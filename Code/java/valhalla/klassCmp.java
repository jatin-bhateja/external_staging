

import jdk.incubator.vector.*;

public class klassCmp {
   public static void main(String [] args) {
       if (FloatVector.class == FloatVector.broadcast(FloatVector.SPECIES_256, 10.0f).getClass()) {
          System.out.println("Pass");
       } else {
          System.out.println("Fail");
       }
   }
}
