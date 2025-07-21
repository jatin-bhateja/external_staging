
abstract value class MyAbsValue {
   public abstract float getAccum();
}

value class MyValue extends MyAbsValue {
  public float f1; 
  public float f2;
  public MyValue(float f1, float f2) {
      this.f1 = f1;
      this.f2 = f2;
  }
  public float getAccum() {
      return this.f1 + this.f2;
  }
}


public class test {
  public static float leaf(MyAbsValue obj) {
      return obj.getAccum();
  }
  public static float micro(MyValue obj, int cond) {
      // T1 = InlineTypeNode Null Param1 Param2  -> build_start_state 
      if (cond > 5000) {
         // Buffering before the call, since obj is not scalarized with -XX:-UseUniqueSubclasses
         // In this case, buffered InlineTypeNode is marked safe for replacement and will update
         // the entry in the local variable array.
         // T2 = Buffered InlineTypeNode CheckCastPP Param1 Param2 : DirectCallGenerator::set_arguments_for_call
         //
         // Question : New buffer should not be scheduled in dominating nodes of true conditional block.
         // Answer  : Yes, this is indeed the case.
         return leaf(obj); 
      }
      // T2 = Phi T1, T2
      // try_push_inline_types_down should now push InlineTypeNodes across Phi, thereby injecting Phi nodes
      // at all the inputs of InlineTypeNodes
      // This InlineTypeNode will have Param1 and Param2 as its field values but oop will have Phi which merges
      // a ConP (null oop) with CheckCastPP
      // Thus getfield should still be able to forward the field values while accumulating.
      return obj.getAccum() + 10.0f;
  }   

  public static void main(String [] args) {
     float res = 0.0f;
     for (int i = 0; i < 10000; i++) {
         res += micro(new MyValue((float)i, 30.0f), i);
     }
     System.out.println("[res] " + res);
  }
}

/*
        subq    rsp, #32        # Create frame

07a     movss   [rsp + #4], XMM1        # spill
080     movss   [rsp + #0], XMM0        # spill
085     cmpl    RDX, #5000
08b     jle,s   B8  P=0.651975 C=6784.000000

08d     B2: #   out( B11 B3 ) <- in( B1 )  Freq: 0.348025
08d     movl    RBP, RSI        # spill
08f     testl   RSI, RSI
091     je     B11  P=0.001000 C=-1.000000

097     B3: #   out( B12 B4 ) <- in( B2 )  Freq: 0.347677
097     # TLS is in R15
097     movq    RSI, [R15 + #464 (32-bit)]      # ptr
09e     movq    R10, RSI        # spill
0a1     addq    R10, #24        # ptr
0a5     cmpq    R10, [R15 + #480 (32-bit)]      # raw ptr
0ac     jae,us  B12  P=0.000100 C=-1.000000

0ae     B4: #   out( B5 ) <- in( B3 )  Freq: 0.347642
0ae     movq    [R15 + #464 (32-bit)], R10      # ptr
0b5     PREFETCHW [R10 + #192 (32-bit)] # Prefetch allocation into level 1 cache and mark modified
0bd     movq    R10, precise MyValue: 0x0000715c001058b8:Constant:exact *       # ptr
0c7     movq    R10, [R10 + #168 (32-bit)]      # long
0ce     movq    [RSI], R10      # long
0d1     movl    [RSI + #8 (8-bit)], narrowklass: precise MyValue: 0x0000715c001058b8:Constant:exact *   # compressed klass ptr
0d8     movl    [RSI + #12 (8-bit)], R12        # int (R12_heapbase==0)

0dc     B5: #   out( B6 ) <- in( B13 B4 )  Freq: 0.347677
0dc     movss   XMM1, [rsp + #0]        # spill
0e1     movss   [RSI + #16 (8-bit)], XMM1       # float
0e6     movss   XMM0, [rsp + #4]        # spill
0ec     movss   [RSI + #20 (8-bit)], XMM0       # float
0f1
0f1     MEMBAR-storestore (empty encoding)
0f1     # checkcastPP of RSI

0f1     B6: #   out( B15 B7 ) <- in( B5 B11 )  Freq: 0.348025
        nop     # 2 bytes pad for loops and calls
0f3     call,static  test::leaf
        # test::micro @ bci:8 (line 25) L[0]=_ L[1]=_
        # OopMap {off=248/0xf8}

100     B7: #   out( B10 ) <- in( B6 )  Freq: 0.348018
        # Block is sole successor of call
100     jmp,s   B10

102     B8: #   out( B14 B9 ) <- in( B1 )  Freq: 0.651975
102     movl    R11, RSI        # spill
105     testl   RSI, RSI
107     je,s   B14  P=0.000001 C=-1.000000
*/
