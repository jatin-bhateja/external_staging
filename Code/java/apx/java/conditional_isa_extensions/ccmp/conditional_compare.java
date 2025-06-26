
public class conditional_compare {
    public static long micro1(long src1, long src2, long cond1, long cond2, long cond3) {
       long res = src1;
       // UCT due to low branching probabiltiy on false path
       // spoil the party by landing into UCT.
       //if (cond1 > 10000 && cond2 < 20) {    --> T1
       if (cond1 > 5000 || cond2 < 5000 || cond3 < 5000) {
          res = src2;
       }
       return res;
    }

    public static long micro2(long src1, long src2, long cond1, long cond2) {
       long res = src1;
       if (cond1 > 5000 || cond2 < 5000) {
          res = src2;
       }
       return res;
    }

    public static long micro3(long src1, long src2, long cond1, long cond2) {
       long res = src1;
       // UCT due to low branching probabiltiy on false path
       // spoil the party by landing into UCT.
       if (cond1 < 50000 && cond2 < 50000) {
          res = src2;
       }
       return res;
    }

    public static void main(String [] args) {
       long res = 0;
       for (int i = 0; i < 100000; i++) {
           //res += micro(i, i + 10, i, 2);   --> T1
           //res += micro1(i, i + 10, i, i, i);
           res += micro2(i, i + 10, i, i );
       }
       System.out.println("[res] " + res);
    }
}

/*
Pattern of interest
 37  If  === 5 36 35  [[ 38 39 ]] P=0.651975, C=6784.000000 !jvms: ccmp_micro::micro @ bci:9 (line 8)
 38  IfTrue  === 37  [[ 47 ]] #1 !jvms: ccmp_micro::micro @ bci:9 (line 8)
 39  IfFalse  === 37  [[ 42 ]] #0 !jvms: ccmp_micro::micro @ bci:9 (line 8)
 42  Region  === 42 57 48 39  [[ 42 61 ]] #reducible  !jvms: ccmp_micro::micro @ bci:30 (line 9)
 45  CmpL  === _ 16 31  [[ 46 47 ]]  !jvms: ccmp_micro::micro @ bci:18 (line 8)
 46  Bool  === _ 45  [[ 47 ]] [lt] !jvms: ccmp_micro::micro @ bci:18 (line 8)
 47  If  === 38 46 45  [[ 48 49 ]] P=0.999774, C=4423.000000 !jvms: ccmp_micro::micro @ bci:18 (line 8)
 48  IfTrue  === 47  [[ 42 ]] #1 !jvms: ccmp_micro::micro @ bci:18 (line 8)
 49  IfFalse  === 47  [[ 56 ]] #0 !jvms: ccmp_micro::micro @ bci:18 (line 8)
 54  CmpL  === _ 18 31  [[ 55 56 ]]  !jvms: ccmp_micro::micro @ bci:27 (line 8)
 55  Bool  === _ 54  [[ 56 ]] [lt] !jvms: ccmp_micro::micro @ bci:27 (line 8)
 56  If  === 49 55 54  [[ 57 58 ]] P=0.500000, C=-1.000000 !jvms: ccmp_micro::micro @ bci:27 (line 8)
 57  IfTrue  === 56  [[ 42 ]] #1 !jvms: ccmp_micro::micro @ bci:27 (line 8)
 58  IfFalse  === 56  [[ 61 ]] #0 !jvms: ccmp_micro::micro @ bci:27 (line 8)
 61  Region  === 61 42 58  [[ 61 63 62 ]] #reducible  !jvms: ccmp_micro::micro @ bci:33 (line 11)
 62  Phi  === 61 12 10  [[ 63 ]]  #long !jvms: ccmp_micro::micro @ bci:33 (line 11)

  - C1 C2 C3
  - C2.T.TGT == C3.T.TGT && C2.T.CCFLAG == C3.T.CCFLAG && C2.F == C3
    CCMP C2.COND.NOT C3 <DVF = C2.COND.FLAG
  - CCFLAG is important to keep subsequent jcc sacrosanct.


  Anatomy of CCMP instruction:-
    - CCMP 
        - DFV (returned if SRC.FLAG != EVEX.SFLAGS), CCMPNEQ -> NE is encoded into EVEX.SFLAGS bits, DFV needs to be set explicitly.
        - OP1
        - OP2
        - DST.FLAGS = OP1 - OP2 [EFLAGS set according to the subtraction operation] 

        if (SRC.FLAT == EVEX.SFLAGS) {
           DST.FLAGS = OP1. CMP OP2.
        } else {
           DST.FLAGS = DFV
        }
                
    -    

  Case 1:
     Source:- 
       res = src1; 
       if (c1 == 1 || c2 == 2) {
          res = src2;
       }
       return res;

    C2 SoN IR:-

        Parm0(c1) ConI(1)
            |      |
            |      |
             \    /     Parm1(c2) ConI(2)
              CmpI       |          |
               |         |    ______|
              Bool (eq)   \  /
               |          CmpI (COND2)
              IF (COND1)   | 
             /  \        Bool (eq)  
            /    \        |
         IfTrue IfFalse  /
           |       |    /
           |        \  /
           |         IF
           |        /  \
           |       /    \
           |   IfTrue   IfFalse
           |   |         |
           |   |        /
         Region        / 
            |         /
            |   _____/
            |   |
            Region
               |   Parm2(src2)  Parm3(src1)
               |    /            /
               |   /            /
               |  /            /
              Phi/____________/
               |
               |
             Return

    Short circuiting :-
       COND1 || COND2 
       - if COND1 is TRUE then COND2 need not be executed.
       - In terms of CCMP, we fold result of former comparison with subsequent compare to 
         save costly branch prediction resources as intermediate JMP is absorbed. Hence,
         to emulate short circuiting, EVEX.SFLAGS should be set to inverse of original source flags
         and DFV should be same as SRC.FLAGS.
       - Thus, if COND1 is true then we skip executing COND2 part of CCMP instruction and pass
         the flags modified by COND1 as it is to consumer instruction.


    All the following conditions must be satisfied to infer a CCMP IR pattern.
       - COND1.FP == COND2
       - COND1.TP.TARGET == COND2.TP.TARGET

    By, setting DFV as SRC.FLAGS we ensure that consumer of flags is agnostic to control flow modification
    i.e. flags modified by COND1 execution must match with CCMP default flags value after failed SRF.FLAG check
    since EVEX.SFLAGS == ~COND1.PREDICATE hence, we will not exeucte COND2 and pass unmodifed flags.
  
  Case 2:
     Source:- 
       res = src1; 
       if (c1 == 1 && c2 == 2) {
          res = src2;
       }
       return res;

    C2 SoN IR:-

        Parm0(c1) ConI(1)
            |      |
            |      |
             \    /     Parm1(c2) ConI(2)
              CmpI       |          |
               |         |    ______|
              Bool (eq)   \  /
               |          CmpI (COND2)
              IF (COND1)   | 
             /  \        Bool (eq)  
            /    \        |
         IfFalse IFTrue  /
           |       |    /
           |        \  /
           |         IF
           |        /  \
           |       /    \
           |   IfFalse  IfTrue
           |   |         |
           |   |        /
          Region       / 
            |         /
            |   _____/
            |   |
            Region
               |   Parm2(src1)  Parm3(src2)
               |    /            /
               |   /            /
               |  /            /
              Phi/____________/
               |
               |
             Return

    Short circuiting :-
      o COND1 && COND2 

    Pre-conditions:-
    - COND1.FP.TARGET == COND2.FP.TARGET
    - COND1.TP == COND2
    
    Settings for CCMP:-
    - CCMP.EXEX.DFV = COND1.FALSE.FLAGS 
    - CCMP.EVEX.SFLAGS = COND1.PREDICATE
    
    Constraints limiting the scope of optimization :-
      o Un-common traps injected based on branch profiles can distort the
        graph structures, there by limiting CCMP inferencing.

      o UCT injection is performed while parsing if* bytecode[s]
      o Parsing sequentially walks over bytecode blocks and generates the IR graph one bytecode at a time
      o Thus, at the time of UCT injection we do not have view of upcoming converging control flows. 
      o Existing Conditional move detection is also impacted by similar problems.
      
*/

