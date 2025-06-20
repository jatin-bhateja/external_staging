import java.util.Arrays;
class red_add {
 public static  int [] arr;
 public static int micro(int ctr) {
    int res = 0;
    for(int i = 0; i < arr.length; i++) {
        res = res + arr[i] * (2);
    }
    return res;
 }
 public static void main(String [] args) {
    int res = 0;
    arr = new int[1024];
    Arrays.fill(arr, 10);
    for(int i = 0; i < 100000; i++) {
       res += micro(i & 1023);     
    }
    System.out.println(res);
 }

}
