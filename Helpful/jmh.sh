#!/bin/sh

export JAVA_HOME=/home/jatinbha/sandboxes/jdk-mainline-vanilla/build/linux-x86_64-server-release/jdk/
export PATH=$JAVA_HOME/bin:$PATH

mvn clean install

taskset -c 0 java -jar ./jmh-samples/target/benchmarks.jar -wi 3 -i 5 | tee log_6_8.txt

export JAVA_HOME=/home/jatinbha/sandboxes/generic-operands-mainline/build/linux-x86_64-server-release/jdk/
export PATH=$JAVA_HOME/bin:$PATH

mvn clean install

taskset -c 0 java -jar ./jmh-samples/target/benchmarks.jar -wi 3 -i 5 | tee log_gen_opers6_8.txt
