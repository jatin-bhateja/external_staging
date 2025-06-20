#!/bin/bash
###################################
## Author: jatinbha
## OpenJDK: Unit test automation.
##################################

sudo rm -rf logs
sudo mkdir logs

if [ $# != 4 ]; then
    echo "./test.sh <TIER> <SSE_LEVEL> <AVX_LEVEL> <OPTS>"
    echo "TIER      = 1,2,3,4"
    echo "AVX_LEVEL = 0,1,2,3,KNL,ALL"
    echo "SSE_LEVEL = 0,1,2,3,4,ALL"
else
   TIER=$1
   SSELEVEL=$2
   AVXLEVEL=$3
   OPTS=$4

   TIERS=""
   if [ $TIER == "all" ]; then
       TIERS="1 2 3 4"
   elif [ $TIER != "" ]; then
       TIERS=$TIER
   fi

   SSELEVELS=""
   if [ $SSELEVEL == "all" ]; then
       SSELEVELS="0 1 2 3 4"
   elif [ $SSELEVEL != "" ]; then
       SSELEVELS=$SSELEVEL
   fi

   AVXLEVELS=""
   if [ $AVXLEVEL == "all" ]; then
       AVXLEVELS="0 1 2 3 KNL"
   elif [ $AVXLEVEL != "" ]; then
       AVXLEVELS=$AVXLEVEL
   fi

   for tier in $TIERS
   do
       for sse in $SSELEVELS
       do
           echo "TIER = $tier , SSE_LEVEL = $sse"
           if [ $tier == 4 ]; then
               sudo make test TEST="test/hotspot/jtreg:hotspot_vector_1" CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" | tee log_tier4_SSE$sse.txt
               sudo make test TEST="test/hotspot/jtreg:hotspot_vector_2" CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" >> log_tier4_SSE$sse.txt
               sudo make test TEST="test/jdk/:jdk_vector" CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=0 -XX:UseSSE=$sse $OPTS" >> log_tier4_SSE$sse.txt
           else 
               sudo make test-tier$tier CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseSSE=$sse $OPTS" | tee log_tier${tier}_SSE$sse.txt
           fi
           sudo mkdir -p logs/LOGS_tier${tier}_sselevel$sse
           sudo mv build/linux-x86-server-fastdebug/test-results ./logs/LOGS_tier${tier}_sselevel$sse/
           sudo mv log_*.txt logs/LOGS_tier${tier}_sselevel$sse
       done
       for avx in $AVXLEVELS
       do
           echo "TIER = $tier , AVX_LEVEL = $avx"
           if [ $avx == "KNL" ]; then
               if [ $tier == 4 ]; then
                   sudo make test TEST="test/hotspot/jtreg:hotspot_vector_1" CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" | tee log_tier4_AVX$avx.txt
                   sudo make test TEST="test/hotspot/jtreg:hotspot_vector_2" CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" >> log_tier4_AVX$avx.txt
                   sudo make test TEST="test/jdk/:jdk_vector" CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" >> log_tier4_AVX$avx.txt
               else
                   sudo make test-tier$tier CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=3 -XX:+UseKNLSetting $OPTS" | tee log_tier4_AVX$avx.txt
               fi
           else
               sudo make test-tier$tier CONF=linux-x86-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=8;JAVA_OPTIONS=-XX:UseAVX=$avx $OPTS" | tee log_tier${tier}_AVX$avx.txt
           fi
           sudo mkdir -p logs/LOGS_tier${tier}_avxlevel$avx
           sudo mv build/linux-x86-server-fastdebug/test-results ./logs/LOGS_tier${tier}_avxlevel$avx/
           sudo mv log_*.txt logs/LOGS_tier${tier}_avxlevel$avx
       done
   done
fi
