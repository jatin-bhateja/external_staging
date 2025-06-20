
import jdk.incubator.vector.*;

interface VOp<V extends FloatVector, S extends VectorShuffle> {
  public float apply(V vec, S shuf);
}

interface LOp<V extends FloatVector> {
  public float apply(V a, int i);
}

public class test {
  public float f1 = 0.0f;
  public float f2 = 10.0f;

  public float leaf (FloatVector vec, VectorShuffle shuf, LOp fn) {
    if (f1 == 0.0) { 
      System.out.println("Captured context length = " + fn.getClass().getDeclaredFields().length);
    }
    float res = 0.0f;
    for (int i = 0; i < vec.length(); i++) {
      res += fn.apply(vec, i);
    }
    return res;
  }

  public static float micro(FloatVector vec, VectorShuffle shuf, VOp fn) {
    return fn.apply(vec, shuf); 
  }

  public static void main(String [] args) {
    test obj = new test();
    FloatVector vec = FloatVector.broadcast(FloatVector.SPECIES_256, 10.0f);
    VectorShuffle<Float> shuf = FloatVector.SPECIES_256.iotaShuffle(0, 1, true);
    for (int i = 0; i < 10000; i++) {
                                           // 'this' keyword passed as first argument to virtually dispatched method sets the capture context for lambda.
                                           // Captured context is not thread safe and thus its advisable to always use non-capturing lambdas.
      obj.f1 += micro(vec, shuf, (v, s) -> obj.leaf(v, s, (v1, ln) -> (v1.lane(s.laneSource(ln)) + obj.f1)));
    }
    System.out.println(obj.f1);
  }
} 
