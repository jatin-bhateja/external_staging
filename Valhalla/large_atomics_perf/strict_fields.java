
import jdk.internal.vm.annotation.Strict;

public class strict_fields {
   @Strict
   public float re;

   @Strict
   public float im;

   public strict_fields(float re, float im) {
       this.re = re;
       this.im = im;
   }

   public static void main(String [] args) {
      strict_fields obj = new strict_fields(1.0f, 2.0f); 
      System.out.println("aggregate = " + (obj.im + obj.re));
   }
}
