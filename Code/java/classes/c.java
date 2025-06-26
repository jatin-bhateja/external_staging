class c {
   static class MyInteger {
      public Integer val;
      public MyInteger(int i) {
        val = Integer.valueOf(i);
      }
   }
   public static <M> void func(Class<M> cl, M obj) {
     System.out.println(cl);
     System.out.println(obj);
   } 
   public static void main(String [] args) {
      func(null, null);
      func(MyInteger.class, new MyInteger(1));
      func(Integer.class, 1); // auto-boxing
      func(Byte.class, (byte) 1); // auto-boxing
      //func(Integer.class, 1.1);
   }
}


