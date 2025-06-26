####

####

if [ $# != 2 ] ; then
  echo "./test.sh <TIER> <AVX_LEVEL>"
  echo "TIER      = 1,2,3"
  echo "AVX_LEVEL = 0,1,2,3,KNL"
else

TIER=$1
AVXLEVEL=$2

if [ $TIER == "all" ] || [ $TIER == "1" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "0" ]  ; then
   echo "TIER = 1 , AVXLEVEL = 0"
   sudo make test-tier1 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=0" | tee log_tier1_AVX0.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "2" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "0" ]  ; then
   echo "TIER = 2 , AVXLEVEL = 0"
   sudo make test-tier2 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=0" | tee log_tier2_AVX0.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "3" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "0" ]  ; then
   echo "TIER = 3 , AVXLEVEL = 0"
   sudo make test-tier3 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=0" | tee log_tier3_AVX0.txt
   fi
fi
  
if [ $TIER == "all" ] || [ $TIER == "1" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "1" ]  ; then
   echo "TIER = 1 , AVXLEVEL = 1"
   sudo make test-tier1 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=1" | tee log_tier1_AVX1.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "2" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "1" ]  ; then
   echo "TIER = 2 , AVXLEVEL = 1"
   sudo make test-tier2 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=1" | tee log_tier2_AVX1.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "3" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "1" ]  ; then
   echo "TIER = 3 , AVXLEVEL = 1"
   sudo make test-tier3 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=1" | tee log_tier3_AVX1.txt
   fi
fi
  
if [ $TIER == "all" ] || [ $TIER == "1" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "2" ]  ; then
   echo "TIER = 1 , AVXLEVEL = 2"
   sudo make test-tier1 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=2" | tee log_tier1_AVX2.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "2" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "2" ]  ; then
   echo "TIER = 2 , AVXLEVEL = 2"
   sudo make test-tier2 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=2" | tee log_tier2_AVX2.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "3" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "2" ]  ; then
   echo "TIER = 3 , AVXLEVEL = 2"
   sudo make test-tier3 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=2" | tee log_tier3_AVX2.txt
   fi
fi
  
if [ $TIER == "all" ] || [ $TIER == "1" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "3" ]  ; then
   echo "TIER = 1 , AVXLEVEL = 3"
   sudo make test-tier1 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=3" | tee log_tier1_AVX3.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "2" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "3" ]  ; then
   echo "TIER = 2 , AVXLEVEL = 3"
   sudo make test-tier2 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=3" | tee log_tier2_AVX3.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "3" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "3" ]  ; then
   echo "TIER = 3 , AVXLEVEL = 3"
   sudo make test-tier3 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=3" | tee log_tier3_AVX3.txt
   fi
fi
  
if [ $TIER == "all" ] || [ $TIER == "1" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "KNL" ]  ; then
   echo "TIER = 1 , AVXLEVEL = 3 (KNL)"
   sudo make test-tier1 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSettings" | tee log_tier1_AVX3_KNL.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "2" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "KNL" ]  ; then
   echo "TIER = 2 , AVXLEVEL = 3 (KNL)"
   sudo make test-tier2 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSettings" | tee log_tier2_AVX3_KNL.txt
   fi
fi

if [ $TIER == "all" ] || [ $TIER == "3" ]; then
   if [ $AVXLEVEL == "all" ] || [ $AVXLEVEL == "KNL" ]  ; then
   echo "TIER = 3 , AVXLEVEL = 3 (KNL)"
   sudo make test-tier3 CONF=linux-x86_64-server-fastdebug JTREG="RETAIN=all;JOBS=8;TIMEOUT_FACTOR=4;JAVA_OPTIONS= -XX:UseAVX=3 -XX:+UseKNLSettings" | tee log_tier3_AVX3_KNL.txt
   fi
fi

fi
