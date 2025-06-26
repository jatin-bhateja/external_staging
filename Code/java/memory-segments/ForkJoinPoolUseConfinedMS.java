
import java.lang.foreign.*;
import java.util.stream.IntStream;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.RecursiveTask;


import java.lang.foreign.*;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;
import java.util.stream.IntStream;

public class ForkJoinPoolUseConfinedMS {
    // Common memory segment.
    public static MemorySegment ms = null;

    public static class MyTask extends RecursiveTask {
        public MemorySegment ms;
        public int sindex;
        public int eindex;
        public int val;

        public MyTask(MemorySegment ms, int sindex, int eindex, int val) {
            this.ms = ms;
            this.sindex = sindex;
            this.eindex = eindex;
            this.val = val;
        }

        public Integer compute()  {
            System.out.println("[thread] " + Thread.currentThread() + " sindex = " + sindex +  " eindex = " + eindex);
            try {
                if (sindex == eindex) {
                    ms.setAtIndex(ValueLayout.JAVA_INT, sindex, val);
                    return 1;
                } else if (sindex == eindex - 1) {
                    ms.setAtIndex(ValueLayout.JAVA_INT, sindex, val);
                    ms.setAtIndex(ValueLayout.JAVA_INT, eindex, val);
                    return 2;
                } else {
                    int mid = (sindex + eindex) >>> 1;
                    MyTask ltask = new MyTask(ms, sindex, mid - 1, val);
                    MyTask rtask = new MyTask(ms, mid, eindex, val);
                    ltask.fork();
                    rtask.fork();
                    return (Integer)ltask.get() + (Integer)rtask.get();
                }
            }   catch (Exception e) {
                System.out.println(e);
            } finally {
                return -1;
            }
        }
    }

    public static void main(String [] args) {
        int size = Integer.parseInt(args[0]);
        try (Arena arena = Arena.ofConfined()) {
            ms = arena.allocate(size << 2, 64);
            ForkJoinPool pool = new ForkJoinPool(2);
            MyTask task = new MyTask(ms, 0, size - 1, 20);
            pool.submit(task);
            pool.close();
            IntStream.range(0, size).forEach(i -> System.out.println(ms.getAtIndex(ValueLayout.JAVA_INT, i)));
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
