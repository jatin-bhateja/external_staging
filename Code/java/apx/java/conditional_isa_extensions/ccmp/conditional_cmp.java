
import java.util.Arrays;
import java.util.stream.IntStream;
import java.util.Arrays;
import java.util.Random;

public class conditional_cmp {
   //
   // CMov =>  COND > 1 ? A : B   
   //
   //  Scalar IR:-
   //              -----------------
   //              | CmpNode COND 1|  
   //        [GT]  |---------------|
   //         |        |
   //         \        /
   //          \      /
   //         ----------
   //         |BoolNode|                         [1] [a] [b]
   //         ----------                          |   |   |  
   //             | (1)                           |   |   |
   //             |                          =>   ________
   //             V                               | CMovI|
   //            [IF]                             -------- 
   //           /    \                                |
   //          /      \                               |
   //     [IFTrue]  [IFFalse]
   //          \      /
   //           \    /
   //          [Region] [A] [B]   
   //                \   |  /
   //                 \  | / 
   //                 [Phi]
   //                   |
   //  Vector IR:-
   //   Auto-vectorization: IF-conversion.
   //   => VectorBlend [VectorMaskCmp] (LoadVector A), (LoadVector B), MASK 
   //                 
   //  Quick walk over new SLP code structure [DONE]
   //
   public static int LEN = 10204;


   // source :  if (cond1 && cond2) {
   //              TRUE_PATH;
   //           } else {
   //              FALSE_PATH;
   //           } 
   //           CONVERGENCE_PATH
   // Non-APX:- 
   //     EFLAGS = cond1
   //     jne FALSE_PATH     // Short-circuiting..
   //     EFLAGS = cond2
   //     jne FALSE_PATH
   //     TRUE_PATH:
   //     JMP CONVERGENCE_PATH 
   //     FALSE_PATH:
   //     CONVERGENCE_PATH:
   // APX:-
   //     EFLAGS = cond1
   //     EFLAGS = cond2 scc=EFLAGS cond   pros:
   //                                         - Implicit short-circuiting, second condition is evaluated only if scc condition matches with
   //                                           EFLAGS bits...
   //                                         - Save an entry in Branch History and Branch prediction tables.
   //                                      cons:
   //                                         - EVEX encoding mandates 4 byte prefix for new conditional compare instruction.
   //                                         - Near jmp (within 8 bit offset) has 3 byte encoding. 
   //                                           - Not a size oriented optimization.   
   //     jne FALSE_PATH
   //     TRUE_PATH:
   //     JMP CONVERGENCE_PATH 
   //     FALSE_PATH:
   //     CONVERGENCE_PATH:
   //   

   // Next Steps:
   //   - Measure the performance impact (BPU, code size, throughput, latency) using c-micros with handcrafter inlined assembly sequence using new conditional compare / test instruciton, using simics..
   //   - Simics new user training.
   //   - Object size estimation using APX enabled Clang / GCC  
   // 
   // New IR:  CCMoveI
   public static int cond_cmp_micro(int a, int b, boolean cond) {
      int res = 0;
      if (cond) {
         res = a;
      } else {
         res = b;
      }
      return res;
   }

   public static int micro(int a, int b, boolean cond) {
      int res = 0;
      // Two level 2bit adaptive predictor.
      // Local patten table per branch 2^2 = 4 entries
      // 2 bit saturating counter per entry.
      // Branch history register size : 2 bit
      // Local patten table
      //  0 0     : counter 2 bit ( 00 01 10 11) -> alternates between strongly not taken (00) to strongly taken (11)
      //  0 1     :
      //  1 0     :
      //  1 1     :
      // For following branches
      // with alternating branch taken pattern 010101...
      // Branch history register will always hold 01 10 values.
      // Thus only two rows of pattern table will be used, staurating counter
      // in row corresponding to 01 entry will have 00 value 
      // while counter corresponding to 10 will have 11 value after 
      // some learning curve
      // Thus after some time it will start make 100% accurate predictions.
      
      if (cond) {
         res = a;
      } else {
         res = b;
      }
      return res;
   }

   public static void main (String [] args) {
      int [] a = new int[LEN];
      int [] b = new int[LEN];
      int [] c = new int[LEN];
      int [] r = new int[LEN];

      Random rd = new Random(1023);
      Arrays.fill(a, 1);
      Arrays.fill(b, 2);
      IntStream.range(0, LEN).forEach(i -> c[i] = rd.nextInt(LEN));

      for (int i = 0; i < LEN; i++) {
         r[i] = micro(a[i], b[i], (c[i] & 0x3) == (i & 0x3));
      }

      System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(r, 0, 16)));
   }
}
