
abstract class AbstractPoint {
    public abstract float compute_distance();
}

class TwoDPoint extends AbstractPoint {
    public float _x;
    public float _y;

    public TwoDPoint(float x, float y) {
        this._x = x;
        this._y = y;
    }

    public float compute_distance() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2));
    }
}

// Multiple sub-classing nullifies the impact of UseUniqueSubclasses
class ThreeDPoint extends AbstractPoint {
    public float _x;
    public float _y;
    public float _z;

    public ThreeDPoint(float x, float y, float z) {
        this._x = x;
        this._y = y;
        this._z = z;
    }

    public float compute_distance() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2) + Math.pow(_z, 2));
    }
}

// Multiple sub-classing nullifies the impact of UseUniqueSubclasses
class FourDPoint extends AbstractPoint {
    public float _x;
    public float _y;
    public float _z;
    public float _t;

    public FourDPoint(float x, float y, float z, float t) {
        this._x = x;
        this._y = y;
        this._z = z;
        this._t = t;
    }

    public float compute_distance() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2) + Math.pow(_z, 2) + Math.pow(_t, 2));
    }
}

public class test_jdk {

    public static float micro(int init) {
        AbstractPoint point =
            (init & 3) == 0 ?
                new TwoDPoint((float)init, (float)init) :
                ((init & 3) == 1 ?
                    new ThreeDPoint((float)init + 10, (float)init + 10, (float)init + 10) :
                    new FourDPoint((float)init + 10, (float)init + 10, (float)init + 10, (float)init + 10));
        
        float res = 0.0f;
        if (init > 400000) {
            res = point.compute_distance();
        } else { 
            res = point.compute_distance();
        }
        return res;
    }

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 10000000; i++) {
            res += micro(i);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            res += micro(i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time]  " + (t2-t1) + "  ms  [res] " + res);
    }
}
