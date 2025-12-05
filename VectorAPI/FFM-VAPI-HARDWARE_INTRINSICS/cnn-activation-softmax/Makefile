all:
	gcc jsvml_s_exp_linux_x86.S -c
	g++ -mavx512f -fPIC -shared jsvml_s_exp_linux_x86.o -o libSoftmaxNative.so SoftmaxNative.cpp
	jextract SoftmaxNative.h
	javac -cp . SoftmaxNative_h.java
	javac -cp . --add-modules=jdk.incubator.vector SoftmaxBench.java


run_ffm:
	java --add-modules=jdk.incubator.vector -Xbatch -XX:-TieredCompilation -cp . SoftmaxBench 1 4096

run_vapi:
	java --add-modules=jdk.incubator.vector -Xbatch -XX:-TieredCompilation -cp . SoftmaxBench 0 4096


run_jfr:
	java --add-modules=jdk.incubator.vector -Xbatch -XX:-TieredCompilation -XX:StartFlightRecording=jdk.CPUTimeSample#enabled=true,filename=SOFTMAX.jfr -cp . SoftmaxBench -1 4096
	jfr view cpu-time-hot-methods SOFTMAX.jfr 

clean:
	rm -rf *.class
	rm -rf *.so
	rm -rf *.jfr
	rm -rf SoftmaxNative_h*.java
	rm -rf *.o
