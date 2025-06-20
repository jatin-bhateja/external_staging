
sealed interface DoubleVector permits DoubleVector64I {
  void print();
  static DoubleVector fromValue(double val) {
    return new DoubleVector64I(val);
  }
  DoubleVector lanewise_add(double val);
  DoubleVector lanewise_add(DoubleVector val);
}

primitive public class DoubleVector64I implements DoubleVector {
  double value;

  public void print() {
    System.out.println("value => " + value);
  }

  public DoubleVector lanewise_add(double val) {
     DoubleVector64I vec = (DoubleVector64I)this;
     return new DoubleVector64I(vec.value + val);
  }

  public DoubleVector lanewise_add(DoubleVector val) {
     DoubleVector64I vec = (DoubleVector64I)this;
     return new DoubleVector64I(this.value + vec.value);
  } 

  public DoubleVector64I(double val) {
    value = val;
  }

  public static void main(String [] args) {
    DoubleVector obj = null;
    obj = DoubleVector.fromValue(10.0);
    obj.print();
    for(int i = 0; i < 100000; i++) {
      DoubleVector obj1 = obj.lanewise_add(10.0);
      obj = obj.lanewise_add(obj1);
    }
    obj.print();
  }
}
