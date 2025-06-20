
import java.util.Arrays;
import java.lang.reflect.Array;

public class test {
   public static final Class<?> intlaneType = int.class;
   public static final Class<?> longlaneType = long.class;

   static void copyMemLoop(Class<?> elemTy, Object src, Object dst, int length) {
       if (elemTy == int.class) {
          for(int i = 0; i < length; i++) {
             Array.setInt(dst, i, Array.getInt(src, i));
          }
       } else  if (elemTy == long.class) {
          for(int i = 0; i < length; i++) {
             Array.setLong(dst, i, Array.getLong(src, i));
          }
       }
   }

   public static void main(String [] args) {
       Object src = null;
       Object dst = null;
       int type = Integer.parseInt(args[0]);
       int size = Integer.parseInt(args[1]);
       if (type == 0)  {
          src = new int[size];
          dst = new int[size];
          Arrays.fill((int[])src, 10);          
          for(int i =0; i < 100000; i++) {
             copyMemLoop(intlaneType, src, dst, size); 
          }
          System.out.println("[Res] " + Array.getInt(dst, 0));
       } else {
          src = new long[size];
          dst = new long[size];
          Arrays.fill((long[])src, 10);          
          for(int i =0; i < 100000; i++) {
             copyMemLoop(longlaneType, src, dst, size); 
          }
          System.out.println("[Res] " + Array.getLong(dst, 0));
       }
   }
}
