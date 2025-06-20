

class ncrc {
  public static final int VL = 16;
  public static int func(int val) {
     int [] arr = new int[VL+val];
     for(int i = 0 ; i < VL ; i++)
       arr[i] = 10 + val;
     return arr[4];   
  }
  public static void main(String [] args) {
    int sum = 0;
    for(int i = 0 ; i < 1000000 ; i++)
       sum += func(i % 100);  
    System.out.println("Res = " + sum);
  }
}
