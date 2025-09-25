
value abstract class AbstractPoint {
    public abstract float compute_distance();
}

value class TwoDPoint extends AbstractPoint {
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
    public static AbstractPoint [] genPoints(float init) {
        AbstractPoint [] points = new AbstractPoint[3]; // start, mid, end
        points[0] = new TwoDPoint((float)init, (float)init);
        points[1] = new ThreeDPoint((float)init + 10, (float)init + 10, (float)init + 10);
        points[2] = new TwoDPoint((float)init + 20, (float)init + 20);
        return points;
    }

    public static float micro(int init) {
        AbstractPoint [] points = genPoints(init);
        float res = 0.0f;
        res += ((TwoDPoint)points[0]).compute_distance();
        res += ((ThreeDPoint)points[1]).compute_distance();
        res += ((TwoDPoint)points[2]).compute_distance();
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
