#!/bin/bash

./gentests.sh

OPTS=$1
export JAVA_HOME=/home/jatinbha/sandboxes/valhalla/valhalla/build/linux-x86_64-server-fastdebug/images/jdk
export JAVA_HOME_REF=/home/jatinbha/sandboxes/jdk/build/linux-x86_64-server-fastdebug/images/jdk
export PATH=$JAVA_HOME/bin:$PATH

i=1
for size in 512 64 128 256 64
do
  for type in Byte Short Int Long Float Double
  do
      echo "[Test $i]" 

      sudo $JAVA_HOME/bin/javac  --add-modules=jdk.incubator.vector deopt_mask_${type}${size}.java

      sudo $JAVA_HOME/bin/java --add-modules=jdk.incubator.vector -XX:-TieredCompilation -Xbatch $OPTS -XX:+DeoptimizeALot -XX:CompileThresholdScaling=0.1 -XX:-TraceDeoptimization -cp . deopt_mask_${type}${size} >& /tmp/log1.txt

      sudo $JAVA_HOME_REF/bin/java --add-modules=jdk.incubator.vector -XX:-TieredCompilation -Xbatch $OPTS  -XX:+DeoptimizeALot -XX:CompileThresholdScaling=0.1 -XX:-TraceDeoptimization -cp . deopt_mask_${type}${size} >& /tmp/log2.txt

      grep "Assertion" /tmp/log1.txt | tee log1.txt
      grep "Assertion" /tmp/log2.txt | tee log2.txt
      diff log1.txt log2.txt >& /dev/null
      if [ $? -eq 0 ]; then
         echo "MASK_${type}${size} PASS"
      else
         echo "MASK_${type}${size} FAIL"
      fi
      i=$(expr $i + 1)
  done
done

for size in 64 128 256 512
do
  for type in Byte Short Int Long Float Double
  do
      echo "[Test $i]" 

      sudo $JAVA_HOME/bin/javac  --add-modules=jdk.incubator.vector deopt_shuffle_${type}${size}.java

      sudo $JAVA_HOME/bin/java --add-modules=jdk.incubator.vector -XX:-TieredCompilation -Xbatch $OPTS -XX:+DeoptimizeALot -XX:CompileThresholdScaling=0.1 -XX:-TraceDeoptimization -cp . deopt_shuffle_${type}${size} >& /tmp/log1.txt

      sudo $JAVA_HOME_REF/bin/java --add-modules=jdk.incubator.vector -XX:-TieredCompilation -Xbatch  $OPTS -XX:+DeoptimizeALot -XX:CompileThresholdScaling=0.1 -XX:-TraceDeoptimization -cp . deopt_shuffle_${type}${size} >& /tmp/log2.txt
  
      grep "Assertion" /tmp/log1.txt | tee log1.txt
      grep "Assertion" /tmp/log2.txt | tee log2.txt
      diff log1.txt log2.txt >& /dev/null
      if [ $? -eq 0 ]; then
         echo "SHUFFLE_${type}${size} PASS"
      else
         echo "SHUFFLE_${type}${size} FAIL"
      fi
      i=$(expr $i + 1)
  done
done

for size in 64 128 256 512
do
  for type in Byte Short Int Long Float Double
  do
      echo "[Test $i]" 

      sudo $JAVA_HOME/bin/javac  --add-modules=jdk.incubator.vector deopt_vector_${type}${size}.java

      sudo $JAVA_HOME/bin/java --add-modules=jdk.incubator.vector -XX:-TieredCompilation -Xbatch $OPTS -XX:+DeoptimizeALot -XX:CompileThresholdScaling=0.1 -XX:-TraceDeoptimization -cp . deopt_vector_${type}${size} >& log1.txt

      sudo $JAVA_HOME_REF/bin/java --add-modules=jdk.incubator.vector -XX:-TieredCompilation -Xbatch $OPTS -XX:+DeoptimizeALot -XX:CompileThresholdScaling=0.1 -XX:-TraceDeoptimization -cp . deopt_vector_${type}${size} >& log2.txt

      grep "Assertion" /tmp/log1.txt | tee log1.txt
      grep "Assertion" /tmp/log2.txt | tee log2.txt
      diff log1.txt log2.txt >& /dev/null
      if [ $? -eq 0 ]; then
         echo "VECTOR_${type}${size} PASS"
      else
         echo "VECTOR_${type}${size} FAIL"
      fi
      i=$(expr $i + 1)
  done
done
