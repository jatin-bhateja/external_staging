
import jdk.incubator.vector.*;   

class test {
    public static final int val = 10;
    public static final int [] arr = { 1,2,3,4};
    public static VectorSpecies<Integer> SPECIES = IntVector.SPECIES_256; 

    public static VectorSpecies<Integer> species(VectorShape s) {
        switch (s) {
            case S_64_BIT: return IntVector.SPECIES_64;
            case S_128_BIT: return IntVector.SPECIES_128;
            case S_256_BIT: return IntVector.SPECIES_256;
            case S_512_BIT: return IntVector.SPECIES_512;
            case S_Max_BIT: return IntVector.SPECIES_MAX;
            default: throw new IllegalArgumentException("Bad shape: " + s);
        }
    }

    public static void main (String [] args) {
       arr[1] = 20;
       int res = 0;
       for (int i = 0 ; i < 100000 ; i++) {
          res += species(SPECIES.vectorShape()).length();
       }
       System.out.println("[RES] " + res);
    }
}
