
import java.util.stream.IntStream;

// TODO: Use records instead of class.

class PlaneCoordinates {
    public float x;
    public float y;

    public PlaneCoordinates(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void affine_transform(float scale, float offset) {
        this.x = x * scale + offset;
        this.y = y * scale + offset;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }
}

public class test_pea {
    public static int witer = 0;
    public static int miter = 0;
    public static PlaneCoordinates point = new PlaneCoordinates(0.0f, 0.0f);

    public static float transform(float x, float y, int cond) {
        PlaneCoordinates inst = new PlaneCoordinates(x, y);
        if (cond > 1000) {
            point = inst;
        } else {
            inst.affine_transform(3.0f, 5.0f);
        }
        return inst.getX() + inst.getY();
    }

    public static float transform_pea(float x, float y, int cond) {
        float inst_x = x;
        float inst_y = y;
        if (cond > 1000) {
            // Limiting the allocation to the control flow
            // where its escaping.
            point = new PlaneCoordinates(x, y);
        } else {
            //inst.affine_transform(3.0f, 5.0f);
            inst_x = inst_x * 3.0f + 5.0f;
            inst_y = inst_y * 3.0f + 5.0f;
        }
        return inst_x + inst_y;
    }

    interface BenchMark {
        float apply(float a, float b, int cond);
    }

    public static void runBench(String msg, BenchMark bm, float [] a, float [] b) {
        float res = 0.0f;
        for (int iter = 0; iter < witer; iter++) {
            for (int i = 0; i < a.length; i++) {
                res += bm.apply(a[i], b[i], i);
            }
        }
        long t1 = System.currentTimeMillis();
        for (int iter = 0; iter < miter; iter++) {
            for (int i = 0; i < a.length; i++) {
                res += bm.apply(a[i], b[i], i);
            }
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ " + msg + " time " + (t2 - t1) + "ms  [res] " + res);
    }

    public static void main(String [] args) {
        witer = Integer.parseInt(args[0]);
        miter = Integer.parseInt(args[1]);

        float [] line1 = new float[2048];
        float [] line2 = new float[2048];

        IntStream.range(0, line1.length).forEach(i -> {line1[i] = (float)i * 0.001f;});
        IntStream.range(0, line2.length).forEach(i -> {line2[i] = (float)i * 0.002f;});

        if (Integer.parseInt(args[2]) == 0) {
            runBench("transform" , (x, y, c) -> transform(x, y, c), line1, line2);
        } else {
            runBench("transform_pae", (x, y, c) -> transform_pea(x, y, c), line1, line2);
        }
    }
}