
value abstract class AbstractPoint {
    public abstract float compute_disatnce();
}

value class TwoDPoint extends AbstractPoint {
    public float _x;
    public float _y;

    public TwoDPoint(float x, float y) {
        this._x = x;
        this._y = y;
    }

    public float compute_disatnce() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2));
    }
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

    public float compute_disatnce() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2) + Math.pow(_z, 2));
    }
}


public class test_valhalla {
    public static float micro(float p1, float p2, float p3, int cond) {
        AbstractPoint obj = null;
        if (cond > 50000) {
            obj = new ThreeDPoint(p1, p2, p3);
        } else  {
            obj = new TwoDPoint(p1, p2);
        }
        return obj.compute_disatnce();
    } 

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 10000000; i++) {
        }
        res = 0.0f;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            res += micro((float)i, (float)i+10, (float)i+20, i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + " ms  [res]  " + res); 
    }
}
