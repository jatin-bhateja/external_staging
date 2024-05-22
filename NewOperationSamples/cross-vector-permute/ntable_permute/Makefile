all: 
	jextract --output . NTablePermute.h 
	javac NTablePermute_h.java 
	g++ -mavx512f -fPIC -shared NTablePermute.cxx -o libNTablePermute.so
	javac --add-modules=jdk.incubator.vector  -cp . NTablePermute.java 

run:
	java --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector  -cp . NTablePermute 2 -1
#	java -Djextract.trace.downcalls=true --enable-native-access=ALL-UNNAMED --add-modules=jdk.incubator.vector  -cp . NTablePermute 2 -1

clean:
	rm -rf *.so *.class
