
public class value_range {
   public int value;
   public static int micro(int mask) {
       //mask = Math.clamp(mask, -10000, 10000); 
       mask = Math.min(10000, Math.max(mask, -10000)); 
       //[TypeInt: _lo = -10000, _hi = 10000]
       if (mask > 10000 || mask < -10000) {
         // No-UTC
         return mask + 100;
       }
       return mask;
   }
   public static void main(String [] args) {
       int res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(i);
       }
       System.out.println("[res] " + res);
   } 
}
