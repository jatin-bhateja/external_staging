#!/bin/bash
export JAVA_HOME=/home/jbhateja/softwares/jdk-20/
export PATH=$JAVA_HOME/bin:$PATH
i=1; while [ $i -lt  32 ]; do  echo "Running upacking $i"; java --add-modules=jdk.incubator.vector VectorBitUnpacker${i}; i=$(expr $i + 1); done
