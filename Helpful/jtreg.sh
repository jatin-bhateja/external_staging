
export JAVA_HOME=/home/jatinbha/sandboxes/jdk-arraycopy-stub/build/linux-x86_64-server-release/jdk
export NATIVE_HOME=$JAVA_HOME/../images/test/hotspot/jtreg/native
export PATH=$JAVA_HOME/bin:$PATH
export JT_HOME=/home/jatinbha/sandboxes/jdk-jtreg/jtreg/build/images/jtreg

java -jar $JT_HOME/lib/jtreg.jar  -vmoptions:"-XX:UseAVX=3" -nativepath:$NATIVE_HOME -testjdk:$JAVA_HOME  -va -conc:4 -timeout:4 :hotspot_compiler
\cp  JTreport/text/newfailures.txt ./newfailures_avx3_stub.txt

