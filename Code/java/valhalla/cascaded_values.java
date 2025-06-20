
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;
import jdk.internal.vm.annotation.ImplicitlyConstructible;

interface VectorPayload {
}

@LooselyConsistentValue
@ImplicitlyConstructible
value class VectorPayload256  implements VectorPayload {
    public float field1;
    public float field2;
    public float field3;
    public float field4;
    public VectorPayload256(float f1, float f2, float f3, float f4) {
        this.field1 = f1;
        this.field2 = f2;
        this.field3 = f3;
        this.field4 = f4;
    }
    public float getAccum() {
        return field1 + field2  + field3  + field4;
    }
    public static VectorPayload256 add (VectorPayload256 addened, VectorPayload256 auguend) {
       return new VectorPayload256(
              addened.field1 + auguend.field1, 
              addened.field2 + auguend.field2, 
              addened.field3 + auguend.field3, 
              addened.field4 + auguend.field4); 
    }

    public String toString() {
       return field1 + " , "  + field2 + " , " + field3 + " , " + field4;
    }
}

value abstract class Vector {
   public abstract Vector add(Vector auguend);
}

value class Vector256 extends Vector {
   @NullRestricted
   VectorPayload256 payload;
    
   public Vector256(VectorPayload obj) {
      this.payload = (VectorPayload256)obj;
   } 

   public Vector256(float f1, float f2, float f3, float f4) {
      this.payload = new VectorPayload256(f1, f2, f3, f4);
   } 

   @Override
   public Vector add(Vector arg) {
      Vector256 addened = (Vector256)this;
      Vector256 auguend = (Vector256)arg;
      return new Vector256(VectorPayload256.add(addened.payload, auguend.payload)); 
   }

   public String toString() {
      return "[v256] { " + payload + " } ";
   } 
} 

public class cascaded_values {
    public static Vector micro(Vector obj, float val)  {
       Vector auguend = new Vector256(val, val, val, val);
       return obj.add(auguend);
    }

    public static void main(String [] args) {
       Vector res = new Vector256(1.0f, 2.0f, 3.0f, 4.0f);
       for (int i = 0; i < 100000; i++) {
          res = micro(res, (float)i); 
       }
       System.out.println("[res] " + res);
    }
} 
