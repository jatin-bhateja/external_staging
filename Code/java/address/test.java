
class test {
  public static final int LEN = 64;

  public static byte workload(byte [] dst, byte [] src, int cnt) {
    dst[cnt] = 10;
    cnt += 10;
    dst[cnt] = 20;
    return dst[cnt];
  }

  public static void main(String [] args) {
     byte [] r = new byte[LEN];
     byte [] a = new byte[LEN];

     for (int i = 0 ; i < LEN/2; i++)
        a[i] = (byte)i;

     int res = 0;
     for (int i = 0 ; i < 1000000 ; i++)
        res += workload(r, a,i&0xF);

     for(int i = 0 ; i < LEN ; i++)
       System.out.println("Res =  " + r[i]);
  }
}

