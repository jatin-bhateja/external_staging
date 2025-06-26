/*
 * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

#include "gc/z/zBarrierSetAssembler.hpp"

#include "asm/assembler.hpp"
#include "asm/macroAssembler.hpp"
#include "code/codeCache.hpp"

#include "unittest.hpp"

#define INIT  0xCAFECAFECAFECAFEL

typedef int (*jit_code)();


static void test_save_restore_egprs() {
  int result = -1;
  BufferBlob* b = BufferBlob::create("zGCSpillArea", 1000);
  CodeBuffer code(b);

  Label error, done;
  MacroAssembler _masm(&code);
  MacroAssembler* masm = &_masm;
  
  address entry = __ pc();
  __ mov64(rax, INIT);

  // Initialize EGPRs.
  __ movq(r16, rax);
  __ movq(r17, rax);
  __ movq(r18, rax);
  __ movq(r19, rax);
  __ movq(r20, rax);
  __ movq(r21, rax);
  __ movq(r22, rax);
  __ movq(r23, rax);
  __ movq(r24, rax);
  __ movq(r25, rax);
  __ movq(r26, rax);
  __ movq(r27, rax);
  __ movq(r28, rax);
  __ movq(r29, rax);
  __ movq(r30, rax);
  __ movq(r31, rax);

  {
    // Save and reset EGPRs
    ZRuntimeCallSpill reg_saver(masm, noreg,  ZXMMSpillMode::avx128);
    __ xorq(rax, rax);
    __ xorq(r16, r16);
    __ xorq(r17, r17);
    __ xorq(r18, r18);
    __ xorq(r19, r19);
    __ xorq(r20, r20);
    __ xorq(r21, r21);
    __ xorq(r22, r22);
    __ xorq(r23, r23);
    __ xorq(r24, r24);
    __ xorq(r25, r25);
    __ xorq(r26, r26);
    __ xorq(r27, r27);
    __ xorq(r28, r28);
    __ xorq(r29, r29);
    __ xorq(r30, r30);
    __ xorq(r31, r31);
  }

  // Check restored values.
  __ cmpq(r16, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r17, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r18, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r19, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r20, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r21, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r22, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r23, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r24, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r25, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r26, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r27, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r28, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r29, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r30, rax);
  __ jcc(Assembler::notEqual, error);
  __ cmpq(r31, rax);
  __ jcc(Assembler::notEqual, error);
  __ jmp(done);
  __ bind(error);
  __ movq(rax, 1);
  __ ret(1);
  __ bind(done);
  __ movq(rax, 0);
  __ ret(0);

  jit_code func = (jit_code)entry;
  result = func();
  ASSERT_EQ(result, 0);

  BufferBlob::free(b);
}


TEST_VM(ZRuntimeCallSpillTest, test_save_restore_egprs) {
  FlagSetting flag_change_apx(UseAPX, true);
  VM_Version::set_apx_cpuFeatures();
  test_save_restore_egprs();
}
