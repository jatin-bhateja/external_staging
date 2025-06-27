import static jdk.internal.value.ValueClass.*;
import java.util.Arrays;

value class Int8 {
   public byte _value;
   public Int8(byte value) {
       this._value = value;
   }
   public byte getValue() {
       return _value;
   }
   public Int8 mul(Int8 multiplier) {
       return new Int8((byte)(this._value * multiplier._value));
   }

   public String toString() {
       return "<int8> { " + _value +  " } ";
   }
}

value class Int32 {
   public int _value;
   public Int32(int value) {
       this._value = value;
   }
   public int getValue() {
       return _value;
   }

   public Int32 add(byte auguend) {
       return new Int32(this._value + auguend);
   }

   public Int32 add(Int8 auguend) {
       return new Int32(this._value + auguend.getValue());
   }

   public Int32 add(Int32 auguend) {
       return new Int32(this._value + auguend.getValue());
   }
   public String toString() {
       return "<int32> { " + _value +  " } ";
   }
}

value class Int8Vector64B {
   public Int8 [] _payload;

   public Int8Vector64B(Int8 init) {
       _payload = (Int8 [])newNullRestrictedNonAtomicArray(Int8.class, 64, init);
   }

   public void setLane(int idx, Int8 value) {
       _payload[idx] = value;
   }

   public Int8 getLane(int idx) {
       return _payload[idx];
   }

   public int length() {
       return _payload.length;
   }

   public String toString() {
       StringBuilder sb = new StringBuilder();
       sb.append("<int8_64B> {");
       for (int i = 0; i < _payload.length; i++) {
           sb.append(_payload[i].getValue() + " , ");
       }
       sb.append("}");
       return sb.toString();
   }

   public static Int32 dotProductWith32BitAccumulation(Int8Vector64B a, Int8Vector64B b) {
       Int8Vector64B mul = new Int8Vector64B(new Int8((byte)0));
       for (int i = 0; i < a.length(); i++) {
           mul.setLane(i, a.getLane(i).mul(b.getLane(i)));
       }
       Int32 accu = new Int32(0);
       for (int i = 0; i < mul.length(); i++) {
           accu = accu.add(mul.getLane(i));
       }
       return accu;
   }
}

class Int8Array64B {
   public byte [] _payload;

   public Int8Array64B(byte init) {
       _payload = new byte[64];
       Arrays.fill(_payload, (byte)init);
   }

   public void setLane(int idx, byte value) {
       _payload[idx] = value;
   }

   public byte getLane(int idx) {
       return _payload[idx];
   }

   public int length() {
       return _payload.length;
   }

   public String toString() {
       StringBuilder sb = new StringBuilder();
       sb.append("<int8_64B> {");
       for (int i = 0; i < _payload.length; i++) {
           sb.append(_payload[i] + " , ");
       }
       sb.append("}");
       return sb.toString();
   }

   public static Int32 dotProductWith32BitAccumulationArr(Int8Array64B arr, Int8Array64B brr) {
       Int8Array64B mul = new Int8Array64B((byte)0);
       for (int i = 0; i < arr.length(); i++) {
           mul.setLane(i, (byte)(arr.getLane(i) * brr.getLane(i)));
       }
       Int32 accu = new Int32(0);
       for (int i = 0; i < mul.length(); i++) {
           accu = accu.add(mul.getLane(i));
       }
       return accu;
   }
}

public class int8_flat_array_dot_product {

    interface micro {
        public Int32 apply(byte a, byte b);
    }

    public static micro genMicro(int algo) {
        if (algo == 1) {
            return new micro() {
                public Int32 apply(byte a, byte b) {
                    Int8Vector64B va = new Int8Vector64B(new Int8(a));
                    Int8Vector64B vb = new Int8Vector64B(new Int8(b));
                    return Int8Vector64B.dotProductWith32BitAccumulation(va, vb);
                }
            };
        } else if (algo == 2) {
            return new micro() {
                public Int32 apply(byte a, byte b) {
                    Int8Array64B va = new Int8Array64B(a);
                    Int8Array64B vb = new Int8Array64B(b);
                    return Int8Array64B.dotProductWith32BitAccumulationArr(va, vb);
                }
            };
        }
        return null;
    }

    public static Int32 micro(micro obj, byte a, byte b) {
        return obj.apply(a, b);
    }

    public static void main(String [] args) {
        int algo = Integer.parseInt(args[0]);
        Int32 res = new Int32(0);
        micro obj = genMicro(algo);

        for (int i = 0; i < 100000; i++) {
           res = res.add(micro(obj, (byte)i, (byte)(i + 1)));
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 100000; i++) {
           res = res.add(micro(obj, (byte)i, (byte)(i + 1)));
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + " ms  [res] " + res);
    }
}
