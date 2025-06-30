
import jdk.incubator.vector.*;

class roundf {
   public static VectorSpecies ISPECIES = IntVector.SPECIES_512;
   public static VectorSpecies SPECIES = FloatVector.SPECIES_512;

   public static  int round_vector(float [] a, int [] r, int ctr) {
     IntVector shiftVBC = (IntVector)ISPECIES.broadcast(24-2+127);
     for (int i = 0 ; i < a.length ; i += SPECIES.length()) {
       FloatVector fv = FloatVector.fromArray(SPECIES, a, i);
       IntVector iv = fv.reinterpretAsInts();
       IntVector biasedExpV = iv.lanewise(VectorOperators.AND, 0x7F800000);
       biasedExpV = biasedExpV.lanewise(VectorOperators.ASHR, 23); 
       IntVector shiftV = shiftVBC.lanewise(VectorOperators.SUB, biasedExpV);
       VectorMask cond = shiftV.lanewise(VectorOperators.AND, -32)
                        .compare(VectorOperators.EQ ,0);
       IntVector res = iv.lanewise(VectorOperators.AND,0x007FFFFF, cond)
                      .lanewise(VectorOperators.OR, 0x007FFFFF+1, cond); 
       VectorMask cond1 = iv.compare(VectorOperators.LT, 0);
       VectorMask cond2 = cond1.and(cond);
       res = res.lanewise(VectorOperators.NEG, cond2);
       res = res.lanewise(VectorOperators.ASHR, shiftV, cond)
            .lanewise(VectorOperators.ADD, 1, cond)
            .lanewise(VectorOperators.ASHR, 1, cond);
       res = fv.convert(VectorOperators.F2I, 0)
            .reinterpretAsInts()
            .blend(res, cond); 
       res.intoArray(r, i);
     }
     return r[ctr];
   }

  public static int round_scalar1(float a) {
     return Math.round(a);
  }


  public static int round_scalar(float [] a,  int [] r, int ctr) {
     for (int j =  0 ; j < a.length ; j++) {
        r[j] = round_scalar1(a[j]);
     }
     return r[ctr];
  }

  public static void main(String [] args) {
     int algo = Integer.parseInt(args[0]);
     float [] a = new float[4096];
     int [] r = new int[4096];

     for (int i = 0 ; i < 4096; i++)
        //a[i] = -0x1.0p-1f;
        a[i] = Float.MAX_VALUE;
      

     int res = 0;
     if (algo == 0) {
       for (int i = 0 ; i < 100000 ; i++)
          res += round_scalar(a, r, i & 4095);
  
       long t1 = System.currentTimeMillis();
       res = 0;
       for (int i = 0 ; i < 500000 ; i++)
          res += round_scalar(a, r, i & 4095);
       long t2 = System.currentTimeMillis();
       
       System.out.println("[Time Scalar] " + (t2-t1) + " ms  [Res] " + res); 
       for(int i = 0 ; i <= 17; i++) {
          String s = String.format("a[" + i + "] = %10.10f r["+ i + "] = " + r[i], a[i]);
          System.out.println(s);
       }
     } else {
       res = 0;
       for (int i = 0 ; i < 100000 ; i++)
         res += round_vector(a, r, i & 4095);
  
       long t1 = System.currentTimeMillis();
       res = 0;
       for (int i = 0 ; i < 500000 ; i++)
         res += round_vector(a, r, i & 4095);
       long t2 = System.currentTimeMillis();
       
       System.out.println("[Time Vector] " + (t2-t1) + " ms  [Res] " + res); 
       for(int i = 0 ; i <= 17; i++) {
          String s = String.format("a[" + i + "] = %10.10f r["+ i + "] = " + r[i], a[i]);
          System.out.println(s);
       }
     }
  }
}
