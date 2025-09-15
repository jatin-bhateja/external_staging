compile:
	javac --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED test_constant_gen.java
run:
	java  -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:CompileCommand=Print,test_constant_gen::yeild_constant_int  -cp . test_constant_gen 203
	java  -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:CompileCommand=Print,test_constant_gen::yeild_constant_array_element  -cp . test_constant_gen 203
clean:
	rm -rf *.class
