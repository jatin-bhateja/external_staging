

class ccp {
  public static int x;
  public static int [] arr;

  public static int func1(int ctr) {
     int i = 10;
     while (i < 1024) {
        x = i;
        if ( x < 1 ) {
           i = arr[ctr];
           arr[ctr] = i + 10;
        }
        i++;
     }
     return arr[ctr];
  }
 
  // GVN sweeping.
  public static int func(int ctr) {
     int x = 0;
     int i = 10;
     while (i < 1024) {
        x = i;
        if ( x < 1 ) {        // CCP:EdgeTaken: F
           i = arr[ctr];      // DC
           //x  = i + 10;     // DC
           arr[ctr] = i + 10; // DC
        }                     //
        i++;                  // SCEV: {10,+1,1}
     }
     return i;
  }

  public static void main(String [] args) {
     int res = 0;
     arr = new int[1024];
     for(int i = 0; i < arr.length; i++) {
        arr[i] = i;
     }
     for(int i = 0; i < 1000000; i++) {
        res += func(1);
     }
     System.out.println("[Res] " + res);
  }
}
