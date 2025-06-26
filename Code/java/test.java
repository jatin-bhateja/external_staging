
class test {
    public static byte [] fromByteArr = new byte[1024];
    public static byte [] toByteArr   = new byte[1024];

    public static int micro(int fromPos, int toPos, int len) {
       System.arraycopy(fromByteArr, fromPos, toByteArr, toPos, 45);
       return toByteArr[toPos+1];
    }

    public static void main(String [] args) {
       long res = 0;
       for (int i = 0 ;  i < fromByteArr.length ; i++) {
         fromByteArr[i] = (byte)i;
       }
       for(int i = 0 ; i < 1000000 ; i++) {
          res += micro(0 , 10, 45);
       }
       System.out.println("res = " + res);
    }
}
