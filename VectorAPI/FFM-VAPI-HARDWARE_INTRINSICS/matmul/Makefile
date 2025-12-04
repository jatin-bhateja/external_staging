all:
	g++ -mavx512f -fPIC -shared -o libmatmul_512.so matmul_512.c
	jextract matmul_512.h
	javac matmul_512_h.java
	javac --add-modules=jdk.incubator.vector matmul_512_bench.java


run_ffm:
	java --add-modules=jdk.incubator.vector -Xbatch -XX:-TieredCompilation -cp . matmul_512_bench 0 false 512 256

run_vapi:
	java --add-modules=jdk.incubator.vector -Xbatch -XX:-TieredCompilation -cp . matmul_512_bench 1 false 512 256


run_jfr:
	java --add-modules=jdk.incubator.vector -Xbatch -XX:-TieredCompilation -XX:StartFlightRecording=jdk.CPUTimeSample#enabled=true,filename=MATMUL.jfr -cp . matmul_512_bench -1 false 512 256
	jfr view cpu-time-hot-methods MATMUL.jfr 

clean:
	rm -rf *.class
	rm -rf *.so
	rm -rf *.jft
	rm -rf matmul_512_h*.java
