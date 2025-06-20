
import jdk.incubator.vector.*;

class jit {
  public VectorMask<Integer> micro() {
    boolean[] mask_all_true = new boolean[IntVector.SPECIES_256.length()];
    for(int j = 0 ; j < mask_all_true.length; j++) {
      mask_all_true[j] = true;
    }
    return VectorMask.fromArray(IntVector.SPECIES_256, mask_all_true, 0); 
  }

  public static void main (String [] args) { 
    long Res = 0;
    VectorMask<Integer> mask;
    for ( int i = 0 ; i < 1000000 ; i++)  {
      jit obj = new jit(); 
      mask = obj.micro();
      Res += mask.toLong(); 
    }
    System.out.println("Res =  " + Res);
  }
}
