
abstract class Type {
   public abstract float getVal(float incr);
}

class Type1 extends Type {
   public float field;
   public Type1(float init) {
      field = init;
   }
   public float getVal(float incr) {
      // C2 based on branch profiling will generate
      // uncommon traps for low probability control flows.
      if (incr > 9990) { 
          // Infrequently executed code will lead to uncommon trap
          throw new AssertionError("Dummy error");
      }
      return field + incr;
   }
}

class Type2 extends Type {
   public float field;
   public Type2(float init) {
      field = init + 10.0f;
   }
   public float getVal(float incr) {
      return field + incr;
   }
}


public class test_bi {
   public static Type getObj(int i) {
      return ((i & 1) == 1) ? new Type1((float)i) : new Type2((float)i);
   }
   public static float micro(Type obj, float init) {
      return obj.getVal(init) * init;
   }
   public static void main(String [] args) {
      float res = 0.0f; 
      for (int i = 0; i < 10000; i++) {
           res += micro(getObj(i), (float)i);
      }
      System.out.println("[res] " + res);
   }
}
