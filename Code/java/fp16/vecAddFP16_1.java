
import java.util.stream.IntStream;
import jdk.incubator.vector.*;
import static jdk.incubator.vector.Float16.*;
//import jdk.internal.vm.annotation.*;
//import jdk.internal.math.*;

public class vecAddFP16_1 {
  public static int count = 12400;

  public static float [] fp32_const_arr;

  public float micro() {
     float res = 0.0f;
     Float16 zero = shortBitsToFloat16(Float.floatToFloat16(4.0f));
     // Zero (LoadP from OSR buffer)
    /*
    1  Con  === 0  [[ ]]  #top
    3  StartOSR  === 3 0  [[ 3 5 6 7 8 9 10 ]]  #{0:control, 1:abIO, 2:memory, 3:rawptr:BotPTR, 4:return_address, 5:rawptr:BotPTR}
    5  Parm  === 3  [[ 35 36 27 31 ]] Control !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
    6  Parm  === 3  [[ 452 64 143 94 ]] I_O !orig=[72] !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
    7  Parm  === 3  [[ 362 40 36 27 31 35 91 605 1323 316 139 1316 16 122 563 1376 ]] Memory  Memory: @BotPTR *+bot, idx=Bot; !orig=[73] !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
    8  Parm  === 3  [[ 147 452 143 36 68 64 94 672 701 98 ]] FramePtr !orig=[715] !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
    9  Parm  === 3  [[ 143 452 94 64 ]] ReturnAdr !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
   10  Parm  === 3  [[ 36 33 33 29 29 25 25 ]] Parm0: rawptr:BotPTR !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
   16  MergeMem  === _ 1 7 39 1 1 1 1 1 1 1 1 1 1 1 1  [[ 452 ]]  { N39:rawptr:BotPTR - - - - - - - - - - - - }  Memory: @BotPTR *+bot, idx=Bot;
   21  ConI  === 0  [[ 1403 1369 ]]  #int:0
   25  AddP  === _ 10 10 26  [[ 27 ]]  !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
   26  ConL  === 0  [[ 25 ]]  #long:24
   27  LoadF  === 5 7 25  [[ 64 531 622 94 ]]  @rawptr:BotPTR, idx=Raw; #float (does not depend only on test, raw access) !orig=[75] !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
   29  AddP  === _ 10 10 30  [[ 31 ]]  !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
   30  ConL  === 0  [[ 29 1186 564 606 ]]  #long:16
   31  LoadP  === 5 7 29  [[ 62 64 47 1375 1375 ]]  @rawptr:BotPTR, idx=Raw; #java/lang/Object * (does not depend only on test, raw access)  Oop:java/lang/Object * !jvms: vecAddFP16_1::micro @ bci:13 (line 17)
        62  CheckCastPP  === 1385 31  [[ 555 143 315 315 ]]  #jdk/incubator/vector/Float16 (java/io/Serializable,java/lang/Comparable):NotNull:exact *  Oop:jdk/i
        => UNBOXING from Oop placed in OSR buffer => LoadS
     */
     // ConF => ConvF2HF => Allocate (Escaping) 
     for (int i = 0; i < count; i++) {
         // LoadF => ConvF2HF => Allocate (Escaping) 
         Float16 val = shortBitsToFloat16(Float.floatToFloat16(fp32_const_arr[i]));
        //  ConvF2HF => ReinterpretS2HF  
        //  ConvF2HF => ReinterpretS2HF AddHF => ReinterpretHF2S => ConvHF2F
         res += add(val, zero).floatValue();
     }
     return res;
  }

  public vecAddFP16_1 () {
     fp32_const_arr = new float[count];
     for (int i = 0; i < count; i++) {
         fp32_const_arr[i] = (float)i;
     }
  }
  public static void main(String [] args) {
     short res = (short)0;
     vecAddFP16_1 obj = new vecAddFP16_1();
     for (int i = 0; i < 20000; i++) {
         res += obj.micro();
     }
     long t1 = System.currentTimeMillis();
     for (int i = 0; i < 20000; i++) {
         res += obj.micro();
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[time] " + (t2-t1) + " ms  [res] " + res);
  }
}
