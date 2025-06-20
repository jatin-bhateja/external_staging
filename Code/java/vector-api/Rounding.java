public class Rounding {
   public static void main(String [] args) {
       for (int i = 0; i < Integer.MAX_VALUE; i++) {
           int t1 = i >>> 24;
           int t2 = i & ~t1;
           int positionOfTrailingOne = Integer.numberOfTrailingZeros(t2);
           int positionOfLeadingOne = 32 - Integer.numberOfLeadingZeros(t2);
           if ((positionOfLeadingOne - positionOfTrailingOne) > 24) {
              System.out.println("positionOfLeadingOne = " + positionOfLeadingOne);
              System.out.println("positionOfTrailingOne = " + positionOfTrailingOne);
              System.out.println("for i = " + i +  " t2 = " + t2); 
           }
       }
   }
}
