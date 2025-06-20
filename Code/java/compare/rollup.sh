#!/bin/sh

rm -rf results.csv

export JAVA_HOME=/home/jatinbha/softwares/jdk-15/
export PATH=$JAVA_HOME/bin:$PATH
javac compareb.java
echo "------------------------------------------" >> release.csv
echo "JDK-15 vanilla UseAVX=2" >> results.csv
echo "  Length(bytes)      Time(ms)" >> results.csv
echo "------------------------------------------" >> results.csv
for (( i = 0 ; $i < 64 ; i = $i + 1 ))
do
  numactl --cpunodebind=1 --membind=1 java -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:UsePartialInlineSize=32 -XX:UseAVX=2 -cp . compareb $i >& /tmp/out
  TIME=$(cat /tmp/out | grep "Time" | awk '{print $2}')
  echo "    $i    ,    $TIME" >> results.csv                   
done

echo "------------------------------------------" >> release.csv
echo "JDK-15 vanilla UseAVX=3" >> results.csv
echo "  Length(bytes)      Time(ms)" >> results.csv
echo "------------------------------------------" >> results.csv
for (( i = 0 ; $i < 64 ; i = $i + 1 ))
do
  numactl --cpunodebind=1 --membind=1 java -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:UsePartialInlineSize=32 -XX:UseAVX=3 -cp . compareb $i >& /tmp/out
  TIME=$(cat /tmp/out | grep "Time" | awk '{print $2}')
  echo "    $i    ,    $TIME" >> results.csv                   
done
export JAVA_HOME=/home/jatinbha/sandboxes/git-Compare-Acc/jdk/build/linux-x86_64-server-release/jdk/
export PATH=$JAVA_HOME/bin:$PATH

javac compareb.java
echo "------------------------------------------" >> release.csv
echo "JDK-TIP PartialInlineSize = 32" >> results.csv
echo "  Length(bytes)      Time(ms)" >> results.csv
echo "------------------------------------------" >> results.csv
for (( i = 0 ; $i < 64 ; i = $i + 1 ))
do
  numactl --cpunodebind=1 --membind=1 java -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:UsePartialInlineSize=32 -XX:UseAVX=3 -cp . compareb $i >& /tmp/out
  TIME=$(cat /tmp/out | grep "Time" | awk '{print $2}')
  echo "    $i    ,    $TIME" >> results.csv                   
done

echo ""
echo ""
echo "------------------------------------------" >> release.csv
echo "JDK-TIP PartialInlineSize = 64" >> results.csv
echo "  Length(bytes)      Time(ms)" >> results.csv
echo "------------------------------------------" >> results.csv
for (( i = 0 ; $i < 64 ; i = $i + 1 ))
do
  numactl --cpunodebind=1 --membind=1 java -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:UsePartialInlineSize=64 -XX:UseAVX=3 -cp . compareb $i >& /tmp/out
  TIME=$(cat /tmp/out | grep "Time" | awk '{print $2}')
  echo "    $i    ,    $TIME" >> results.csv                   
done
