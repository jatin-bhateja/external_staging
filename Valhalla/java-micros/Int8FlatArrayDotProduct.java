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

package org.openjdk.bench.valhalla.reduced_precision;

import org.openjdk.jmh.annotations.*;
import java.util.concurrent.TimeUnit;
import static jdk.internal.value.ValueClass.*;
import java.util.Arrays;
import java.util.stream.IntStream;
import java.util.Random;

value class Int8 {
    public byte _value;

    public Int8(byte value) {
        this._value = value;
    }

    public byte getValue() {
        return _value;
    }

    public Int8 mul(Int8 multiplier) {
        return new Int8((byte)(this._value * multiplier._value));
    }

    public String toString() {
        return "<int8> { " + _value +  " } ";
    }
}

value class Int32 {
    public int _value;

    public Int32(int value) {
        this._value = value;
    }

    public int getValue() {
        return _value;
    }

    public Int32 add(byte auguend) {
        return new Int32(this._value + auguend);
    }

    public Int32 add(Int8 auguend) {
        return new Int32(this._value + auguend.getValue());
    }

    public Int32 add(Int32 auguend) {
        return new Int32(this._value + auguend.getValue());
    }

    public String toString() {
        return "<int32> { " + _value +  " } ";
    }
}

value class Int8Vector64B {
    public Int8 [] _payload;

    public Int8Vector64B(Int8 init) {
        _payload = (Int8 [])newNullRestrictedNonAtomicArray(Int8.class, 64, init);
    }

    public void setLane(int idx, Int8 value) {
        _payload[idx] = value;
    }

    public Int8 getLane(int idx) {
        return _payload[idx];
    }

    public int length() {
        return _payload.length;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("<int8_64B> {");
        for (int i = 0; i < _payload.length; i++) {
            sb.append(_payload[i].getValue() + " , ");
        }
        sb.append("}");
        return sb.toString();
    }

    public static Int32 dotProductWith32BitAccumulation(Int8Vector64B a, Int8Vector64B b) {
        Int8Vector64B mul = new Int8Vector64B(new Int8((byte)0));
        for (int i = 0; i < a.length(); i++) {
            mul.setLane(i, a.getLane(i).mul(b.getLane(i)));
        }
        Int32 accu = new Int32(0);
        for (int i = 0; i < mul.length(); i++) {
            accu = accu.add(mul.getLane(i));
        }
        return accu;
    }
}

class Int8Array64B {
   public byte [] _payload;

   public Int8Array64B(byte init) {
       _payload = new byte[64];
       Arrays.fill(_payload, (byte)init);
   }

   public void setLane(int idx, byte value) {
       _payload[idx] = value;
   }

   public byte getLane(int idx) {
       return _payload[idx];
   }

   public int length() {
       return _payload.length;
   }

   public String toString() {
       StringBuilder sb = new StringBuilder();
       sb.append("<int8_64B> {");
       for (int i = 0; i < _payload.length; i++) {
           sb.append(_payload[i] + " , ");
       }
       sb.append("}");
       return sb.toString();
   }

   public static Int32 dotProductWith32BitAccumulation(Int8Array64B arr, Int8Array64B brr) {
       Int8Array64B mul = new Int8Array64B((byte)0);
       for (int i = 0; i < arr.length(); i++) {
           mul.setLane(i, (byte)(arr.getLane(i) * brr.getLane(i)));
       }
       Int32 accu = new Int32(0);
       for (int i = 0; i < mul.length(); i++) {
           accu = accu.add(mul.getLane(i));
       }
       return accu;
   }
}

@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@Fork(value = 1,
      jvmArgsAppend = {"--add-opens", "java.base/jdk.internal.value=ALL-UNNAMED",
                       "--enable-preview"})
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Benchmark)
public class Int8FlatArrayDotProduct {
    @Param({"1024", "2048"})
    public int size;

    public byte [] arr;
    public byte [] brr;
    public static final Random rd = new Random(1343);

    @Setup(Level.Trial)
    public void BmSetup() {
        arr = new byte[size];
        brr = new byte[size];
        IntStream.range(0, size).forEach(
            i -> {
                arr[i] = (byte)rd.nextInt(size);
                brr[i] = (byte)rd.nextInt(size);
            }
        );
    }

    @Benchmark
    public Int32 int8DotProductWith32BitAccumFlatArray() {
        Int32 res = new Int32(0);
        for (int i = 0; i < size; i++) {
            Int8Vector64B va = new Int8Vector64B(new Int8(arr[i]));
            Int8Vector64B vb = new Int8Vector64B(new Int8(brr[i]));
            res = res.add(Int8Vector64B.dotProductWith32BitAccumulation(va, vb));
        }
        return res;
    }

    @Benchmark
    public Int32 int8DotProductWith32BitAccumArray() {
        Int32 res = new Int32(0);
        for (int i = 0; i < size; i++) {
            Int8Array64B va = new Int8Array64B(arr[i]);
            Int8Array64B vb = new Int8Array64B(brr[i]);
            res = res.add(Int8Array64B.dotProductWith32BitAccumulation(va, vb));
        }
        return res;
    }
}
