
import java.util.Random;

class test {
  public static final int LEN = 64;
  public static Random r = new Random(10);

  public static String micro() {
    final StringBuilder buf=new StringBuilder();
    buf.append(" \"str_bytesToReplace" + r.nextInt(4) + "\"");
    buf.append(";\n");
    return buf.toString();
  }

  public static void main(String [] args) {
    int Res = 0;
    for(int i = 0; i < 1000000; i++)
       Res += micro().length();
 
    System.out.println("Res = " + Res);  
  }
} 
