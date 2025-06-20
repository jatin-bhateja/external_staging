
import java.nio.ByteBuffer;


class jit {
  public static long micro(int capacity) {
    long res = 0;
    ByteBuffer buff = ByteBuffer.allocateDirect(capacity);
/*
    // Broadcast value
    for (int i = 0; i < (capacity >> 3); i++)
       buff.putLong(0xFFFFFFFFFFFFFFFFL);

    buff = buff.rewind();
    for(int i = 0 ; i < capacity >> 3; i++)
      res += buff.getLong(i);
*/
    return buff.getLong() + 1;
  }

  public static void main (String [] args) { 
    long Res = 0 ;
    int capacity = Integer.parseInt(args[0]);
    // warmup
    for ( int ctr = 0 ; ctr < 100 ; ctr++)  {
      for ( int i = 0 ; i < 10000 ; i++)  {
         Res += micro(capacity+ctr);
      }
    }

    long t1 = System.currentTimeMillis();
    for ( int ctr = 0 ; ctr < 100; ctr++)  {
      for ( int i = 0 ; i < 10000 ; i++)  {
         Res += micro(capacity+ctr);
      }
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[Time] : " + (t2-t1) + " ms " + "[Res] :" + Res);
  }

}
