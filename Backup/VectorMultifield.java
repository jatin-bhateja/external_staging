
package jdk.incubator.vector;

import java.util.Objects;
import jdk.internal.vm.annotation.MultiField;
import jdk.internal.misc.Unsafe;

abstract class FloatVectorMF {
   void printMsg() {
      System.out.println("MSG1");
   }
}

primitive class Float256VectorMF extends FloatVectorMF {
  @MultiField(value=8)
  public final float field;

  Float256VectorMF() {
    field = 10.0f;
  }
  public float getField() { 
    return field;
  }
}

public class VectorMultifield {
  public static Object mfield = new Float256VectorMF();

  public static long getMultiFieldOffset() throws Exception {
     var field = Float256VectorMF.class.getField("field");
     return Unsafe.getUnsafe().objectFieldOffset(field);
  }

  public static int bundleSize() throws Exception {
     var field = Float256VectorMF.class.getField("field");
     var msanno = field.getAnnotationsByType(MultiField.class);

     Objects.nonNull(msanno);
     assert msanno.length == 1;

     int value = msanno[0].value();
     return value; 
  }

  public static void setMultiFieldValue(int idx, float val) throws Exception {
     int value = bundleSize();
     if (idx < 0 || idx >= value) {
        throw new RuntimeException("Index out of multifile bundle size");
     }
     long offset = getMultiFieldOffset();
     mfield = Unsafe.getUnsafe().makePrivateBuffer(mfield);
     Unsafe.getUnsafe().putFloat(mfield, offset + idx * Integer.BYTES, val);
     Unsafe.getUnsafe().finishPrivateBuffer(mfield);
  }

  public static float getMultiFieldValue(int idx) throws Exception {
     int value = bundleSize();
     if (idx < 0 || idx >= value) {
        throw new RuntimeException("Index out of multifile bundle size");
     }
     long offset = getMultiFieldOffset();
     return Unsafe.getUnsafe().getFloat(mfield, offset + idx * Integer.BYTES); 
  }

  public static void broadcastMultiFieldValue(float value) throws Exception {
    int bundlesize = bundleSize();
    for(int i = 0; i < bundlesize; i++) {
       setMultiFieldValue(i, value);
    } 
  }

  public static float[] getMultiFieldArray() throws Exception {
    int bundlesize = bundleSize();
    float [] arr = new float[bundlesize];
    for(int i = 0; i < bundlesize; i++) {
       arr[i] = getMultiFieldValue(i);
    }
    return arr;
  }
}

