class ABC {}

class ftype {
  public static void micro(Class<?> etype, Class<?> ctype) {
     System.out.println(etype);
     System.out.println(ctype);
  }
  public static void main(String [] args) {
     micro(byte.class, ABC.class);
  }
}
