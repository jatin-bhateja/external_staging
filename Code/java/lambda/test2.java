

import jdk.incubator.vector.*;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class CrashTest {
    static int sum = 0;
    static final VectorSpecies<Byte> BYTE_512_SPECIES = ByteVector.SPECIES_512;

    public static void main(String[] args) {
        Properties p = System.getProperties();
        p.forEach((k, v) -> {
            byte[] bk = k.toString().getBytes(StandardCharsets.UTF_8);
            byte[] bv = v.toString().getBytes(StandardCharsets.UTF_8);
            sum += assertHashCode(bk);
            sum += assertHashCode(bv);
        });
        System.out.println("Sum is" + sum);
    }

    static int assertHashCode(byte[] b) {
        int actual = hashCodeVectorGenericShift(b, BYTE_512_SPECIES);
        return (actual);
    }

    static int hashCodeVectorGenericShift(byte[] a, VectorSpecies<Byte> byteSpecies) {
        int h = 1;
        for (int i = 0; i < (a.length & ~63); i += byteSpecies.length()) {
            ByteVector b = ByteVector.fromArray(byteSpecies, a, i);
            for (int j = 0; j < 4; j++) {
                b = b.slice(16);
            }
        }
        return h;
    }
} 
 

