all:
	gcc svml_z0_exp_s_ha.S -c
	g++ -mavx512f -fPIC -shared svml_z0_exp_s_ha.o -o libSoftmaxNative.so SoftmaxNative.cpp
	jextract SoftmaxNative.h
	javac SoftmaxNative_h.java
	javac --add-modules=jdk.incubator.vector SoftmaxBench.java


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
