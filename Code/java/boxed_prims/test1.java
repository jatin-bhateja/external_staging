

class test1 {
   public static Float workload(Float f1, Float f2) {
     return f1 + f2;
   }
   public static void main(String [] args) {
     Float s1 = new Float(45.5f);
     Float s2 = new Float(56.5f);
     Float s3 = new Float(23.5);
     for(int i = 0 ; i < 100000 ; i++)
       s3 += workload(s1,s2);
     System.out.println("Res = " + s3);
  }
}
