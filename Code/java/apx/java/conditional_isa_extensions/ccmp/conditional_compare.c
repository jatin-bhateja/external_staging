
/*
    - Pros
        - Very useful to reduce the number of branches and thus saving BTB entries.
        - Even though compiler driven short circuiting saves exeucting redundant follow up comparisons
          if does generate addtional condition logic e.g.

     source: 
       if ( cond1 && cond2) {
             true_path
       }
       follow_on_path

     compiler:
          -- First level IR. 
     IR:
         T1 = ICMP cond1
         BR  i1 T1 TRUE_LABEL1 , FALSE_LABEL1

     TRUE_LABEL1:
         T2 = ICMP cond2
         BR i1 T2  TRUE_LABEL2, FALSE_LABEL2

     FALSE_LABEL1:
         BR FOLLOW_ON_PATH

     FALSE_LABEL2:
         BR FOLLOW_ON_PATH

     TRUE_LABEL2:
         true_path_block
         BR FOLLOW_ON_PATH

     FOLLOW_ON_PATH:
         follow_on_path_block


         -- Branch optimization. Dead blocks with unconditional block removed and its target propagated back to its predecessor
            terminal IR.

     IR:
         T1 = ICMP cond1
         BR  i1 T1 TRUE_LABEL1 , FOLLOW_ON_PATH

     TRUE_LABEL1:
         T2 = ICMP cond2
         BR i1 T2  TRUE_LABEL2, FOLLOW_ON_PATH

     TRUE_LABEL2:
         true_path_block
         BR FOLLOW_ON_PATH

     FOLLOW_ON_PATH:
         follow_on_path_block

     Still above code sequence has 3 branching (BR) IRs. Which could potential occupy space in BTB.


     With conditional compare and test we can form a macro level IR which can absorb two conditional expressions
     there by saving entries in generally space constrained branch prediction machinery and help in improving
     misprediction ratio in real server workloads.


 */


 int micro(int cond1, int cond2, int a, int b) {
    int res = 0;
    if (cond1 && cond2) {
       res = a + b;
    }
    return res;
 }
