

class war {
  public static final int SIZE = 1024;
  public static void workload(float [] a) {
   for (int j = 0; j < 1000000 ; j++)
     for (int i = 0 ; i < SIZE-1 ; i++)
       a[i] = a[i+1];
  }
  public static void main(String [] args) {
    float [] arr = new float[SIZE];
    for (int i = 0; i < SIZE ;i++)
      arr[i] = 1.0f + i;
    war.workload(arr);
    System.out.println("Res = " + arr[512]); 
  }
}
