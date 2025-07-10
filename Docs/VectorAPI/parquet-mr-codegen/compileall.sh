#!/bin/bash
export JAVA_HOME=/home/jbhateja/softwares/jdk-20/
export PATH=$JAVA_HOME/bin:$PATH
i=1; while [ $i -lt  32 ]; do  echo "Compiling $i"; javac --add-modules=jdk.incubator.vector VectorBitUnpacker${i}.java; i=$(expr $i + 1); done
echo "Compiling BytePacker.java"
javac BytePacker.java
echo "Compiling BytePackerFactory.java"
javac BytePackerFactory.java
echo "Compiling ByteBitPackingLE.java"
javac ByteBitPackingLE.java
