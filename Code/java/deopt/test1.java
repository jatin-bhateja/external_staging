

class test {
  public static int [] arr;
  public static int leaf(int ctr) {
     return  arr[ctr] = 1;
  }
  public static int micro(int ctr) {
     return leaf(ctr);
  }
  public static void main(String [] args) {
     int res = 0;
     arr = new int[100000];
     res += micro(10); 
     System.out.println("res = " + res);
  } 
} 
