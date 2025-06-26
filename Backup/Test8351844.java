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

package compiler.vectorapi;

import compiler.lib.ir_framework.*;
import compiler.lib.verify.*;
import jdk.incubator.vector.LongVector;
import jdk.incubator.vector.VectorSpecies;

/*
 * @test
 * @bug 8351844
 * @summary C2 x64 AVX2 vpminmax: assert(regs[i] != regs[j]) failed: regs[1] and regs[2] are both: xmm0
 * @modules jdk.incubator.vector
 * @requires vm.compiler2.enabled
 * @library /test/lib
 *
 * @run driver compiler.vectorapi.Test8351844
 */
import jdk.incubator.vector.*;

public class Test8351844 {
    @Test
    @IR(count = {IRNode.MIN_VL, " >0 "})
    public static long testBug1() {
        LongVector lv1 = LongVector.broadcast(LongVector.SPECIES_256, -17179869184L);
        LongVector lv2 = LongVector.broadcast(LongVector.SPECIES_256, -17179869184L);
        LongVector lv3 = LongVector.broadcast(LongVector.SPECIES_256, 16385L);
        return lv1.lanewise(VectorOperators.MIN, lv2).add(lv3).lane(0);
    }
    
    @Check(test="testBug1")
    public static void checkTestBug1(long acutal) throws Exception {
        TestFramework.deoptimize(Test8351844.class.getMethod("testBug1"));    
        long expected = testBug1();
        Verify.checkEQ(acutal, expected);
    }

    @Test
    @IR(count = {IRNode.MAX_VL, " >0 "})
    public static long testBug2() {
        LongVector lv1 = LongVector.broadcast(LongVector.SPECIES_256, -17179869184L);
        LongVector lv2 = LongVector.broadcast(LongVector.SPECIES_256, -17179869184L);
        LongVector lv3 = LongVector.broadcast(LongVector.SPECIES_256, 16385L);
        return lv1.lanewise(VectorOperators.MAX, lv2).add(lv3).lane(0);
    }
    
    @Check(test="testBug2")
    public static void checkTestBug2(long acutal) throws Exception {
        TestFramework.deoptimize(Test8351844.class.getMethod("testBug2"));    
        long expected = testBug2();
        Verify.checkEQ(acutal, expected);
    }

    public static void main(String[] args) {
        TestFramework.runWithFlags("-XX:UseAVX=2", "-XX:+IgnoreUnrecognizedVMOptions");
    }
}
