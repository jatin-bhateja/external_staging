

export JAVA_HOME=/home/jatinbha/sandboxes/jdk-arraycopy-stub/build/linux-x86_64-server-fastdebug/jdk/
export JAVA_HOME=/home/jatinbha/sandboxes/jdk-arraycopy-pi/build/linux-x86_64-server-fastdebug/jdk/
export PATH=$JAVA_HOME/bin:$PATH

for i in compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.fft.small scimark.lu.large scimark.lu.small scimark.monte_carlo scimark.sor.large scimark.sor.small  scimark.sparse.large scimark.sparse.small serial sunflow xml.transform xml.validation
  do
    echo "Run $i: Profile : $JAVA_HOME"

    numactl --cpunodebind=0 --membind=0  java -Xmx20g -XX:UseAVX=3 -XX:AVX3Threshold=0 -Xms20g -Xmn12g -XX:+UseParallelGC -XX:ParallelGCThreads=28 -XX:-StackTraceInThrowable -XX:-UseBiasedLocking -XX:+UseLargePages -XX:-TieredCompilation -jar SPECjvm2008.jar -coe -ict -ikv -wt 30 -it 10 -ctf true $i >& ${i}_profile_r1.txt

done

for i in compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.fft.small scimark.lu.large scimark.lu.small scimark.monte_carlo scimark.sor.large scimark.sor.small  scimark.sparse.large scimark.sparse.small serial sunflow xml.transform xml.validation
  do
    echo "Run $i: Profile : $JAVA_HOME"

    numactl --cpunodebind=0 --membind=0  java -Xmx20g -XX:UseAVX=3 -XX:MaxVectorSize=32 -XX:AVX3Threshold=0 -Xms20g -Xmn12g -XX:+UseParallelGC -XX:ParallelGCThreads=28 -XX:-StackTraceInThrowable -XX:-UseBiasedLocking -XX:+UseLargePages -XX:-TieredCompilation -jar SPECjvm2008.jar -coe -ict -ikv -wt 30 -it 10 -ctf true $i >& ${i}_profile_r2.txt

done
