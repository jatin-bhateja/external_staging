
import java.util.Arrays;

primitive class inline_klass {
  int fieldI;
  long fieldL;
  int [] fieldArrI;

  public inline_klass(int fI, long fL, int len) {
     fieldI = fI;
     fieldL = fL;
     fieldArrI = new int[len];
     Arrays.fill(fieldArrI, 10);
  }
}


public class inline {
  public inline_klass pobj;

  public inline(int i) {
    pobj =  new inline_klass(i, (long)(i+10),  512);
  }

  public static int micro(inline obj, int ctr) {
      return (int)obj.pobj.fieldL + obj.pobj.fieldI * 1024 + obj.pobj.fieldArrI[ctr & 511];
  }

  public static void main(String [] args) {
     int res = 0;
     for(int i = 0; i < 10000; i++) {
        res += micro(new inline(i), i);
     } 
     System.out.println("[Res] " + res);
  }
}
