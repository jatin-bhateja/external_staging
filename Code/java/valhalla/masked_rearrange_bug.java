
// compile: javac --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-modules=jdk.incubator.vector --enable-preview -source 26 masked_rearrange_bug.java
// run : java -XX:+UseNonAtomicValueFlattening --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED  -Xbootclasspath/a:. -XX:-PrintInlineLayout --enable-preview -cp . masked_rearrange_bug 

import jdk.internal.vm.annotation.*;
import jdk.internal.misc.Unsafe;
import java.util.Arrays;

@LooselyConsistentValue
value class VectorPayloadMF128I {
   @MultiField(value=4)
   private int _mfield;

   public VectorPayloadMF128I() {
      _mfield = 0;
   }
}

@LooselyConsistentValue
value class VectorPayloadMF32Z {
   @MultiField(value=4)
   private boolean _mfield;

   public VectorPayloadMF32Z() {
      _mfield = false;
   }
}

value class Int128Vector {
   @NullRestricted
   @Strict
   private VectorPayloadMF128I _payload;

   public static final int HOFFSET = 16;

   private static final Unsafe U = Unsafe.getUnsafe();

   public Int128Vector(VectorPayloadMF128I payload) {
      _payload = payload;
   }

   public VectorPayloadMF128I getPayload() {
       return _payload;
   }

   public static Int128Vector fromArray(int [] arr, int index) {
      VectorPayloadMF128I payload = new VectorPayloadMF128I();
      payload = U.makePrivateBuffer(payload);
      for (int i = 0; i < 4; i++) {
          U.putInt(payload, HOFFSET + i * Integer.BYTES, arr[i + index]); 
      } 
      payload = U.finishPrivateBuffer(payload);
      return new Int128Vector(payload);
   } 

   public Int128Vector rearrange(VectorShuffle indexes, VectorMask mask) {
      VectorPayloadMF128I vpayload = this.getPayload();
      VectorPayloadMF128I ipayload = indexes.getPayload();
      VectorPayloadMF32Z  mpayload= mask.getPayload();
      VectorPayloadMF128I vresult = new VectorPayloadMF128I();
      vresult = U.makePrivateBuffer(vresult);
      for (int i = 0; i < 4; i++) {
          if (U.getBoolean(mpayload, HOFFSET + i * Byte.BYTES)) {
              int index = U.getInt(ipayload, HOFFSET + i * Integer.BYTES);
              int value = U.getInt(vpayload, HOFFSET + index * Integer.BYTES);
              U.putInt(vresult, HOFFSET +  i *  Integer.BYTES, value);
          }
      }
      vresult = U.finishPrivateBuffer(vresult);
      return new Int128Vector(vresult);
   }

   public void intoArray(int [] arr, int index) {
      VectorPayloadMF128I payload = getPayload();
      for (int i = 0; i < 4; i++) {
          arr[i + index] = U.getInt(payload, HOFFSET + i * Integer.BYTES); 
      } 
   }
}

value class VectorShuffle {
   @NullRestricted
   @Strict
   private VectorPayloadMF128I _payload;

   private static final Unsafe U = Unsafe.getUnsafe();

   public VectorPayloadMF128I getPayload() {
       return _payload;
   }

   public VectorShuffle(VectorPayloadMF128I payload) {
      _payload = payload;
   }

   public static VectorShuffle fromArray(int [] arr, int index) {
      VectorPayloadMF128I payload = new VectorPayloadMF128I();
      payload = U.makePrivateBuffer(payload);
      for (int i = 0; i < 4; i++) {
          U.putInt(payload, 16 + i * Integer.BYTES, arr[i + index]); 
      } 
      payload = U.finishPrivateBuffer(payload);
      return new VectorShuffle(payload);
   } 
}

value class VectorMask {
    @NullRestricted
    @Strict
    private VectorPayloadMF32Z _payload;
 
    public static final int HOFFSET = 16;

    private static final Unsafe U = Unsafe.getUnsafe();

    public VectorMask(VectorPayloadMF32Z payload) {
        _payload = payload;
    }

    public VectorPayloadMF32Z getPayload() {
        return _payload;
    } 

    public static VectorMask fromLong(long mask) {
        VectorPayloadMF32Z mpayload = new VectorPayloadMF32Z();
        mpayload = U.makePrivateBuffer(mpayload);
        for (int i = 0; i < 4; i++) {
            U.putBoolean(mpayload, HOFFSET + i, (1 == ((mask >> i) & 0x1)));
        } 
        mpayload = U.finishPrivateBuffer(mpayload);
        return new VectorMask(mpayload);
    }
}

class masked_rearrange_bug {

  public static void shuffle(int [] arr, int [] neworder, int i) {
     VectorMask mask = VectorMask.fromLong(-1L);
     Int128Vector vector = Int128Vector.fromArray(arr, i);
     VectorShuffle index = VectorShuffle.fromArray(neworder, i);
     vector.rearrange(index, mask).intoArray(arr,i);
  }

  public static void main(String [] args) {
     int [] arr = new int[32];
     int [] neworder = new int[32];
     for(int i = 0 ; i < 32 ; i++) {
       arr[i] = i;
       neworder[i] = 3 - (i & 3);
     }
     shuffle(arr, neworder, 0);
     System.out.println(Arrays.toString(arr));
  }
}
