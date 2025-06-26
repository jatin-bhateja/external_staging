
abstract class Species<E> {
  interface fnPtr<E> { 
     E apply(E a,  E step);
  }
  static fnPtr<E> fp;
  
  static <E> void setFn(fnPtr<E> f) {
   fp = f;
  }
}


class t {
  static Integer stepFunction(Integer a, Integer step) {
     return a.intValue() + step.intValue();
  }

  @SuppressWarnings("unchecked")
  public static void main (String [] args) {
     Species.setFn((a,b)-> t.stepFunction((Integer)a,(Integer)b));
     System.out.println("Res = " + Species.fp.apply(20,100));
  } 
}
