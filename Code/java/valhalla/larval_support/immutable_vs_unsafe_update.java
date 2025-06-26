
import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.ImplicitlyConstructible;
import jdk.internal.vm.annotation.NullRestricted;

// Script generated payload files.
@LooselyConsistentValue
@ImplicitlyConstructible
value class VectorPayloadMF256F {
   // Two problems with scalar lanes
   // Layout of fields is determined at load time, hence there is a possibility of 
   // rearrangement.
   // Load / Store happens to and from arrays or memory segments, which is contiguously laid out.
   // Pros:
   //   - No use of unsafe or explicit transition to larval state and associated complexities.
   //   - Simple design fully aligned with Valhalla, mainly a java side changes.
   // Cons:
   //   - Vector Load / store from payload may be tricky due to non-deterministic layout of fields.
   //   - 
   // Multifield guarantees packed flat layout of field bundle.
   public float _value0;
   public float _value1;
   public float _value2;
   public float _value3;
   public float _value4;
   public float _value5;
   public float _value6;
   public float _value7;
   public VectorPayloadMF256F(float init) {
       this._value0 = init;
       this._value1 = init;
       this._value2 = init;
       this._value3 = init;
       this._value4 = init;
       this._value5 = init;
       this._value6 = init;
       this._value7 = init;
   }

   public VectorPayloadMF256F(VectorPayloadMF256F obj, int fcnt, float val) {
       this._value0 = fcnt == 0 ? val : obj._value0;
       this._value1 = fcnt == 1 ? val : obj._value1;
       this._value2 = fcnt == 2 ? val : obj._value2;
       this._value3 = fcnt == 3 ? val : obj._value3;
       this._value4 = fcnt == 4 ? val : obj._value4;
       this._value5 = fcnt == 5 ? val : obj._value5;
       this._value6 = fcnt == 6 ? val : obj._value6;
       this._value7 = fcnt == 7 ? val : obj._value7;
   }

   public float getValue(int idx) {
       switch(idx) {
          case 0 : return this._value0;
          case 1 : return this._value1;
          case 2 : return this._value2;
          case 3 : return this._value3;
          case 4 : return this._value4;
          case 5 : return this._value5;
          case 6 : return this._value6;
          case 7 : return this._value7;
          default : assert false ; return 0;
       }
   }
}

value class Float256Vector {
   @NullRestricted
   VectorPayloadMF256F payload;

   public static final int VLENGTH    = 8;
   public static final Class<?> ETYPE = float.class;

   Float256Vector(Object obj) {
       this.payload = (VectorPayloadMF256F)obj;
   }

   public int vLength() { return VLENGTH; }

   public Class<?> eType() { return ETYPE; }
 
   public Float256Vector (float val) {
      VectorPayloadMF256F payload = new VectorPayloadMF256F(0.0f);
      for (int i = 0; i < VLENGTH; i++) {
         payload = new VectorPayloadMF256F(payload, i, val); 
      }
      this.payload = payload;
   }

   public static Float256Vector fromArray(float [] arr) {
      VectorPayloadMF256F payload = new VectorPayloadMF256F(0.0f);
      for (int i = 0; i < VLENGTH; i++) {
         payload = new VectorPayloadMF256F(payload, i, arr[i]); 
      }
      return new Float256Vector(payload);
   }

   public Float256Vector add(Float256Vector src) {
       VectorPayloadMF256F res = new VectorPayloadMF256F(0.0f);
       for (int i = 0 ; i < VLENGTH; i++) {
          res = new VectorPayloadMF256F(res, i, this.payload.getValue(i) + src.payload.getValue(i));
       }
       return new Float256Vector(res);
   } 

   public String toString() {
      StringBuffer str = new StringBuffer(" ");
      str.append("[vec] ");
      for (int i = 0 ; i < VLENGTH; i++) {
          str.append(" {" + i +  "}:" + payload.getValue(i));
      }
      return str.toString();
   }
}


public class immutable_vs_unsafe_update {
   public static Float256Vector micro(Float256Vector src1, float val) {
      Float256Vector src2 = new Float256Vector(val);
      return src1.add(src2);
   }

   public static void main (String [] args) {
      Float256Vector res = new Float256Vector(0.0f);
      for (int i = 0; i < 10000; i++) {
          res = micro(res, (float)i);
      }
      System.out.println(res); 
   }
} 


