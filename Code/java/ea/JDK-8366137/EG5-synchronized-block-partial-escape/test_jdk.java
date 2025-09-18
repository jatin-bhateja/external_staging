
class Point {
    public float x;
    public float y;
    public float z;

    public Point(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public float compute_distance_from_origin() {
        return (float)Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
    }
}

public class test_jdk {
    public static Point cached_point = null;

    public static float micro(float x, float y, float z) {
        Point p = new Point(x, y, z);
        
        synchronized(p) {
            if (cached_point != null) {
                // No object materialization needed in this control path.
                return cached_point.compute_distance_from_origin();
            } else {
                // Object must materialization before assignment in this control path.
                cached_point = p; 
                return p.compute_distance_from_origin(); 
            }
        }
    }
  
    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 1000000; i++) {
            res += micro((float)i, (float)i + 10.0f, (float)i + 100.0f);
            if ((i % 100) == 0) {
                cached_point = null;
            }
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            res += micro((float)i, (float)i + 10.0f, (float)i + 100.0f);
            if ((i % 100) == 0) {
                cached_point = null;
            }
        }
        long t2 = System.currentTimeMillis();
        IO.println("[time] " + (t2 - t1) + " ms  [res] " + res);
    }
}
