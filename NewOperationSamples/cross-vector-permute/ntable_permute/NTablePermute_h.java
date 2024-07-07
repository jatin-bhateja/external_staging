// Generated by jextract

import java.lang.invoke.*;
import java.lang.foreign.*;
import java.nio.ByteOrder;
import java.util.*;
import java.util.function.*;
import java.util.stream.*;

import static java.lang.foreign.ValueLayout.*;
import static java.lang.foreign.MemoryLayout.PathElement.*;

public class NTablePermute_h {

    NTablePermute_h() {
        // Should not be called directly
    }

    static final Arena LIBRARY_ARENA = Arena.ofAuto();
    static final boolean TRACE_DOWNCALLS = Boolean.getBoolean("jextract.trace.downcalls");

    static void traceDowncall(String name, Object... args) {
         String traceArgs = Arrays.stream(args)
                       .map(Object::toString)
                       .collect(Collectors.joining(", "));
         System.out.printf("%s(%s)\n", name, traceArgs);
    }

    static MemorySegment findOrThrow(String symbol) {
        return SYMBOL_LOOKUP.find(symbol)
            .orElseThrow(() -> new UnsatisfiedLinkError("unresolved symbol: " + symbol));
    }

    static MethodHandle upcallHandle(Class<?> fi, String name, FunctionDescriptor fdesc) {
        try {
            return MethodHandles.lookup().findVirtual(fi, name, fdesc.toMethodType());
        } catch (ReflectiveOperationException ex) {
            throw new AssertionError(ex);
        }
    }

    static MemoryLayout align(MemoryLayout layout, long align) {
        return switch (layout) {
            case PaddingLayout p -> p;
            case ValueLayout v -> v.withByteAlignment(align);
            case GroupLayout g -> {
                MemoryLayout[] alignedMembers = g.memberLayouts().stream()
                        .map(m -> align(m, align)).toArray(MemoryLayout[]::new);
                yield g instanceof StructLayout ?
                        MemoryLayout.structLayout(alignedMembers) : MemoryLayout.unionLayout(alignedMembers);
            }
            case SequenceLayout s -> MemoryLayout.sequenceLayout(s.elementCount(), align(s.elementLayout(), align));
        };
    }

    static final SymbolLookup SYMBOL_LOOKUP = SymbolLookup.loaderLookup()
            .or(Linker.nativeLinker().defaultLookup());

    public static final ValueLayout.OfBoolean C_BOOL = ValueLayout.JAVA_BOOLEAN;
    public static final ValueLayout.OfByte C_CHAR = ValueLayout.JAVA_BYTE;
    public static final ValueLayout.OfShort C_SHORT = ValueLayout.JAVA_SHORT;
    public static final ValueLayout.OfInt C_INT = ValueLayout.JAVA_INT;
    public static final ValueLayout.OfLong C_LONG_LONG = ValueLayout.JAVA_LONG;
    public static final ValueLayout.OfFloat C_FLOAT = ValueLayout.JAVA_FLOAT;
    public static final ValueLayout.OfDouble C_DOUBLE = ValueLayout.JAVA_DOUBLE;
    public static final AddressLayout C_POINTER = ValueLayout.ADDRESS
            .withTargetLayout(MemoryLayout.sequenceLayout(java.lang.Long.MAX_VALUE, JAVA_BYTE));
    public static final ValueLayout.OfLong C_LONG = ValueLayout.JAVA_LONG;

    private static class permute2Tables {
        public static final FunctionDescriptor DESC = FunctionDescriptor.ofVoid(
            NTablePermute_h.C_POINTER,
            NTablePermute_h.C_POINTER,
            NTablePermute_h.C_POINTER,
            NTablePermute_h.C_POINTER
        );

        public static final MemorySegment ADDR = NTablePermute_h.findOrThrow("permute2Tables");

        public static final MethodHandle HANDLE = Linker.nativeLinker().downcallHandle(ADDR, DESC);
    }

    /**
     * Function descriptor for:
     * {@snippet lang=c :
     * void permute2Tables(float *res, float *src1, float *src2, int *indexes)
     * }
     */
    public static FunctionDescriptor permute2Tables$descriptor() {
        return permute2Tables.DESC;
    }

    /**
     * Downcall method handle for:
     * {@snippet lang=c :
     * void permute2Tables(float *res, float *src1, float *src2, int *indexes)
     * }
     */
    public static MethodHandle permute2Tables$handle() {
        return permute2Tables.HANDLE;
    }

    /**
     * Address for:
     * {@snippet lang=c :
     * void permute2Tables(float *res, float *src1, float *src2, int *indexes)
     * }
     */
    public static MemorySegment permute2Tables$address() {
        return permute2Tables.ADDR;
    }

    /**
     * {@snippet lang=c :
     * void permute2Tables(float *res, float *src1, float *src2, int *indexes)
     * }
     */
    public static void permute2Tables(MemorySegment res, MemorySegment src1, MemorySegment src2, MemorySegment indexes) {
        var mh$ = permute2Tables.HANDLE;
        try {
            if (TRACE_DOWNCALLS) {
                traceDowncall("permute2Tables", res, src1, src2, indexes);
            }
            mh$.invokeExact(res, src1, src2, indexes);
        } catch (Throwable ex$) {
           throw new AssertionError("should not reach here", ex$);
        }
    }
}
