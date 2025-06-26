

import jdk.incubator.vector.*;
import java.util.Arrays;

public class TwoVectorPermute {
   public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_256;

   public static void micro(float [] res, float [] shuf, float [] src1, float [] src2) {
       // OPT1: VectorShuffle.fromArray
       VectorShuffle<Float> vshuf = FloatVector.fromArray(FSP, shuf, 0).toShuffle();
       // OPT2: Sub-optimal wrapIndexes 
       VectorShuffle<Float> vshuf_wrapped = vshuf.wrapIndexes();
       FloatVector.fromArray(FSP, src1, 0)
         .rearrange(vshuf_wrapped)
         .blend(FloatVector.fromArray(FSP, src2, 0)
                           .rearrange(vshuf_wrapped),
                           vshuf.laneIsValid().not())
         .intoArray(res, 0);
   }
       // Notes:
       //  - With vector based indices in range [0:VEC_LEN*2) this can be optimized.
       //
       // Latencies: 
       //    Current : LOADS + VPERMD + VPERMD + VBLENDMD = 3 + 3 + 1 = 7 cycles + LOADS
       //    Post Opt: LOADS + VPERMI2D + VPMOVM2D + VPSLLD + VPSRLD + VPOR = 3 + 3 + 1 + 1 + 1  = 9 cycles  + LOADS
       //    Target  : LOADS + VPERMI2D = 3 cycles + LOADS
       //
       /*  Ideal Folding: (Quick Selection Pattern + JIT snippet)
          (A)   VectorBlend (V1.VectorRearrange(shuf), V2.VectorRearrange(shuf), mask)
          => 
          (B)  V1.VectorExtendedRearrange(V2, shuf, mask)

          (JIT sequence A)
             "vmovdqu %1, %%ymm1  \n\t"
             "vmovdqu %2, %%ymm2  \n\t"
             "vmovdqu %0, %%ymm3  \n\t"
             "kmovw %3 , %%k1     \n\t"

             "vpermd %%ymm1, %%ymm3, %%ymm1 \n\t"
             "vpermd %%ymm2, %%ymm3, %%ymm2 \n\t" 
             "vpblendmd %%ymm2, %%ymm1, %%ymm3 %{%%k1} \n\t"
             "vmovdqu64 %%ymm3, %0  \n\t"

           (JIT sequence B)
             "vmovdqu %1, %%ymm1  \n\t"
             "vmovdqu %2, %%ymm2  \n\t"
             "vmovdqu %0, %%ymm3  \n\t"
             "kmovw %3 , %%k1     \n\t"

             "vpmovm2d %%k1, %%ymm4 \n\t"        |
             "vpsrld $31, %%ymm4, %%ymm4 \n\t"   |   Broadcast VEC_SIZE GPR -> XMM => 5 cycles      
             "vpslld $3, %%ymm4, %%ymm4 \n\t"    |   VEC_SIZE + MASKED_ADD(k1) = 6 cycles
             "vpord %%ymm4, %%ymm3, %%ymm3 \n\t" |

             "vpermi2d %%ymm2, %%ymm1, %%ymm3 \n\t"
             "vmovdqu64 %%ymm3, %0  \n\t"
       */ 
       //  Bug1: Incorrectness since JDK-20
       //   java --add-modules=jdk.incubator.vector -cp . TwoVectorPermute
       //  Bug2: Incorrect java.lang.IllegalArgumentException
       //   java --add-modules=jdk.incubator.vector -XX:CompileOnly=TwoVectorPermute::micro -cp . TwoVectorPermute


   public static void main(String [] args) {
       float [] res  = new float[FSP.length()];
       float [] shuf = new float[FSP.length()];
       float [] src1 = new float[FSP.length()];
       float [] src2 = new float[FSP.length()];
       for (int i = 0; i < FSP.length(); i++) {
           shuf[i] = i * 2;
       }
       for (int i = 0; i < FSP.length(); i++) {
           src1[i] = i;
           src2[i] = i + FSP.length(); 
       }
       for (int i = 0; i < 50000; i++) {
           micro(res, shuf, src1, src2);
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 50000; i++) {
           micro(res, shuf, src1, src2);
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time] " + (t2-t1) + " ms  [res] " + Arrays.toString(res));
   }
}  
