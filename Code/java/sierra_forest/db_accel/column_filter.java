
import java.util.Arrays;
import java.util.concurrent.*;
import jdk.incubator.vector.*;

public class column_filter {
   public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256;

   interface Predicate {
       VectorMask<Integer> apply(Vector<Integer> input, int pivot);
   }

   public static void micro(int [] compressed, int [] source, Predicate cond) {
       int ctr = 0;
       for (int i = 0, j = 0; i < source.length; i += SPECIES.length()) {
           IntVector vec = IntVector.fromArray(SPECIES, source, i);
           //VectorMask<Integer> pred = cond.apply(vec, 1023);
           //VectorMask<Integer> pred = vec.compare(VectorOperators.GT, 1023);
           VectorMask<Integer> pred = VectorMask.fromLong(SPECIES, ctr++);
           vec.compress(pred).intoArray(compressed, j);
           j += pred.trueCount();
       }
   }
   
   public static void main(String [] args) {
       ThreadLocalRandom random = ThreadLocalRandom.current(); 
       int [] column = random.ints(4096, 0, 4096).toArray();
       int [] result = new int[4096];
       for (int i = 0; i < 100000; i++) {
           micro(result, column, (v, pivot) -> v.compare(VectorOperators.GT, pivot));  
       }
       long t1 = System.currentTimeMillis();
       for (int i = 0; i < 30000; i++) {
           micro(result, column, (v, pivot) -> v.compare(VectorOperators.GT, pivot));  
       }
       long t2 = System.currentTimeMillis();
       System.out.println("[time]  " + (t2-t1) + " ms  [res] " + Arrays.toString(Arrays.copyOfRange(result, 0, 16)));
   }
}
