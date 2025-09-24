
JAVAC_VALHALLA=/mnt/c/Github/valhalla/build/linux-x86_64-server-release/images/jdk/bin/javac
JAVA_VALHALLA=/mnt/c/Github/valhalla/build/linux-x86_64-server-release/images/jdk/bin/java

JAVAC_JDK=/home/jatinbha/softwares/jdk-26/bin/javac
JAVA_JDK=/home/jatinbha/softwares/jdk-26/bin/java

JAVAC_GRAAL=/mnt/c/Github/softwares/graalvm-jdk-25+37.1/bin/javac
JAVA_GRAAL=/mnt/c/Github/softwares/graalvm-jdk-25+37.1/bin/java

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

compile_valhalla_relaxed:
	${JAVAC_VALHALLA} --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED --enable-preview -source 25 test_valhalla_relaxed_atomicity.java

run_valhalla_relaxed:
	@echo "[RUN] Valhalla Relaxed Atomicity"
	${JAVA_VALHALLA} --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -XX:-TieredCompilation --enable-preview -cp . test_valhalla_relaxed_atomicity

	#java -XX:-TieredCompilation --enable-preview -XX:StartFlightRecording:method-timing=test_valhalla,filename=JFR_VALHALLA.jfr -cp . test_valhalla


compile_graal:
	${JAVAC_GRAAL} --enable-preview -source 25 test_jdk.java

run_graal:
	@echo "[RUN] GRAAL JDK"
	${JAVA_GRAAL} -XX:+UnlockExperimentalVMOptions -XX:CompileCommand=DontInline,test_jdk::* -XX:+EnableJVMCI -XX:+UseJVMCICompiler -XX:-TieredCompilation -cp . test_jdk 

all_valhalla_relaxed: compile_valhalla_relaxed run_valhalla_relaxed

all_jdk: compile_jdk run_jdk

all_valhalla: compile_valhalla run_valhalla 

all_graal: compile_graal run_graal

all: all_jdk all_graal all_valhalla all_valhalla_relaxed

clean:
	rm -rf *.class *.jfr *.dat
