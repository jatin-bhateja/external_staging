
class pair extends Thread {
  private int i;
  private int j;
  public pair(int x, int y) {
    this.i = x;
    this.j = y;
  }
  public void run() {
     System.out.println("Starting thread " + this.i);
     for (int i = 0 ; i < this.i ; i++) {
        int [] mem = new int[this.j];
        for(int j = 0 ; i < mem.length; i++) {
          if ((j & 1) == 1) {
             mem[j] += 10;
          } else {
             mem[j] += 20;
          }
          this.j = mem[j] += sum();
        }
     }
     System.out.println("Existing thread " + this.i);
  }

  public int sum() {
    return this.i + this.j;
  }
}


public class jit {
  public int micro(int a , int b) {
     int Res = 0;
     pair [] ary = new pair[72];
     for (int i = 0 ; i < ary.length; i++) {
         ary[i]= new pair(a,b);
         ary[i].start();
     }
     try {
       for(int i = 0 ; i < ary.length; i++) {
           ary[i].join();
           Res += ary[i].sum();
       } 
     } catch (Exception e) {
       System.out.println(e);
     }
     return Res;   
  }

  public static void main (String [] args) { 
    int Res = 0 ;
    jit obj = new jit(); 
    for ( int i = 0 ; i < 10000000 ; i++)  {
      Res += obj.micro(i%72, i + 10);
      if(i % 100000 == 0) {
         System.gc();
      }
    }
    System.out.println("Res =  " + Res);
  }
}
