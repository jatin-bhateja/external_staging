


class test {
  public static int workload(int a , int b) {
     int t1 = a + b;
     int t2 = t1 + t1;
     return t2 + 10;
  }

  public static void main(String [] args) {
    int temp = 0;
    for(int i = 0 ; i < 1000000 ; i++)
      temp += workload(i % 2, i %3);
    System.out.println("Res = " + temp); 
  }
}
