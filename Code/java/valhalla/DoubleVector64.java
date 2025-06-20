
sealed abstract class DoubleVector permits DoubleVector64 {
  abstract void print();
  public static DoubleVector fromValue(double val) {
    return new DoubleVector64(val);
  }
  public abstract DoubleVector lanewise_add(double val);
  public abstract DoubleVector lanewise_add(DoubleVector val);
}

primitive public class DoubleVector64 extends DoubleVector {
  double value;

  public void print() {
    System.out.println("value => " + value);
  }

  public DoubleVector lanewise_add(double val) {
     DoubleVector64 vec = (DoubleVector64)this;
     return new DoubleVector64(vec.value + val);
  }

  public DoubleVector lanewise_add(DoubleVector val) {
     DoubleVector64 vec = (DoubleVector64)this;
     return new DoubleVector64(this.value + vec.value);
  } 

  public DoubleVector64(double val) {
    value = val;
  }

  public static void main(String [] args) {
    DoubleVector obj = null;
    obj = DoubleVector.fromValue(10.0);
    obj.print();
    for(int i = 0; i < 100000; i++) {
      obj = obj.lanewise_add(10.0);
      obj = obj.lanewise_add(obj);
    }
    obj.print();
  }
}
