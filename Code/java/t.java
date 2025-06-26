
import jdk.incubator.vector.*;

class t {
  public static void main(String [] args) {
     //int res = 0;
     VectorShuffle shuffle = ByteVector.SPECIES_64.iotaShuffle(0,1,false);
     VectorShuffle res = shuffle.cast(IntVector.SPECIES_256);
     System.out.println(res);
  }
}



