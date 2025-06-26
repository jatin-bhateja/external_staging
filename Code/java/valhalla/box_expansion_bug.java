
import jdk.incubator.vector.*;

public class box_expansion_bug {
	static final VectorSpecies<Byte> B_SPECIES = ByteVector.SPECIES_128;
        static final int LENGTH = 1024;

	private static ByteVector func2(ByteVector v, int i) {
		ByteVector v1 = v;
		if (i % 2 == 0 || i % 3 == 0) {
			if (i % 2 == 0) {
				v1 = v1.lanewise(VectorOperators.AND, (byte)5);
			}

			if (i % 8 == 0) {
				v1 = v;
			}
		}
		return v1;
	}

	public static ByteVector v2;

	public static void main(String[] args) {
		ByteVector v = ByteVector.zero(B_SPECIES);
                byte [] ia = new byte[LENGTH];

		for (int i = 0; i < 100000; i++) {
			for (int j = 0; j < LENGTH; j += B_SPECIES.length()) {
				ByteVector av = ByteVector.fromArray(B_SPECIES, ia, j);
				v = func2(av, i);
			}
		}

		v2 = v;
	}
}



