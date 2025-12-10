
import java.lang.foreign.*;
import jdk.incubator.vector.*;
import java.nio.ByteOrder;

public class matmul_512_bench {

    public static final VectorSpecies<Float> FSP = FloatVector.SPECIES_PREFERRED;

    static {
        System.loadLibrary("matmul_512");
        System.out.println("Loaded libmatmul_512.so");
    }

    public static MemorySegment allocate_matrix(Arena arena, int rows, int cols) {
        float ctr = 0.0f;
        MemorySegment ms = arena.allocate(Float.BYTES * rows * cols);
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                ms.set(ValueLayout.JAVA_FLOAT, Float.BYTES * (i * cols + j), ctr++);
            }
        }
        return ms;
    }

    public static void print_matrix(MemorySegment mat, int rows, int cols) {
        IO.println("[");
        for (int i = 0; i < rows; i++) {
            IO.print(" [ ");
            for (int j = 0; j < cols; j++) {
                IO.print(mat.get(ValueLayout.JAVA_FLOAT, Float.BYTES * (i * cols + j)) + ", ");
            }
            IO.println(" ]");
        }
        IO.println("]");
    }

    public static void matmul_512_vapi(MemorySegment prodmat, MemorySegment mat1, MemorySegment mat2, int rows, int cols) {
        assert cols % 16 == 0;
        assert rows % 16 == 0;
        int dim2 = rows > cols ? cols : rows;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < dim2; j+=FSP.length()) {
                FloatVector res = FloatVector.broadcast(FSP, 0.0f);
                for (int k = 0; k < cols; k++) {
                    FloatVector va = FloatVector.broadcast(FSP, mat1.get(ValueLayout.JAVA_FLOAT, Float.BYTES * (i * cols + k)));
                    FloatVector vb = FloatVector.fromMemorySegment(FSP, mat2, Float.BYTES * (k * cols + j), ByteOrder.nativeOrder());
                    res = va.lanewise(VectorOperators.FMA, vb, res);
                }
                res.intoMemorySegment(prodmat, Float.BYTES * (i * cols + j), ByteOrder.nativeOrder());
            }
        }
    }

    public static void runBM(String msg, MemorySegment prodmat, MemorySegment mat1, MemorySegment mat2, int rows, int cols, MicroBM func) {
        for (int i = 0; i < 1000; i++) {
            func.apply(prodmat, mat1, mat2, rows, cols);
        }

        long start = System.currentTimeMillis();
        for (int i = 0; i < 1000; i++) {
            func.apply(prodmat, mat1, mat2, rows, cols);
        }
        long end = System.currentTimeMillis();
        IO.println("[" + msg + "TIME] " + (end - start) + "ms");
    }

    interface MicroBM {
        public void apply(MemorySegment prod, MemorySegment mat1, MemorySegment mat2, int rows, int cols);
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
        boolean debug = Boolean.parseBoolean(args[1]);
        int rows = Integer.parseInt(args[2]);
        int cols = Integer.parseInt(args[3]);
        try (Arena arena = Arena.ofShared()) {
            MemorySegment mat1 = allocate_matrix(arena, rows, cols);
            MemorySegment mat2 = allocate_matrix(arena, cols, rows);
            MemorySegment prodmat = allocate_matrix(arena, rows, rows);

            if (debug) {
                print_matrix(mat1, rows, cols);
                print_matrix(mat2, cols, rows);
            }

            if (algo == 0 || algo == -1) {
                runBM(" FFM ", prodmat, mat1, mat2, rows, cols, (p,m1,m2,r,c) -> matmul_512_h.matmul_512_ps(p, m1, m2, r, c));
                if (debug) {
                    print_matrix(prodmat, rows, rows);
                }
            }

            if (algo == 1 || algo == -1) {
                runBM(" VAPI ", prodmat, mat1, mat2, rows, cols, (p,m1,m2,r,c) -> matmul_512_vapi(p, m1, m2, r, c));
                if (debug) {
                    print_matrix(prodmat, rows, rows);
                }
            }

            /*
            if (algo == 2 || algo == -1) {
                runBM(" HWI ", prodmat, mat1, mat2, rows, cols, (p,m1,m2,r,c) -> matmul_512_vapi(p, m1, m2, r, c));
                if (debug) {
                    print_matrix(prodmat, rows, rows);
                }
            }*/
        }
    }
}
