//
// Copyright

// Machine Generated File.  Do Not Edit!

#include "precompiled.hpp"
#include "adfiles/adGlobals_small_cpu.hpp"
#include "adfiles/ad_small_cpu.hpp"
#include "memory/allocation.inline.hpp"
#include "code/codeCache.hpp"
#include "code/compiledIC.hpp"
#include "code/nativeInst.hpp"
#include "code/vmreg.inline.hpp"
#include "gc/shared/collectedHeap.inline.hpp"
#include "oops/compressedOops.hpp"
#include "oops/markWord.hpp"
#include "oops/method.hpp"
#include "oops/oop.inline.hpp"
#include "opto/c2_MacroAssembler.hpp"
#include "opto/cfgnode.hpp"
#include "opto/intrinsicnode.hpp"
#include "opto/locknode.hpp"
#include "opto/opcodes.hpp"
#include "opto/regalloc.hpp"
#include "opto/regmask.hpp"
#include "opto/runtime.hpp"
#include "runtime/safepointMechanism.hpp"
#include "runtime/sharedRuntime.hpp"
#include "runtime/stubRoutines.hpp"
#include "utilities/growableArray.hpp"
#include "utilities/powerOfTwo.hpp"

//SourceForm




#ifndef PRODUCT
void Compile::adlc_verification() {

  // Following assertions generated from definition section
}
#endif

// Map from machine-independent register number to register_save_policy
const        char register_save_policy[] = {
  'C', // XMM0
  'C', // XMM1
  'C', // XMM2
  'C', // rax
  'C', // rbx
  'C' // no trailing comma // rcx
};

// Map from machine-independent register number to c_reg_save_policy
const        char c_reg_save_policy[] = {
  'C', // XMM0
  'C', // XMM1
  'C', // XMM2
  'C', // rax
  'C', // rbx
  'C' // no trailing comma // rcx
};

// Map from machine-independent register number to register_save_type
const        int register_save_type[] = {
  Op_RegD,
  Op_RegF,
  Op_RegF,
  Op_RegI,
  Op_RegI,
  Op_RegI // no trailing comma
};


const        int   reduceOp[] = {
  /*    0 */  0,
  /*    1 */  0,
  /*    2 */  0,
  /*    3 */  0,
  /*    4 */  0,
  /*    5 */  0,
  /*    6 */  0,
  /*    7 */  0,
  /*    8 */  legXmm0_rule,
  /*    9 */  legXmm1_rule,
  /*   10 */  rRegI_rule,
  // last operand
  // last operand class
  // last internally defined operand
  /*   11 */  legXmm0_rule,
  /*   12 */  rRegI_rule,
  // last instruction
  0 // no trailing comma
};

const        int   leftOp[] = {
  /*    0 */  0,
  /*    1 */  0,
  /*    2 */  0,
  /*    3 */  0,
  /*    4 */  0,
  /*    5 */  0,
  /*    6 */  0,
  /*    7 */  0,
  /*    8 */  0,
  /*    9 */  0,
  /*   10 */  0,
  // last operand
  // last operand class
  // last internally defined operand
  /*   11 */  legXmm0_rule,
  /*   12 */  rRegI_rule,
  // last instruction
  0 // no trailing comma
};

const        int   rightOp[] = {
  /*    0 */  0,
  /*    1 */  0,
  /*    2 */  0,
  /*    3 */  0,
  /*    4 */  0,
  /*    5 */  0,
  /*    6 */  0,
  /*    7 */  0,
  /*    8 */  0,
  /*    9 */  0,
  /*   10 */  0,
  // last operand
  // last operand class
  // last internally defined operand
  /*   11 */  legXmm1_rule,
  /*   12 */  rRegI_rule,
  // last instruction
  0 // no trailing comma
};

const char        *ruleName[] = {
  /*    0 */  "UNIVERSE",
  /*    1 */  "LABEL",
  /*    2 */  "SREGI",
  /*    3 */  "SREGP",
  /*    4 */  "SREGF",
  /*    5 */  "SREGD",
  /*    6 */  "SREGL",
  /*    7 */  "METHOD",
  /*    8 */  "LEGXMM0",
  /*    9 */  "LEGXMM1",
  /*   10 */  "RREGI",
  // last operand
  // last operand class
  // last internally defined operand
  /*   11 */  "addF_reg",
  /*   12 */  "addI_reg",
  // last instruction
  "invalid rule name" // no trailing comma
};

const        bool  swallowed[] = {
  /*    0 */  false,
  /*    1 */  false,
  /*    2 */  false,
  /*    3 */  false,
  /*    4 */  false,
  /*    5 */  false,
  /*    6 */  false,
  /*    7 */  false,
  /*    8 */  false,
  /*    9 */  false,
  /*   10 */  false,
  // last operand
  // last operand class
  // last internally defined operand
  /*   11 */  false,
  /*   12 */  false,
  // last instruction
  false // no trailing comma
};

// Mapping from machine-independent opcode to boolean
const        char must_clone[] = {
  0, // Node: 0
  0, // Set: 1
  0, // RegN: 2
  0, // RegI: 3
  0, // RegP: 4
  0, // RegF: 5
  0, // RegD: 6
  0, // RegL: 7
  0, // VecA: 8
  0, // VecS: 9
  0, // VecD: 10
  0, // VecX: 11
  0, // VecY: 12
  0, // VecZ: 13
  0, // RegVectMask: 14
  0, // RegFlags: 15
  0, // _last_machine_leaf: 16
  0, // AbsD: 17
  0, // AbsF: 18
  0, // AbsI: 19
  0, // AbsL: 20
  0, // AddD: 21
  0, // AddF: 22
  0, // AddI: 23
  0, // AddL: 24
  0, // AddP: 25
  0, // Allocate: 26
  0, // AllocateArray: 27
  0, // AndI: 28
  0, // AndL: 29
  0, // ArrayCopy: 30
  0, // AryEq: 31
  0, // AtanD: 32
  1, // Binary: 33
  0, // Blackhole: 34
  1, // Bool: 35
  0, // BoxLock: 36
  0, // ReverseBytesI: 37
  0, // ReverseBytesL: 38
  0, // ReverseBytesUS: 39
  0, // ReverseBytesS: 40
  0, // ReverseBytesV: 41
  0, // CProj: 42
  0, // CacheWB: 43
  0, // CacheWBPreSync: 44
  0, // CacheWBPostSync: 45
  0, // CallDynamicJava: 46
  0, // CallJava: 47
  0, // CallLeaf: 48
  0, // CallLeafNoFP: 49
  0, // CallLeafVector: 50
  0, // CallRuntime: 51
  0, // CallStaticJava: 52
  0, // CastDD: 53
  0, // CastFF: 54
  0, // CastII: 55
  0, // CastLL: 56
  0, // CastVV: 57
  0, // CastX2P: 58
  0, // CastP2X: 59
  0, // CastPP: 60
  0, // Catch: 61
  0, // CatchProj: 62
  0, // CheckCastPP: 63
  0, // ClearArray: 64
  0, // CompressBits: 65
  0, // ExpandBits: 66
  0, // CompressBitsV: 67
  0, // ExpandBitsV: 68
  0, // ConstraintCast: 69
  0, // CMoveD: 70
  0, // CMoveF: 71
  0, // CMoveI: 72
  0, // CMoveL: 73
  0, // CMoveP: 74
  0, // CMoveN: 75
  1, // CmpN: 76
  1, // CmpD: 77
  0, // CmpD3: 78
  1, // CmpF: 79
  0, // CmpF3: 80
  1, // CmpI: 81
  1, // CmpL: 82
  0, // CmpL3: 83
  0, // CmpLTMask: 84
  1, // CmpP: 85
  1, // CmpU: 86
  0, // CmpU3: 87
  1, // CmpUL: 88
  0, // CmpUL3: 89
  0, // CompareAndSwapB: 90
  0, // CompareAndSwapS: 91
  0, // CompareAndSwapI: 92
  0, // CompareAndSwapL: 93
  0, // CompareAndSwapP: 94
  0, // CompareAndSwapN: 95
  0, // WeakCompareAndSwapB: 96
  0, // WeakCompareAndSwapS: 97
  0, // WeakCompareAndSwapI: 98
  0, // WeakCompareAndSwapL: 99
  0, // WeakCompareAndSwapP: 100
  0, // WeakCompareAndSwapN: 101
  0, // CompareAndExchangeB: 102
  0, // CompareAndExchangeS: 103
  0, // CompareAndExchangeI: 104
  0, // CompareAndExchangeL: 105
  0, // CompareAndExchangeP: 106
  0, // CompareAndExchangeN: 107
  0, // GetAndAddB: 108
  0, // GetAndAddS: 109
  0, // GetAndAddI: 110
  0, // GetAndAddL: 111
  0, // GetAndSetB: 112
  0, // GetAndSetS: 113
  0, // GetAndSetI: 114
  0, // GetAndSetL: 115
  0, // GetAndSetP: 116
  0, // GetAndSetN: 117
  0, // Con: 118
  0, // ConN: 119
  0, // ConNKlass: 120
  0, // ConD: 121
  0, // ConF: 122
  0, // ConI: 123
  0, // ConL: 124
  0, // ConP: 125
  0, // Conv2B: 126
  0, // ConvD2F: 127
  0, // ConvD2I: 128
  0, // ConvD2L: 129
  0, // ConvF2D: 130
  0, // ConvF2I: 131
  0, // ConvF2L: 132
  0, // ConvI2D: 133
  0, // ConvI2F: 134
  0, // ConvI2L: 135
  0, // ConvL2D: 136
  0, // ConvL2F: 137
  0, // ConvL2I: 138
  0, // ConvF2HF: 139
  0, // ConvHF2F: 140
  0, // CountedLoop: 141
  0, // CountedLoopEnd: 142
  0, // OuterStripMinedLoop: 143
  0, // OuterStripMinedLoopEnd: 144
  0, // LongCountedLoop: 145
  0, // LongCountedLoopEnd: 146
  0, // CountLeadingZerosI: 147
  0, // CountLeadingZerosL: 148
  0, // CountLeadingZerosV: 149
  0, // CountTrailingZerosI: 150
  0, // CountTrailingZerosL: 151
  0, // CountTrailingZerosV: 152
  0, // CreateEx: 153
  0, // DecodeN: 154
  0, // DecodeNKlass: 155
  0, // DivD: 156
  0, // DivF: 157
  0, // DivI: 158
  0, // DivL: 159
  0, // UDivI: 160
  0, // UDivL: 161
  0, // DivMod: 162
  0, // DivModI: 163
  0, // DivModL: 164
  0, // UDivModI: 165
  0, // UDivModL: 166
  0, // EncodeISOArray: 167
  0, // EncodeP: 168
  0, // EncodePKlass: 169
  1, // FastLock: 170
  1, // FastUnlock: 171
  0, // FmaD: 172
  0, // FmaF: 173
  0, // Goto: 174
  0, // Halt: 175
  0, // CountPositives: 176
  0, // If: 177
  0, // RangeCheck: 178
  0, // IfFalse: 179
  0, // IfTrue: 180
  0, // Initialize: 181
  0, // JProj: 182
  0, // Jump: 183
  0, // JumpProj: 184
  0, // LShiftI: 185
  0, // LShiftL: 186
  0, // LoadB: 187
  0, // LoadUB: 188
  0, // LoadUS: 189
  0, // LoadD: 190
  0, // LoadD_unaligned: 191
  0, // LoadF: 192
  0, // LoadI: 193
  0, // LoadKlass: 194
  0, // LoadNKlass: 195
  0, // LoadL: 196
  0, // LoadL_unaligned: 197
  0, // LoadP: 198
  0, // LoadN: 199
  0, // LoadRange: 200
  0, // LoadS: 201
  0, // Lock: 202
  0, // Loop: 203
  0, // LoopLimit: 204
  0, // Mach: 205
  0, // MachNullCheck: 206
  0, // MachProj: 207
  0, // MulAddS2I: 208
  0, // MaxI: 209
  0, // MaxL: 210
  0, // MaxD: 211
  0, // MaxF: 212
  0, // MemBarAcquire: 213
  0, // LoadFence: 214
  0, // MemBarAcquireLock: 215
  0, // MemBarCPUOrder: 216
  0, // MemBarRelease: 217
  0, // StoreFence: 218
  0, // StoreStoreFence: 219
  0, // MemBarReleaseLock: 220
  0, // MemBarVolatile: 221
  0, // MemBarStoreStore: 222
  0, // MergeMem: 223
  0, // MinI: 224
  0, // MinL: 225
  0, // MinF: 226
  0, // MinD: 227
  0, // ModD: 228
  0, // ModF: 229
  0, // ModI: 230
  0, // ModL: 231
  0, // UModI: 232
  0, // UModL: 233
  0, // MoveI2F: 234
  0, // MoveF2I: 235
  0, // MoveL2D: 236
  0, // MoveD2L: 237
  0, // IsInfiniteF: 238
  0, // IsFiniteF: 239
  0, // IsInfiniteD: 240
  0, // IsFiniteD: 241
  0, // MulD: 242
  0, // MulF: 243
  0, // MulHiL: 244
  0, // UMulHiL: 245
  0, // MulI: 246
  0, // MulL: 247
  0, // Multi: 248
  0, // NegI: 249
  0, // NegL: 250
  0, // NegD: 251
  0, // NegF: 252
  0, // NeverBranch: 253
  0, // OnSpinWait: 254
  0, // Opaque1: 255
  0, // OpaqueLoopInit: 256
  0, // OpaqueLoopStride: 257
  0, // OpaqueZeroTripGuard: 258
  0, // Opaque4: 259
  0, // OpaqueInitializedAssertionPredicate: 260
  0, // ProfileBoolean: 261
  0, // OrI: 262
  0, // OrL: 263
  1, // OverflowAddI: 264
  1, // OverflowSubI: 265
  1, // OverflowMulI: 266
  1, // OverflowAddL: 267
  1, // OverflowSubL: 268
  1, // OverflowMulL: 269
  0, // PCTable: 270
  0, // Parm: 271
  0, // ParsePredicate: 272
  0, // PartialSubtypeCheck: 273
  0, // SubTypeCheck: 274
  0, // Phi: 275
  0, // PopCountI: 276
  0, // PopCountL: 277
  0, // PopCountVI: 278
  0, // PopCountVL: 279
  0, // PopulateIndex: 280
  0, // PrefetchAllocation: 281
  0, // Proj: 282
  0, // RShiftI: 283
  0, // RShiftL: 284
  0, // Region: 285
  0, // Rethrow: 286
  0, // Return: 287
  0, // ReverseI: 288
  0, // ReverseL: 289
  0, // ReverseV: 290
  0, // Root: 291
  0, // RoundDouble: 292
  0, // RoundDoubleMode: 293
  0, // RoundDoubleModeV: 294
  0, // RoundFloat: 295
  0, // RotateLeft: 296
  0, // RotateLeftV: 297
  0, // RotateRight: 298
  0, // RotateRightV: 299
  0, // SafePoint: 300
  0, // SafePointScalarObject: 301
  0, // SafePointScalarMerge: 302
  0, // ShenandoahCompareAndExchangeP: 303
  0, // ShenandoahCompareAndExchangeN: 304
  0, // ShenandoahCompareAndSwapN: 305
  0, // ShenandoahCompareAndSwapP: 306
  0, // ShenandoahWeakCompareAndSwapN: 307
  0, // ShenandoahWeakCompareAndSwapP: 308
  0, // ShenandoahLoadReferenceBarrier: 309
  0, // SCMemProj: 310
  0, // CopySignD: 311
  0, // CopySignF: 312
  0, // SignumD: 313
  0, // SignumF: 314
  0, // SignumVF: 315
  0, // SignumVD: 316
  0, // SqrtD: 317
  0, // SqrtF: 318
  0, // RoundF: 319
  0, // RoundD: 320
  0, // Start: 321
  0, // StartOSR: 322
  0, // StoreB: 323
  0, // StoreC: 324
  0, // StoreCM: 325
  0, // StoreD: 326
  0, // StoreF: 327
  0, // StoreI: 328
  0, // StoreL: 329
  0, // StoreP: 330
  0, // StoreN: 331
  0, // StoreNKlass: 332
  0, // StrComp: 333
  0, // StrCompressedCopy: 334
  0, // StrEquals: 335
  0, // StrIndexOf: 336
  0, // StrIndexOfChar: 337
  0, // StrInflatedCopy: 338
  0, // SubD: 339
  0, // SubF: 340
  0, // SubI: 341
  0, // SubL: 342
  0, // TailCall: 343
  0, // TailJump: 344
  0, // MacroLogicV: 345
  0, // ThreadLocal: 346
  0, // Unlock: 347
  0, // URShiftB: 348
  0, // URShiftS: 349
  0, // URShiftI: 350
  0, // URShiftL: 351
  0, // XorI: 352
  0, // XorL: 353
  0, // Vector: 354
  0, // AddVB: 355
  0, // AddVS: 356
  0, // AddVI: 357
  0, // AddReductionVI: 358
  0, // AddVL: 359
  0, // AddReductionVL: 360
  0, // AddVF: 361
  0, // AddReductionVF: 362
  0, // AddVD: 363
  0, // AddReductionVD: 364
  0, // SubVB: 365
  0, // SubVS: 366
  0, // SubVI: 367
  0, // SubVL: 368
  0, // SubVF: 369
  0, // SubVD: 370
  0, // MulVB: 371
  0, // MulVS: 372
  0, // MulVI: 373
  0, // MulReductionVI: 374
  0, // MulVL: 375
  0, // MulReductionVL: 376
  0, // MulVF: 377
  0, // MulReductionVF: 378
  0, // MulVD: 379
  0, // MulReductionVD: 380
  0, // MulAddVS2VI: 381
  0, // FmaVD: 382
  0, // FmaVF: 383
  0, // DivVF: 384
  0, // DivVD: 385
  0, // AbsVB: 386
  0, // AbsVS: 387
  0, // AbsVI: 388
  0, // AbsVL: 389
  0, // AbsVF: 390
  0, // AbsVD: 391
  0, // NegVI: 392
  0, // NegVL: 393
  0, // NegVF: 394
  0, // NegVD: 395
  0, // SqrtVD: 396
  0, // SqrtVF: 397
  0, // LShiftCntV: 398
  0, // RShiftCntV: 399
  0, // LShiftVB: 400
  0, // LShiftVS: 401
  0, // LShiftVI: 402
  0, // LShiftVL: 403
  0, // RShiftVB: 404
  0, // RShiftVS: 405
  0, // RShiftVI: 406
  0, // RShiftVL: 407
  0, // URShiftVB: 408
  0, // URShiftVS: 409
  0, // URShiftVI: 410
  0, // URShiftVL: 411
  0, // AndV: 412
  0, // AndReductionV: 413
  0, // OrV: 414
  0, // OrReductionV: 415
  0, // XorV: 416
  0, // XorReductionV: 417
  0, // MinV: 418
  0, // MaxV: 419
  0, // MinReductionV: 420
  0, // MaxReductionV: 421
  0, // CompressV: 422
  0, // CompressM: 423
  0, // ExpandV: 424
  0, // LoadVector: 425
  0, // LoadVectorGather: 426
  0, // LoadVectorGatherMasked: 427
  0, // StoreVector: 428
  0, // StoreVectorScatter: 429
  0, // StoreVectorScatterMasked: 430
  0, // LoadVectorMasked: 431
  0, // StoreVectorMasked: 432
  0, // VerifyVectorAlignment: 433
  0, // VectorCmpMasked: 434
  0, // VectorMaskGen: 435
  0, // VectorMaskOp: 436
  0, // VectorMaskTrueCount: 437
  0, // VectorMaskFirstTrue: 438
  0, // VectorMaskLastTrue: 439
  0, // VectorMaskToLong: 440
  0, // VectorLongToMask: 441
  0, // Pack: 442
  0, // PackB: 443
  0, // PackS: 444
  0, // PackI: 445
  0, // PackL: 446
  0, // PackF: 447
  0, // PackD: 448
  0, // Pack2L: 449
  0, // Pack2D: 450
  0, // Replicate: 451
  0, // RoundVF: 452
  0, // RoundVD: 453
  0, // Extract: 454
  0, // ExtractB: 455
  0, // ExtractUB: 456
  0, // ExtractC: 457
  0, // ExtractS: 458
  0, // ExtractI: 459
  0, // ExtractL: 460
  0, // ExtractF: 461
  0, // ExtractD: 462
  0, // Digit: 463
  0, // LowerCase: 464
  0, // UpperCase: 465
  0, // Whitespace: 466
  0, // VectorBox: 467
  0, // VectorBoxAllocate: 468
  0, // VectorUnbox: 469
  0, // VectorMaskWrapper: 470
  0, // VectorMaskCmp: 471
  0, // VectorMaskCast: 472
  1, // VectorTest: 473
  0, // VectorBlend: 474
  0, // VectorRearrange: 475
  0, // VectorLoadMask: 476
  0, // VectorLoadShuffle: 477
  0, // VectorLoadConst: 478
  0, // VectorStoreMask: 479
  0, // VectorReinterpret: 480
  0, // VectorCast: 481
  0, // VectorCastB2X: 482
  0, // VectorCastS2X: 483
  0, // VectorCastI2X: 484
  0, // VectorCastL2X: 485
  0, // VectorCastF2X: 486
  0, // VectorCastD2X: 487
  0, // VectorCastF2HF: 488
  0, // VectorCastHF2F: 489
  0, // VectorUCastB2X: 490
  0, // VectorUCastS2X: 491
  0, // VectorUCastI2X: 492
  0, // VectorizedHashCode: 493
  0, // VectorInsert: 494
  0, // MaskAll: 495
  0, // AndVMask: 496
  0, // OrVMask: 497
  0 // no trailing comma // XorVMask: 498
};
//  The following instructions can cisc-spill



// An array of character pointers to machine register names.
const char *Matcher::regName[REG_COUNT] = {
  "XMM0",
  "XMM1",
  "XMM2",
  "rax",
  "rbx",
  "rcx" // no trailing comma
};

// An array of character pointers to machine register names.
const VMReg OptoReg::opto2vm[REG_COUNT] = {
	,
	,
	,
	,
	,
	 // no trailing comma
	};

 OptoReg::Name OptoReg::vm2opto[ConcreteRegisterImpl::number_of_registers];

// An array of the machine register encode values
const unsigned char Matcher::_regEncode[REG_COUNT] = {
  (unsigned char)'\x1',  // XMM0
  (unsigned char)'\x1',  // XMM1
  (unsigned char)'\x1',  // XMM2
  (unsigned char)'\x1',  // rax
  (unsigned char)'\x1',  // rbx
  (unsigned char)'\x1' // no trailing comma  // rcx
};


//------------------Define classes derived from MachOper---------------------
MachOper  *labelOper::clone() const {
  return  new labelOper(_label, _block_num);
}
uint labelOper::opcode() const { return LABEL; }

const RegMask *sRegIOper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &(Compile::current()->FIRST_STACK_mask());
}

const RegMask *sRegPOper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &(Compile::current()->FIRST_STACK_mask());
}

const RegMask *sRegFOper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &(Compile::current()->FIRST_STACK_mask());
}

const RegMask *sRegDOper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &(Compile::current()->FIRST_STACK_mask());
}

const RegMask *sRegLOper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &(Compile::current()->FIRST_STACK_mask());
}

MachOper  *methodOper::clone() const {
  return  new methodOper(_method);
}
uint methodOper::opcode() const { return METHOD; }

const RegMask *legXmm0Oper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &RC1_mask();
}

const RegMask *legXmm1Oper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &RC1_mask();
}

const RegMask *rRegIOper::in_RegMask(int index) const {
  assert(0 <= index && index < 1, "index out of range");
  return &RC2_mask();
}

//------------------Define members for classes derived from MachNode----------

void addF_regNode::emit(C2_MacroAssembler* masm, PhaseRegAlloc* ra_) const {
  // Start at oper_input_base() and count operands
  unsigned idx0 = 1;
  unsigned idx1 = 1; 	// dst
  unsigned idx2 = idx1 + opnd_array(1)->num_edges(); 	// src
  {

     0xF
    }
}

void addI_regNode::emit(C2_MacroAssembler* masm, PhaseRegAlloc* ra_) const {
  // Start at oper_input_base() and count operands
  unsigned idx0 = 1;
  unsigned idx1 = 1; 	// dst
  unsigned idx2 = idx1 + opnd_array(1)->num_edges(); 	// src2
  {

     0xF
    }
}



bool Matcher::has_match_rule(int opcode) {
  assert(_last_machine_leaf < opcode && opcode < _last_opcode, "opcode in range");
  return _hasMatchRule[opcode];
}

const bool Matcher::_hasMatchRule[_last_opcode] = {
    false,  // Node
    false,  // Set
    false,  // RegN
    false,  // RegI
    false,  // RegP
    false,  // RegF
    false,  // RegD
    false,  // RegL
    false,  // VecA
    false,  // VecS
    false,  // VecD
    false,  // VecX
    false,  // VecY
    false,  // VecZ
    false,  // RegVectMask
    false,  // RegFlags
    false,  // _last_machine_leaf
    false,  // AbsD
    false,  // AbsF
    false,  // AbsI
    false,  // AbsL
    false,  // AddD
    true ,  // AddF
    true ,  // AddI
    false,  // AddL
    false,  // AddP
    false,  // Allocate
    false,  // AllocateArray
    false,  // AndI
    false,  // AndL
    false,  // ArrayCopy
    false,  // AryEq
    false,  // AtanD
    false,  // Binary
    false,  // Blackhole
    false,  // Bool
    false,  // BoxLock
    false,  // ReverseBytesI
    false,  // ReverseBytesL
    false,  // ReverseBytesUS
    false,  // ReverseBytesS
    false,  // ReverseBytesV
    false,  // CProj
    false,  // CacheWB
    false,  // CacheWBPreSync
    false,  // CacheWBPostSync
    false,  // CallDynamicJava
    false,  // CallJava
    false,  // CallLeaf
    false,  // CallLeafNoFP
    false,  // CallLeafVector
    false,  // CallRuntime
    false,  // CallStaticJava
    false,  // CastDD
    false,  // CastFF
    false,  // CastII
    false,  // CastLL
    false,  // CastVV
    false,  // CastX2P
    false,  // CastP2X
    false,  // CastPP
    false,  // Catch
    false,  // CatchProj
    false,  // CheckCastPP
    false,  // ClearArray
    false,  // CompressBits
    false,  // ExpandBits
    false,  // CompressBitsV
    false,  // ExpandBitsV
    false,  // ConstraintCast
    false,  // CMoveD
    false,  // CMoveF
    false,  // CMoveI
    false,  // CMoveL
    false,  // CMoveP
    false,  // CMoveN
    false,  // CmpN
    false,  // CmpD
    false,  // CmpD3
    false,  // CmpF
    false,  // CmpF3
    false,  // CmpI
    false,  // CmpL
    false,  // CmpL3
    false,  // CmpLTMask
    false,  // CmpP
    false,  // CmpU
    false,  // CmpU3
    false,  // CmpUL
    false,  // CmpUL3
    false,  // CompareAndSwapB
    false,  // CompareAndSwapS
    false,  // CompareAndSwapI
    false,  // CompareAndSwapL
    false,  // CompareAndSwapP
    false,  // CompareAndSwapN
    false,  // WeakCompareAndSwapB
    false,  // WeakCompareAndSwapS
    false,  // WeakCompareAndSwapI
    false,  // WeakCompareAndSwapL
    false,  // WeakCompareAndSwapP
    false,  // WeakCompareAndSwapN
    false,  // CompareAndExchangeB
    false,  // CompareAndExchangeS
    false,  // CompareAndExchangeI
    false,  // CompareAndExchangeL
    false,  // CompareAndExchangeP
    false,  // CompareAndExchangeN
    false,  // GetAndAddB
    false,  // GetAndAddS
    false,  // GetAndAddI
    false,  // GetAndAddL
    false,  // GetAndSetB
    false,  // GetAndSetS
    false,  // GetAndSetI
    false,  // GetAndSetL
    false,  // GetAndSetP
    false,  // GetAndSetN
    false,  // Con
    false,  // ConN
    false,  // ConNKlass
    false,  // ConD
    false,  // ConF
    false,  // ConI
    false,  // ConL
    false,  // ConP
    false,  // Conv2B
    false,  // ConvD2F
    false,  // ConvD2I
    false,  // ConvD2L
    false,  // ConvF2D
    false,  // ConvF2I
    false,  // ConvF2L
    false,  // ConvI2D
    false,  // ConvI2F
    false,  // ConvI2L
    false,  // ConvL2D
    false,  // ConvL2F
    false,  // ConvL2I
    false,  // ConvF2HF
    false,  // ConvHF2F
    false,  // CountedLoop
    false,  // CountedLoopEnd
    false,  // OuterStripMinedLoop
    false,  // OuterStripMinedLoopEnd
    false,  // LongCountedLoop
    false,  // LongCountedLoopEnd
    false,  // CountLeadingZerosI
    false,  // CountLeadingZerosL
    false,  // CountLeadingZerosV
    false,  // CountTrailingZerosI
    false,  // CountTrailingZerosL
    false,  // CountTrailingZerosV
    false,  // CreateEx
    false,  // DecodeN
    false,  // DecodeNKlass
    false,  // DivD
    false,  // DivF
    false,  // DivI
    false,  // DivL
    false,  // UDivI
    false,  // UDivL
    false,  // DivMod
    false,  // DivModI
    false,  // DivModL
    false,  // UDivModI
    false,  // UDivModL
    false,  // EncodeISOArray
    false,  // EncodeP
    false,  // EncodePKlass
    false,  // FastLock
    false,  // FastUnlock
    false,  // FmaD
    false,  // FmaF
    false,  // Goto
    false,  // Halt
    false,  // CountPositives
    false,  // If
    false,  // RangeCheck
    false,  // IfFalse
    false,  // IfTrue
    false,  // Initialize
    false,  // JProj
    false,  // Jump
    false,  // JumpProj
    false,  // LShiftI
    false,  // LShiftL
    false,  // LoadB
    false,  // LoadUB
    false,  // LoadUS
    false,  // LoadD
    false,  // LoadD_unaligned
    false,  // LoadF
    false,  // LoadI
    false,  // LoadKlass
    false,  // LoadNKlass
    false,  // LoadL
    false,  // LoadL_unaligned
    false,  // LoadP
    false,  // LoadN
    false,  // LoadRange
    false,  // LoadS
    false,  // Lock
    false,  // Loop
    false,  // LoopLimit
    false,  // Mach
    false,  // MachNullCheck
    false,  // MachProj
    false,  // MulAddS2I
    false,  // MaxI
    false,  // MaxL
    false,  // MaxD
    false,  // MaxF
    false,  // MemBarAcquire
    false,  // LoadFence
    false,  // MemBarAcquireLock
    false,  // MemBarCPUOrder
    false,  // MemBarRelease
    false,  // StoreFence
    false,  // StoreStoreFence
    false,  // MemBarReleaseLock
    false,  // MemBarVolatile
    false,  // MemBarStoreStore
    false,  // MergeMem
    false,  // MinI
    false,  // MinL
    false,  // MinF
    false,  // MinD
    false,  // ModD
    false,  // ModF
    false,  // ModI
    false,  // ModL
    false,  // UModI
    false,  // UModL
    false,  // MoveI2F
    false,  // MoveF2I
    false,  // MoveL2D
    false,  // MoveD2L
    false,  // IsInfiniteF
    false,  // IsFiniteF
    false,  // IsInfiniteD
    false,  // IsFiniteD
    false,  // MulD
    false,  // MulF
    false,  // MulHiL
    false,  // UMulHiL
    false,  // MulI
    false,  // MulL
    false,  // Multi
    false,  // NegI
    false,  // NegL
    false,  // NegD
    false,  // NegF
    false,  // NeverBranch
    false,  // OnSpinWait
    false,  // Opaque1
    false,  // OpaqueLoopInit
    false,  // OpaqueLoopStride
    false,  // OpaqueZeroTripGuard
    false,  // Opaque4
    false,  // OpaqueInitializedAssertionPredicate
    false,  // ProfileBoolean
    false,  // OrI
    false,  // OrL
    false,  // OverflowAddI
    false,  // OverflowSubI
    false,  // OverflowMulI
    false,  // OverflowAddL
    false,  // OverflowSubL
    false,  // OverflowMulL
    false,  // PCTable
    false,  // Parm
    false,  // ParsePredicate
    false,  // PartialSubtypeCheck
    false,  // SubTypeCheck
    false,  // Phi
    false,  // PopCountI
    false,  // PopCountL
    false,  // PopCountVI
    false,  // PopCountVL
    false,  // PopulateIndex
    false,  // PrefetchAllocation
    false,  // Proj
    false,  // RShiftI
    false,  // RShiftL
    false,  // Region
    false,  // Rethrow
    false,  // Return
    false,  // ReverseI
    false,  // ReverseL
    false,  // ReverseV
    false,  // Root
    false,  // RoundDouble
    false,  // RoundDoubleMode
    false,  // RoundDoubleModeV
    false,  // RoundFloat
    false,  // RotateLeft
    false,  // RotateLeftV
    false,  // RotateRight
    false,  // RotateRightV
    false,  // SafePoint
    false,  // SafePointScalarObject
    false,  // SafePointScalarMerge
    false,  // ShenandoahCompareAndExchangeP
    false,  // ShenandoahCompareAndExchangeN
    false,  // ShenandoahCompareAndSwapN
    false,  // ShenandoahCompareAndSwapP
    false,  // ShenandoahWeakCompareAndSwapN
    false,  // ShenandoahWeakCompareAndSwapP
    false,  // ShenandoahLoadReferenceBarrier
    false,  // SCMemProj
    false,  // CopySignD
    false,  // CopySignF
    false,  // SignumD
    false,  // SignumF
    false,  // SignumVF
    false,  // SignumVD
    false,  // SqrtD
    false,  // SqrtF
    false,  // RoundF
    false,  // RoundD
    false,  // Start
    false,  // StartOSR
    false,  // StoreB
    false,  // StoreC
    false,  // StoreCM
    false,  // StoreD
    false,  // StoreF
    false,  // StoreI
    false,  // StoreL
    false,  // StoreP
    false,  // StoreN
    false,  // StoreNKlass
    false,  // StrComp
    false,  // StrCompressedCopy
    false,  // StrEquals
    false,  // StrIndexOf
    false,  // StrIndexOfChar
    false,  // StrInflatedCopy
    false,  // SubD
    false,  // SubF
    false,  // SubI
    false,  // SubL
    false,  // TailCall
    false,  // TailJump
    false,  // MacroLogicV
    false,  // ThreadLocal
    false,  // Unlock
    false,  // URShiftB
    false,  // URShiftS
    false,  // URShiftI
    false,  // URShiftL
    false,  // XorI
    false,  // XorL
    false,  // Vector
    false,  // AddVB
    false,  // AddVS
    false,  // AddVI
    false,  // AddReductionVI
    false,  // AddVL
    false,  // AddReductionVL
    false,  // AddVF
    false,  // AddReductionVF
    false,  // AddVD
    false,  // AddReductionVD
    false,  // SubVB
    false,  // SubVS
    false,  // SubVI
    false,  // SubVL
    false,  // SubVF
    false,  // SubVD
    false,  // MulVB
    false,  // MulVS
    false,  // MulVI
    false,  // MulReductionVI
    false,  // MulVL
    false,  // MulReductionVL
    false,  // MulVF
    false,  // MulReductionVF
    false,  // MulVD
    false,  // MulReductionVD
    false,  // MulAddVS2VI
    false,  // FmaVD
    false,  // FmaVF
    false,  // DivVF
    false,  // DivVD
    false,  // AbsVB
    false,  // AbsVS
    false,  // AbsVI
    false,  // AbsVL
    false,  // AbsVF
    false,  // AbsVD
    false,  // NegVI
    false,  // NegVL
    false,  // NegVF
    false,  // NegVD
    false,  // SqrtVD
    false,  // SqrtVF
    false,  // LShiftCntV
    false,  // RShiftCntV
    false,  // LShiftVB
    false,  // LShiftVS
    false,  // LShiftVI
    false,  // LShiftVL
    false,  // RShiftVB
    false,  // RShiftVS
    false,  // RShiftVI
    false,  // RShiftVL
    false,  // URShiftVB
    false,  // URShiftVS
    false,  // URShiftVI
    false,  // URShiftVL
    false,  // AndV
    false,  // AndReductionV
    false,  // OrV
    false,  // OrReductionV
    false,  // XorV
    false,  // XorReductionV
    false,  // MinV
    false,  // MaxV
    false,  // MinReductionV
    false,  // MaxReductionV
    false,  // CompressV
    false,  // CompressM
    false,  // ExpandV
    false,  // LoadVector
    false,  // LoadVectorGather
    false,  // LoadVectorGatherMasked
    false,  // StoreVector
    false,  // StoreVectorScatter
    false,  // StoreVectorScatterMasked
    false,  // LoadVectorMasked
    false,  // StoreVectorMasked
    false,  // VerifyVectorAlignment
    false,  // VectorCmpMasked
    false,  // VectorMaskGen
    false,  // VectorMaskOp
    false,  // VectorMaskTrueCount
    false,  // VectorMaskFirstTrue
    false,  // VectorMaskLastTrue
    false,  // VectorMaskToLong
    false,  // VectorLongToMask
    false,  // Pack
    false,  // PackB
    false,  // PackS
    false,  // PackI
    false,  // PackL
    false,  // PackF
    false,  // PackD
    false,  // Pack2L
    false,  // Pack2D
    false,  // Replicate
    false,  // RoundVF
    false,  // RoundVD
    false,  // Extract
    false,  // ExtractB
    false,  // ExtractUB
    false,  // ExtractC
    false,  // ExtractS
    false,  // ExtractI
    false,  // ExtractL
    false,  // ExtractF
    false,  // ExtractD
    false,  // Digit
    false,  // LowerCase
    false,  // UpperCase
    false,  // Whitespace
    false,  // VectorBox
    false,  // VectorBoxAllocate
    false,  // VectorUnbox
    false,  // VectorMaskWrapper
    false,  // VectorMaskCmp
    false,  // VectorMaskCast
    false,  // VectorTest
    false,  // VectorBlend
    false,  // VectorRearrange
    false,  // VectorLoadMask
    false,  // VectorLoadShuffle
    false,  // VectorLoadConst
    false,  // VectorStoreMask
    false,  // VectorReinterpret
    false,  // VectorCast
    false,  // VectorCastB2X
    false,  // VectorCastS2X
    false,  // VectorCastI2X
    false,  // VectorCastL2X
    false,  // VectorCastF2X
    false,  // VectorCastD2X
    false,  // VectorCastF2HF
    false,  // VectorCastHF2F
    false,  // VectorUCastB2X
    false,  // VectorUCastS2X
    false,  // VectorUCastI2X
    false,  // VectorizedHashCode
    false,  // VectorInsert
    false,  // MaskAll
    false,  // AndVMask
    false,  // OrVMask
    false   // XorVMask
};


int Compile::sync_stack_slots() const { return (null); }

uint Matcher::stack_alignment_in_bytes() { return 4; }

OptoReg::Name Matcher::return_addr() const { return OptoReg::stack2reg(); }

uint Compile::varargs_C_out_slots_killed() const { return 0; }

OptoRegPair Matcher::return_value(uint ideal_reg) {

  
}

OptoRegPair Matcher::c_return_value(uint ideal_reg) {

  
}

OptoReg::Name Matcher::inline_cache_reg() { return OptoReg::Name((null)_num); }

int Matcher::inline_cache_reg_encode() { return _regEncode[inline_cache_reg()]; }

OptoReg::Name Matcher::interpreter_frame_pointer_reg() { return OptoReg::Name(XMM0_num); }

OptoReg::Name Matcher::c_frame_pointer() const { return OptoReg::Name(XMM0_num); }

// Number of callee-save + always-save registers
int  Matcher::number_of_saved_registers() {
  return 0;
};

bool Compile::needs_deep_clone_jvms() { return false; }

