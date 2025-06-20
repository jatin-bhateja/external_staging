
import jdk.incubator.vector.*;
import java.nio.ByteBuffer;

class add {
  public static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_512;

  public static void workload(int [] r, ByteBuffer a , ByteBuffer b) {
    int i = 0;
    for(; i < SPECIES.loopBound(r.length) ; i+=SPECIES.length()) {
      IntVector IV1 = IntVector.fromByteBuffer(SPECIES, a, i*4, java.nio.ByteOrder.nativeOrder());
      IntVector IV2 = IntVector.fromByteBuffer(SPECIES, b, i*4, java.nio.ByteOrder.nativeOrder());
      IV1 = IV1.add(IV2);
      IV1.intoArray(r, i);
    }
  }

  public static void workload_int(int [] r, int [] a , int [] b) {
    int i = 0;
    for(; i < SPECIES.loopBound(r.length) ; i+=SPECIES.length()) {
      IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
      IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
      IV1 = IV1.add(IV2);
      IV1.intoArray(r, i);
    }
    for(; i < r.length; i++) {
      r[i] = a[i] + b[i]; 
    }
  }

  public static void workload_mask_tail(int [] r, int [] a , int [] b) {
    int i = 0;
    for(; i < SPECIES.loopBound(r.length) ; i+=SPECIES.length()) {
      IntVector IV1 = IntVector.fromArray(SPECIES, a, i);
      IntVector IV2 = IntVector.fromArray(SPECIES, b, i);
      IV1 = IV1.add(IV2);
      IV1.intoArray(r, i);
    }
    VectorMask<Integer> tail_mask = VectorMask.fromLong(SPECIES, (1 << (r.length - i)) -1);
    IntVector.fromArray(SPECIES, a, i, tail_mask)
    .add(IntVector.fromArray(SPECIES, b, i, tail_mask))
    .intoArray(r, i, tail_mask);
  }


  public static void main(String [] args) {
     //int [] a = new int[1029];
     //int [] b = new int[1029];
     int [] r = new int[1024];

     ByteBuffer a = ByteBuffer.allocateDirect(1024*4);
     ByteBuffer b = ByteBuffer.allocateDirect(1024*4);

     var veca = ByteVector.SPECIES_512.broadcast(1);
     var vecb = ByteVector.SPECIES_512.broadcast(2);

     for(int i = 0 ; i < ByteVector.SPECIES_512.loopBound(a.limit()); i += ByteVector.SPECIES_512.length()) {
       veca.intoByteBuffer(a,  i , java.nio.ByteOrder.nativeOrder());
       vecb.intoByteBuffer(b,  i , java.nio.ByteOrder.nativeOrder());
     }
   
     for(int i = 0 ; i < 900000 ;i++) {
          workload(r, a, b);
     }

     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 900000 ;i++) {
          workload(r, a, b);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) +" ms");
  /*   for(int i = 0; i  < 8 ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }
     for(int i = 0 ; i < 900000 ;i++) {
          workload_mask_tail(r, a, b);
     }

     t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 900000 ;i++) {
          workload_mask_tail(r, a, b);
     }
     t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) +" ms");
   */
     for(int i = 0; i  < 8 ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }
  }
}
