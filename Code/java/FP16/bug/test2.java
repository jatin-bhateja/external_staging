
import java.util.Arrays;

/*
float    554  LoadF  === 364 7 555  [[ 553 ]]  @float[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; #float (does not depend only on test, unknown control) !orig=238,[134] !jvms: test2::micro @ bci:12 (line 7)
int      553  ConvF2I  === _ 554  [[ 552 ]]  #int !orig=135 !jvms: test2::micro @ bci:13 (line 7)
int      552  LShiftI  === _ 553 136  [[ 551 ]]  !orig=137 !jvms: test2::micro @ bci:14 (line 7)
int      551  RShiftI  === _ 552 136  [[ 550 ]]  !orig=138 !jvms: test2::micro @ bci:14 (line 7)
float    550  ConvI2F  === _ 551  [[ 549 ]]  #float !orig=139 !jvms: test2::micro @ bci:15 (line 7)
byte     549  ConvF2I  === _ 550  [[ 547 ]]  #int !orig=140 !jvms: test2::micro @ bci:16 (line 7)
memory   837  Phi  === 834 331 163  [[ 790 ]]  #memory  Memory: @byte[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=6; !orig=[687],[559],189,[187],[94] !jvms: test2::micro @ bci:8 (line 7)
byte     790  StoreB  === 834 837 798 791  [[ 789 ]]  @byte[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=6;  Memory: @byte[int:>=0] (java/lang/Cloneable,java/io/Serializable):NotNull:exact+any *, idx=6; !orig=657,547,163,570 !jvms: test2::micro @ bci:18 (line 7)
*/
public class test2 {
   public static void micro(byte [] dst, float [] src) {
       for (int i = 0; i < dst.length; i++) {
           dst[i] = (byte)((float)((byte)src[i]));
       }
   }
   public static void main(String [] args) {
       byte [] dst = new byte[4096];
       float [] src = new float[4096];
       Arrays.fill(src, 10.0f); 
       for (int i = 0; i < 10000; i++) {
           micro(dst, src);
       } 
       System.out.println("[res] " + Arrays.toString(Arrays.copyOfRange(dst, 0, 16)));
   }
}
