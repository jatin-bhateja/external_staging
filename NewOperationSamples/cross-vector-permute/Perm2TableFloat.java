
import jdk.incubator.vector.*;
import java.util.Arrays;
//
//
//
// <E extends FloatVector, F extends IntVector>
// Vector<F>.selectFrom(Vector<E> v1, Vector<E> v2)
//  - checkIndexes - for OOB access.
//       - Java Side
//           - mask = broadcast(FSP, FSP.length() - 1).compare(VectorOperators.LT, this)
//       - Currently loading a shuffle from array wraps around OOD indices to a -ve values.
//  - pass to expander.
//      - PERMUTE insturction always accept integer indices. 
//      - Float to  
//  Shuffles
//    - byte [] 
//    - VectorLoadShuffle - VectorUnpackNode::Ideal - > byte -> vector lanes size.
//
// Notes:
//   1. Any vector api performing lane shuffeling / permutation uses VectorShuffle to pass indices.
//   2. Shuffle creation intercepts.    
//      a. fromArray : Wraps around OOB indix to a -ve value. 
//      b. shuffleIota
//      c. Vector.toShuffle
//
// jshell> float [] arr = {0,1,2,7,9,11,13,15}
//arr ==> float[8] { 0.0, 1.0, 2.0, 7.0, 9.0, 11.0, 13.0, 15.0 }
//
//jshell> var vec = FloatVector.fromArray(FloatVector.SPECIES_256, arr, 0)
//vec ==> [0.0, 1.0, 2.0, 7.0, 9.0, 11.0, 13.0, 15.0]
//
//jshell> var shuf = VectorShuffle.fromArray(FloatVector.SPECIES_256, index, 0)
//shuf ==> Shuffle[0, 1, 2, 7, -7, -5, -3, -1]
//
//jshell> vec.rearrange(shuf)
//|  Exception java.lang.IndexOutOfBoundsException: required an index in [0..7] but found -7
//|        at AbstractShuffle.checkIndexFailed (AbstractShuffle.java:221)
//|        at AbstractShuffle.checkIndexes (AbstractShuffle.java:130)
//|        at FloatVector.rearrangeTemplate (FloatVector.java:2257)
//|        at Float256Vector.rearrange (Float256Vector.java:439)
//|        at Float256Vector.rearrange (Float256Vector.java:41)
//|        at (#48:1)
//  
//  OOB errors are thrown lazily before performing actual permutation. This is similar to stream usecase where streams
//  are evaluated lazily at terminal operation.
//  
//   3. Shuffling Vector APIs
//      a. Vector.rearrange
//      b. selectFrom
//      c. slice 
//      d. unslice
//  https://docs.oracle.com/en/java/javase/22/docs/api/jdk.incubator.vector/jdk/incubator/vector/Vector.html#:~:text=The%20slice()%20family%20of%20methods,order%2C%20source%20lanes%20to%20destination%20lanes.
//
//  Out of above APIs, a. directly accepts a shuffle argument, while others internally transforms the vector holding index value to a shuffle using Vector.toShuffle() API.
//  APIs b,c and d are based over rearrange operation which always expects to receive indices through a shuffle instance.
//
//  Q. Why do we need to pass indices through shuffle and not directly using vectors ?
//  A. Main reason for this design decision is to keep indices in a representation which is agnostic to vector lane type, i.e. index value remains same for different vector types.
//     However, it may be expanded to match the vector lane size.
//     Ideally a VectorShuffle corresponding to an IntVector should  seamlessly be passed for FloatVector.
//
//     1) Targets with permute / shuffle instructions expects lane size conformance b/w vector operands and index operand, though it may only consider some bits of index lanes
//     for effective index computation.
//     2) Index is an integer value while vector may hold floating point values.
//     3) All the VectorAPIs, currently expects type conformance b/w vector argument, which is why an API like selectFrom which may hold indices in a float vector, first   
//        converts floating point lane to a byte lane using Vector.toShuffle, inline expanders may then upcast the byte lanes to a wider integral lane to match lane size of
//        vector lane.
//
//     Vector<E>
//          |
//          V
//     VectorConvert (E to Byte)
//          |
//          V
//     VectorBox (Shuffle)
//
//    Unboxing idealization then, unpack the indices held in a byte vector to wider integral vector to match the lane size.
//
//    Optimization opportunity (CHECKED):
//    =========================
//    FloatVector + VectorConvert(F2B) + VectorUnbox => FloatVector + VectorCastF2X(F2B) + VectorLoadShuffle(B2I) => FloatVector + VectorConvert(F2I)
//                                                                                                                => We do not need special case handling for F2X, a prior
//                                                                                                                => OOB check using AbstractShuffle.checkIndexes API
//                                                                                                                => ensured that indices lie in valid range.
//     AbstractShuffle.checkIndexes() prior to re-arrange checks for OOB indices using toVector() + compare against vector lanes count, thus those instructions
//     are still executed, so replacing VectorLoadShuffle with VectorCastF2I may not show perceptible gains 
//
//     load_vector XMM6,[RCX + #16 (8-bit)]  // FLOAT VECTOR[INDICES] => FloatVector.selectFrom(FloatVector)
//     load_vector XMM7,[RDX + #16 (8-bit)]
//     movq    R11, float[int:8]	# ptr
//     load_vector XMM1,[R11 + #16 (8-bit)]
//     vector_cast_f2x XMM0,XMM6	! using XMM5, XMM4, XMM3 and XMM2 as TEMP
//     vector_cast_b2x XMM2,XMM0	!
//     vector_compare XMM3,XMM2,XMM1,#3	!
//     vmovdqu XMM2,XMM3	# spill
//     vector_mask_cast XMM2
//     vptest_ge16  XMM2, XMM2
//	
//     jne,u   B18  P=0.000000 C=6784.000000
//
//     B8: #	out( B21 B9 ) <- in( B7 )  Freq: 0.999993
//     movl    R11, [RSI + #12 (8-bit)]	# range
//     NullCheck RSI
//
//     B9: #	out( B17 B10 ) <- in( B8 )  Freq: 0.999992
//     leal    RBP, [R11 + #-7]
//     vector_cast_f2x_strict XMM0,XMM6  ###### [NEW] CASTF2I 
//     vector_rearrange XMM0, XMM0, XMM7
//
//                 OLD
//
//     load_vector XMM7,[RDX + #16 (8-bit)]
//     movq    R11, float[int:8] # ptr
//     load_vector XMM1,[R11 + #16 (8-bit)]
//     vector_cast_f2x XMM0,XMM6	! using XMM5, XMM4, XMM3 and XMM2 as TEMP
//     vector_cast_b2x XMM2,XMM0	!
//     vector_compare XMM3,XMM2,XMM1,#3	!
//     vmovdqu XMM2,XMM3	# spill
//     vector_mask_cast XMM2
//     vptest_ge16  XMM2, XMM2
//	
//     jne,u   B18  P=0.000000 C=6784.000000
//
//     B8: #	out( B21 B9 ) <- in( B7 )  Freq: 0.999993
//     movl    R11, [RSI + #12 (8-bit)]	# range
//     NullCheck RSI
//
//     B9: #	out( B17 B10 ) <- in( B8 )  Freq: 0.999992
//     vector_load_shuffle XMM0, XMM0     ###### LOAD FROM BACKING STORAGE
//     vector_rearrange XMM0, XMM0, XMM7
//    
//     4) VectorShuffle.toVector needs to be aware of target vector lane type, which is why shuffle has multiple vector type specific subclasses even though its internal backing
//        storage (a byte array) is agnostic to vector type.
//
//     5) VPERMPS (VEX.256 encoded version) : SRC1 carries permute indices which must be integer value, considering that float lanes have fixed format as per IEEE 754 specification
//        and effective index is contained in least significant three bits for each index lane.
//
//     6) A fine point to note here, Ideal type of VectorLoadShuffle for floating point types is TypeVect(T_FLOAT, LANE_COUNT), but effectivelty it expands byte vector to and int vector.
//         
//
//DEST[31:0]←(SRC2[255:0] >> (SRC1[2:0] * 32))[31:0];
//                                -----
//DEST[63:32]←(SRC2[255:0] >> (SRC1[34:32] * 32))[31:0];
//DEST[95:64]←(SRC2[255:0] >> (SRC1[66:64] * 32))[31:0];
//DEST[127:96]←(SRC2[255:0] >> (SRC1[98:96] * 32))[31:0];
//DEST[159:128]←(SRC2[255:0] >> (SRC1[130:128] * 32))[31:0];
//DEST[191:160]←(SRC2[255:0] >> (SRC1[162:160] * 32))[31:0];
//DEST[223:192]←(SRC2[255:0] >> (SRC1[194:192] * 32))[31:0];
//DEST[255:224]←(SRC2[255:0] >> (SRC1[226:224] * 32))[31:0];
//
//  Ways to pass indices to various vectorAPIs :-
//     a. VectorShuffle: 
//           - Only accepts valid index ranges to accomidate 0:VECTOR_LENGTH, OOB accesses are either wrapped around or represented using -ve values.
//           - Not suitable to accomodate indices for combined index range of multiple vectors.
//        
//     b. int [] :
//           - Gather indices from typed arrays. Java array subscript index value range must lie within [0:Integer.MAX_VALUE)
//     c. MemorySegment vector load/store APIs accept long offsets w.r.t segment base address. To perform gather from / scatter to a memory segment, one needs to pass
//        an array of long offsets.
//     d. Vector.selectFrom(Vector v1, Mask) accepts indices through vectors, but transform it into shuffle to comply with rearrange argument specification.
//     e. Java being a safe language, must perform OOB checks over indices.
//     f. An API like n-table permute must have following checks.
//          - Indices must lie in valid combined index range [0: VEC_LENGTH * N)   
//          - Implementable using existing APIs, compare + rearrange + blend.
//          - rearrange always expects indices to be passed as shuffles to perform OOB check.
//                - OOB check for entire index range already performed upfront.
//          - Vector.selectFrom(Vector v1, Vector<Integer> indices);
//             Performs cross-lane-movement of lane elements across 'this' and argument vector 'v1' using index vector passed as second argument, where each lane of index vector contains
//             valid integer value lying within combined index range of participating vectors i.e. [0, Vector.LENGTH * 2).
//          - Creating an extended shuffle will add overhead.
//             - backing storage of byte[] may not be able to accomodate indices for ARM SVE (2048 bit vectors)
//        
//    Vector<E>.selectFrom(Vector<E> v1, Vector<E> v2, Vector<E> indices);
public class Perm2TableFloat {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;

   public static void micro(float [] res, float [] src1, float [] src2, float [] perm) {
       var permv = FloatVector.fromArray(FSP, perm, 0); 
       var vsrc1 = FloatVector.fromArray(FSP, src1, 0); 
       var vsrc2 = FloatVector.fromArray(FSP, src2, 0); 
       var vec7 = FloatVector.broadcast(FSP, FSP.length() - 1);
       // Silently wraps indices in valid index range i.e 0:VECLENGTH.
       // No OOB checking ???
       var shuf = permv.toShuffle().wrapIndexes();
       var mask = permv.compare(VectorOperators.GT, vec7);
       vsrc1.rearrange(shuf)
            .blend(vsrc2.rearrange(shuf), mask.cast(FSP))
            .intoArray(res, 0);
   }

   // Task2:  Ideal Transformation :  v1.rearrange(shuf).Vector.blend(v2.rearrange(shuf), mask) => VectorExtendedRearrange
   public static void main(String [] args) {
      float arr1[]  = {1,2,3,4,5,6,7,8};
      float arr2[]  = {17,18,19,20,21,22,23,24};
      float perm[] = {2,11,6,7,9,11,3,4};
      float res [] = new float[8]; 
      for (int i = 0; i < 10000; i++) {
           micro(res, arr1, arr2, perm);
      } 
      long t1 = System.currentTimeMillis();
      for (int i = 0; i < 10000; i++) {
           micro(res, arr1, arr2, perm);
      } 
      long t2 = System.currentTimeMillis();
      System.out.println("[time] " + (t2-t1) + " ms " + Arrays.toString(res));
   }
} 
