public class test_monitor {
   static long counter;
   // Lock coarsening.
   public void micro() {
       synchronized(this) {
          counter++;
       }
       synchronized(this) {
          counter+=10;
       }
       synchronized(this) {
          counter+=100;
       }
   }

   public static void main(String [] args) {
       test_monitor obj = new test_monitor();
       for (int i = 0 ; i < 10000; i++) {
           obj.micro();
       }
       System.out.println("[counter] " + counter);
   }
}
/*
CPROMPT>perf stat -e cycles,instructions,mem_inst_retired.lock_loads java -XX:+PrintLockStatistics -XX:-EliminateLocks -cp . test_monitor
[counter] 11100000000
dynamic locks: 299886009

 Performance counter stats for 'java -XX:+PrintLockStatistics -XX:-EliminateLocks -cp . test_monitor':

   19,81,26,10,517      cycles
   15,63,68,31,199      instructions              #    0.79  insn per cycle
      60,12,44,245      mem_inst_retired.lock_loads

       7.025415501 seconds time elapsed

       6.942256000 seconds user
       0.155871000 seconds sys


CPROMPT>perf stat -e cycles,instructions,mem_inst_retired.lock_loads java -XX:+PrintLockStatistics -XX:+EliminateLocks -cp . test_monitor
[counter] 11100000000
dynamic locks: 299919570
eliminated locks: 199946380 (66%)

 Performance counter stats for 'java -XX:+PrintLockStatistics -XX:+EliminateLocks -cp . test_monitor':

    7,18,82,92,740      cycles
    6,52,92,02,551      instructions              #    0.91  insn per cycle
      20,13,26,831      mem_inst_retired.lock_loads

       2.512570403 seconds time elapsed

       2.418299000 seconds user
       0.158837000 seconds sys
*/
