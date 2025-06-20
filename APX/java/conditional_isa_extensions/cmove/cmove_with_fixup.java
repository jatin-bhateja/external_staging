
public class cmove_with_fixup  {

    public static int micro(int a, int b, float c, float d) {
       // UCF, unordered compare flag, applicable to only NE and EQ predicates,
       // since NaN == NaN is false, and NaN != NaN is true.
       // For other predicates like,  <  > unordered / ordered comparison
       // does not effect the flag consumer, ie. 2.0f > 2.0f will set 
       // same flags as NaN > NaN.
       // While we need special fixups for predicates where unordered and
       // ordered comparisons effect flags differently, i.e.
       // NaN == NaN is false and while 2.0f == 2.0f is true.
       // return c > d ? a : b;
       /*
          10  cmpF_cc_reg_CF  === _ 12 13  [[ 11 ]]
          11  cmovL_regU  === _ 10 14 15  [[ 2 ]] be !jvms: cmove_with_fixup::micro @ bci:13 (line 13)
       */
       // return c != d ? a : b;
       /*
         10 cmpF_cc_reg_CF  === _ 11 12  [[ 9 ]]
         9  cmovL_regUCF2_ne  === _ 10 13 14  [[ 2 ]] ne !jvms: cmove_with_fixup::micro @ bci:13 (line 18)

                instruct cmovL_regUCF2_ne(cmpOpUCF2 cop, rFlagsRegUCF cr, rRegL dst, rRegL src) %{
                  predicate(!UseAPX && n->in(1)->in(1)->as_Bool()->_test._test == BoolTest::ne);
                  match(Set dst (CMoveL (Binary cop cr) (Binary dst src)));
                
                  ins_cost(200); // XXX
                  format %{ "cmovpq  $dst, $src\n\t"
                            "cmovneq $dst, $src" %}
                  ins_encode %{
                    __ cmovq(Assembler::parity, $dst$$Register, $src$$Register);
                    __ cmovq(Assembler::notEqual, $dst$$Register, $src$$Register);
                  %}
                  ins_pipe(pipe_cmov_reg);
                %}

           For != comparison,  since NaN != NaN is true hence to maintain sacrosanctity
           of flags as seen by consumer we first emit a cmove for parity flag as 
           ordered comparison would have generated a false value here, if parity flag
           is not set this mean comparison was ordered and hence next cmove is based 
           on NE flag settings.
       */
       //return c == d ? a : b;
       /*
          9  cmovL_regUCF2_ne  === _ 10 13 14  [[ 2 ]] ne !jvms: cmove_with_fixup::micro @ bci:13 (line 43)
          10  cmpF_cc_reg_CF  === _ 11 12  [[ 9 ]]
          for <= operator, NaN <= NaN is indeed false and we don't need any special fixup like == or !=
          where result are flipped and counter intuitive i.e. NaN == NaN is false and NaN != NaN is true.

    UNORDERED: ZF,PF,CF := 111;
    GREATER_THAN: ZF,PF,CF := 000;
    LESS_THAN: ZF,PF,CF := 001;
    EQUAL: ZF,PF,CF := 100;

          To execute a cmove, predicate must be true, for equality operator ==, since NaN == NaN is false
          hence predicate will be false for these values and conditional move should not be executed
          We cannot check for noParity to detect this condition as parity is not set for GT, LT and EQ
          case also. 
          Hence, following is incorrect floating equality comparison logic, since for non equal non-nan
          values also we may incorrectly update dst.   
          if (parity == false) {
              dst = src
          } else if (zf == true) {
              dst = dst
          } 

          Equality comparison involving at least one NaN will always be false irrespective of operand flipping.
          Similarly, equality comparison involving non NAN equal values will always be true irrespective of operand flipping.
   

          Instruction sequence of following existing patten will enforce cmove when parity flag is set, i.e. if any
          of the operand is a NaN value, which is incorrect. 

               // Since (x == y) == !(x != y), we can flip the sense of the test by flipping the
               // inputs of the CMove
               instruct cmovI_regUCF2_eq(cmpOpUCF2 cop, rFlagsRegUCF cr, rRegI dst, rRegI src) %{
                 predicate(!UseAPX && n->in(1)->in(1)->as_Bool()->_test._test == BoolTest::eq);
                 match(Set dst (CMoveI (Binary cop cr) (Binary src dst)));
               
                 ins_cost(200); // XXX
                 format %{ "cmovpl  $dst, $src\n\t"
                           "cmovnel $dst, $src" %}
                 ins_encode %{
                   __ cmovl(Assembler::parity, $dst$$Register, $src$$Register);
                   __ cmovl(Assembler::notEqual, $dst$$Register, $src$$Register);
                 %}
                 ins_pipe(pipe_cmov_reg);
               %}

          Because we always flip the comparison predicate to a canonical form during parsing, hence eq becomes neq.
          Negating the predicate involves flipping the true and false control path edges since condition is now 
          reversed.

          Hence following transformations are equivalent.

          if (c == d) {  fcmp results into 0 , ifne false_path, compiler use either fcmpg or fcmpl here if subsiquent
             true_path   instruction is ifne
          } else {
             false_path
          }
          =====
          if (c != d) {    we choose the true path if fcmp results in a non zero results, here if c == d then fcmp 
             false_path    results into zero value, if c < d then -1 otherwise 1 i.e c > d, we take the true path
          } else {         if c > d or c < d, NaN != NaN is true and NaN != non-NAN is also true, ie. result of fcmp is zero
             true_path     so with fcmpl/g  and ifne we will always take a false path for unordered and ordered comparison
          }                failure, in case of non-equality condition an unordered comparison always results into a true value
                           i.e. 
                           if PARITY flag is set then conditional cmove based on non-equality check should always execute.
                           However, to exeucte a conditional move for non-equality comparison of non-NAN operand 
                           ZERO_FLAG must not be set.  
                           
                           This explanation goes in line with following JIT sequence emitted for cmovL_regUCF2_ne matcher pattern.
                               __ cmovq(Assembler::parity, $dst$$Register, $src$$Register);
                               __ cmovq(Assembler::notEqual, $dst$$Register, $src$$Register);

                           For, equality check, we consider following premises / lemmas
                              1) NaN == NaN is false
                              2) non-NAN == NaN is false
                              3) non-NAN == non-NAN if true in case both operands are equal else false.

                           thus, 
                           fcmp F1 F2 
                               - 0  if both the operands are non-NAN values and are equal. 
                               - 1/-1  if F1 > F2 or F1 < F2, or one of operand is NaN then
                                 fcmpl will results into -1 and fcmpg will result into 1.

                           fcmpg F1 F2
                           ifne  false_path
                           true_path:
                              ...
                              goto exit_path
                           false_path:
                              ...
                           exit_path:

                           Thus a conditional move which is based on equality comparison should execute only 
                           iff both the operands are non-values and are exactly equal.

                           So following JIT sequence emitted for cmovI_regUCF2_eq matcher pattern is incorrect
                              
                             __ cmovl(Assembler::parity, $dst$$Register, $src$$Register);
                             __ cmovl(Assembler::notEqual, $dst$$Register, $src$$Register);

                           Since PARITY flag is set if either of the operand is NaN value.
                           
                           As per following comment on the eq matcher pattern
                           // Since (x == y) == !(x != y), we can flip the sense of the test by flipping the

                           If we flip the inputs we have following cases
 
                           fcmp F1 F2   0 if F1 == F2, 1 if F1 > F2 and -1 if F1 < F2                        
                               Thus, if F1 and F2 are equal then flipping operands does not disturb the semantics.
                               if F1 > F2, then for equality comparions, results is 1 and flipped operand will return a -1
                               
                           Thus, following bytecode is agnostic to operand flipping, since if F1 != F2 then result will be
                           1 or -1 and in both the cases we choose the false_path.

                           fcmp F1 F2
                           ifne false_path
                           true_path:
                                ...
                                goto exit_path
                           false_path:
                                ...
                           exit_path:
                         

       */                  
       return c == d ? a : b;
    }
 
    public static void main(String [] args) {
       long res = 0;
       for (int i = 0; i < 100000; i++) {
           res += micro(10, 20, 0.0f,  ((i & 3) == 0) ? Float.NaN : 0.0f);
           //res += micro(10, 20, ((i & 1) == 0) ? Float.NaN : 2.0f,  ((i & 1) == 0) ? Float.NaN : 3.0f);
       }
       System.out.println("[res] " + res);
    }
}
