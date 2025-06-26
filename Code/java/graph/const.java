

class test {
  public static int doSum(int arg) {
    return Math.max(arg, 100);
  }

  public static void main(String [] args) {
    int sum = 0;
    for(int i = 0 ; i <  1000000 ;i++)
      sum += doSum(i);
    System.out.println("Res = "  + sum);
  }
}
