/*
 * Copyright (c) 2021, Huawei Technologies Co. Ltd. All rights reserved.
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

import jdk.incubator.vector.ShortVector;
import jdk.incubator.vector.VectorSpecies;
import jdk.incubator.vector.VectorShuffle;

/*
 * @test
 * @bug 8265907
 * @modules jdk.incubator.vector
 * @run main/othervm compiler.vectorapi.TestVectorShuffleIota
 */

public class bug1 {
    static final VectorSpecies<Short> SPECIESi = ShortVector.SPECIES_64;

    static final int INVOC_COUNT = 150000;

    static int [] ai = {0, 1, 2, 3};
    static short [] bi = {0, 1, 2, 3};

    static void testShuffleI() {
        ShortVector vec = (ShortVector)(VectorShuffle.fromArray(SPECIESi, ai, 0).toVector());
        vec.intoArray(bi, 0);
    }

    public static void main(String[] args) {
        VectorShuffle<Short> shuf = null;
        for (int i = 0; i < INVOC_COUNT; i++) {
            testShuffleI();
        }
        for (int i = 0; i < ai.length; i++) {
            System.out.print(bi[i] + ", ");
        }
        System.out.println();
    }
}
