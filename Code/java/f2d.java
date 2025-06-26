class f2d {
   static double process(double input) {
       return input;
   }
   public static void main(String [] args) {
      float val = Float.parseFloat(args[0]);
      System.out.println(process(val));
   }
}

