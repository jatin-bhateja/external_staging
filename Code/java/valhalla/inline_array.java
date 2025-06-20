
import java.util.Arrays;

primitive class inline_klass {
  int fieldI;
  public inline_klass(int fI) {
     fieldI = fI;
  }
}


public class inline_array {
  public inline_klass [] parr;

  public inline_array() {
     parr = new inline_klass[32];
     for(int i = 0; i < 32; i++) {
        parr[i] =  new inline_klass(i);
     }
  }

  public static int micro(inline_array obj, int ctr) {
     return obj.parr[ctr].fieldI * 1024;
  }

  public static void main(String [] args) {
     int res = 0;
     for(int i = 0; i < 10000; i++) {
        res += micro(new inline_array(), i&31);
     } 
     System.out.println("[Res] " + res);
  }
}
