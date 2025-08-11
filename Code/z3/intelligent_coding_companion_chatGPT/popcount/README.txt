Operation:-
-----------

popcount :-
  count set bits in an integral number.

KnownBits:-
  Captures both compile time know ZEROS and ONE bits in the value range.

KnownBits to Range:-
  - MAX = ~ZEROS
  - MIN = ONES

Proof:-
  - ZEROS and ONES are inferred out of common prefix of value range delimiting bounds.
  - Thus, ~ZEROS will not only include common prefix but will also set all other bits 
    not included in common prefix, which also cover set bits in non-common prefix of
    actual value range b/w delimiting bounds.

Result Value Range:-
  - TypeInt::make(popcount(ONES), popcount(~ZEROS));

Proof:-
  - Given that ~ZEROS >= UB  >= LB >= ONES
  - Therefore, popcount(~ZEROS) will always be guarantted to be greater than popcount(ONES).
  - Also, popcount(~ZEROS) >= Res.UB >= Res.LB >= popcount(ONES)


Input:
   X.LB : Int64
   X.UB : Int64
  
   Res.LB = Int64
   Res.UB = Int64

   Res = popcount(X)

   clz = count_leading_zeros(X.LB ^ X.UB)
   common_prefix_mask = ((1 << (clz)) - 1) << (64 - clz)
   ONES = X.LB & common_prefix_mask
   ZEROS = ~(X.LB & common_prefix_mask) & (~common_prefix_mask)

rove:
   popcount(~ZEROS) >= Res.UB >= Res.LB >= popcount(ONES)

  
Input:

  X = Int64
  X.LB = BitVector(INT_MIN, 32)
  X.UB = BitVector(INT_MAX, 32)

  clz = count_leading_zeros(X.LB ^ X.UB)
  common_prefix_mask = ((1 << (clz)) - 1) << (64 - clz)
  ONES = X.LB & common_prefix_mask
  ZEROS = ~(X.LB & common_prefix_mask) & (~common_prefix_mask)
  

Result:
  R = popcount(x)

Constraints:

   X.LB signed <= X.UB 

   popcount(~ZEROS) >= res.UB >= res.LB >= popcount(ONES)  

