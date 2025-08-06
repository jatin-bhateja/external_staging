from z3 import *

# Set n-bit width
n = 32
UINT_MAX = 2**n - 1

# Define symbolic variables (unbounded integers, but constrained to be unsigned)
a = Int('a')
b = Int('b')
c = Int('c')

# Saturating addition: if sum >= UINT_MAX, clamp to UINT_MAX, else use sum
def saturate_unsigned(x):
    return If(x >= UINT_MAX, UINT_MAX, x)

# Constrain a, b, c to be unsigned (>= 0)
unsigned_constraints = [a >= 0, b >= 0, c >= 0]

# Define LHS and RHS
lhs = saturate_unsigned(saturate_unsigned(a + b) + c)
rhs = saturate_unsigned(a + saturate_unsigned(b + c))

# Check if associativity fails
s = Solver()
s.add(unsigned_constraints)
s.add(lhs != rhs)

# Solve
if s.check() == sat:
    m = s.model()
    print("❌ Not associative. Counterexample found:")
    print(f"a = {m[a]}")
    print(f"b = {m[b]}")
    print(f"c = {m[c]}")
    print(f"lhs = {m.eval(lhs)}")
    print(f"rhs = {m.eval(rhs)}")
else:
    print("✅ Associative: The expressions are always equal (UNSAT)")
