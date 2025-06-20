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
      sudo  make  test TEST="test/hotspot/jtreg/compiler/valhalla/"  CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=32;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" | tee log_VALHALLA_SSE$sse.txt
      sudo mkdir -p logs/LOGS_VALHALLA_sselevel$sse
      sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VALHALLA_sselevel$sse/
      sudo mv log_*.txt logs/LOGS_VALHALLA_sselevel$sse
   done

   for avx in $AVXLEVELS
   do
      echo "AVXLEVEL = $avx"
      if [ $avx == "KNL" ]; then
         sudo  make  test TEST="test/hotspot/jtreg/compiler/valhalla"  CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=32;TIMEOUT_FACTOR=8;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" | tee log_VALHALLA_AVX$avx.txt
      else
         sudo  make  test TEST="test/hotspot/jtreg/compiler/valhalla"  CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=32;TIMEOUT_FACTOR=8;JAVA_OPTIONS= -XX:UseAVX=$avx $OPTS" | tee log_VALHALLA_AVX$avx.txt
      fi
      sudo mkdir -p logs/LOGS_VALHALLA_avxlevel$avx
      sudo mv build/linux-x86_64-server-fastdebug/test-results ./logs/LOGS_VALHALLA_avxlevel$avx/
      sudo mv log_*.txt logs/LOGS_VALHALLA_avxlevel$avx
   done
fi
