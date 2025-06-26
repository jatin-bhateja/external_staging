class cproj {
   public static int [] res = new int[1];
   public static void micro(int i) {
      if (i  > 10) {  
         res[0] = 20;
      } else {
         res[0] = 30;
      }
   }
   public static void main(String [] args) {
      micro(Integer.parseInt(args[0]));
   }
} 
/*
AFTER: print_ideal
   0  Root  === 0 49 68 88 105 110  [[ 0 1 3 21 29 30 31 35 36 44 51 63 69 76 119 121 124 ]] inner 
   1  Con  === 0  [[ ]]  #top
   3  Start  === 3 0  [[ 3 5 6 7 8 9 10 ]]  #{0:control, 1:abIO, 2:memory, 3:rawptr:BotPTR, 4:return_address, 5:int}
   5  Parm  === 3  [[ 24 ]] Control !jvms: cproj::micro @ bci:-1 (line 4)
   6  Parm  === 3  [[ 110 101 84 64 45 ]] I_O !jvms: cproj::micro @ bci:-1 (line 4)
   7  Parm  === 3  [[ 16 107 101 91 84 33 71 45 64 53 ]] Memory  Memory: @BotPTR *+bot, idx=Bot; !jvms: cproj::micro @ bci:-1 (line 4)
   8  Parm  === 3  [[ 110 105 84 101 88 49 45 68 64 ]] FramePtr !jvms: cproj::micro @ bci:-1 (line 4)
   9  Parm  === 3  [[ 110 84 64 101 45 ]] ReturnAdr !jvms: cproj::micro @ bci:-1 (line 4)
  10  Parm  === 3  [[ 22 ]] Parm0: int !jvms: cproj::micro @ bci:-1 (line 4)
  16  MergeMem  === _ 1 7 1 1 1 108  [[ 110 ]]  { - - - N108:int[int:>=0]:exact+any * }  Memory: @BotPTR *+bot, idx=Bot;
  21  ConI  === 0  [[ 22 ]]  #int:10
  22  CmpI  === _ 10 21  [[ 23 ]]  !jvms: cproj::micro @ bci:3 (line 4)
  23  Bool  === _ 22  [[ 24 ]] [le] !jvms: cproj::micro @ bci:3 (line 4)
  24  If  === 5 23  [[ 25 26 ]] P=0.500000, C=-1.000000 !jvms: cproj::micro @ bci:3 (line 4)
  25  IfTrue  === 24  [[ 81 ]] #1 !jvms: cproj::micro @ bci:3 (line 4)
  26  IfFalse  === 24  [[ 41 ]] #0 !jvms: cproj::micro @ bci:3 (line 4)
  29  ConP  === 0  [[ 32 32 ]]  #java/lang/Class:exact *  Oop:java/lang/Class:exact *
  30  ConL  === 0  [[ 32 ]]  #long:120
  31  ConI  === 0  [[ 64 45 94 56 101 84 ]]  #int:0
  32  AddP  === _ 29 29 30  [[ 33 ]]   Oop:java/lang/Class:exact+120 * [narrow] !jvms: cproj::micro @ bci:6 (line 5)
  33  LoadN  === _ 7 32  [[ 125 120 122 64 101 ]]  @java/lang/Class:exact+120 * [narrow], name=res, idx=4; #narrowoop: int[int:>=0]:exact * !jvms: cproj::micro @ bci:6 (line 5)
  35  ConI  === 0  [[ 71 45 64 ]]  #int:20
  36  ConP  === 0  [[ 84 45 ]]  #NULL
  38  Bool  === _ 120  [[ 41 81 ]] [ne] !jvms: cproj::micro @ bci:12 (line 5)
  41  If  === 26 38  [[ 42 43 ]] P=0.999999, C=-1.000000 !jvms: cproj::micro @ bci:12 (line 5)
  42  IfTrue  === 41  [[ 123 53 71 ]] #1 !jvms: cproj::micro @ bci:12 (line 5)
  43  IfFalse  === 41  [[ 45 ]] #0 !jvms: cproj::micro @ bci:12 (line 5)
  44  ConI  === 0  [[ 84 ]]  #int:-10
  45  CallStaticJava  === 43 6 7 8 9 (121 1 36 31 35 ) [[ 46 ]] # Static uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')  void ( int ) C=0.000100 cproj::micro @ bci:12 (line 5) !jvms: cproj::micro @ bci:12 (line 5)
  46  Proj  === 45  [[ 49 ]] #0 !jvms: cproj::micro @ bci:12 (line 5)
  49  Halt  === 46 1 1 8 1  [[ 0 ]]  !jvms: cproj::micro @ bci:12 (line 5)
  51  ConL  === 0  [[ 52 90 ]]  #long:12
  52  AddP  === _ 122 122 51  [[ 53 ]]  !jvms: cproj::micro @ bci:12 (line 5)
  53  LoadRange  === 42 7 52  [[ 56 ]]  @bottom[int:>=0]+12 * [narrow], idx=5; #int:>=0 !jvms: cproj::micro @ bci:12 (line 5)
  56  CmpU  === _ 53 31  [[ 115 ]]  !orig=54 !jvms: cproj::micro @ bci:12 (line 5)
  63  ConI  === 0  [[ 101 ]]  #int:-28
  64  CallStaticJava  === 118 6 7 8 9 (124 1 33 31 35 ) [[ 65 ]] # Static uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')  void ( int ) C=0.000100 cproj::micro @ bci:12 (line 5) !jvms: cproj::micro @ bci:12 (line 5)
  65  Proj  === 64  [[ 68 ]] #0 !jvms: cproj::micro @ bci:12 (line 5)
  68  Halt  === 65 1 1 8 1  [[ 0 ]]  !jvms: cproj::micro @ bci:12 (line 5)
  69  ConL  === 0  [[ 70 106 ]]  #long:16
  70  AddP  === _ 122 122 69  [[ 71 ]]  !jvms: cproj::micro @ bci:12 (line 5)
  71  StoreI  === 117 7 70 35  |42  [[ 108 ]]  @int[int:>=0]:exact+any *, idx=6;  Memory: @int[int:>=0]:NotNull:exact[0] *, idx=6; !jvms: cproj::micro @ bci:12 (line 5)
  72  Region  === 72 113 117  [[ 72 110 108 ]]  !jvms: cproj::micro @ bci:23 (line 9)
  76  ConI  === 0  [[ 107 84 101 ]]  #int:30
  81  If  === 25 38  [[ 82 83 ]] P=0.999999, C=-1.000000 !jvms: cproj::micro @ bci:22 (line 7)
  82  IfTrue  === 81  [[ 126 91 107 ]] #1 !jvms: cproj::micro @ bci:22 (line 7)
  83  IfFalse  === 81  [[ 84 ]] #0 !jvms: cproj::micro @ bci:22 (line 7)
  84  CallStaticJava  === 83 6 7 8 9 (44 1 36 31 76 ) [[ 85 ]] # Static uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')  void ( int ) C=0.000100 cproj::micro @ bci:22 (line 7) !jvms: cproj::micro @ bci:22 (line 7)
  85  Proj  === 84  [[ 88 ]] #0 !jvms: cproj::micro @ bci:22 (line 7)
  88  Halt  === 85 1 1 8 1  [[ 0 ]]  !jvms: cproj::micro @ bci:22 (line 7)
  90  AddP  === _ 125 125 51  [[ 91 ]]  !jvms: cproj::micro @ bci:22 (line 7)
  91  LoadRange  === 82 7 90  [[ 94 ]]  @bottom[int:>=0]+12 * [narrow], idx=5; #int:>=0 !jvms: cproj::micro @ bci:22 (line 7)
  94  CmpU  === _ 91 31  [[ 111 ]]  !orig=92 !jvms: cproj::micro @ bci:22 (line 7)
 101  CallStaticJava  === 114 6 7 8 9 (63 1 33 31 76 ) [[ 102 ]] # Static uncommon_trap(reason='range_check' action='make_not_entrant' debug_id='0')  void ( int ) C=0.000100 cproj::micro @ bci:22 (line 7) !jvms: cproj::micro @ bci:22 (line 7)
 102  Proj  === 101  [[ 105 ]] #0 !jvms: cproj::micro @ bci:22 (line 7)
 105  Halt  === 102 1 1 8 1  [[ 0 ]]  !jvms: cproj::micro @ bci:22 (line 7)
 106  AddP  === _ 125 125 69  [[ 107 ]]  !jvms: cproj::micro @ bci:22 (line 7)
 107  StoreI  === 113 7 106 76  |82  [[ 108 ]]  @int[int:>=0]:exact+any *, idx=6;  Memory: @int[int:>=0]:NotNull:exact[0] *, idx=6; !jvms: cproj::micro @ bci:22 (line 7)
 108  Phi  === 72 107 71  [[ 16 ]]  #memory  Memory: @int[int:>=0]:exact+any *, idx=6; !jvms: cproj::micro @ bci:23 (line 9)
 110  Return  === 72 6 16 8 9  [[ 0 ]] 
 111  Bool  === _ 94  [[ 126 ]] [le]
 113  IfFalse  === 126  [[ 107 72 ]] #0 !orig=[97] !jvms: cproj::micro @ bci:22 (line 7)
 114  IfTrue  === 126  [[ 101 ]] #1 !orig=[100] !jvms: cproj::micro @ bci:22 (line 7)
 115  Bool  === _ 56  [[ 123 ]] [le]
 117  IfFalse  === 123  [[ 71 72 ]] #0 !orig=[59] !jvms: cproj::micro @ bci:12 (line 5)
 118  IfTrue  === 123  [[ 64 ]] #1 !orig=[62] !jvms: cproj::micro @ bci:12 (line 5)
 119  ConN  === 0  [[ 120 ]]  #narrowoop: NULL
 120  CmpN  === _ 33 119  [[ 38 ]] 
 121  ConI  === 0  [[ 45 ]]  #int:-10
 122  DecodeN  === _ 33  [[ 70 70 52 52 ]]  #int[int:>=0]:NotNull:exact * !orig=[34] !jvms: cproj::micro @ bci:6 (line 5)
 123  If  === 42 115  [[ 118 117 ]] P=0.000001, C=-1.000000
 124  ConI  === 0  [[ 64 ]]  #int:-28
 125  DecodeN  === _ 33  [[ 106 106 90 90 ]]  #int[int:>=0]:NotNull:exact * !orig=[34] !jvms: cproj::micro @ bci:6 (line 5)
 126  If  === 82 111  [[ 114 113 ]] P=0.000001, C=-1.000000
*/
