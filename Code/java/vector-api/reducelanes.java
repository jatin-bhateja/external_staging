import jdk.incubator.vector.*;

class test {
	static int INVOC_COUNT = 2;

	static void workload(short [] a, short [] r) {
		for (int i = 0; i < a.length; i += ShortVector.SPECIES_64.length()) {
			ShortVector av = ShortVector.fromArray(ShortVector.SPECIES_64, a, i);
			r[i] = av.reduceLanes(VectorOperators.MIN);
		}
	}

	public static void main(String [] args) {
		short[] a = new short[1560];
		short[] r = new short[1560];

		//Init
		for(int i = 0; i < a.length; i++)
			a[i] = (short)i;

		for(int i = 0 ; i < 100000 ; i++)
			workload(a, r);
	}
}

