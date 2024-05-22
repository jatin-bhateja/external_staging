Targets:
  - AVX2
  - AVX512

Input:
  - Unsigned integers (UINT_MAX : 0).

Process:
Algo1: 
  - MAX =  ComputeMAX(A,B)
  - MIN =  ComputeMIN(A,B)
  - RES = {UINT_MAX - MAX} < MIN ? INT_MAX : A + B

Algo2:
  - Unpack doubleword to quadword with zero extension.
  - Perform quadword ADD operation.
  - Pack quadword to doubleword with unsigned saturation.


Results:

AVX512:

Algo1 is roughly 1.5x performant vs Algo2.

CPROMPT>perf stat -e cycles,instructions ./algo1 
[res] 4294967295
 Performance counter stats for './algo1':
       5,06,39,337      cycles                                                      
      11,79,36,180      instructions              #    2.33  insn per cycle         
       0.033071645 seconds time elapsed
       0.033152000 seconds user
       0.000000000 seconds sys


CPROMPT>perf stat -e cycles,instructions ./algo2
[res] 4294967295
 Performance counter stats for './algo2':
       9,99,90,955      cycles                                                      
      15,39,63,964      instructions              #    1.54  insn per cycle         
       0.048535518 seconds time elapsed
       0.048410000 seconds user
       0.000000000 seconds sys

AVX2: In absence of direct unsigned comparison instruction, algo2 is 10% cycle efficient over algo1.

CPROMPT>perf stat -e cycles,instructions ./algo1 
[res] 4294967295
 Performance counter stats for './algo1':
      10,89,56,476      cycles                                                      
      16,29,46,371      instructions              #    1.50  insn per cycle         
       0.047947248 seconds time elapsed
       0.048005000 seconds user
       0.000000000 seconds sys


CPROMPT>perf stat -e cycles,instructions ./algo2
[res] 4294967295

 Performance counter stats for './algo2':
       9,99,73,297      cycles                                                      
      15,39,47,751      instructions              #    1.54  insn per cycle         
       0.048451765 seconds time elapsed
       0.048518000 seconds user
       0.000000000 seconds sys

