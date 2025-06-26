

import jdk.incubator.vector.*;

class test {
  public static VectorSpecies<Byte> SPECIES = ByteVector.SPECIES_512;

  public static void shuffle(byte [] res, byte [] arr, int [] idx) {
     for(int i = 0 ; i < SPECIES.loopBound(res.length); i+=SPECIES.length()) {
       ByteVector FV = ByteVector.fromArray(SPECIES, arr, i);
       FV.rearrange(VectorShuffle.fromArray(SPECIES, idx, 0)).intoArray(res,i);
     }
  }

  public static void main(String [] args) {
     byte [] arr = new byte[64];
     byte [] res = new byte[64];
     int [] idx = new int[64];
     for(int i = 0 ; i < arr.length; i++)
       arr[i] = (byte)(i);
     for(int i = 0 ; i < 64 ; i++)
       idx[i] = 0;
     idx[5] = 12;
     idx[17] = 0;
     idx[31] = 45;
     for( int i = 0 ; i < 90000 ; i++)
       shuffle(res, arr, idx);
     long t1 = System.currentTimeMillis();
     for( int i = 0 ; i < 90000 ; i++)
       shuffle(res, arr, idx);
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) + " ms ");
     for(int i = 0 ; i < 64; i++)
       System.out.println(i + ": " + res[i] + " ");
  }
}
