
import java.util.Arrays;
import java.util.Random;
import jdk.incubator.vector.*;

class rearrangef {

  public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_64;

  public static void micro(float [] dst, float [] arr, int [] indices) {
     for (int i = 0; i < 1000; i++) {
        for (int j = 0; j < dst.length; j+= SPECIES.length()) {
            FloatVector.fromArray(SPECIES, arr, j)
                       .rearrange(VectorShuffle.fromArray(FloatVector.SPECIES_64, indices, j))
                       .intoArray(dst, j);
        }
     }
  }

  public static void main(String [] args) {
     Random r = new Random(1023);
     float [] arr     = new float[512];
     float [] dst     = new float[512];
     int   [] indices = new int[512];
     for (int i = 0; i < indices.length; i++) {
        indices[i] = r.nextInt(2);
     }
     for(int i = 0 ; i < arr.length; i++) {
        arr[i] = (float)(i + 10);
     }
     for(int i = 0; i < 100; i++) {
        micro(dst, arr, indices);
     }
     System.out.println(Arrays.toString(dst));
  }
}
