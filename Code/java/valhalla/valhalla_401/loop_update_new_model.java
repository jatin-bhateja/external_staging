

class MyValue {
    public float f1;
    public float f2;
    public float f3;
    public float f4;
    public MyValue(float f1, float f2, float f3, float f4) {
        this.f1 = f1;
        this.f2 = f2;
        this.f3 = f3;
        this.f4 = f4;
    }

    public float getAccum() {
        return  f1 + f2 + f3 + f4;
    }
}


public class loop_update_new_model {
    public static MyValue update(MyValue obj, int field, float init) {
        switch(field) {
            case 0: return new MyValue(init, obj.f2, obj.f3, obj.f4);
            case 1: return new MyValue(obj.f1, init, obj.f3, obj.f4);
            case 2: return new MyValue(obj.f1, obj.f2, init, obj.f4);
            case 3: return new MyValue(obj.f1, obj.f2, obj.f3, init);
        }
        return null;
    }

    public static float micro3(float init) {
        MyValue value = new MyValue(0.0f, 0.0f, 0.0f, 0.0f);
        for (int i = 0; i < 4; i++) {
           value = update(value, i, init);
        }
        return value.getAccum();
    } 

    public static float micro2(float init) {
        MyValue value = new MyValue(0.0f, 0.0f, 0.0f, 0.0f);
        value = update(value, 0, init);
        value = update(value, 1, init);
        value = update(value, 2, init);
        value = update(value, 3, init);
        return value.getAccum();
    } 

    public static float micro1(float init) {
        MyValue value = new MyValue(0.0f, 0.0f, 0.0f, 0.0f);
        value = new MyValue(init, value.f2, value.f3, value.f4);
        value = new MyValue(value.f1, init, value.f3, value.f4);
        value = new MyValue(value.f1, value.f2, init, value.f4);
        value = new MyValue(value.f1, value.f2, value.f3, init);
        return value.getAccum();
    } 

    public static void MicroBenchMark(String msg, BenchMark bm) {
        float res = 0.0f;
        for (int i = 0; i < 100000; i++) {
            res += bm.apply((float)i);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            res += bm.apply((float)i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[ " + msg + " time] " + (t2-t1) + " ms  [res] " + res);
    }

    interface BenchMark {
        public float apply(float init);
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
        if (algo == 1) {
          MicroBenchMark("micro1", (i) -> micro1(i));
        } else if (algo == 2) {
          MicroBenchMark("micro2", (i) -> micro2(i));
        } else if (algo == 3) { 
          MicroBenchMark("micro3", (i) -> micro3(i));
        }
    }
}
