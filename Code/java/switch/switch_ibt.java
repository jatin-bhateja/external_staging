
class test {
  public static int func(int val) {
    switch(val) {
     case 1:
      return val + 100;
     case 2:
      return val + 200;
     case 3:
      return val + 300;
     case 4:
      return val + 400;
     case 5:
      return val + 500;
     case 6:
      return val + 600;
     case 7:
      return val + 700;
     default:
      return val + 10000;
    }
  }
  public static void main(String [] args) {
    int Res = 0;
    for(int i = 0 ; i < 1000000 ;i++) 
       Res += func(i%10);
    System.out.println("Res = " + Res);
  }
}
