// JAVAC : javac --enable-preview --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED field_offset.java
// JAVA  : java --enable-preview -Xbootclasspath/a:. --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -XX:+PrintFieldLayout -cp . field_offset

import jdk.internal.vm.annotation.MultiField;

public class field_offset {
    @MultiField(value=8)
    public float field;

    public static void main(String [] args) {
        field_offset obj = new field_offset();
        obj.field = 10;
        System.out.println(obj.hashCode());
    }
}
