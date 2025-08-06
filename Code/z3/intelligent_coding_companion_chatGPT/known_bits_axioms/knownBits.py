from z3 import *

# Create symbolic unsigned 64-bit integers
UB = BitVec('UB', 64)
LB = BitVec('LB', 64)

# Define XOR of UB and LB
xor_val = UB ^ LB

# Define COUNT_LEADING_ZEROS
def count_leading_zeros(x):
    """Returns number of leading zeros in 64-bit word."""
    clauses = []
    for i in range(64):
        # Is the i-th bit (from MSB) the first '1'?
        pattern = LShR(x, 63 - i) & 1 == 1
        all_zero_before = And([LShR(x, 63 - j) & 1 == 0 for j in range(i)])
        clauses.append(If(And(all_zero_before, pattern), BitVecVal(i, 64), BitVecVal(64, 64)))
    return Reduce(lambda a, b: If(a == 64, b, a), clauses)

CPL = count_leading_zeros(xor_val)  # Common Prefix Length

# COMMON_PREFIX_MASK = ((1ULL << CPL) - 1) << (64 - CPL)
mask = (BitVecVal(1, 64) << CPL) - 1
COMMON_PREFIX_MASK = mask << (64 - CPL)

COMMON_PREFIX = UB & COMMON_PREFIX_MASK
ZEROS = COMMON_PREFIX_MASK & (~COMMON_PREFIX)
ONES = COMMON_PREFIX

# Define the proposition to prove:
# ~ZEROS >= UB   AND   ONES <= LB
prop1 = UGE(~ZEROS, UB)  # ~ZEROS >= UB  (unsigned)
prop2 = ULE(ONES, LB)    # ONES <= LB    (unsigned)
proposition = And(prop1, prop2)

# Try to find a counterexample (negation of proposition)
s = Solver()
s.add(Not(proposition))

# Check
if s.check() == sat:
    m = s.model()
    print("❌ Property does NOT hold. Counterexample found:")
    print(f"UB  = {m[UB].as_long():#018x}")
    print(f"LB  = {m[LB].as_long():#018x}")
    print(f"~ZEROS = {~m.eval(ZEROS).as_long() & 0xFFFFFFFFFFFFFFFF:#018x}")
    print(f"ONES   = {m.eval(ONES).as_long():#018x}")
    print(f"UB     = {m.eval(UB).as_long():#018x}")
    print(f"LB     = {m.eval(LB).as_long():#018x}")
else:
    print("✅ Property holds for all UB, LB (UNSAT)")

