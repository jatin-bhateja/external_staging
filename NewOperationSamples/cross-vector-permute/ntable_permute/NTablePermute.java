import jdk.incubator.vector.*;
import java.util.Random;
import java.util.Arrays;
import java.lang.foreign.*;

public class NTablePermute {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_512;
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_512;

   public static void checkIndexes(int [] indices, int length) {
       IntVector iv = IntVector.fromArray(ISP, indices, 0);
       VectorMask<Integer> mask = iv.compare(VectorOperators.GE, ISP.broadcast(length))
                                    .or(iv.compare(VectorOperators.LT, ISP.zero()));
       if (mask.anyTrue()) {
           throw new IndexOutOfBoundsException();
       }
   }

   public static void permuteNTables_Scalar(float [] res, float [][] tablesN, int [] indices) {
       for (int i = 0; i < indices.length; i++) {
           if (indices[i] < 0 || indices[i] >= tablesN.length * FSP.length()) {
              throw new IndexOutOfBoundsException();
           }
       }
       for (int i = 0; i < indices.length; i++) {
          res[i] = tablesN[(indices[i] / FSP.length())][indices[i] % FSP.length()];
       }
   } 

   public static void permute2Tables_Native(MemorySegment res, MemorySegment src1, MemorySegment src2, MemorySegment indices) {
       for (int i = 0; i < indices.byteSize() / Integer.BYTES; i++) {
           if (indices.get(ValueLayout.JAVA_INT, i * Integer.BYTES) < 0 || indices.get(ValueLayout.JAVA_INT, i * Integer.BYTES) >= 32) {
              throw new IndexOutOfBoundsException();
           }
       }
       
       NTablePermute_h.permute2Tables(res, src1, src2, indices);
   } 

   // 1) Processor loads addresses from memory at granularity of cache line.
   // 2) Loading one element from 16 element float array is going to incur same penalty as
   //    loading all sixteen if array base was cache line aligned, infact with misalignment
   //    loads splits across cache lines.
   // 3) Vector load is retiered once all the elements are loaded into vector, this is expensive
   //    compared to single element loading given that processor uses optimization like 
   //    "critical word first early restart".
   // 4) Overheads per iteration: permutation, broadcast.
   // 5) Not a good case for vectoriation.
   // 6) Vectorization works best for applying same operation over sequence of data.
   // 7) Two table permutation (DataStax), must directly emit VPERMI2B/W/D/L/PS/PD 
   //    in addition to OOB indexes checking to show any benefit over native intrinsic
   //    based implementation which only incurs FFI overhead, and it may be miniscule
   //    if bulk of cycles are spent in native code.
   public static void permuteNTables(float [] res, float [][] tablesN, int [] indices) {
       checkIndexes(indices, tablesN.length * FSP.length());

       FloatVector resv = FloatVector.broadcast(FSP, 0);
       IntVector iv = IntVector.fromArray(ISP, indices, 0);
       IntVector iv_wrapped = iv.and(ISP.broadcast(ISP.length() - 1));
       VectorShuffle<Float> shuf = iv_wrapped.toShuffle().cast(FSP);
       for (int i = 0; i < tablesN.length; i++) {
          FloatVector table = FloatVector.fromArray(FSP, tablesN[i], 0);
          FloatVector permuted_table = table.rearrange(shuf);
          VectorMask<Integer> mask = iv.compare(VectorOperators.GE, i*FSP.length())
                                       .and(iv.compare(VectorOperators.LT, i*FSP.length() + FSP.length()));
          resv = resv.blend(permuted_table, mask.cast(FSP)); 
       }

       resv.intoArray(res, 0);
   } 

   static {
      System.loadLibrary("NTablePermute"); 
      System.out.println("Loaded libNTablePermute.so");
   } 

   public static void main(String []args) {
      // One unified array, can directly use Gather API, to loads from desired indices of tabel.
      int ctr = 0;
      Random r = new Random(10);
      int N = Integer.parseInt(args[0]);
      int algo = Integer.parseInt(args[1]);
      int [] indices = new int[FSP.length()];
      for (int i = 0; i < indices.length; i++) {
         indices[i] = r.nextInt((FSP.length() * N));
      }
      float [][] tablesN = new float[N][];
      for (int i = 0; i < N; i++) {
          tablesN[i] = new float[FSP.length()];
          for (int j = 0; j < tablesN[i].length; j++) {
              tablesN[i][j] = ctr++;
          }
      } 
      float [] res = new float[FSP.length()];
      for (int i = 0; i < N; i++) {
         System.out.println("[table" + i + "] " + Arrays.toString(tablesN[i]));
      }
      System.out.println("[indices] " + Arrays.toString(indices));

      if (algo == 0 || algo == -1) {
         for (int i = 0; i < 500000; i++) {
   	  permuteNTables_Scalar(res, tablesN, indices);
         }
         long t1 = System.currentTimeMillis();
         for (int i = 0; i < 900000; i++) {
   	  permuteNTables_Scalar(res, tablesN, indices);
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time scalar ] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
      } 
      if (algo == 1 || algo == -1) {
         for (int i = 0; i < 500000; i++) {
   	  permuteNTables(res, tablesN, indices);
         }
         long t1 = System.currentTimeMillis();
         for (int i = 0; i < 900000; i++) {
   	  permuteNTables(res, tablesN, indices);
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time vector ] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
      }

      if (algo == 2 || algo == -1) {
         MemorySegment ms_res  = Arena.global().allocate(64, 64);
         MemorySegment ms_src1 = Arena.global().allocate(64, 64);
         MemorySegment ms_src2 = Arena.global().allocate(64, 64);
         MemorySegment ms_indexes = Arena.global().allocate(64, 64);
         ms_src1.copyFrom(MemorySegment.ofArray(tablesN[0]));
         ms_src2.copyFrom(MemorySegment.ofArray(tablesN[1]));
         ms_indexes.copyFrom(MemorySegment.ofArray(indices));

         for (int i = 0; i < 500000; i++) {
   	  permute2Tables_Native(ms_res, ms_src1, ms_src2, ms_indexes);
         }
         long t1 = System.currentTimeMillis();
         for (int i = 0; i < 900000; i++) {
   	  permute2Tables_Native(ms_res, ms_src1, ms_src2, ms_indexes);
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time native ] " + (t2-t1) + " ms  [res] " + Arrays.toString(ms_res.toArray(ValueLayout.JAVA_INT)));
      }
   }
}
