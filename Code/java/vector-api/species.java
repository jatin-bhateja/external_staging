
import jdk.incubator.vector.*;

class species {
   public static int micro() {
     return IntVector.SPECIES_PREFERRED.length() + FloatVector.SPECIES_PREFERRED.length();
   }
   public static void main(String [] args) {
      int res = 0;
      for(int i = 0 ; i < 100000; i++) {
         res += micro();
      }
      System.out.println("[RES] " + res);
   }
}
