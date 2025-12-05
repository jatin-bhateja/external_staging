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

[ VAPI  TIME] 67ms
[pred] [2.948774E-4, 3.5096513E-4, 1.9738331E-4, 2.6974094E-4, 3.0025118E-4, 1.6123685E-4, 1.4505566E-4, 2.066662E-4]
[ FFM  TIME] 120ms
[pred] [2.948774E-4, 3.5096513E-4, 1.9738331E-4, 2.6974094E-4, 3.0025118E-4, 1.6123685E-4, 1.4505566E-4, 2.066662E-4]

                        Java Methods that Execute the Most from CPU Time Sampler (Experimental)

Method                                                                                                  Samples Percent
------------------------------------------------------------------------------------------------------- ------- -------
java.lang.invoke.LambdaForm$MH.0x0000000094088000.invoke(Object, long, long, long, int)                      13  41.94%
SoftmaxBench.vapi_kernel(MemorySegment, MemorySegment, int)                                                   8  25.81%
jdk.internal.classfile.impl.SplitConstantPool.classEntryForClassOrInterface(ClassDesc)                        2   6.45%
jdk.internal.constant.MethodTypeDescImpl.buildDescriptorString()                                              1   3.23%
java.lang.invoke.LambdaForm$MH.0x0000000094083800.invoke(Object, long, long, long, int)                       1   3.23%
jdk.internal.foreign.abi.DowncallStub.0x0000000094084400.invoke(...)                                          1   3.23%
java.lang.invoke.MethodType.genericMethodType(int, boolean)                                                   1   3.23%
jdk.internal.classfile.impl.BufWriterImpl.writeUtfEntry(String)                                               1   3.23%
jdk.incubator.vector.FloatVector.lambda$intoMemorySegment0$0(...)                                             1   3.23%
jdk.internal.classfile.impl.AbstractPoolEntry$Utf8EntryImpl.<init>(ConstantPool, int, String, int)            1   3.23%
jdk.incubator.vector.FloatVector.reduceLanesTemplate(VectorOperators$Associative)                             1   3.23%

