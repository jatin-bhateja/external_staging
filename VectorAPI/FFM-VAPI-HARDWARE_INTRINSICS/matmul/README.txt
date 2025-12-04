A) Steps to run:
   -------------

  1/ export LD_LIBRARY_PATH=$PWD
  2/ make all
  3/ make with appropriate make run target
     make run_ffm
     make run_vapi
     make run_jfr
  4/ make clean to remove artifacts.

B) Profile:
   --------

                      Java Methods that Execute the Most from CPU Time Sampler (Experimental)

Method                                                                                             Samples Percent
-------------------------------------------------------------------------------------------------- ------- -------
java.lang.invoke.LambdaForm$MH.0x0000000034082c00.invoke(Object, long, long, long, long, int, int)   1,675  78.16%
matmul_512_bench.matmul_512_vapi(MemorySegment, MemorySegment, MemorySegment, int, int)                345  16.10%
java.lang.invoke.LambdaForm$MH.0x000000003404e400.invoke(Object, long, long, long, long, int, int)     113   5.27%
jdk.incubator.vector.FloatVector.lanewiseTemplate(VectorOperators$Ternary, Vector, Vector)               4   0.19%
jdk.internal.foreign.AbstractMemorySegmentImpl.checkBounds(long, long)                                   2   0.09%
java.lang.invoke.LambdaForm$Holder.constant_L(Object)                                                    1   0.05%
java.lang.invoke.MethodTypeForm.canonicalizeAll(Class[], int)                                            1   0.05%
jdk.internal.util.ReferencedKeyMap.getNoCheckStale(Object)                                               1   0.05%
jdk.incubator.vector.FloatVector.maybeSwap(ByteOrder)                                                    1   0.05%


C) Results:
[ FFM TIME] 14293ms
[ VAPI TIME] 2777ms

D) Analysis:
   ---------
 Significant overheads with FFM, VAPI is around 5x faster.

- FFM
   - No-inlining
   - Call Overhead
     - Hits more if number of cycles spent in callee is not significant.
- VAPI
   - Intrinsics/Inline expansion are expanded into efficient instruction sequence replacing the call.
   - Unrolling also improves loop throughput by amortizing the overhead across multiples unrolled iteration.
