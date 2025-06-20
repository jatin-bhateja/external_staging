
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
CPROMPT>perf stat taskset -c 1 ./app 37
[res] 260000

 Performance counter stats for 'taskset -c 1 ./app 37':

          3,302.90 msec task-clock                #    1.000 CPUs utilized
                 9      context-switches          #    0.003 K/sec
                 1      cpu-migrations            #    0.000 K/sec
               115      page-faults               #    0.035 K/sec
   10,54,43,22,564      cycles                    #    3.192 GHz
   10,03,26,78,976      instructions              #    0.95  insn per cycle
    2,00,10,56,769      branches                  #  605.848 M/sec
            50,846      branch-misses             #    0.00% of all branches

       3.303564249 seconds time elapsed

       3.303489000 seconds user
       0.000000000 seconds sys


CPROMPT>perf stat taskset -c 1 ./app 38
[res] 220000

 Performance counter stats for 'taskset -c 1 ./app 38':

          3,790.49 msec task-clock                #    1.000 CPUs utilized
                11      context-switches          #    0.003 K/sec
                 1      cpu-migrations            #    0.000 K/sec
               118      page-faults               #    0.031 K/sec
   12,10,09,11,387      cycles                    #    3.192 GHz
   10,03,25,06,942      instructions              #    0.83  insn per cycle
    2,00,11,51,333      branches                  #  527.940 M/sec
       2,86,75,097      branch-misses             #    1.43% of all branches

       3.791023383 seconds time elapsed

       3.790950000 seconds user
       0.000000000 seconds sys
*/

// Between Lspy 37 and 38 there is a huge increase in branch misprediction.
// resulting into 20% increase in cycles count.
// This indicates usage of two level adaptive either 37 bit / 74 bit branch predictor with local / global histroy table.
// spy branch experience high misprediction ratio after 37 branch history i.e. history of last 37 branches
// cannot predict spy branch direction.
// Since spy branch is part of loop hence its preceeded by a loop exit condition and successed by loopback
// jump instruction.

// ENTRY  SPY JMP
// Loop has static trip count of 100000, and thus 99999 loop entry conditional branches will be accurately
// predicted with one misprediction for loop exit case.
// Thus branching pattern for loop entry condition is
// 1 1 1 1 1 1  1....999999 time.....0 

// This can be easily predicted with two level 2 bit adaptive predictor with local histroy table with 2 bit saturating
// counter per table entry. Saturating counter vary between 00 to 11 with 00 being strongly not taken and 11 be strongly taken.

// Similary spy branch with spy width of 37 has following branching pattern
// 0 0 0 0 0 .....36 times.. 1
//
// Similar to above, two bit local branch history register can accurately predict spy branch..
//  
//  0 0   00 (strongly not taken), when spy branch is visited 36th time its local history register will have  0 0
//  and will mis-predict since 37 time it should take fallthrough path.
//  0 1   01 (weekly not taken)
//  1 0
//  1 1
//  
//  Lets insert 74 taken branches before spy branch and if the misprediction rate goes high then its a clear indication of
//  global branch histroy based two level adaptive predictor.
//
//  Branching pattern for loop entry and spy branch should loop like following.
//  1 0 1 0 1 0 .......thus with 4 bit global history register...we see a strongly not taken prediction after 36 iteration of loop and
//  branch history contains 1010
//  0000 
//  ...
//  1010   11  
//  0101   00
//  ...
//  1011   00
//  ..
//  1111  


int micro(int Lspy) {
   int a = 0;
   for (int i = 0; i < 100000; i++) {
       if (i % Lspy == 0) a = 0; 
       a++;
   }
   return a;
}

/*

CPROMPT>perf stat taskset -c 1 ./app2 37
[res] 1380000

 Performance counter stats for 'taskset -c 1 ./app2 37':

         23,834.19 msec task-clock                #    1.000 CPUs utilized
                79      context-switches          #    0.003 K/sec
                 1      cpu-migrations            #    0.000 K/sec
               118      page-faults               #    0.005 K/sec
   76,09,02,85,345      cycles                    #    3.192 GHz
 2,32,05,18,45,789      instructions              #    3.05  insn per cycle
   76,00,40,65,406      branches                  # 3188.868 M/sec
          1,39,871      branch-misses             #    0.00% of all branches

      23.835355337 seconds time elapsed

      23.834603000 seconds user
       0.000000000 seconds sys


CPROMPT>perf stat taskset -c 1 ./app2 38
[res] 1380000

 Performance counter stats for 'taskset -c 1 ./app2 38':

         24,139.88 msec task-clock                #    1.000 CPUs utilized
                87      context-switches          #    0.004 K/sec
                 1      cpu-migrations            #    0.000 K/sec
               121      page-faults               #    0.005 K/sec
   77,06,61,07,101      cycles                    #    3.192 GHz
 2,32,05,15,17,451      instructions              #    3.01  insn per cycle
   76,00,41,33,852      branches                  # 3148.488 M/sec
       2,64,15,280      branch-misses             #    0.03% of all branches

      24.141069052 seconds time elapsed

      24.140283000 seconds user
       0.000000000 seconds sys

  With 74 conditional taken brancher with a branching pattern of 1111....74 time.... next branch is predicted to be taken
  But, with Lspy of 37 spy branch must not taken for first 36 times, in this case with lspy 37 we can see a low misprediction
  rate this indicates presence of low local histroy register with width 37 since with lspy 38 we see a 2000x increase in 
  branch misprediction count. Thus local history register can no longer predict spy branch..

*/
int micro2(int Lspy) {
   int a = 0;
   for (int i = 1; i < 100000; i++) {
       if (i > 0) a = 1; 
       if (i > 0) a = 2; 
       if (i > 0) a = 3; 
       if (i > 0) a = 4; 
       if (i > 0) a = 5; 
       if (i > 0) a = 6; 
       if (i > 0) a = 7; 
       if (i > 0) a = 8; 
       if (i > 0) a = 9; 
       if (i > 0) a = 10; 
       if (i > 0) a = 11; 
       if (i > 0) a = 12; 
       if (i > 0) a = 13; 
       if (i > 0) a = 14; 
       if (i > 0) a = 15; 
       if (i > 0) a = 16; 
       if (i > 0) a = 17; 
       if (i > 0) a = 18; 
       if (i > 0) a = 19; 
       if (i > 0) a = 20; 
       if (i > 0) a = 21; 
       if (i > 0) a = 22; 
       if (i > 0) a = 23; 
       if (i > 0) a = 24; 
       if (i > 0) a = 25; 
       if (i > 0) a = 26; 
       if (i > 0) a = 27; 
       if (i > 0) a = 28; 
       if (i > 0) a = 29; 
       if (i > 0) a = 30; 
       if (i > 0) a = 31; 
       if (i > 0) a = 32; 
       if (i > 0) a = 33; 
       if (i > 0) a = 34; 
       if (i > 0) a = 35; 
       if (i > 0) a = 36; 
       if (i > 0) a = 11; 
       if (i > 0) a = 12; 
       if (i > 0) a = 13; 
       if (i > 0) a = 14; 
       if (i > 0) a = 15; 
       if (i > 0) a = 16; 
       if (i > 0) a = 17; 
       if (i > 0) a = 18; 
       if (i > 0) a = 19; 
       if (i > 0) a = 110; 
       if (i > 0) a = 111; 
       if (i > 0) a = 112; 
       if (i > 0) a = 113; 
       if (i > 0) a = 114; 
       if (i > 0) a = 115; 
       if (i > 0) a = 116; 
       if (i > 0) a = 117; 
       if (i > 0) a = 118; 
       if (i > 0) a = 119; 
       if (i > 0) a = 120; 
       if (i > 0) a = 121; 
       if (i > 0) a = 122; 
       if (i > 0) a = 123; 
       if (i > 0) a = 124; 
       if (i > 0) a = 125; 
       if (i > 0) a = 126; 
       if (i > 0) a = 127; 
       if (i > 0) a = 128; 
       if (i > 0) a = 129; 
       if (i > 0) a = 130; 
       if (i > 0) a = 131; 
       if (i > 0) a = 132; 
       if (i > 0) a = 133; 
       if (i > 0) a = 134; 
       if (i > 0) a = 135; 
       if (i > 0) a = 136; 
       if (i > 0) a = 137; 
       if (i > 0) a = 137; 
       if (i % Lspy == 0) a = 0; 
       a++;
   }
   return a;
}

int main(int argc, char* argv[]) {
   if (argc != 2) {
      return fprintf(stderr, "Incorrect Argment! ./app <spy_branch_distance>\n");
   }
   int Lspy = atoi(argv[1]);
   long res = 0;
   for (int ic = 0 ; ic < 10000; ic++) {
       res += micro2(Lspy);
   }
   return fprintf(stdout, "[res] %ld\n", res);
}


/* Above results were collected over CascadeLake server, with Granite Rapids the branch predicition has improved a lot and even with Lspy of 98 micro2 show
   very low branch misprediction and with Lspy of 99 it show 0.2% branch-misses which is 100x more than Lspy 98.

GNR>perf stat taskset -c 1 ./app2 99
[res] 1380000

 Performance counter stats for 'taskset -c 1 ./app2 99':

         22,119.53 msec task-clock                       #    1.000 CPUs utilized
                14      context-switches                 #    0.633 /sec
                 1      cpu-migrations                   #    0.045 /sec
               124      page-faults                      #    5.606 /sec
    54,968,914,711      cycles                           #    2.485 GHz
   232,136,347,216      instructions                     #    4.22  insn per cycle
    76,024,615,339      branches                         #    3.437 G/sec
        12,816,208      branch-misses                    #    0.02% of all branches
   329,813,157,222      slots                            #   14.910 G/sec
   237,982,827,171      topdown-retiring                 #     71.9% Retiring
     3,880,154,790      topdown-bad-spec                 #      1.2% Bad Speculation
     3,880,154,790      topdown-fe-bound                 #      1.2% Frontend Bound
    85,363,405,398      topdown-be-bound                 #     25.8% Backend Bound
     6,466,924,651      topdown-heavy-ops                #      2.0% Heavy Operations       #     69.9% Light Operations
     2,586,769,860      topdown-br-mispredict            #      0.8% Branch Mispredict      #      0.4% Machine Clears
         2,803,029      topdown-fetch-lat                #      0.0% Fetch Latency          #      1.2% Fetch Bandwidth
    27,161,083,535      topdown-mem-bound                #      8.2% Memory Bound           #     17.6% Core Bound

      22.122678982 seconds time elapsed

      22.092353000 seconds user
       0.002975000 seconds sys


GNR>perf stat taskset -c 1 ./app2 98
[res] 1380000

 Performance counter stats for 'taskset -c 1 ./app2 98':

         21,947.05 msec task-clock                       #    1.000 CPUs utilized
                13      context-switches                 #    0.592 /sec
                 1      cpu-migrations                   #    0.046 /sec
               122      page-faults                      #    5.559 /sec
    54,542,028,582      cycles                           #    2.485 GHz
   232,135,732,632      instructions                     #    4.26  insn per cycle
    76,024,465,860      branches                         #    3.464 G/sec
           709,924      branch-misses                    #    0.00% of all branches
   327,251,862,534      slots                            #   14.911 G/sec
   237,418,017,916      topdown-retiring                 #     72.3% Retiring
     1,283,340,637      topdown-bad-spec                 #      0.4% Bad Speculation
     3,850,021,912      topdown-fe-bound                 #      1.2% Frontend Bound
    85,983,822,705      topdown-be-bound                 #     26.2% Backend Bound
     6,416,703,186      topdown-heavy-ops                #      2.0% Heavy Operations       #     70.3% Light Operations
           647,097      topdown-br-mispredict            #      0.0% Branch Mispredict      #      0.4% Machine Clears
         9,498,988      topdown-fetch-lat                #      0.0% Fetch Latency          #      1.2% Fetch Bandwidth
    28,233,494,022      topdown-mem-bound                #      8.6% Memory Bound           #     17.6% Core Bound

      21.950072055 seconds time elapsed

      21.918690000 seconds user
       0.003947000 seconds sys
*/


/// TODO : Replace Spy branch with conditional move and measure its impact on branch misprediciton.
