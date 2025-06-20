
export JAVA_HOME=/home/intel/sandboxes/jdk-release2/jdk/build/linux-x86_64-server-release/jdk/
export NATIVE_HOME=/home/intel/sandboxes/jdk-release2/jdk/build/linux-x86_64-server-release/images/test/hotspot/jtreg/native
export PATH=$JAVA_HOME/bin:$PATH
export JT_HOME=/home/intel/sandboxes/jdk-jtreg/jtreg/build/images/jtreg

java -jar $JT_HOME/lib/jtreg.jar  -vmoptions:"-XX:UseAVX=0" -nativepath:$NATIVE_HOME -testjdk:$JAVA_HOME  -va -conc:4 -timeout:4 :hotspot_compiler
\cp  JTreport/text/newfailures.txt ./newfailures_avx0.txt
rm -rf JTreport JTwork

java -jar $JT_HOME/lib/jtreg.jar  -vmoptions:"-XX:UseAVX=1" -nativepath:$NATIVE_HOME -testjdk:$JAVA_HOME  -va -conc:4 -timeout:4 :hotspot_compiler
\cp  JTreport/text/newfailures.txt ./newfailures_avx1.txt
rm -rf JTreport JTwork

java -jar $JT_HOME/lib/jtreg.jar  -vmoptions:"-XX:UseAVX=2" -nativepath:$NATIVE_HOME -testjdk:$JAVA_HOME  -va -conc:4 -timeout:4 :hotspot_compiler
\cp  JTreport/text/newfailures.txt ./newfailures_avx2.txt
rm -rf JTreport JTwork


