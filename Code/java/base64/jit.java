
import java.util.Base64;
import java.util.Base64.Encoder;

public class jit {
  public static int micro(byte [] enc , byte [] text) {
    int [] src = new int[1024];
    int [] dst = new int[1024];
    for(int i = 0 ; i < src.length; i++) 
       src[i] = i;
    System.arraycopy(src,0, dst, 0, dst.length);
    return Base64.getEncoder().encode(text, enc);
  }

  public static void main (String [] args) { 
    int res = 0;
    byte [] text = "ABC".getBytes(); 
    byte [] enc = new byte[4];
    for ( int i = 0 ; i < 1000000 ; i++)  {
       res += micro(enc, text);
    }
    System.out.println("res =  " + res);
  }  
}
