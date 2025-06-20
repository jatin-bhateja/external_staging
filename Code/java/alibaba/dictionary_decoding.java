
import java.util.Arrays;
import java.util.Random;
import jdk.incubator.vector.*;

public class dictionary_decoding {
    public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

    public dictionary_decoding(int [] Dictionary, int [] Data) {
        assert Dictionary.length == Data.length;
        Random r = new Random(1024);
        for(int i = 0; i < Data.length; i++) {
           Dictionary[i] = r.nextInt();
           Data[i] = r.nextInt(Data.length-1);
        }
    }

    public void decode_scalar(int [] Decoded_Data, int [] Data, int [] Dictionary) {
        assert Decoded_Data.length == Data.length && Decoded_Data.length == Dictionary.length;
        for(int i = 0; i < Data.length; i++ ) {
            Decoded_Data[i] = Dictionary[Data[i]];
        }
    }


    // Data hold adjusted Dictionary indices.
    public void decode_vector(int [] Decoded_Data, int [] Data, int [] Dictionary) {
        assert Decoded_Data.length == Data.length && Decoded_Data.length == Dictionary.length;
        int i = 0;
        for(; i < SPECIES.loopBound(Data.length); i+= SPECIES.length()) {
            IntVector ddVec = IntVector.fromArray(SPECIES, Dictionary, 0, Data, i);
            ddVec.intoArray(Decoded_Data, i);
        }
        for(; i < Data.length; i++) {
           Decoded_Data[i] = Dictionary[Data[i]];
        }
    }

    public static void main(String [] args) {
        int size = Integer.parseInt(args[0]);
        int algo = Integer.parseInt(args[1]);
        int [] Decoded_Data = new int[size];
        int [] Dictionary = new int[size]; 
        int [] Data =  new int[size];

        dictionary_decoding obj = new dictionary_decoding(Dictionary, Data);
        
        if (algo == 0) {
            // Warm-up iterations.
            for(int i = 0; i < 200000; i++) {
                obj.decode_scalar(Decoded_Data, Data, Dictionary);
            }
            // Measured iterations.
            long t1 = System.currentTimeMillis();
            for(int i = 0; i < 100000; i++) {
                obj.decode_scalar(Decoded_Data, Data, Dictionary);
            }
            long t2 = System.currentTimeMillis();
            long res = 0;
            for(int i = 0 ; i < Decoded_Data.length; i++) {
                res += i*Decoded_Data[i];
            }
            System.out.println("[Time Scalar] " + (t2-t1) + " ms  [Res] " + res);
        } else {
            // Warm-up iterations.
            for(int i = 0; i < 200000; i++) {
                obj.decode_vector(Decoded_Data, Data, Dictionary);
            }
         
            // Measured iterations.
            long t1 = System.currentTimeMillis();
            for(int i = 0; i < 100000; i++) {
               obj.decode_vector(Decoded_Data, Data, Dictionary);
            }
            long t2 = System.currentTimeMillis();
            long res = 0;
            for(int i = 0 ; i < Decoded_Data.length; i++) {
                res += i*Decoded_Data[i];
            }
            System.out.println("[Time Vector] " + (t2-t1) + " ms  [Res] " + res);
        }
    }
}
