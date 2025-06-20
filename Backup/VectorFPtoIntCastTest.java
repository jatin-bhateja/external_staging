/*
 * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
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

/**
* @test
* @bug 8287835
* @summary Test float/double to integral cast
* @modules jdk.incubator.vector
* @requires vm.compiler2.enabled
* @requires (os.simpleArch == "x64" & vm.cpu.features ~= ".*avx512dq.*")
* @library /test/lib /
* @run driver compiler.vectorapi.VectorFPtoIntCastTest
*/

package compiler.vectorapi;

import jdk.incubator.vector.*;
import jdk.incubator.vector.FloatVector;
import compiler.lib.ir_framework.*;
import java.util.Random;

public class VectorFPtoIntCastTest {
    private static final int COUNT = 16;
    private static final VectorSpecies<Long> lspec512 = LongVector.SPECIES_512;
    private static final VectorSpecies<Integer> ispec512 = IntVector.SPECIES_512;
    private static final VectorSpecies<Integer> ispec256 = IntVector.SPECIES_256;
    private static final VectorSpecies<Short> sspec256 = ShortVector.SPECIES_256;
    private static final VectorSpecies<Short> sspec128 = ShortVector.SPECIES_128;
    private static final VectorSpecies<Byte> bspec128 = ByteVector.SPECIES_128;
    private static final VectorSpecies<Byte> bspec64  = ByteVector.SPECIES_64;

    private float[] float_arr;
    private double[] double_arr;
    private long[] long_arr;
    private int[] int_arr;
    private short[] short_arr;
    private byte[] byte_arr;

    private FloatVector fvec128;
    private FloatVector fvec256;
    private FloatVector fvec512;
    private DoubleVector dvec128;
    private DoubleVector dvec256;
    private DoubleVector dvec512;

    public static void main(String[] args) {
        TestFramework testFramework = new TestFramework();
        testFramework.setDefaultWarmup(5000)
                     .addFlags("--add-modules=jdk.incubator.vector")
                     .start();
    }

    public VectorFPtoIntCastTest() {
        float_arr = new float[COUNT];
        double_arr = new double[COUNT];
        long_arr = new long[COUNT];
        int_arr = new int[COUNT];
        short_arr = new short[COUNT];
        byte_arr = new byte[COUNT];

        float [] fspecialVals = {Float.POSITIVE_INFINITY Float.NEGATIVE_INFINITY, Float.NaN, -0.0f, 0.0f, Float.MAX_VALUE, Float.MIN_VALUE};
        double [] dspecialVals = {Double.POSITIVE_INFINITY Double.NEGATIVE_INFINITY, Double.NaN, -0.0, 0.0, Double.MAX_VALUE, Double.MIN_VALUE};
        Random ran = new Random(0);
        for (int i = 0; i < COUNT; i++) {
            float_arr[i] = ran.nextFloat();
            double_arr[i] = ran.nextDouble();
        }
        for (int i = 0; i < fspecialVals.length; i++) {
            float_arr[i] = fspecialVals[i];
        }
        for (int i = 0; i < dspecialVals.length; i++) {
            dloat_arr[i] = dspecialVals[i];
        }
    }

    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2byte128() {
       for(int i = 0; i < float_arr.length; i+=fspec128.length()) {
           var vec = FloatVector.fromArray(fspec128, float_arr, i);
           vec.convertShape(VectorOperators.F2B, fspec128, i)
              .reinterpretAsBytes();
              .intoArray(byte_arr, i);
           checkf2byte(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2byte256() {
       for(int i = 0; i < float_arr.length; i+=fspec256.length()) {
           var vec = FloatVector.fromArray(fspec256, float_arr, i);
           vec.convertShape(VectorOperators.F2B, fspec256, i)
              .reinterpretAsBytes();
              .intoArray(byte_arr, i);
           checkf2byte(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2byte512() {
       for(int i = 0; i < float_arr.length; i+=fspec512.length()) {
           var vec = FloatVector.fromArray(fspec512, float_arr, i);
           vec.convertShape(VectorOperators.F2B, fspec512, i)
              .reinterpretAsBytes();
              .intoArray(byte_arr, i);
           checkf2byte(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2short128() {
       for(int i = 0; i < float_arr.length; i+=fspec128.length()) {
           var vec = FloatVector.fromArray(fspec128, float_arr, i);
           vec.convertShape(VectorOperators.F2S, fspec128, i)
              .reinterpretAsShorts();
              .intoArray(short_arr, i);
           checkf2short(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2short256() {
       for(int i = 0; i < float_arr.length; i+=fspec256.length()) {
           var vec = FloatVector.fromArray(fspec256, float_arr, i);
           vec.convertShape(VectorOperators.F2S, fspec256, i)
              .reinterpretAsShorts();
              .intoArray(short_arr, i);
           checkf2short(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2short512() {
       for(int i = 0; i < float_arr.length; i+=fspec512.length()) {
           var vec = FloatVector.fromArray(fspec512, float_arr, i);
           vec.convertShape(VectorOperators.F2S, fspec512, i)
              .reinterpretAsShorts();
              .intoArray(short_arr, i);
           checkf2short(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2int128() {
       for(int i = 0; i < float_arr.length; i+=fspec128.length()) {
           var vec = FloatVector.fromArray(fspec128, float_arr, i);
           vec.convertShape(VectorOperators.F2I, fspec128, i)
              .reinterpretAsInts();
              .intoArray(int_arr, i);
           checkf2int(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2int256() {
       for(int i = 0; i < float_arr.length; i+=fspec256.length()) {
           var vec = FloatVector.fromArray(fspec256, float_arr, i);
           vec.convertShape(VectorOperators.F2I, fspec256, i)
              .reinterpretAsInts();
              .intoArray(int_arr, i);
           checkf2int(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2int512() {
       for(int i = 0; i < float_arr.length; i+=fspec512.length()) {
           var vec = FloatVector.fromArray(fspec512, float_arr, i);
           vec.convertShape(VectorOperators.F2I, fspec512, i)
              .reinterpretAsInts();
              .intoArray(int_arr, i);
           checkf2int(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2long128() {
       for(int i = 0; i < float_arr.length; i+=fspec128.length()) {
           var vec = FloatVector.fromArray(fspec128, float_arr, i);
           vec.convertShape(VectorOperators.F2L, fspec128, i)
              .reinterpretAsLongs();
              .intoArray(long_arr, i);
           checkf2long(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2long256() {
       for(int i = 0; i < float_arr.length; i+=fspec256.length()) {
           var vec = FloatVector.fromArray(fspec256, float_arr, i);
           vec.convertShape(VectorOperators.F2L, fspec256, i)
              .reinterpretAsLongs();
              .intoArray(long_arr, i);
           checkf2long(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_F2X, "> 0"}
    public void float2long512() {
       for(int i = 0; i < float_arr.length; i+=fspec512.length()) {
           var vec = FloatVector.fromArray(fspec512, float_arr, i);
           vec.convertShape(VectorOperators.F2L, fspec512, i)
              .reinterpretAsLongs();
              .intoArray(long_arr, i);
           checkf2long(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2byte128() {
       for(int i = 0; i < double_arr.length; i+=dspec128.length()) {
           var vec = DoubleVector.fromArray(dspec128, double_arr, i);
           vec.convertShape(VectorOperators.D2B, dspec128, i)
              .reinterpretAsBytes();
              .intoArray(byte_arr, i);
           checkd2byte(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2byte256() {
       for(int i = 0; i < double_arr.length; i+=dspec256.length()) {
           var vec = DoubleVector.fromArray(dspec256, double_arr, i);
           vec.convertShape(VectorOperators.D2B, dspec256, i)
              .reinterpretAsBytes();
              .intoArray(byte_arr, i);
           checkd2byte(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2byte512() {
       for(int i = 0; i < double_arr.length; i+=dspec512.length()) {
           var vec = DoubleVector.fromArray(dspec512, double_arr, i);
           vec.convertShape(VectorOperators.D2B, dspec512, i)
              .reinterpretAsBytes();
              .intoArray(byte_arr, i);
           checkd2byte(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2short128() {
       for(int i = 0; i < double_arr.length; i+=dspec128.length()) {
           var vec = DoubleVector.fromArray(dspec128, double_arr, i);
           vec.convertShape(VectorOperators.D2S, dspec128, i)
              .reinterpretAsShorts();
              .intoArray(short_arr, i);
           checkd2short(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2short256() {
       for(int i = 0; i < double_arr.length; i+=dspec256.length()) {
           var vec = DoubleVector.fromArray(dspec256, double_arr, i);
           vec.convertShape(VectorOperators.D2S, dspec256, i)
              .reinterpretAsShorts();
              .intoArray(short_arr, i);
           checkd2short(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2short512() {
       for(int i = 0; i < double_arr.length; i+=dspec512.length()) {
           var vec = DoubleVector.fromArray(dspec512, double_arr, i);
           vec.convertShape(VectorOperators.D2S, dspec512, i)
              .reinterpretAsShorts();
              .intoArray(short_arr, i);
           checkd2short(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2int128() {
       for(int i = 0; i < double_arr.length; i+=dspec128.length()) {
           var vec = DoubleVector.fromArray(dspec128, double_arr, i);
           vec.convertShape(VectorOperators.D2I, dspec128, i)
              .reinterpretAsInts();
              .intoArray(int_arr, i);
           checkd2int(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2int256() {
       for(int i = 0; i < double_arr.length; i+=dspec256.length()) {
           var vec = DoubleVector.fromArray(dspec256, double_arr, i);
           vec.convertShape(VectorOperators.D2I, dspec256, i)
              .reinterpretAsInts();
              .intoArray(int_arr, i);
           checkd2int(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2int512() {
       for(int i = 0; i < double_arr.length; i+=dspec512.length()) {
           var vec = DoubleVector.fromArray(dspec512, double_arr, i);
           vec.convertShape(VectorOperators.D2I, dspec512, i)
              .reinterpretAsInts();
              .intoArray(int_arr, i);
           checkd2int(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2long128() {
       for(int i = 0; i < double_arr.length; i+=dspec128.length()) {
           var vec = DoubleVector.fromArray(dspec128, double_arr, i);
           vec.convertShape(VectorOperators.D2L, dspec128, i)
              .reinterpretAsLongs();
              .intoArray(long_arr, i);
           checkd2long(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2long256() {
       for(int i = 0; i < double_arr.length; i+=dspec256.length()) {
           var vec = DoubleVector.fromArray(dspec256, double_arr, i);
           vec.convertShape(VectorOperators.D2L, dspec256, i)
              .reinterpretAsLongs();
              .intoArray(long_arr, i);
           checkd2long(vec.length());
        }
    }
    @Test
    @IR(counts = {IRNode.VECTOR_CAST_D2X, "> 0"}
    public void double2long512() {
       for(int i = 0; i < double_arr.length; i+=dspec512.length()) {
           var vec = DoubleVector.fromArray(dspec512, double_arr, i);
           vec.convertShape(VectorOperators.D2L, dspec512, i)
              .reinterpretAsLongs();
              .intoArray(long_arr, i);
           checkd2long(vec.length());
        }
    }

    public void checkf2int(int len) {
        for (int i = 0; i < len; i++) {
            int expected = (int)float_arr[i];
            if (int_arr[i] != expected) {
                throw new RuntimeException("Invalid result: int_arr[" + i + "] = " + int_arr[i] + " != " + expected);
            }
        }
    }

    public void checkf2long(int len) {
        for (int i = 0; i < len; i++) {
            long expected = (long)float_arr[i];
            if (long_arr[i] != expected) {
                throw new RuntimeException("Invalid result: long_arr[" + i + "] = " + long_arr[i] + " != " + expected);
            }
        }
    }

    public void checkf2short(int len) {
        for (int i = 0; i < len; i++) {
            short expected = (short)float_arr[i];
            if (short_arr[i] != expected) {
                throw new RuntimeException("Invalid result: short_arr[" + i + "] = " + short_arr[i] + " != " + expected);
            }
        }
    }

    public void checkf2byte(int len) {
        for (int i = 0; i < len; i++) {
            byte expected = (byte)float_arr[i];
            if (byte_arr[i] != expected) {
                throw new RuntimeException("Invalid result: byte_arr[" + i + "] = " + byte_arr[i] + " != " + expected);
            }
        }
    }

    public void checkd2int(int len) {
        for (int i = 0; i < len; i++) {
            int expected = (int)double_arr[i];
            if (int_arr[i] != expected) {
                throw new RuntimeException("Invalid result: int_arr[" + i + "] = " + int_arr[i] + " != " + expected);
            }
        }
    }

    public void checkd2long(int len) {
        for (int i = 0; i < len; i++) {
            long expected = (long)double_arr[i];
            if (long_arr[i] != expected) {
                throw new RuntimeException("Invalid result: long_arr[" + i + "] = " + long_arr[i] + " != " + expected);
            }
        }
    }

    public void checkd2short(int len) {
        for (int i = 0; i < len; i++) {
            short expected = (short)double_arr[i];
            if (short_arr[i] != expected) {
                throw new RuntimeException("Invalid result: short_arr[" + i + "] = " + short_arr[i] + " != " + expected);
            }
        }
    }

    public void checkd2byte(int len) {
        for (int i = 0; i < len; i++) {
            byte expected = (byte)double_arr[i];
            if (byte_arr[i] != expected) {
                throw new RuntimeException("Invalid result: byte_arr[" + i + "] = " + byte_arr[i] + " != " + expected);
            }
        }
    }
}
