
# SEP Setup:
#
#  1/ jar xf fs2xl.exe jvmtisym
#  2/ ls jvmtisym/lin.em64T/libjvmtisym.so .
#  3/ sep -start -app /home/intel/sandboxes/jdk-release/jdk/jdk/build/linux-x86_64-server-slowdebug/jdk/bin/java -args -agentpath:/workloads/JVM/libjvmtisym/libjvmtisym.so=ofile=SEP_DATA.jsym -XX:UseAVX=2 -Xms7g -Xmn12g -XX:+UseParallelGC -XX:ParallelGCThreads=28 -XX:-StackTraceInThrowable -XX:-UseBiasedLocking -XX:+UseLargePages -XX:+TieredCompilation -jar SPECjvm2008.jar -coe -ict -ikv -wt 30 -it 30 -ctf true scimark.monte_carlo"
#  4/ tar cvf sep_data.tar /boot/System.map-3.10.0-957.el7.x86_64 *.jsym *.tb7 libjvmtisym.so
#  5/ Copy sep_data.tar to windows, extract contents and run fs2xl.exe
#

if [ $# == 2 ]; then

echo "Running BM : $1"
echo "JAVA_HOME  : $JAVA_HOME"
echo "DC_TYPE    : $2"

BM_NAME=$1
DC_TYPE=$2
export PATH=$JAVA_HOME/bin/:$PATH

# Single BM (non-startup):
if [ $BM_NAME != "all" ]; then
  if [ $DC_TYPE == "SEP" ]; then
    SEP_ARGS="-agentpath:/workloads/JVM/libjvmtisym/libjvmtisym.so=ofile=${BM_NAME}.jsym"
  else
    SEP_ARGS=""
  fi
  numactl --cpunodebind=0 --membind=0  java $SEP_ARGS -Xmx20g -XX:UseAVX=3 -Xms20g -Xmn12g -XX:+UseParallelGC -XX:ParallelGCThreads=28 -XX:-StackTraceInThrowable -XX:+UseBiasedLocking -XX:-TieredCompilation  -XX:+UseLargePages -jar SPECjvm2008.jar -coe -ict -ikv -wt 30 -it 20 -ctf true ${BM_NAME} | tee ${BM_NAME}.txt 

else 
#All BMs:
#
for i in compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.fft.small scimark.lu.large scimark.lu.small scimark.monte_carlo scimark.sor.large scimark.sor.small  scimark.sparse.large scimark.sparse.small serial sunflow xml.transform xml.validation
  do
    BM_NAME=$i
    if [ $DC_TYPE == "SEP" ]; then
      SEP_ARGS="-agentpath:/workloads/JVM/libjvmtisym/libjvmtisym.so=ofile=${BM_NAME}.jsym"
    else
      SEP_ARGS=""
    fi

    echo "Run $i: $JAVA_HOME"

    numactl --cpunodebind=0 --membind=0  java $SEP_ARGS -Xmx20g -XX:UseAVX=3 -Xms20g -Xmn12g -XX:+UseParallelGC -XX:ParallelGCThreads=28 -XX:-StackTraceInThrowable -XX:+UseLargePages -XX:+UseBiasedLocking -XX:-TieredCompilation -jar SPECjvm2008.jar -coe -ict -ikv -wt 30 -it 20 -ctf true $i | tee ${BM_NAME}.txt

done
fi

else
  echo "run_cmds.sh <BM_NAME> <DC_TYPE>"
fi
