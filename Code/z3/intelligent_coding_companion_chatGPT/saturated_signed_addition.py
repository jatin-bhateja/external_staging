from z3 import *

# 32-bit signed int limits
INT_MIN = -2**31
INT_MAX = 2**31 - 1

# Define symbolic variables
a = Int('a')
b = Int('b')
c = Int('c')

# Define the saturating addition as a Python function using Z3 If
def saturate(x):
    return If(x < INT_MIN, INT_MIN,
              If(x > INT_MAX, INT_MAX, x))

# Define LHS and RHS expressions
lhs = saturate(saturate(a + b) + c)
rhs = saturate(a + saturate(b + c))

# Setup solver
s = Solver()
s.add(lhs != rhs)  # We're trying to find a counterexample

# Check satisfiability
if s.check() == sat:
    m = s.model()
    print("❌ Not associative. Counterexample found:")
    print(f"a = {m[a]}")
    print(f"b = {m[b]}")
    print(f"c = {m[c]}")
    print(f"lhs (saturate(saturate(a + b) + c)) = {m.eval(lhs)}")
    print(f"rhs (saturate(a + saturate(b + c))) = {m.eval(rhs)}")
else:
    print("✅ Associative: The expressions are always equal (UNSAT)")

