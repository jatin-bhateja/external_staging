

class test {
  public static int [] arr;
  public static int leaf(int ctr) {
    try { return  arr[ctr] = 1; }
    catch (Exception e) {
       System.out.println("Caught : " + e);
    }
    System.out.println("Running after exception.");
    return -1;
  }
  public static int micro(int ctr) {
     return leaf(ctr);
  }
  public static void main(String [] args) {
     int res = 0;
     arr = new int[100000];
     for(int i = 0 ; i < 100001 ;i++) {
        res += micro(i); 
     }
     System.out.println("res = " + res);
  } 
} 
