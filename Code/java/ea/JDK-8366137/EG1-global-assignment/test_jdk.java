
class ThreeDCoordinates {
    public float x;
    public float y;
    public float z;
    ThreeDCoordinates(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    ThreeDCoordinates affineXForm(float scale, float offset) {
        float new_x = x * scale + offset;
        float new_y = y * scale + offset;
        float new_z = z * scale + offset;
        return new ThreeDCoordinates(new_x, new_y, new_z); 
    }

    float distance_from_origin() {
        return (float)Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
    }
}

class Cube  {
    public ThreeDCoordinates p1; 
    public ThreeDCoordinates p2; 
    public ThreeDCoordinates p3; 
    public ThreeDCoordinates p4; 
    public ThreeDCoordinates p5; 
    public ThreeDCoordinates p6; 
    public ThreeDCoordinates p7; 
    public ThreeDCoordinates p8; 

    public Cube(ThreeDCoordinates p1, ThreeDCoordinates p2, ThreeDCoordinates p3, ThreeDCoordinates p4,
                ThreeDCoordinates p5, ThreeDCoordinates p6, ThreeDCoordinates p7, ThreeDCoordinates p8) {
        this.p1 = p1;
        this.p2 = p2;
        this.p3 = p3;
        this.p4 = p4;
        this.p5 = p5;
        this.p6 = p6;
        this.p7 = p7;
        this.p8 = p8;
    }

    public Cube shear(float scale, float offset) {
        ThreeDCoordinates new_p1 = p1.affineXForm(scale, offset);
        ThreeDCoordinates new_p2 = p2.affineXForm(scale, offset);
        ThreeDCoordinates new_p3 = p2.affineXForm(scale, offset);
        ThreeDCoordinates new_p4 = p4.affineXForm(scale, offset);
        ThreeDCoordinates new_p5 = p5.affineXForm(scale, offset);
        ThreeDCoordinates new_p6 = p6.affineXForm(scale, offset);
        ThreeDCoordinates new_p7 = p7.affineXForm(scale, offset);
        ThreeDCoordinates new_p8 = p8.affineXForm(scale, offset);
        return new Cube(new_p1, new_p2, new_p3, new_p4, new_p5, new_p6, new_p7, new_p8);
    }
 
    public ThreeDCoordinates geometric_center() {
        float x_gc = (p1.x + p2.x + p3.x + p4.x + p5.x + p6.x + p7.x + p8.x) / 8;
        float y_gc = (p1.y + p2.y + p3.y + p4.y + p5.y + p6.y + p7.y + p8.y) / 8;
        float z_gc = (p1.z + p2.z + p3.z + p4.z + p5.z + p6.z + p7.z + p8.z) / 8;
        return new ThreeDCoordinates(x_gc, y_gc, z_gc); 
    }
} 

public class test_jdk {
    public static Cube current = null;
    public static ThreeDCoordinates point = null;
   
    public static Cube initCube() {
        ThreeDCoordinates p1 = new ThreeDCoordinates(0.0f, 0.0f, 0.0f);    
        ThreeDCoordinates p2 = new ThreeDCoordinates(0.0f, 0x1.1P-10f, 0.0f);    
        ThreeDCoordinates p3 = new ThreeDCoordinates(0x1.1P-10f, 0.0f, 0.0f);    
        ThreeDCoordinates p4 = new ThreeDCoordinates(0x1.1P-10f, 0x1.1P-10f, 0.0f);    
        ThreeDCoordinates p5 = new ThreeDCoordinates(0.0f, 0.0f, 0x1.1P-10f);    
        ThreeDCoordinates p6 = new ThreeDCoordinates(0.0f, 0x1.1P-10f, 0x1.1P-10f);    
        ThreeDCoordinates p7 = new ThreeDCoordinates(0x1.1P-10f, 0.0f, 0x1.1P-10f);    
        ThreeDCoordinates p8 = new ThreeDCoordinates(0x1.1P-10f, 0x1.1P-10f, 0x1.1P-10f);    
        return new Cube(p1, p2, p3, p4, p5, p6, p7, p8);
    } 

    public static float micro_noescape(int scale, int offset) {
        Cube seed = initCube();
        for (int s = 0; s < scale; s++) {
            for (int o = 0; o < offset; o++) {
                seed = seed.shear((0x1.0P-25f * (float)s), (0x1.0P-25f * (float)o));
            } 
        }
        ThreeDCoordinates gc = seed.geometric_center();
        return gc.distance_from_origin(); 
    }

    public static float micro_escape(int scale, int offset) {
        current = initCube();
        for (int s = 0; s < scale; s++) {
            for (int o = 0; o < offset; o++) {
                current = current.shear((0x1.0P-25f * (float)s), (0x1.0P-25f * (float)o));
            } 
        }
        point = current.geometric_center();
        return point.distance_from_origin(); 
    }

    interface BenchMark {
        public float apply(int scalar, int offset);
    }

    public static void runBM(String msg, BenchMark bm) {
        float res = 0.0f;
        for (int i = 0; i < 10000; i++) {
            res += bm.apply(i, 10); 
        } 
        res = 0.0f;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000; i++) {
            res += bm.apply(i, 10); 
        } 
        long t2 = System.currentTimeMillis();
        IO.println("[" + msg + " time ] " + (t2 - t1) + " ms  [res] " + res);
    }
    
    public static void main(String [] args) {
        runBM("micro_noescape", (f1, f2) -> micro_noescape(f1, f2)); 
        runBM("micro_escape", (f1, f2) -> micro_escape(f1, f2)); 
    }
}
