
value class TwoDPoint {
    public float _x;
    public float _y;

    public TwoDPoint(float x, float y) {
        this._x = x;
        this._y = y;
    }
}

value class LineSegment {
    public static TwoDPoint origin = new TwoDPoint(0.0f, 0.0f);
    public TwoDPoint _p1;
    public TwoDPoint _p2;

    public LineSegment() {
        this._p1 = origin;
        this._p2 = origin;
    }

    public LineSegment(TwoDPoint p1, TwoDPoint p2) {
        this._p1 = p1;
        this._p2 = p2;
    }

    public float compute_distance() {
        return (float)Math.sqrt(Math.pow((_p2._x - _p1._x), 2) + Math.pow((_p2._y - _p1._y), 2));
    } 
}

public class test_valhalla {

    public static float micro(float x1, float y1, float x2, float y2, int cond) {
        TwoDPoint p1 = new TwoDPoint(x1, y1); 
        TwoDPoint p2 = new TwoDPoint(x1, y1); 
        LineSegment line1 = new LineSegment();
        LineSegment line2 = new LineSegment();

        // Flow in-sensitive escape analysis should assume connectivity b/w p1/p2 and line2._p1/_p2.
        if (cond > 500000) {
            line1 = new LineSegment(p1, p2);
        } else {
            line2 = line1;
        }

        return line1.compute_distance() + line2.compute_distance();
    }

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 10000000; i++) {
            res += micro((float)i, (float)i + 10, (float)i * 20, (float)i * 30, i);
        }
        res = 0.0f;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            res += micro((float)i, (float)i + 10, (float)i * 20, (float)i * 30, i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + " ms  [res] " + res);
    }
}
