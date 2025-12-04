A) Steps to run:
   -------------

  1/ export LD_LIBRARY_PATH=$PWD
  2/ make all
  3/ make with appropriate run target
     make run_ffm
     make run_vapi
     make run_jfr
  4/ make clean to remove artifacts.

B) Profile:
   --------

[ VAPI  TIME] 65ms
[ FFM  TIME] 121ms

                        Java Methods that Execute the Most from CPU Time Sampler (Experimental)

Method                                                                                                  Samples Percent
------------------------------------------------------------------------------------------------------- ------- -------
java.lang.invoke.LambdaForm$MH.0x0000000036088000.invoke(Object, long, long, long, int)                      14  43.75%
SoftmaxBench.vapi_kernel(MemorySegment, MemorySegment, int)                                                   9  28.13%
jdk.incubator.vector.FloatVector$FloatSpecies.rvOp(AbstractSpecies$RVOp)                                      2   6.25%
java.lang.StringCoding.countNonZeroAscii(String)                                                              1   3.13%
jdk.incubator.vector.FloatVector.lambda$fromMemorySegment0Template$0(...)                                     1   3.13%
jdk.internal.classfile.impl.SplitConstantPool.classEntryForClassOrInterface(ClassDesc)                        1   3.13%
jdk.internal.classfile.impl.DirectClassBuilder.withField(Util$Writable)                                       1   3.13%
java.lang.invoke.MethodHandles$Lookup.checkSymbolicClass(Class)                                               1   3.13%
java.lang.invoke.MemberName.ensureTypeVisible(Class)                                                          1   3.13%
jdk.internal.classfile.impl.DirectCodeBuilder$4.generateStackMaps(BufWriterImpl)                              1   3.13%
                      Java Methods that Execute the Most from CPU Time Sampler (Experimental)

