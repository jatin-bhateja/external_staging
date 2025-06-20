
import jdk.incubator.vector.*;

class compress {
  public static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_512;

  static FloatVector expandHelper(Vector<Float> v1, Vector<Float> v2, VectorMask<Float> m) {
        VectorSpecies<Float> vsp = m.vectorSpecies();
        FloatVector r  = (FloatVector) v1;
        FloatVector vi = (FloatVector) v2;
        for(int i = 0,j = 0; i < vsp.length(); i++) {
            if(m.laneIsSet(i)) {
               r = r.withLane(i, vi.lane(j++));
            }
        }
        return r;
    }


  public static void workload(float [] r, float [] a, float [] b, VectorMask<Float> mask) {
    int i = 0;
    for(; i < SPECIES.loopBound(a.length) ; i+=SPECIES.length()) {
      FloatVector IV1 = FloatVector.fromArray(SPECIES, a, i);
      FloatVector IV2 = FloatVector.fromArray(SPECIES, b, i);
//      IV1 = IV1.compress(mask, IV2);
//        IV1 = IV1.compress(mask);
        IV1 = IV1.expand(mask);
//      IV1 = expandHelper(IV2, IV1, mask);
      IV1.intoArray(r, i);
    }
  }

  public static void main(String [] args) {
     float [] a = new float[SPECIES.length()];
     float [] b = new float[SPECIES.length()];
     float [] r = new float[SPECIES.length()];

     //VectorMask<Float> mask = VectorMask.fromLong(SPECIES, 43690);
     VectorMask<Float> mask = VectorMask.fromLong(SPECIES, 43690);
     a[0] = 0.0f;
     a[1] = 1.0f;
     a[2] = 2.0f;
     a[3] = 3.0f;
     a[4] = 4.0f;
     a[5] = 5.0f;
     a[6] = 6.0f;
     a[7] = 7.0f;
   
     for(int i = 0 ; i < 100000 ;i++) {
          workload(r, a, b, mask);
     }

     long t1 = System.currentTimeMillis();
     for(int i = 0 ; i < 50000 ;i++) {
          workload(r, a, b, mask);
     }
     long t2 = System.currentTimeMillis();
     System.out.println("[Time] " + (t2-t1) +" ms");
     for(int i = 0; i  < SPECIES.length() ; i++) {
       System.out.println("r[" + i + "] = " + r[i]);
     }
  }
}
