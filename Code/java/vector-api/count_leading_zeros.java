
import jdk.incubator.vector.*;
import java.util.Arrays;

public class count_leading_zeros {
   public static VectorSpecies<Integer> ISP = IntVector.SPECIES_PREFERRED;

   public static void micro(int [] dst, int [] src) {
       IntVector.fromArray(ISP, src, 0)
                .lanewise(VectorOperators.LEADING_ZEROS_COUNT)
                .intoArray(dst, 0);
   }

   public static void main(String [] args) {
       int [] src = {
           33554433, 33554433, 33554433, 33554433, 
           33554433, 33554433, 33554433, 33554433, 
           33554433, 33554433, 33554433, 33554433, 
           33554433, 33554433, 33554433, 33554433, 
       };
       int [] dst = new int[16];
       for (int i = 0; i < 100000; i++) {
           micro(dst, src);
       }
       System.out.println("[res] " + Arrays.toString(dst));
   }
}

/*
   Emperically determined expression ~(src >> 1) & src to turn off all bit after leftmost set bits.

        jshell> for (int i = 0; i < Integer.MAX_VALUE; i++) {
           ...>     int new_i = ~(i >>> 1) & i;
           ...>     if (new_i != i) {
           ...>         System.out.println(new_i + " != " + i); if (first_n == 0) break; else first_n--;
           ...>     }
           ...> }
        2 != 3
        4 != 6
        4 != 7
        10 != 11
        8 != 12
        9 != 13
        8 != 14
        8 != 15
        18 != 19
        20 != 22
        20 != 23
*/

/*
100000000000000000000010
8388610
100000000000000000000011
8388611

jshell> ~(8388611 >> 1) & 8388611
$47 ==> 8388610
*/
