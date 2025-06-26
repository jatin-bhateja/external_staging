
import jdk.incubator.vector.*;

public class jit1 {
  public static final int init = 0;
  public static int [] src;
  public static float [] dst;
  public static final VectorSpecies iSPECIES = IntVector.SPECIES_256;
  public static final VectorSpecies fSPECIES = FloatVector.SPECIES_256;

  public static float micro(int ctr) {
    for(int i = init ; i < iSPECIES.loopBound(src.length); i+= iSPECIES.length()) {
       IntVector iv = IntVector.fromArray(iSPECIES, src, i); 
       Vector<Float> fv = iv.castShape(fSPECIES, 0);
       ((FloatVector)fv).intoArray(dst, i); 
    }
    return dst[ctr];
  }

  public static void main (String [] args) { 
    float Res = 0 ;
    src = new int[10240];
    dst = new float[10240];
    for(int i = 0 ; i < src.length; i++) {
      src[i] = i;
    }
    for ( int i = 0 ; i < 50000 ; i++)  {
      Res += micro(i%src.length);
    }
    long t1 = System.currentTimeMillis();
    for ( int i = 0 ; i < 50000 ; i++)  {
      Res += micro(i%src.length);
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[res] " + Res  + " [time] " + (t2-t1) + " ms ");
  }
}
