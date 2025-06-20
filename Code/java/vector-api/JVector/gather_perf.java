import jdk.incubator.vector.*;
import java.util.stream.IntStream;
import java.util.Arrays;

public class gather_perf {
   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

   static int [] scratch = new int[ISP.length()];

   public static int micro1(int [] src, int idx, int src_idx) {
      IntVector.broadcast(ISP, idx).intoArray(scratch, 0);
      // Scratch is an escaping memory, hence a costly store
      // will be emitted prior to gather, value forwarding may
      // still be effective. 
      return IntVector.fromArray(ISP, src, src_idx, scratch, 0).lane(idx);   
   }

   public static int micro2(int [] src, int idx, int src_idx) {
      int [] scratch = new int[ISP.length()];                   // Non-escaping memeory
      IntVector.broadcast(ISP, idx).intoArray(scratch, 0);     
      // Index LoadVector should benefit from StoreVector value forwarding - Verified
      // Eventually scratch allocation will be eliminated and so does any store to that memory. - not getting eliminated and marked as global escape.
/*
  0x00007f9b48e841e2:   prefetchw 0x100(%rsi)
  0x00007f9b48e841e9:   movl   $0x1ab980,0x8(%rax)          ;   {metadata({type array int})}
  0x00007f9b48e841f0:   prefetchw 0x140(%rsi)
  0x00007f9b48e841f7:   movl   $0x10,0xc(%rax)
  0x00007f9b48e841fe:   prefetchw 0x180(%rsi)
  0x00007f9b48e84205:   mov    %rax,%rsi
  0x00007f9b48e84208:   add    $0x10,%rsi
  0x00007f9b48e8420c:   vpxor  %ymm0,%ymm0,%ymm0
  0x00007f9b48e84210:   vmovdqu %ymm0,(%rsi)
  0x00007f9b48e84214:   vmovdqu %ymm0,0x20(%rsi)            ;*newarray {reexecute=0 rethrow=0 return_oop=0}
 ;; B3: #       out( B28 B4 ) <- in( B8 B2 )  Freq: 1
  0x00007f9b48e84219:   vpbroadcastd (%rsp),%zmm0           ;*invokestatic fromBitsCoerced {reexecute=0 rethrow=0 return_oop=0}
  0x00007f9b48e84220:   vmovdqu32 %zmm0,0x10(%rax)          ;*invokestatic store {reexecute=0 rethrow=0 return_oop=0}   // ZMM0 storeVector to scratch array
  0x00007f9b48e8422a:   mov    %rbp,%rdx
  0x00007f9b48e8422d:   mov    0xc(%rdx),%r8d               ; implicit exception: dispatches to 0x00007f9b48e8444b
 ;; B4: #       out( B10 B5 ) <- in( B3 )  Freq: 1
  0x00007f9b48e84231:   vpbroadcastd %r8d,%zmm1
  0x00007f9b48e84237:   vpbroadcastd 0x10(%rsp),%zmm2       ;*invokestatic extract {reexecute=0 rethrow=0 return_oop=0}
  0x00007f9b48e8423f:   vpaddd %zmm2,%zmm0,%zmm2            ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0} // ZMM0 is value forwarded.
*/

/* Arrays is marked as non-escaping but not scalar replacible.
JavaObject(5) NoEscape(NoEscape) NSR [ 75F [ 110 95 ]]    36  AllocateArray  === 63 64 37 10 1 (65 66 67 68 69 70 71 72 1 ) [[ 92 58 14 122 8 110 ]]  rawptr:NotNull ( int:>=0, java/lang/Object:NotNull *, bool, int, bool ) allocationKlass:[I gather_perf::micro2 @ bci:8 (line 20) !jvms: gather_perf::micro2 @ bci:8 (line 20)
*/
      return IntVector.fromArray(ISP, src, src_idx, scratch, 0).lane(idx); 
   }

   public static int micro3(int [] src, int idx, int src_idx) {
      int [] scratch = new int[ISP.length()];                   // Non-escaping memeory
      Arrays.fill(scratch, idx);
      // Arrays.fill performs elementwise store, thus even though alias type of
      // scalar store i.e int [] does match with load vector's alias type int []
      // but the offsets of store and load address don't match, this prevents
      // any value forwarding, which is why we emit a vpaddd with a memory operand
      // which reads from scratch array  - No value forwarding here.
      //                                 - No elimination of array allocation, 
/*

  0x00007fad64510588:   mov    %ecx,0x10(%rax)
  0x00007fad6451058b:   mov    %ecx,0x14(%rax)
  0x00007fad6451058e:   mov    %ecx,0x18(%rax)
  0x00007fad64510591:   mov    %ecx,0x1c(%rax)
  0x00007fad64510594:   mov    %ecx,0x20(%rax)
  0x00007fad64510597:   mov    %ecx,0x24(%rax)
  0x00007fad6451059a:   mov    %ecx,0x28(%rax)
  0x00007fad6451059d:   mov    %ecx,0x2c(%rax)
  0x00007fad645105a0:   mov    %ecx,0x30(%rax)
  0x00007fad645105a3:   mov    %ecx,0x34(%rax)
  0x00007fad645105a6:   mov    %ecx,0x38(%rax)
  0x00007fad645105a9:   mov    %ecx,0x3c(%rax)
  0x00007fad645105ac:   mov    %ecx,0x40(%rax)
  0x00007fad645105af:   mov    %ecx,0x44(%rax)
  0x00007fad645105b2:   mov    %ecx,0x48(%rax)
  0x00007fad645105b5:   mov    %ecx,0x4c(%rax)              ;*newarray {reexecute=0 rethrow=0 return_oop=0}
  0x00007fad645105b8:   mov    %rbp,%rdx                    ;*invokestatic extract {reexecute=0 rethrow=0 return_oop=0}
  0x00007fad645105bb:   mov    0xc(%rdx),%r8d               ; implicit exception: dispatches to 0x00007fad645107d3
 ;; B4: #       out( B10 B5 ) <- in( B3 )  Freq: 1
  0x00007fad645105bf:   vpbroadcastd 0x10(%rsp),%zmm0       ;*invokestatic extract {reexecute=0 rethrow=0 return_oop=0}
  0x00007fad645105c7:   vpaddd 0x10(%rax),%zmm0,%zmm2       ;*invokestatic binaryOp {reexecute=0 rethrow=0 return_oop=0}
*/
/* Arrays is marked as non-escaping but not scalar replacible.
JavaObject(5) NoEscape(NoEscape) NSR [ 75F [ 110 95 ]]    36  AllocateArray  === 63 64 37 10 1 (65 66 67 68 69 70 71 72 1 ) [[ 92 58 14 122 8 110 ]]  rawptr:NotNull ( int:>=0, java/lang/Object:NotNull *, bool, int, bool ) allocationKlass:[I gather_perf::micro2 @ bci:8 (line 20) !jvms: gather_perf::micro2 @ bci:8 (line 20)
*/
      return IntVector.fromArray(ISP, src, src_idx, scratch, 0).lane(idx); 
   }

   public static void main(String [] args) {
      int res = 0;
      int algo = Integer.parseInt(args[0]);
      int [] src = IntStream.range(0, 4096).toArray();

      if (algo == 0 || algo == -1) {
         for (int i = 0, j = 0; i < 1000000; i++, j += ISP.length()) {
            res += micro1(src, i & (ISP.length() -1), j & 4095); 
         }
   
         long t1 = System.currentTimeMillis();
         for (int i = 0, j = 0; i < 5000000; i++, j += ISP.length()) {
            res += micro1(src, i & (ISP.length() -1), j & 4095); 
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time micro1] " + (t2 - t1) + " ms  [res] " + res);
      }

      if (algo == 1 || algo == -1) {
         for (int i = 0, j = 0; i < 1000000; i++, j += ISP.length()) {
            res += micro2(src, i & (ISP.length() -1), j & 4095); 
         }
   
         long t1 = System.currentTimeMillis();
         for (int i = 0, j = 0; i < 5000000; i++, j += ISP.length()) {
            res += micro2(src, i & (ISP.length() -1), j & 4095); 
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time micro2] " + (t2 - t1) + " ms  [res] " + res);
      }

      if (algo == 2 || algo == -1) {
         for (int i = 0, j = 0; i < 1000000; i++, j += ISP.length()) {
            res += micro3(src, i & (ISP.length() -1), j & 4095); 
         }
   
         long t1 = System.currentTimeMillis();
         for (int i = 0, j = 0; i < 5000000; i++, j += ISP.length()) {
            res += micro3(src, i & (ISP.length() -1), j & 4095); 
         }
         long t2 = System.currentTimeMillis();
         System.out.println("[time micro2] " + (t2 - t1) + " ms  [res] " + res);
      }
   }
}
