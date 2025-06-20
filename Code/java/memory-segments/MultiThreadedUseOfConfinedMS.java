
import java.lang.foreign.*;
import java.util.stream.IntStream;

public class MultiThreadedUseOfConfinedMS implements Runnable {
    public int sindex;
    public int eindex;
    public int val;

    public static MemorySegment ms = null;

    public MultiThreadedUseOfConfinedMS(int sindex, int eindex, int val) {
        this.sindex = sindex;
        this.eindex = eindex;
        this.val = val;
    }

    public void run() {
        for (int i = sindex; i <= eindex; i++) {
            ms.setAtIndex(ValueLayout.JAVA_INT, i, val);
        }
    }

    public static void main(String [] args) {
        int size = Integer.parseInt(args[0]);
        try {
            ms = Arena.ofConfined().allocate(size << 2, 64);
            Thread t = new Thread(new MultiThreadedUseOfConfinedMS(0, (size >>> 1) - 1, 10));
            MultiThreadedUseOfConfinedMS obj = new MultiThreadedUseOfConfinedMS((size >>> 1), size - 1, 20);
            obj.run();
            t.start();
            t.join();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            IntStream.range(0, size).forEach(i -> System.out.println(ms.getAtIndex(ValueLayout.JAVA_INT, i)));
        }
    }
}
