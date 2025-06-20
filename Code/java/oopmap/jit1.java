
import java.util.Arrays;

class MyClass {
  private int [] i;
  private int [] j;

  public MyClass(int x, int y) {
    this.i = new int[x];
    this.j = new int[y];
    Arrays.fill(this.i, 10);
    Arrays.fill(this.j, (int)11);
  }

  public MyClass(MyClass obj, int res) {
    this.i = obj.i;
    this.j = obj.j;
    this.i[0] = res;
  }

  public int sum() {
    int val = 0;
    for(int ctr = 0; ctr < Math.min(i.length, j.length) ; ctr++) {
      val += this.i[ctr] * this.j[ctr] + 1000;
    } 
    return val;
  }
}


public class jit1 {
  public MyClass micro(MyClass obj) {
     int Res = 0;
     Res += obj.sum();
     return new MyClass(obj, Res);   
  }

  public int callee(int a, int b, int c, int d) {
     int t1 = a + b + 40;
     MyClass obj = new MyClass(b,c);
     MyClass t3 = micro(obj);
     return  t3.sum(); 
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    jit1 obj = new jit1(); 
    for ( int i = 10 ; i < 100000 ; i++)  {
      Res += obj.callee(i%72, (int)i, i & 1023, (int)(i+10));
    }
    System.out.println("Res =  " + Res);
  }
}
