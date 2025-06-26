

class test {
  public static int [] field1;
  public static int workload(int index) {
     return field1[index] + 100;
  }
  public static void main(String [] args) {
     int res = 0;
     field1 = new int[1024];
     for(int i = 0 ; i < 1024; i++)
         field1[i] = i;
     for(int i = 0 ; i < 1000000; i++)
         res += workload(i%1024);
     System.out.println("Res = " + res);
  }
}
