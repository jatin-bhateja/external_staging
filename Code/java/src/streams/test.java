
import java.util.stream.*;
import java.util.List;
import java.util.Arrays;


class test {
   public static long micro(int [] arr, int i) {
      IntStream istream = Arrays.stream(arr);
      int [] res = istream.parallel().map(elm -> elm + 1).toArray();
      return res[i]; 
   }
  
   public static void main(String [] args) {
     long Res = 0;
     int [] arr = new int[10240];
     Arrays.fill(arr, 1);

     for(int i = 0 ; i < 100000; i++) 
        Res += micro(arr, i&(arr.length-1));
     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 10000; i++) 
        Res += micro(arr, i&(arr.length-1));
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + "ms  [Res] " + Res); 
   }
}
