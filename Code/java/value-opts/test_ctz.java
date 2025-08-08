
import java.util.concurrent.ThreadLocalRandom;

public class test_ctz {

    public static final long lb = ThreadLocalRandom.current().nextLong(10000); 
    public static final long ub = ThreadLocalRandom.current().nextLong(10000); 

    public static long micro(long param) {
        long constrained_param = Math.min(175, Math.max(param, 160));
        return Long.numberOfLeadingZeros(constrained_param);
    }

    public static void main(String [] args) {
        long res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro(i);
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            res += micro(i);
        }
        long t2 = System.currentTimeMillis();
        //System.out.println("[time] " + (t2 - t1) + "ms [res] " + res + " [lb:ub] " + lb + ":" + ub);
        System.out.println("[time] " + (t2 - t1) + "ms [res] " + res);
    }
}

/*
Same result but different constrained_param value ranges
========================================================

PROMPT>java -Xbatch -XX:-TieredCompilation -XX:CompileCommand=PrintIdealPhase,test_ctz::micro,BEFORE_MATCHING -cp . test_ctz
CompileCommand: PrintIdealPhase test_ctz.micro const char* PrintIdealPhase = 'BEFORE_MATCHING'
AFTER: BEFORE_MATCHING
  0  Root  === 0 32  [[ 0 1 3 31 ]] inner 
  3  Start  === 3 0  [[ 3 5 6 7 8 9 ]]  #{0:control, 1:abIO, 2:memory, 3:rawptr:BotPTR, 4:return_address, 5:long, 6:half}
  5  Parm  === 3  [[ 32 ]] Control !jvms: test_ctz::micro @ bci:-1 (line 10)
  6  Parm  === 3  [[ 32 ]] I_O !jvms: test_ctz::micro @ bci:-1 (line 10)
  7  Parm  === 3  [[ 32 ]] Memory  Memory: @BotPTR *+bot, idx=Bot; !jvms: test_ctz::micro @ bci:-1 (line 10)
  8  Parm  === 3  [[ 32 ]] FramePtr !jvms: test_ctz::micro @ bci:-1 (line 10)
  9  Parm  === 3  [[ 32 ]] ReturnAdr !jvms: test_ctz::micro @ bci:-1 (line 10)
 31  ConL  === 0  [[ 32 ]]  #long:52
 32  Return  === 5 6 7 8 9 returns 31  [[ 0 ]] 
[time] 5ms [res] 10400000 [lb:ub] 5556:3773

PROMPT>java -Xbatch -XX:-TieredCompilation -XX:CompileCommand=PrintIdealPhase,test_ctz::micro,BEFORE_MATCHING -cp . test_ctz
CompileCommand: PrintIdealPhase test_ctz.micro const char* PrintIdealPhase = 'BEFORE_MATCHING'
AFTER: BEFORE_MATCHING
  0  Root  === 0 30  [[ 0 1 3 25 24 ]] inner 
  3  Start  === 3 0  [[ 3 5 6 7 8 9 10 ]]  #{0:control, 1:abIO, 2:memory, 3:rawptr:BotPTR, 4:return_address, 5:long, 6:half}
  5  Parm  === 3  [[ 30 ]] Control !jvms: test_ctz::micro @ bci:-1 (line 10)
  6  Parm  === 3  [[ 30 ]] I_O !jvms: test_ctz::micro @ bci:-1 (line 10)
  7  Parm  === 3  [[ 30 ]] Memory  Memory: @BotPTR *+bot, idx=Bot; !jvms: test_ctz::micro @ bci:-1 (line 10)
  8  Parm  === 3  [[ 30 ]] FramePtr !jvms: test_ctz::micro @ bci:-1 (line 10)
  9  Parm  === 3  [[ 30 ]] ReturnAdr !jvms: test_ctz::micro @ bci:-1 (line 10)
 10  Parm  === 3  [[ 36 42 ]] Parm0: long !jvms: test_ctz::micro @ bci:-1 (line 10)
 24  ConL  === 0  [[ 39 44 ]]  #long:3466
 25  ConL  === 0  [[ 36 42 ]]  #long:3322
 28  CountLeadingZerosL  === _ 34  [[ 29 ]]  !jvms: test_ctz::micro @ bci:15 (line 11)
 29  ConvI2L  === _ 28  [[ 30 ]]  #long:minint..maxint, 0u..maxulong, widen: 3 !jvms: test_ctz::micro @ bci:18 (line 11)
 30  Return  === 5 6 7 8 9 returns 29  [[ 0 ]] 
 34  CMoveL  === _ 43 44  [[ 28 ]]  #long:3322..3466, widen: 3 !orig=[27] !jvms: test_ctz::micro @ bci:10 (line 10)
 36  CmpL  === _ 10 25  [[ 37 41 ]] 
 37  Bool  === _ 36  [[ 41 ]] [lt]
 38  CMoveL  === _ 41 42  [[ 44 39 ]]  #long:3322..maxlong, widen: 3 !orig=[26] !jvms: test_ctz::micro @ bci:7 (line 10)
 39  CmpL  === _ 38 24  [[ 40 43 ]]  !orig=[32]
 40  Bool  === _ 39  [[ 43 ]] [gt] !orig=[33]
 41  Binary  === _ 37 36  [[ 38 ]] 
 42  Binary  === _ 10 25  [[ 38 ]] 
 43  Binary  === _ 40 39  [[ 34 ]] 
 44  Binary  === _ 38 24  [[ 34 ]] 
[time] 20ms [res] 10400000 [lb:ub] 3322:3466
*/
