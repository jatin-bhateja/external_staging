

import java.util.zip.*;
import jdk.incubator.vector.*;

class Test {
  public static int DATA_LEN;  

  public final int MOD_ADLER = 65521;

  public IntVector Multiplier;

  public final VectorSpecies<Integer> DATA_SPECIES;

  public final VectorSpecies<Integer> MULT_SPECIES;

  public Test(int len) {
    DATA_SPECIES = IntVector.SPECIES_256;
    MULT_SPECIES = IntVector.SPECIES_256;
    int [] arr = new int[MULT_SPECIES.length()];
    for (int i = 0 ; i < arr.length; i++)
      arr[i] = len - i;
    Multiplier = IntVector.fromArray(MULT_SPECIES, arr ,0);
  }
  
  public int adler32_jvm(byte [] data) {
    Adler32 obj = new Adler32();
    obj.update(data, 0, data.length);
    return (int)obj.getValue();
  }

  /* 
    where data is the location of the data in physical memory and 
    len is the length of the data in bytes 
  */
  public int  adler32(byte [] data) {
    int a = 1, b = 0;
    
    // True cross iteration data dependency will inhebit 
    // loop vectorization.
    for (int index = 0; index < data.length; ++index) {
        a = (a + data[index]) % MOD_ADLER;
        b = (b + a) % MOD_ADLER;
    }

    //System.out.println("b = " + b );
    //System.out.println("a = " + a );
    
    return (b << 16) | a;
  }


  public int  adler32_vector(byte [] data) {
    int ctr = 0;
    int a = 1, b = 0;
    
    int addened_for_A = 0;
    int addened_for_B = 0;

    for (int index = 0; index < data.length; index += MULT_SPECIES.length())  {
        ByteVector BV =  ByteVector.fromArray(ByteVector.SPECIES_64, data, index); 

        IntVector data_BV = (IntVector)(BV.convertShape(VectorOperators.B2I, DATA_SPECIES, 0));
        IntVector data_for_B = data_BV.mul(Multiplier);

        //System.out.println("\nIter [" + ctr++ + "]: \n" +   data_BV);
        //System.out.println(data_for_B);

        addened_for_A +=  data_BV.reduceLanes(VectorOperators.ADD);
        addened_for_B +=  data_for_B.reduceLanes(VectorOperators.ADD);
        
        //addened_for_A = addened_for_A % MOD_ADLER;
        //addened_for_B = addened_for_B % MOD_ADLER;

        //System.out.println("addened_for_A = " + addened_for_A);
        //System.out.println("addened_for_B = " + addened_for_B);
                
        Multiplier = Multiplier.sub(MULT_SPECIES.length());
    }

    b = (b + a*DATA_LEN + addened_for_B) % MOD_ADLER;

    //System.out.println("\nb = " + b + " a = " + a + " mult = " + MULT_SPECIES.length() + " addened_for_B = " + addened_for_B );

    a = (a + addened_for_A) % MOD_ADLER;
    //System.out.println("a = " + a + " addened_for_A = " + addened_for_A );
    
    return (b << 16) | a;
  }

  public static void main(String [] args) {
     int chksum = 0;
     DATA_LEN = Integer.parseInt(args[0]);

     byte [] data = new byte[DATA_LEN];
     for(int i = 0 ; i < data.length ; i++) 
        data[i] = (byte)i;     

     // Warmup Scalar JVM
     for (int i = 0;  i < 1000000; i++) {
      Test obj = new Test(DATA_LEN);
      chksum += obj.adler32_jvm(data);
     }
         
     chksum = 0;
     long t1 = System.nanoTime();
     for (int i = 0;  i < 50000; i++) {
      Test obj = new Test(DATA_LEN);
      chksum += obj.adler32_jvm(data);
     }
     long t2 = System.nanoTime();
     System.out.println("Time : " + ((t2-t1)/1000000) + "ms | Checksum (adler32_jvm) = " + chksum);
        
     // Warmup Scalar
     for (int i = 0;  i < 1000000; i++) {
      Test obj = new Test(DATA_LEN);
      chksum += obj.adler32(data);
     }
         
     chksum = 0;
     t1 = System.nanoTime();
     for (int i = 0;  i < 50000; i++) {
      Test obj = new Test(DATA_LEN);
      chksum += obj.adler32(data);
     }
     t2 = System.nanoTime();
     System.out.println("Time : " + ((t2-t1)/1000000) + "ms | Checksum (adler32) = " + chksum);

     // Warmup Vector
     chksum = 0;
     for (int i = 0;  i < 1000000; i++) {
       Test obj = new Test(DATA_LEN);
       chksum += obj.adler32_vector(data);
     }
     chksum = 0;
     t1 = System.nanoTime();
     for (int i = 0;  i < 50000; i++) {
       Test obj = new Test(DATA_LEN);
       chksum += obj.adler32_vector(data);
     }
     t2 = System.nanoTime();
     System.out.println("Time : " + ((t2-t1)/1000000) + "ms | Checksum (adler32_vector) = " + chksum);
  }

}
