/*
 * Copyright (c) 2021, Arm Limited. All rights reserved.
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

import jdk.incubator.vector.*;
import java.util.Random;
import java.util.Arrays;

public class VectorCastShape128Test {
    private static final VectorSpecies<Integer> ispec = IntVector.SPECIES_256;
    private static final VectorSpecies<Byte> bspec = ByteVector.SPECIES_128;

    private static final int NUM_ITER = 100000;
    private static final int LENGTH = 512;
    private static int[] ia;
    private static byte[] fb;

    private static void initialize() {
        ia = new int[LENGTH];
        fb = new byte[LENGTH];
        for (int i = 0; i < LENGTH; i++) {
            ia[i] = 65535;
        }
    }

    private static float testIntToFloat(int ctr) {
          IntVector va = IntVector.fromArray(ispec, ia, 0);
          ByteVector vb = (ByteVector) va.castShape(bspec, 0);
          vb.intoArray(fb, 0);
          return fb[ctr];
    }

    public static void main(String [] args) {
        initialize();
        float res = 0.0f;
        for (int i = 0; i < NUM_ITER; i++) {
             res +=  testIntToFloat(i & (LENGTH-1));
        }
        System.out.println("Res = " + res);
    }
}
