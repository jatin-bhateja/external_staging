
import jdk.incubator.vector.*;

public class Issue2 {
  public static final VectorSpecies SP1 = IntVector.SPECIES_512;  // A) Constant Final (global constant post resolution)
  public final VectorSpecies SP2 = IntVector.SPECIES_512;         // B) Initialized at runtime. 
  public final int val1;                                          // C) Blank Final (Initialized at runtime)
  public static final int val2 = 40;                              // D) Constant Final

/*
  Disassembled ClassFile:
  public static final jdk.incubator.vector.VectorSpecies SP1;
    descriptor: Ljdk/incubator/vector/VectorSpecies;
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL

  public final jdk.incubator.vector.VectorSpecies SP2;
    descriptor: Ljdk/incubator/vector/VectorSpecies;
    flags: (0x0011) ACC_PUBLIC, ACC_FINAL

  public final int val1;
    descriptor: I
    flags: (0x0011) ACC_PUBLIC, ACC_FINAL

  public static final int val2 = 40;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 40
*/

  public Issue2() {
    this.val1 = 40;
  }

  public int micro(int i) {
     return val1 + 10 + val2 + SP1.length() + SP2.length() + i;
  }

  public static void main(String [] args) { 
     int res = 0;
     Issue2 obj = new Issue2();
     for(int i = 0 ; i < 100000 ; i++) 
       res += obj.micro(i);

     System.out.println("Res = " + res);
  }
}
