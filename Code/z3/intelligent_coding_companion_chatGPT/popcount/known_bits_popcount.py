from z3 import *

def z3_popcount(x, bits=64):
    # Sum bits of x, returns Z3 Int expression
    return Sum([If(Extract(i, i, x) == 1, 1, 0) for i in range(bits)])

def clz_bv(x, bits=64):
    # Count leading zeros as a BitVecVal (6 bits enough for 0..64)
    res = BitVecVal(bits, 6)
    for i in range(bits):
        bit = Extract(bits - 1 - i, bits - 1 - i, x)
        res = If(bit == 1, BitVecVal(i, 6), res)
    return res

def make_mask(clz, bits=64):
    # Simplified mask: top 'clz' bits set to 1, rest 0
    all_ones = BitVecVal((1 << bits) - 1, bits)  # 0xFFFFFFFFFFFFFFFF for 64 bits
    shift_amount = BitVecVal(bits, clz.size()) - clz
    shift_amount_ext = ZeroExt(bits - clz.size(), shift_amount)
    return LShR(all_ones, shift_amount_ext)

def main():
    INT_MIN = -2**31
    INT_MAX = 2**31 - 1
    BIT_WIDTH = 64

    s = Solver()

    X_LB = BitVec('X_LB', BIT_WIDTH)
    X_UB = BitVec('X_UB', BIT_WIDTH)

    # Domain constraints on X_LB and X_UB (32-bit signed range)
    s.add(X_LB >= INT_MIN, X_LB <= INT_MAX)
    s.add(X_UB >= INT_MIN, X_UB <= INT_MAX)

    # Signed ordering constraint
    s.add(X_LB <= X_UB)

    xor_val = X_LB ^ X_UB
    clz = clz_bv(xor_val)

    common_prefix_mask = make_mask(clz)

    ONES = X_LB & common_prefix_mask
    ZEROS = (~(X_LB & common_prefix_mask)) & (~common_prefix_mask)

    res_LB = Int('res_LB')
    res_UB = Int('res_UB')

    # Constrain result bounds to valid popcount range
    s.add(res_LB >= 0, res_LB <= BIT_WIDTH)
    s.add(res_UB >= 0, res_UB <= BIT_WIDTH)

    popcount_ones = z3_popcount(ONES)
    popcount_not_zeros = z3_popcount(~ZEROS)

    # Main constraints
    s.add(res_LB >= popcount_ones)
    s.add(res_UB <= popcount_not_zeros)
    s.add(res_UB >= res_LB)

    # Check satisfiability of main constraints
    if s.check() == sat:
        print("Main constraints satisfiable.")
    else:
        print("Main constraints unsatisfiable.")

    # Now check validity of constraints by checking negation is unsat
    s.push()
    s.add(Or(
        res_LB < popcount_ones,
        res_UB > popcount_not_zeros,
        res_UB < res_LB
    ))
    if s.check() == unsat:
        print("Constraints are valid (negation unsatisfiable).")
    else:
        print("Constraints are NOT valid (negation satisfiable). Possible counterexample exists.")
    s.pop()

if __name__ == "__main__":
    main()
