
Algorithm:
  - AVX2
  - AVX512 

Input:
   Signed doubleword numbers.

Process:
   1) Unpack doubleword to quadword with sign extension.
   2) Perform signed quadword ADD / SUB
   3) Pack with signed saturation from quadword to doubleword.

Output:
   Saturated doubleword results.
