import jdk.incubator.vector.*;
public class hpbroadcast {
   public static int micro1() {
      return IntVector.broadcast(IntVector.SPECIES_256, 1).reinterpretAsInts().lane(1);
   }
   public static int micro2() {
      return IntVector.broadcast(IntVector.SPECIES_256, 1).reinterpretAsInts().lane(1);
   }
 
}
