
import java.lang.foreign.*;

public class test_loop_over_ms {
    public static long [] arr1 = new long[1024];
    public static long [] arr2 = new long[1024];
    public static long [] arr3 = new long[1024];
    //public static MemorySegment ms1 = Arena.global().allocate(1024, 64);
    //public static MemorySegment ms2 = Arena.global().allocate(1024, 64);
    //public static MemorySegment ms3 = Arena.global().allocate(1024, 64);
    public static MemorySegment ms1 = MemorySegment.ofArray(arr1);
    public static MemorySegment ms2 = MemorySegment.ofArray(arr2);
    public static MemorySegment ms3 = MemorySegment.ofArray(arr3);

    public static void micro() {
        long tc = ms3.byteSize() / 8;
        for (int i = 0; i < tc; i++) {
            ms3.set(ValueLayout.JAVA_LONG, i*8, ms1.get(ValueLayout.JAVA_LONG, i*8) + ms2.get(ValueLayout.JAVA_LONG, i*8)); 
        }
    }

    public static void micro_arr() {
        for (int i = 0; i < arr3.length; i++) {
            arr3[i] = arr1[i] + arr2[i]; 
        }
    }

    public static void main(String [] args) {
        ms1.fill((byte)0);
        ms2.fill((byte)1);
        for (int i = 0; i < 100000; i++) { 
            micro();
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) { 
            micro();
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2-t1) + " ms  [res] " + ms3.get(ValueLayout.JAVA_LONG, 0));
    }
}
