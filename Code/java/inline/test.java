import jdk.internal.vm.annotation.ForceInline;

class test {
  @ForceInline
  public static int doSum(int a, int b) {
     return a + b;
  }
  public static void main(String [] args) {
     System.out.println("Res = " + doSum(10,20));
  }
}

