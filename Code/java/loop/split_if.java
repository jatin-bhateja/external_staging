
import java.util.stream.*;


/*
    Q. What exactly we are trying to achieve with split-if in this case ?
    A. Within a loop body there is a conditional block with loop variant conditional expression.
       Idea is to pull in as much logic from the commom portion at the merge point, this will give 
       increase the scope of optimization like constant folding, and GVN, since both the successor
       blocks will have nodes pulled in from the merge point.

       cost-modeling:-
          -  take into account the number of statement after converging block. these will cloned
             into both the branches.
          -  some targets like x86 uses Loop stream detectors as front-end power friendly optimization
             where a loop with specific number of micro-ops can fit into LSD cached and need not
             be decoded again, an optimization like split-if which makes the if branches bulky
             may impacts LSD residency.
          -  Branch probability of conditional branch, PhaseCFG should schedule the blocks based
             on branch probabilities.

*/

public class split_if {
      public static double micro(double [] arr) {
          double res = 0.0;
          for (int i = 0; i < arr.length; i++) {
              double val = 0.0;
              if (arr[i] > 0.0) {
                 val = arr[i]; 
              } else {
                 val = 0.0;
              }
              res += Math.cos(val);
          }
          return res;
      }
    
      public static void main(String [] args) {
          double [] arr = new double[2001];
          int j = 0;
          IntStream.range(-1000, 1000).forEach(i -> { arr[1000 + i] = (double)i; });           
          double res = 0.0;
          for (int i = 0; i < 100000; i++) {
             res += micro(arr); 
          }
          System.out.println("[res] " + res);
      }
}
