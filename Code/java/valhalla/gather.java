
import jdk.incubator.vector.*;

public class gather {
  public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

  public static int micro(int [] arr, int [] map) {
    return IntVector.fromArray(SPECIES, arr, 0, map, 0)
                     .lane(1);
  }
  
  public static void main(String [] args) {
    int res = 0; 
    int [] map = {1, 2, 3, 4, 5, 1011, 1012, 1013, 1014};
    int [] arr = new int[2048];
    for (int i = 0; i < arr.length; i++) {
       arr[i] = i;   // PopulateIndex
    } 
    for (int i = 0; i < 10000; i++) {
       res += micro(arr, map); 
    }
    System.out.println("[res] " + res);
  }
}
