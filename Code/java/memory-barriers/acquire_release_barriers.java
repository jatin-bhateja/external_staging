
import java.util.concurrent.atomic.*;

public class acquire_release_barriers implements Runnable {
    public static AtomicInteger counter = new AtomicInteger(10);

/*
 63  MemBarRelease  === 34 1 7 1 1  [[ 64 65 ]]  !jvms: AtomicInteger::set @ bci:2 (line 101) acquire_release_barriers::set_value @ bci:4 (line 8)
 64  Proj  === 63  [[ 68 67 ]] #0 !jvms: AtomicInteger::set @ bci:2 (line 101) acquire_release_barriers::set_value @ bci:4 (line 8)
 65  Proj  === 63  [[ 66 67 ]] #2  Memory: @BotPTR *+bot, idx=Bot; !jvms: AtomicInteger::set @ bci:2 (line 101) acquire_release_barriers::set_value @ bci:4 (line 8)
 66  MergeMem  === _ 1 65 1 1 67  [[ 68 ]]  { - - N67:java/util/concurrent/atomic/AtomicInteger (java/io/Serializable)+12 * }  Memory: @BotPTR *+bot, idx=Bot; !jvms: AtomicInteger::set @ bci:2 (line 101) acquire_release_barriers::set_value @ bci:4 (line 8)
 67  StoreI  === 64 65 62 11  [[ 66 68 ]]  @java/util/concurrent/atomic/AtomicInteger (java/io/Serializable)+12 *, name=value, idx=5; Volatile!  Memory: @java/util/concurrent/atomic/AtomicInteger (java/io/Serializable):NotNull+12 *, name=value, idx=5; !jvms: AtomicInteger::set @ bci:2 (line 101) acquire_release_barriers::set_value @ bci:4 (line 8)

 ;; B2: #       out( N40 ) <- in( B1 )  Freq: 0.999999
  0x000073cccc4274dd:   mov    %edx,0xc(%r12,%r11,8)
  0x000073cccc4274e2:   lock addl $0x0,-0x40(%rsp)          ;*putfield value {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
*/
    public void set_value(int val) {
        counter.set(val);
    }

/*
 63  AddP  === _ 42 42 62  [[ 64 ]]   Oop:java/util/concurrent/atomic/AtomicInteger (java/io/Serializable):NotNull+12 * !jvms: AtomicInteger::get @ bci:1 (line 91) acquire_release_barriers::get_value @ bci:3 (line 12)
 64  LoadI  === _ 7 63  [[ 65 70 ]]  @java/util/concurrent/atomic/AtomicInteger (java/io/Serializable)+12 *, name=value, idx=5; Volatile! #int !jvms: AtomicInteger::get @ bci:1 (line 91) acquire_release_barriers::get_value @ bci:3 (line 12)
 65  MemBarAcquire  === 34 1 7 1 1 64  [[ 66 67 ]]  !jvms: AtomicInteger::get @ bci:1 (line 91) acquire_release_barriers::get_value @ bci:3 (line 12)

  0x00007ea51842e958:   mov    0xc(%r12,%r11,8),%eax        ; implicit exception: dispatches to 0x00007ea51842e96d
                                                            ;*getfield value {reexecute=0 rethrow=0 return_oop=0 return_scalarized=0}
*/
    public int get_value() {
        return counter.get();
    }

    public void run() {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
            set_value(i);
            res += get_value();
        }
        System.out.println("[ " + Thread.currentThread() + " res] " + res);
    }

    public static void main(String [] args) throws Exception {
        Thread t1 = new Thread(new acquire_release_barriers());
        Thread t2 = new Thread(new acquire_release_barriers());
        t1.start();
        t2.start();
        t1.join(); 
        t2.join(); 
    }
}
