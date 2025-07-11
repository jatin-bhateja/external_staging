#!/bin/bash
#########################################
## Author: jatinbha
## OpenJDK: Review checklist automation.
#########################################

### 64/32 bit builds.
TIER=$1
SSE_LEVEL=$2
AVX_LEVEL=$3
BUILD_ONLY=$4
OPTS=$5
#BOOT_JDK=/home/jatinbha/softwares/jdk-19
BOOT_JDK=/usr/lib/jvm/java-11-openjdk-amd64/

if [ $# != 5 ] ; then
    echo "./review.sh <TIER> <SSE_LEVEL> <AVX_LEVEL> <BUILD_ONLY> <OPTS>"
    echo "TIER      = 1,2,3,4"
    echo "SSE_LEVEL = 0,1,2,3"
    echo "AVX_LEVEL = 0,1,2,3,KNL"
    echo "BUILD_ONLY = 0/1"
else
   sudo rm -rf build
   sudo mkdir run_logs
   sudo chmod +x ./configure
   
   sudo ./configure --prefix=$PWD/build --with-debug-level=fastdebug --with-native-debug-symbols=external --with-boot-jdk=$BOOT_JDK --disable-warnings-as-errors --with-jtreg=/home/jatinbha/sandboxes/jtreg/build/images/jtreg/ --with-gtest=/home/jatinbha/softwares/googletest-release-1.8.1
   
   sudo ./configure --prefix=$PWD/build --with-debug-level=fastdebug --with-native-debug-symbols=external --with-boot-jdk=$BOOT_JDK --disable-warnings-as-errors --with-jtreg=/home/jatinbha/sandboxes/jtreg/build/images/jtreg/ --with-gtest=/home/jatinbha/softwares/googletest-release-1.8.1 --with-target-bits=32
   
   sudo ./configure --with-conf-name=linux-minimal --enable-debug --disable-precompiled-headers --with-jvm-variants=minimal --with-boot-jdk=$BOOT_JDK  --with-default-make-target="hotspot" --with-zlib=system
   
   sudo ./configure --with-conf-name=linux-zero --enable-debug --disable-precompiled-headers --with-jvm-variants=zero --with-version-build=0 --with-boot-jdk= --with-default-make-target=hotspot --with-boot-jdk=$BOOT_JDK --with-zlib=system
   
   ls build
   
   sudo make CONF=linux-x86_64-server-fastdebug
   sudo make CONF=linux-x86-server-fastdebug
   sudo make CONF=linux-minimal
   sudo make CONF=linux-zero

   if [ $BUILD_ONLY == 0 ]; then
      sudo /home/jatinbha/bin/test.sh ${TIER} ${SSE_LEVEL} ${AVX_LEVEL} ""
   
      sudo mv logs run_logs/logs.TIER${TIER}_SSE_${SSE_LEVEL}_AVX${AVX_LEVEL}.x86_64
   
      sudo /home/jatinbha/bin/test32.sh ${TIER} ${SSE_LEVEL} ${AVX_LEVEL} ""
   
      sudo mv logs run_logs/logs.TIER${TIER}_SSE_${SSE_LEVEL}_AVX${AVX_LEVEL}.x86
   
      sudo /home/jatinbha/bin/testVECTOR.sh ${SSE_LEVEL} ${AVX_LEVEL}  ""
   
      sudo mv logs run_logs/logs.TIER${TIER}_SSE_${SSE_LEVEL}_AVX${AVX_LEVEL}.VAPI+VECTOR.x86_64
   
      sudo /home/jatinbha/bin/testVECTOR32.sh ${SSE_LEVEL} ${AVX_LEVEL} ""
   
      sudo mv logs run_logs/logs.TIER${TIER}_SSE_${SSE_LEVEL}_AVX${AVX_LEVEL}.VAPI+VECTOR.x86
   fi
fi
