
import jdk.incubator.vector.*;

public class test {
   public static void main(String [] args) {
       short [] special_arr = {
          Halffloat.MAX_VALUE, Halffloat.MIN_VALUE, Halffloat.POSITIVE_INFINITY, Halffloat.NEGATIVE_INFINITY, Halffloat.NaN, 0,
          Halffloat.MAX_VALUE, Halffloat.MIN_VALUE, Halffloat.POSITIVE_INFINITY, Halffloat.NEGATIVE_INFINITY, Halffloat.NaN, 0,
          Halffloat.MAX_VALUE, Halffloat.MIN_VALUE, Halffloat.POSITIVE_INFINITY
       };
       short [] arr = {
          Float.floatToFloat16(1.0),
          Float.floatToFloat16(2.0),
          Float.floatToFloat16(3.0),
          Float.floatToFloat16(4.0),

          Float.floatToFloat16(5.0),
          Float.floatToFloat16(6.0),
          Float.floatToFloat16(7.0),
          Float.floatToFloat16(8.0),

          Float.floatToFloat16(9.0),
          Float.floatToFloat16(10.0),
          Float.floatToFloat16(11.0),
          Float.floatToFloat16(12.0),

          Float.floatToFloat16(13.0),
          Float.floatToFloat16(14.0),
          Float.floatToFloat16(15.0),
          Float.floatToFloat16(16.0)
       };
       
       Halffloat HFV1 = HalffloatVector.fromArray(HalffloatVector.SPECIES_128, arr, 0);
       System.out.println(HFV1.reduceLanesToLong(VectorOperators.ADD));
   }

}
