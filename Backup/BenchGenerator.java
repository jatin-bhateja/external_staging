
import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.util.Random;
import java.util.List;
import java.util.ArrayList;


public class BenchGenerator  {
   public BufferedWriter out;
   public static final Random rd = new Random(1023);
   public static String [] fieldTypes = {"byte", "short", "int", "long" , "float", "double"};

   record FieldDesc(String fieldName, String fieldType) {}
 
   public List<FieldDesc> fields;

   public BenchGenerator(String file) throws Exception {
       out = new BufferedWriter(new FileWriter(file));
       fields = new ArrayList<FieldDesc>();
   }
   
   public void dumpHeader() throws Exception {
      String header =
      """
      import jdk.internal.vm.annotation.Strict;
      import jdk.internal.vm.annotation.NullRestricted;
      import jdk.internal.vm.annotation.LooselyConsistentValue;
      """;
      out.write(header); 
   }


   public String getFieldType(String fieldType) {
      return fieldType.equals("") ? fieldTypes[rd.nextInt(fieldTypes.length)] : fieldType;
   }

   public String getFieldInitValue(String fieldType) {
      return switch (fieldType) {
         case "byte" -> "(byte)" + (byte)rd.nextInt(10000);
         case "short" -> "(short)" + (short)rd.nextInt(10000);
         case "int" -> "" + rd.nextInt(10000);
         case "long" -> "" + rd.nextLong(10000);
         case "float" -> "" + rd.nextFloat(10000.0f) + "f";
         case "double" -> "" + rd.nextDouble(10000.0);
         default -> "";
      };
   }

   public int getTypeSizeInBits(String fieldType) {
      return switch (fieldType) {
         case "byte" -> 8;
         case "short" -> 16;
         case "int" -> 32;
         case "long" -> 64;
         case "float" -> 32;
         case "double" -> 64;
         default -> 0;
      };
   }

   public void dumpValueClass(String fieldType, boolean atomicUpdate, int fieldCount) throws Exception {
      StringBuilder vclass = new StringBuilder();
      vclass.append("\n\n");
      vclass.append(
      String.format(
      """
      %s
      value class MyValue {
      """
      , (atomicUpdate ? "" : "@LooselyConsistentValue")
      ));

      String fieldDecl = 
      """
          public %s %s;
      """;

      // Dump field decelerations.
      for (int i = 0; i < fieldCount; i++) {
          FieldDesc desc = new FieldDesc("fld"+i, getFieldType(fieldType));
          vclass.append(String.format(fieldDecl, desc.fieldType(), desc.fieldName()));
          fields.add(desc);
      }
      
      vclass.append("\n\n");
      vclass.append(
      """
          public MyValue(
      """);
      for (int i = 0; i < fieldCount; i++) {
          if (i != 0) {
              vclass.append(", ");
          }
          FieldDesc desc = fields.get(i);
          vclass.append(desc.fieldType() + " " + desc.fieldName());
      }
      vclass.append(")  {\n");
      for (int i = 0; i < fieldCount; i++) {
          FieldDesc desc = fields.get(i);
          vclass.append("        this." + desc.fieldName() + " = " + desc.fieldName() + "; \n");
      }
      vclass.append("    }");

      vclass.append("\n\n");
      vclass.append(
      """
          public MyValue add(MyValue augend) {
              return new MyValue(
      """
      );
      
      for (int i = 0; i < fieldCount; i++) {
          if (i != 0) {
              vclass.append(", ");
          }
          FieldDesc desc = fields.get(i);
          vclass.append("(" + desc.fieldType() + ") (this." + desc.fieldName() + " + augend." + desc.fieldName +  ")");
      }
      vclass.append(");\n");
      vclass.append("    }\n");

      vclass.append("\n");
      String tostring = 
      """
          public String toString() {
              StringBuilder sb = new StringBuilder();
              sb.append("[MyValue] => ");
      """;
      vclass.append(tostring);
      for (int i = 0; i < fieldCount; i++) {
          FieldDesc desc = fields.get(i);
          vclass.append("        sb.append(" + desc.fieldName() + ");\n");
      }
      vclass.append("        return sb.toString();\n    }\n");
      vclass.append("}\n");
      out.write(vclass.toString());
   }

   public void dumpMainClass(String className, boolean nullRestricted) throws Exception {
       StringBuilder vclass = new StringBuilder();
       vclass.append("\n");
       String mainClass =
       """
       public class %s {
           @Strict
           %s
           public MyValue init = new MyValue(""";
    
       vclass.append(String.format(mainClass, className, nullRestricted ? "@NullRestricted" : ""));

       for (int i = 0; i < fields.size(); i++) {
           if (i != 0) {
               vclass.append(", ");
           }
           FieldDesc desc = fields.get(i);
           vclass.append(getFieldInitValue(desc.fieldType()));
       }
       vclass.append(");\n\n");

       String micro = """
           public void micro(MyValue augend) {
               init = init.add(augend);
           }

           public static void main(String [] args) {
               %s obj = new %s();

               for (int i = 0; i < 1000000; i++) {
                   obj.micro(obj.init);
               }

               long t1 = System.currentTimeMillis();
               for (int i = 0; i < 1000000; i++) {
                   obj.micro(obj.init);
               }
               long t2 = System.currentTimeMillis();

               System.out.println("[time] " + (t2-t1) + "ms [res]" + obj.init);
           }
       }       
       """;

       vclass.append(String.format(micro, className, className));
       out.write(vclass.toString());
   }

   public static void main(String [] args) throws Exception {
       // Mode = 
       //   0  -> Strict atomic update without @LooselyConsistentValue
       //   1  -> Allow non-atomic update with @LooselyConsistentValue
       //   2  -> Enforce no field flattening
       int mode = Integer.parseInt(args[0]);
       int valuePayloadSize = Integer.parseInt(args[1]);

       for (int i = 0; i < fieldTypes.length; i++) {
           String className = "ValueClass" + Character.toUpperCase(fieldTypes[i].charAt(0)) + valuePayloadSize;
           BenchGenerator gen = new BenchGenerator(className + ".java");
           gen.dumpHeader();
           gen.dumpValueClass(fieldTypes[i], mode == 0, valuePayloadSize / gen.getTypeSizeInBits(fieldTypes[i]));
           gen.dumpMainClass(className, mode != 2);
           gen.out.flush();
       } 
   }
}
