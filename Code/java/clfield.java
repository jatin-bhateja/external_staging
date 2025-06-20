

public class clfield {
   public Class<?> clf;

   public clfield(Class<?> clf) {
      this.clf = clf;
   }

   public Class<?> getCls() {
      return clf;
   }

   public int micro(Class<?> clf) {
      return clf == Integer.class ? 1 : 0;
   }
  
   public static void main(String [] args) {
      int Res = 0;
      clfield obj = new clfield(Integer.class);
      for(int i = 0 ; i < 10000000; i++) 
         Res += obj.micro(obj.clf);
      System.out.println("Res:" + Res);
   }
} 
