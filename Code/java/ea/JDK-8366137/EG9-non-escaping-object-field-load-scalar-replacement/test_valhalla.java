

value class Point {
    public float _x;
    public float _y;

    public Point(float x, float y) {
        this._x = x;
        this._y = y;
    }

    public float compute_distance() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2));
    }
}


public class test_valhalla {
    public static float micro(int init, int cond) {
        Point [] points = new Point[3]; // start, mid, end
        points[0] = new Point((float)init, (float)init);
        points[1] = new Point((float)init + 10, (float)init + 10);
        points[2] = new Point((float)init + 20, (float)init + 20);
        return points[0].compute_distance() + points[1].compute_distance() + points[2].compute_distance();
    }

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 10000000; i++) {
            res += micro(i, i);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            res += micro(i, i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time]  " + (t2-t1) + "  ms  [res] " + res);
    }
}
