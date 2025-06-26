/*
 * Copyright (c) 2017, 2018, Oracle and/or its affiliates. All rights reserved.
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

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;
import java.util.HashMap;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.LongFunction;
import java.util.stream.IntStream;

/*
 * @test
 * @bug 8193085 8199773
 * @summary tests for buffer equals and compare
 * @run testng EqualsCompareTest
 */

public class EqualsCompareTest {

    // Maximum width in bits
    static final int MAX_WIDTH = 512;

    static final Map<Class, Integer> typeToWidth;

    static {
        typeToWidth = new HashMap<>();
        typeToWidth.put(char.class, Character.SIZE);
    }

    static int arraySizeFor(Class<?> type) {
        assert type.isPrimitive();
        return 4 * MAX_WIDTH / typeToWidth.get(type);
    }

    enum BufferKind {
        HEAP,
        HEAP_VIEW,
        DIRECT;
    }

    static abstract class BufferType<T extends Buffer, E> {
        final BufferKind k;
        final Class<?> bufferType;
        final Class<?> elementType;

        final MethodHandle eq;
        final MethodHandle cmp;
        final MethodHandle mismtch;

        final MethodHandle getter;
        final MethodHandle setter;

        BufferType(BufferKind k, Class<T> bufferType, Class<?> elementType) {
            this.k = k;
            this.bufferType = bufferType;
            this.elementType = elementType;

            var lookup = MethodHandles.lookup();
            try {
                eq = lookup.findVirtual(bufferType, "equals", MethodType.methodType(boolean.class, Object.class));
                cmp = lookup.findVirtual(bufferType, "compareTo", MethodType.methodType(int.class, bufferType));
                mismtch = lookup.findVirtual(bufferType, "mismatch", MethodType.methodType(int.class, bufferType));

                getter = lookup.findVirtual(bufferType, "get", MethodType.methodType(elementType, int.class));
                setter = lookup.findVirtual(bufferType, "put", MethodType.methodType(bufferType, int.class, elementType));
            }
            catch (Exception e) {
                throw new AssertionError(e);
            }
        }

        @Override
        public String toString() {
            return bufferType.getName() + " " + k;
        }

        T construct(int length) {
            return construct(length, ByteOrder.BIG_ENDIAN);
        }

        abstract T construct(int length, ByteOrder bo);

        @SuppressWarnings("unchecked")
        T slice(T a, int from, int to, boolean dupOtherwiseSlice) {
            a = (T) a.position(from).limit(to);
            return (T) (dupOtherwiseSlice ? a.duplicate() : a.slice());
        }

        @SuppressWarnings("unchecked")
        E get(T a, int i) {
            try {
                return (E) getter.invoke(a, i);
            }
            catch (RuntimeException | Error e) {
                throw e;
            }
            catch (Throwable t) {
                throw new Error(t);
            }
        }

        void set(T a, int i, Object v) {
            try {
                setter.invoke(a, i, convert(v));
            }
            catch (RuntimeException | Error e) {
                throw e;
            }
            catch (Throwable t) {
                throw new Error(t);
            }
        }

        abstract Object convert(Object o);

        boolean equals(T a, T b) {
            try {
                return (boolean) eq.invoke(a, b);
            }
            catch (RuntimeException | Error e) {
                throw e;
            }
            catch (Throwable t) {
                throw new Error(t);
            }
        }

        int compare(T a, T b) {
            try {
                return (int) cmp.invoke(a, b);
            }
            catch (RuntimeException | Error e) {
                throw e;
            }
            catch (Throwable t) {
                throw new Error(t);
            }
        }

        boolean pairWiseEquals(T a, T b) {
            if (a.remaining() != b.remaining())
                return false;
            int p = a.position();
            for (int i = a.limit() - 1, j = b.limit() - 1; i >= p; i--, j--)
                if (!get(a, i).equals(get(b, j)))
                    return false;
            return true;
        }

        int mismatch(T a, T b) {
            try {
                return (int) mismtch.invoke(a, b);
            }
            catch (RuntimeException | Error e) {
                throw e;
            }
            catch (Throwable t) {
              throw new Error(t);
            }
        }

        static class Chars extends BufferType<CharBuffer, Character> {
            Chars(BufferKind k) {
                super(k, CharBuffer.class, char.class);
            }

            @Override
            CharBuffer construct(int length, ByteOrder bo) {
                switch (k) {
                    case DIRECT:
                        return ByteBuffer.allocateDirect(length * Character.BYTES).
                                order(bo).
                                asCharBuffer();
                    case HEAP_VIEW:
                        return ByteBuffer.allocate(length * Character.BYTES).
                                order(bo).
                                asCharBuffer();
                    default:
                    case HEAP:
                        return CharBuffer.allocate(length);
                }
            }

            @Override
            Object convert(Object o) {
                return o instanceof Integer
                       ? (char) ((Integer) o).intValue()
                       : o;
            }

            CharBuffer transformToStringBuffer(CharBuffer c) {
                char[] chars = new char[c.remaining()];
                c.get(chars);
                return CharBuffer.wrap(new String(chars));
            }
        }

    }
    static Object[][] bufferTypes;

    public static void main(String [] args) {
        if (bufferTypes == null) {
            bufferTypes = new Object[][]{
                    {new BufferType.Chars(BufferKind.HEAP)},
                    {new BufferType.Chars(BufferKind.HEAP_VIEW)},
                    {new BufferType.Chars(BufferKind.DIRECT)},
            };
        }
        EqualsCompareTest obj = new EqualsCompareTest();
        int Res = 0;
        for (int ITER = 0 ; ITER < 1000 ; ITER++) {
          for (int i = 0 ; i < bufferTypes.length; i++)
              Res += obj.<Character>testBuffers((BufferType.Chars)(bufferTypes[i][0]));
        }
        System.out.println("Res = " + Res);
    }



    <E>
    int testBuffers(BufferType<CharBuffer, E> bt) {
        // Test with buffers of the same byte order (BE)
        BiFunction<BufferType<CharBuffer, E>, Integer, Buffer> constructor = (at, s) -> {
            CharBuffer a = at.construct(s);
            for (int x = 0; x < s; x++) {
                at.set(a, x, x % 8);
            }
            return a;
        };

        int n = arraySizeFor(bt.elementType);
        int ctr = 0;

        for (boolean dupOtherwiseSlice : new boolean[]{ false, true }) {
            for (int s : ranges(0, n)) {
                CharBuffer a =  (CharBuffer)constructor.apply(bt, s);
                CharBuffer b =  (CharBuffer)constructor.apply(bt, s);

                for (int aFrom : ranges(0, s)) {
                    for (int aTo : ranges(aFrom, s)) {
                        int aLength = aTo - aFrom;

                        CharBuffer as = aLength != s
                               ? bt.slice(a, aFrom, aTo, dupOtherwiseSlice)
                               : a;

                        if (aLength > 0 && !a.isReadOnly()) {
                            for (int i = aFrom; i < aTo; i++) {
                                CharBuffer c =  (CharBuffer)constructor.apply(bt, a.capacity());
                                CharBuffer cs = aLength != s
                                       ? bt.slice(c, aFrom, aTo, dupOtherwiseSlice)
                                       : c;

                                // Create common prefix with a length of i - aFrom
                                bt.set(c, i, -1);

                                assert bt.equals(c, a) == false;

                                int cCa = bt.compare(cs, as);
                                int aCc = bt.compare(as, cs);
                                int v = Integer.signum(cCa) * Integer.signum(aCc);
                                assert v == -1;

                                int cMa = bt.mismatch(cs, as);
                                int aMc = bt.mismatch(as, cs);
                                assert cMa ==  aMc;
                                assert cMa ==  i - aFrom;
                            }
                        }
                        ctr++;
                    }
                }
            }
        }
        return ctr;
    }


    static int[] ranges(int from, int to) {
        int width = to - from;
        switch (width) {
            case 0:
                return new int[]{};
            case 1:
                return new int[]{from, to};
            case 2:
                return new int[]{from, from + 1, to};
            case 3:
                return new int[]{from, from + 1, from + 2, to};
            default:
                return IntStream.of(from, from + 1, from + 2, to / 2 - 1, to / 2, to / 2 + 1, to - 2, to - 1, to)
                        .filter(i -> i >= from && i <= to)
                        .distinct().toArray();
        }
    }
}
