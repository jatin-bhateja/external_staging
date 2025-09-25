
value abstract class AbstractPoint {
    public abstract float compute_distance();
}

value class ThreeDPoint extends AbstractPoint {
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


public class test_valhalla {

    public static float micro(int init) {
        AbstractPoint point = new ThreeDPoint((float)init + 10, (float)init + 10, (float)init + 10);
        float res = 0.0f;
        if (init > 400000) {
            res = 10000.0f * point.compute_distance();
        } else { 
            res = 20000.0f / point.compute_distance();
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
