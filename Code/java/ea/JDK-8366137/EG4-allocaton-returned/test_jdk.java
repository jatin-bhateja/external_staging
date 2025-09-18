
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
    public static float compute_angle_with_x_axis(Point obj) {
        float distance = obj.compute_distance_from_origin();
        return (float)Math.acos(obj.x / distance);
    } 
 
    public static float compute_angle_with_y_axis(Point obj) {
        float distance = obj.compute_distance_from_origin();
        return (float)Math.acos(obj.y / distance);
    } 
 
    public static float compute_angle_with_z_axis(Point obj) {
        float distance = obj.compute_distance_from_origin();
        return (float)Math.acos(obj.z / distance);
    } 

    public static Point genPoint(float p) {
        return new Point(p, p, p); 
    }
 
    public static float micro(float f) {
        Point obj = genPoint(f);
        float theta_x = compute_angle_with_x_axis(obj);
        float theta_y = compute_angle_with_y_axis(obj);
        float theta_z = compute_angle_with_z_axis(obj);
        return theta_x + theta_y + theta_z;
    }
 
    public static void main(String [] args) {
        float res = 0;
        for (int i = 0; i < 1000000; i++) {
            res += micro((float)i); 
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            res += micro((float)i); 
        }
        long t2 = System.currentTimeMillis();
        IO.println("[time] " + (t2 - t1) + " ms  [res] " + res);
    }
}
