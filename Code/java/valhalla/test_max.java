import jdk.incubator.vector.*;

public class test_max {
   public static void main(String [] args) {
      System.out.println(ByteVector.SPECIES_MAX);
      System.out.println(ByteVector.broadcast(ByteVector.SPECIES_MAX, 1));
   }
} 

