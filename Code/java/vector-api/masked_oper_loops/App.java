
import jdk.incubator.vector.*;

public class App {
    public VectorSpecies<Integer> SPECIES = IntVector.SPECIES_PREFERRED;

    // SLP will auto-vectorize otherwise -XX:-UseSuperword
    public void micro_scalar(int[] res, int[] opr1, int[] opr2) {
        int i = 0;
        for (; i < res.length; i++) {
          res[i] = opr1[i] + opr2[i];
        }
    }

    public void micro_vector(int[] res, int[] opr1, int[] opr2) {
        IntVector vec1 = null;
        IntVector vec2 = null;

        // Vectorized loop.
        int i = 0;
        for (; i < SPECIES.loopBound(res.length); i += SPECIES.length()) {
            vec1 = IntVector.fromArray(SPECIES, opr1, i); 
            vec2 = IntVector.fromArray(SPECIES, opr2, i);
            vec1.add(vec2).intoArray(res, i);
        }
        for (; i < res.length; i++) {
          res[i] = opr1[i] + opr2[i];
        }
    }

    public void micro_vector_masked(int[] res, int[] opr1, int[] opr2) {
        int i = 0;
        IntVector vec1 = null;
        IntVector vec2 = null;

        // Loop -> OptFill (mem , true) -> fromArray(mask_all_true, 0) -> unmasked fromArray
        //boolean[] mask_all_true = new boolean[SPECIES.length()];
        //for(int j = 0 ; j < mask_all_true.length; j++) {
        //  mask_all_true[j] = true;
        //}
        //VectorMask<Integer> mask = VectorMask.fromArray(SPECIES, mask_all_true, 0);

        // Vectorized loop.
        for (; i < SPECIES.loopBound(res.length); i += SPECIES.length()) {
            vec1 = IntVector.fromArray(SPECIES, opr1, i);
            vec2 = IntVector.fromArray(SPECIES, opr2, i);
            vec1.add(vec2).intoArray(res, i);
            //vec1.add(vec2, mask).intoArray(res, i);
        }

        // Tail processing.
        VectorMask<Integer> mask_tail = VectorMask.fromLong(SPECIES, (1L << (res.length & (SPECIES.length()-1))) -1);
        vec1 = IntVector.fromArray(SPECIES, opr1, i, mask_tail);
        vec2 = IntVector.fromArray(SPECIES, opr2, i, mask_tail);
        vec1.add(vec2, mask_tail).intoArray(res, i, mask_tail);
    }

    public static void main(String[] args) throws Exception {
        int ITER = Integer.parseInt(args[1]);
        int SIZE = Integer.parseInt(args[0]);

        int[] opr1 = new int[SIZE];
        int[] opr2 = new int[SIZE];
        int[] res  = new int[SIZE];
        for (int i = 0; i < SIZE ; i++) {
          opr1[i] = i;
          opr2[i] = i;
        }

        App obj = new App();

        // Warmup Iterations.
        for (int i = 0; i < ITER; i++) {
            obj.micro_scalar(res, opr1, opr2);
        }

        // Measured Iterations. 
        long Res = 0;
        long time = 0L;
        for (int i = 0; i < ITER; i++) {
            long t1 = System.currentTimeMillis();
            obj.micro_scalar(res, opr1, opr2);
            long t2 = System.currentTimeMillis();
            time += (t2-t1); 
            for (int j = 0; j < res.length; j++) {
               Res += res[j];
            }
        }
        System.out.println("SCALAR : [Time] " + time + " ms   [Res] " + Res);

        // Warmup Iterations.
        for (int i = 0; i < ITER; i++) {
            obj.micro_vector(res, opr1, opr2);
        }

        // Measured Iterations. 
        Res = 0;
        time = 0L;
        for (int i = 0; i < ITER; i++) {
            long t1 = System.currentTimeMillis();
            obj.micro_vector(res, opr1, opr2);
            long t2 = System.currentTimeMillis();
            time += (t2-t1); 
            for (int j = 0; j < res.length; j++) {
               Res += res[j];
            }
        }
        System.out.println("VECTOR : [Time] " + time + " ms   [Res] " + Res);

        // Warmup Iterations.
        for (int i = 0; i < ITER; i++) {
            obj.micro_vector_masked(res, opr1, opr2);
        }

        // Measured Iterations. 
        Res = 0;
        time = 0L;
        for (int i = 0; i < ITER; i++) {
            long t1 = System.currentTimeMillis();
            obj.micro_vector_masked(res, opr1, opr2);
            long t2 = System.currentTimeMillis();
            time += (t2-t1); 
            for (int j = 0; j < res.length; j++) {
               Res += res[j];
            }
        }
        System.out.println("VECTOR_MASKED : [Time] " + time + " ms   [Res] " + Res);
    }
}
