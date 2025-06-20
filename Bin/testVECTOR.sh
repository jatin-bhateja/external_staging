#!/bin/bash
###################################
## Author: jatinbha
## OpenJDK: Unit test automation.
##################################

sudo rm -rf logs
mkdir logs

if [ $# != 3 ] ; then
    echo "./testVECTOR.sh <SSE_LEVEL> <AVX_LEVEL> <OPTS>"
    echo "SSE_LEVEL = 0,1,2,3,4"
    echo "AVX_LEVEL = 0,1,2,3,KNL"
else
   SSELEVEL=$1
   AVXLEVEL=$2
   OPTS=$3

   AVXLEVELS=""
   if [ $AVXLEVEL == "all" ]; then
       AVXLEVELS="0 1 2 3 KNL"
   elif [ $AVXLEVEL != "" ]; then
       AVXLEVELS=$AVXLEVEL
   fi
       
   SSELEVELS=""
   if [ $SSELEVEL == "all" ]; then
       SSELEVELS="0 1 2 3 4"
   elif [ $SSELEVEL != "" ]; then
       SSELEVELS=$SSELEVEL
   fi
  
   for sse in $SSELEVELS
   do
      echo "SSELEVEL = $sse"
      sudo  make  test TEST="test/jdk/jdk/incubator/vector/"  CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" | tee log_VAPI_SSE$sse.txt
      sudo mkdir -p logs/LOGS_VAPI_sselevel$sse
      sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VAPI_sselevel$sse/
      sudo mv log_*.txt logs/LOGS_VAPI_sselevel$sse
      sudo  make  test TEST="test/hotspot/jtreg:hotspot_vector_1" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" | tee log_VECTOR_SSE$sse.txt
      sudo  make  test TEST="test/hotspot/jtreg:hotspot_vector_2" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" >> log_VECTOR_SSE$sse.txt
      sudo  make  test TEST="test/jdk/:jdk_vector" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" >> log_VECTOR_SSE$sse.txt
      mkdir -p logs/LOGS_VECTOR_sselevel$sse
      sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VECTOR_sselevel$sse/
      sudo mv log_*.txt logs/LOGS_VECTOR_sselevel$sse
   done

   for avx in $AVXLEVELS
   do
      echo "AVXLEVEL = $avx"
      if [ $avx == "KNL" ]; then
         sudo  make  test TEST="test/jdk/jdk/incubator/vector/"  CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" | tee log_VAPI_AVX$avx.txt
         sudo mkdir -p logs/LOGS_VAPI_avxlevel$avx
         sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VAPI_avxlevel$avx/
         sudo mv log_*.txt logs/LOGS_VAPI_avxlevel$avx
         sudo  make  test TEST="test/hotspot/jtreg:hotspot_vector_1" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSetting  $OPTS" | tee log_VECTOR_AVX$avx.txt
         sudo  make  test TEST="test/hotspot/jtreg:hotspot_vector_2" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" >> log_VECTOR_AVX$avx.txt
         sudo  make  test TEST="test/jdk/:jdk_vector" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" >> log_VECTOR_AVX$avx.txt
      else
         sudo  make  test TEST="test/jdk/jdk/incubator/vector/"  CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=$avx $OPTS" | tee log_VAPI_AVX$avx.txt
         sudo mkdir -p logs/LOGS_VAPI_avxlevel$avx
         sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VAPI_avxlevel$avx/
         sudo mv log_*.txt logs/LOGS_VAPI_avxlevel$avx
         sudo  make  test TEST="test/hotspot/jtreg:hotspot_vector_1" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=$avx $OPTS" | tee log_VECTOR_AVX$avx.txt
         sudo  make  test TEST="test/hotspot/jtreg:hotspot_vector_2" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=$avx $OPTS" >> log_VECTOR_AVX$avx.txt
         sudo  make  test TEST="test/jdk/:jdk_vector" CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=16;TIMEOUT_FACTOR=16;JAVA_OPTIONS= -XX:UseAVX=$avx $OPTS" >> log_VECTOR_AVX$avx.txt
      fi
      sudo mkdir -p logs/LOGS_VECTOR_avxlevel$avx
      sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VECTOR_avxlevel$avx/
      sudo mv log_*.txt logs/LOGS_VECTOR_avxlevel$avx
   done
fi
