import jdk.internal.misc.Unsafe;
import java.lang.reflect.Field;

value class MyVector {
//class MyVector {
   public float lane0;
   public float lane1;
   public float lane2;
   public float lane3;
   public float lane4;
   public float lane5;
   public float lane6;
   public float lane7;

   public MyVector(float l0, float l1, float l2, float l3, float l4, float l5, float l6, float l7) {
       this.lane0 = l0;
       this.lane1 = l1;
       this.lane2 = l2;
       this.lane3 = l3;
       this.lane4 = l4;
       this.lane5 = l5;
       this.lane6 = l6;
       this.lane7 = l7;
   }

   public MyVector(float init) {
       this.lane0 = init;
       this.lane1 = init;
       this.lane2 = init;
       this.lane3 = init;
       this.lane4 = init;
       this.lane5 = init;
       this.lane6 = init;
       this.lane7 = init;
   }

   public MyVector add(MyVector auguend) {
       return new MyVector(
           lane0 + auguend.lane0,
           lane1 + auguend.lane1,
           lane2 + auguend.lane2,
           lane3 + auguend.lane3,
           lane4 + auguend.lane4,
           lane5 + auguend.lane5,
           lane6 + auguend.lane6,
           lane7 + auguend.lane7);
   }

   public String toString() {
       StringBuffer sb = new StringBuffer();
           sb.append(" <vector> { ");
           sb.append(lane0 + " , ");
           sb.append(lane1 + " , ");
           sb.append(lane2 + " , ");
           sb.append(lane3 + " , ");
           sb.append(lane4 + " , ");
           sb.append(lane5 + " , ");
           sb.append(lane6 + " , ");
           sb.append(lane7 + " } ");
       return sb.toString();
   }
}

public class explicit_larval_value_updates {
    // Configurations
    // - non-flat field
    // - Non-atomic flat field
    // - atomic flat field (not possible 64 bit constraint) 

    public MyVector init = new MyVector(1.0f);

    public static final Unsafe U = Unsafe.getUnsafe();

    interface Bench {
        public MyVector apply(MyVector addened, MyVector auguend);
    }

    public Bench configBench(int option) {
        switch (option) {
            case 1:
                return new Bench () {
                    public MyVector apply(MyVector addened, MyVector auguend) {
                        return addened.add(auguend); 
                    }
                };
            case 2:
                return new Bench() {
                    public MyVector apply(MyVector addened, MyVector auguend) {
                        addened = U.makePrivateBuffer(addened);
                        Field [] fields = MyVector.class.getDeclaredFields();
                        for (int i = 0; i < fields.length; i++) {
                            long offset = U.objectFieldOffset(fields[i]); 
                            float arg1  = U.getFloat(addened, offset);
                            float arg2  = U.getFloat(auguend, offset);
                            U.putFloat(addened, offset, arg1 + arg2);
                        }
                        addened = U.finishPrivateBuffer(addened);
                        return addened; 
                    }
                };
            default :
                assert false;
                break;
        }
        return null;
    }

    public MyVector micro(Bench fun, MyVector arg1, MyVector arg2) {
        return fun.apply(arg1, arg2);
    }

    public static void main(String [] args) {
        explicit_larval_value_updates obj = new explicit_larval_value_updates();
        Bench bm = obj.configBench(Integer.parseInt(args[0]));

        MyVector res = new MyVector(10.0f);
        for (int i = 0; i < 500000; i++) {
            res = obj.micro(bm, obj.init, res); 
        }
        res = new MyVector(10.0f);
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 500000; i++) {
            res = obj.micro(bm, obj.init, res); 
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2-t1) + "ms [res] " + res);
    }
}
