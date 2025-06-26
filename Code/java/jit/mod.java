class mod {
   public static int floorMod(int x, int y) {
        int mod = x % y;
        // if the signs are different and modulo not zero, adjust result
        if ((mod ^ y) < 0 && mod != 0) {
            mod += y;
        }
        return mod;
   }

   public static void main (String [] args) {
      int Res =  0;
      for(int i = 1 ; i < 1000000 ; i++) 
         Res += floorMod(i, i);
      System.out.println("Res = "  + Res);
   }
}
