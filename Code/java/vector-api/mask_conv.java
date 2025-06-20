jshell> var mask = VectorMask.fromLong(LongVector.SPECIES_256, 9)
mask ==> Mask[T..T]

jshell> var vec = LongVector.SPECIES_256.broadcast(-1)
vec ==> [-1, -1, -1, -1]

jshell> LongVector.SPECIES_256.zero().blend(one, mask)
$27 ==> [-1, 0, 0, -1]

jshell> LongVector.SPECIES_256.zero().blend(one, mask).reinterpretAsBytes().compare(VectorOperators.EQ, -1)
$29 ==> Mask[TTTTTTTT................TTTTTTTT]

jshell> LongVector.SPECIES_256.zero().blend(one, mask).reinterpretAsBytes().compare(VectorOperators.EQ, -1).and(VectorMask.fromLong(ByteVector.SPECIES_256, 8608480567731124087L))
$34 ==> Mask[TTT.TTT.................TTT.TTT.]

jshell> var vec = LongVector.SPECIES_256.broadcast(-1)
vec ==> [-1, -1, -1, -1]

jshell> var mask = VectorMask.fromLong(LongVector.SPECIES_256, 15)
mask ==> Mask[TTTT]

jshell> LongVector.SPECIES_256.zero().blend(one, mask).reinterpretAsBytes().compare(VectorOperators.EQ, -1).and(VectorMask.fromLong(ByteVector.SPECIES_256, 8608480567731124087L))
$37 ==> Mask[TTT.TTT.TTT.TTT.TTT.TTT.TTT.TTT.]

