primitive class pclass {
  public int f1;
  public int f2;
  public int f3;
  public int f4;
  public int f5;
  public int f6;
  public int f7;
  public int f8;
  public int f9;
  public int f10;
  public int f11;
  public int f12;
  public int f13;
  public int f14;
  public int f15;
  public int f16;
  public int f17;

  public pclass(int i) {
     f1 = i + 1;
     f2 = i + 2;
     f3 = i + 3;
     f4 = i + 4;
     f5 = i + 5;
     f6 = i + 6;
     f7 = i + 7;
     f8 = i + 8;
     f9 = i + 9;
     f10 = i + 10;
     f11 = i + 11;
     f12 = i + 12;
     f13 = i + 13;
     f14 = i + 14;
     f15 = i + 15;
     f16 = i + 16;
     f17 = i + 17;
  }

  public int add_all() {
     return f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10 + f11 + f12 + f13 + f14 + f15 + f16 + f17;
  }
}

public class megatype {
   public static pclass micro (int i ) {
      return new pclass(i);
   }

   public static void main(String [] args) {
      int res  = 0;
      for (int i = 0; i < 10000; i++) {
          res +=  micro(i).add_all(); 
      }
      System.out.println("[res] " + res);
   }
}
