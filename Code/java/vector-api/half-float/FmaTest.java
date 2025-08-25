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

import jdk.incubator.vector.*;
import java.util.Arrays;

public class FmaTest {
    static final VectorSpecies<Float16> SPECIES = HalffloatVector.SPECIES_PREFERRED;

    static final int SIZE = 512;
    static short[] a = new short[SIZE];
    static short[] b = new short[SIZE];
    static short[] c = new short[SIZE];

    static {
        for (int i = 0; i < SIZE; i++) {
            a[i] = Float16.float16ToRawShortBits(Float16.valueOf((float)0.01f));
            b[i] = Float16.float16ToRawShortBits(Float16.valueOf((float)0.01f));
            c[i] = Float16.float16ToRawShortBits(Float16.valueOf((float)0.01f));
        }
    }

    static float scalar_fp16_dot_product() {
        int i = 0;
        Float16 accum = Float16.shortBitsToFloat16((short)0);
        for (; i < a.length; i++) {
            Float16 af16 = Float16.shortBitsToFloat16(a[i]);
            Float16 bf16 = Float16.shortBitsToFloat16(b[i]);
            accum = Float16.fma(af16, bf16, accum); 
        }
        return accum.floatValue();
    }

    static short [] temp_arr = new short[32];
    static float autovectorized_fp16_dot_product() {
        int i = 0;
        Float16 accum = Float16.shortBitsToFloat16((short)0);
        for (; i < a.length; i += 32) {
            for (int k = 0, j = i; j < 32 + i; j++, k++) {
                Float16 af16 = Float16.shortBitsToFloat16(a[j]);
                Float16 bf16 = Float16.shortBitsToFloat16(b[j]);
                temp_arr[k] = Float16.float16ToRawShortBits(Float16.multiply(af16, bf16));
            }
            for (int k = 0; k < 32; k++) {
                accum = Float16.add(accum, Float16.shortBitsToFloat16(temp_arr[k]));
            }
            Arrays.fill(temp_arr, (short)0);
        }
        return accum.floatValue();
    }

    static float vectorapi_fp16_dot_product() {
        int i = 0;
        HalffloatVector accum = HalffloatVector.broadcast(SPECIES, (short)0);
        for (; i < a.length; i += SPECIES.length()) {
            HalffloatVector av = HalffloatVector.fromArray(SPECIES, a, i);
            HalffloatVector bv = HalffloatVector.fromArray(SPECIES, b, i);
            accum = av.lanewise(VectorOperators.FMA, bv, accum);
        }
        Float16 res = Float16.shortBitsToFloat16((short)0);
        for (int j = 0; j < SPECIES.length(); j++) {
            res = Float16.add(Float16.shortBitsToFloat16(accum.lane(j)), res);
        }
        for (; i < a.length; i++) {
            Float16 af16 = Float16.shortBitsToFloat16(a[i]);
            Float16 bf16 = Float16.shortBitsToFloat16(b[i]);
            res = Float16.fma(af16, bf16, res);
        }
        return res.floatValue();
    }

    interface BenchMark {
        public float apply();
    }

    public static void runBm(String msg, BenchMark bm) {
        float res = 0.0f;
        for (int i = 0; i < 100000; i++) {
            res += bm.apply();
        }    
        res = 0.0f;
        long start = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
            res += bm.apply();
        }    
        long end = System.currentTimeMillis();
        System.out.println("[ " + msg + " time ] " + (end - start) + " ms  [res] "  + res);
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
        if (algo == 0 || algo == -1) {
            runBm("scalar_fp16_dotp", () -> scalar_fp16_dot_product());
        } 
        if (algo == 1 || algo == -1) {
            runBm("autovectorized_fp16_dotp", () -> autovectorized_fp16_dot_product());
        }
        if (algo == 2 || algo == -1) {
            runBm("vectorapi_fp16_dotp", () -> vectorapi_fp16_dot_product());
        }
    }
}
