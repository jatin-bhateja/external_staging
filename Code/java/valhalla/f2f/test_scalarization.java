
@SuppressWarnings("preview")
abstract value class AbsValue {
   public abstract float getRes();
}

value class MyValue extends AbsValue {
  float field1;
  float field2;
  MyValue(float f1, float f2) {
     field1 = f1;
     field2 = f2;
  }
  public float getRes() { return field1 + field2; }
}

public class test_scalarization {
    @SuppressWarnings("preview")
    public static float micro(AbsValue obj) {   // Single sub-class, Param type will be MyValue
        return obj.getRes();                    // ITN Intercept 1.  Build Start State, depends on signature based has_scalarized_args flag
    }                                           // ITN Intercept 2.  Parser again iterates over arguments to create InlineTypeNodes for monomorphically 
                                                //                   detected value type parameters. These are passed as value oops and do not enter
                                                //                   through inline entry points.
                                                //  
    @SuppressWarnings("preview")
    public static float leaf(int i) {
        return micro(new MyValue((float)i, (float)Math.sqrt(100.0f)));
    }

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 10000; i++) {
            res += leaf(i);
        }
        System.out.println("[res] " + res);
    }
}

