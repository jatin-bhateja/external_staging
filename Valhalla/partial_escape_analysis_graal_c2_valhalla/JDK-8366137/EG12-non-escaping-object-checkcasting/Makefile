include ../tools.conf

compile_jdk:
	${JAVAC_JDK} test_jdk.java

run_jdk:
	@echo "[RUN] C2 JDK"
	${JAVA_JDK} -XX:-TieredCompilation -XX:CompileCommand=DontInline,test_jdk::* -cp . test_jdk

        #java -XX:-TieredCompilation -XX:StartFlightRecording:method-timing=test_jdk,filename=JFR_JDK.jfr -cp . test_jdk

jfr_jdk:
	jfr view method-timing JFR_JDK.jfr



compile_valhalla:
	${JAVAC_VALHALLA} --enable-preview -source 25 test_valhalla.java

run_valhalla:
	@echo "[RUN] Valhalla"
	${JAVA_VALHALLA} -XX:-TieredCompilation -XX:CompileCommand=DontInline,test_valhalla::* --enable-preview -cp . test_valhalla

	#java -XX:-TieredCompilation --enable-preview -XX:StartFlightRecording:method-timing=test_valhalla,filename=JFR_VALHALLA.jfr -cp . test_valhalla

jfr_valhalla:
	jfr view method-timing JFR_JDK.jfr

compile_graal:
	${JAVAC_GRAAL} --enable-preview -source 25 test_jdk.java

run_graal:
	@echo "[RUN] GRAAL JDK"
	${JAVA_GRAAL} -XX:+UnlockExperimentalVMOptions -XX:CompileCommand=DontInline,test_jdk::* -XX:+EnableJVMCI -XX:+UseJVMCICompiler -XX:-TieredCompilation -cp . test_jdk 

all_jdk: compile_jdk run_jdk

all_valhalla: compile_valhalla run_valhalla 

all_graal: compile_graal run_graal

all: all_jdk all_graal all_valhalla

clean:
	rm -rf *.class *.jfr *.dat
