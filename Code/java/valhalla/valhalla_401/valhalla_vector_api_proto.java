
// Compile: javac --enable-preview -source 25 --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -cp . valhalla_vector_api_mf_proto.java

// Run:     java -Xbootclasspath/a:. --enable-preview --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -XX:+UseNonAtomicValueFlattening --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -XX:-PauseAtStartup -XX:-UseOnStackReplacement -XX:+PrintInlineLayout -XX:CompileOnly=Float256Vector::add -cp . valhalla_vector_api_mf_proto

/*
Layout of class VectorPayload256MF@0x7d15040b3a10 extends java/lang/Object@0x7d15040b3a10
Instance fields:
 @0 RESERVED 12/-
 @12 REGULAR 4/4 "_mfield" F
Static fields:
 @0 RESERVED 120/-
 @120 REGULAR 4/4 ".null_reset" Ljava/lang/Object;
Instance size = 16 bytes
First field offset = 12
Payload layout: 4/4
Non atomic flat layout: 4/4
Atomic flat layout: -/-
Nullable flat layout: -/-
---
Layout of class Float256Vector@0x7d15040b3a10 extends java/lang/Object@0x7d15040b3a10
Instance fields:
 @0 RESERVED 12/-
 @12 FLAT 4/4 "_payload" LVectorPayload256MF; VectorPayload256MF@0x7d15040b3a10 NON_ATOMIC_FLAT
Static fields:
 @0 RESERVED 120/-
 @120 REGULAR 4/4 "U" Ljdk/internal/misc/Unsafe;
 @124 REGULAR 4/4 ".null_reset" Ljava/lang/Object;
Instance size = 16 bytes
First field offset = 12
Payload layout: 4/4
Non atomic flat layout: 4/4
Atomic flat layout: -/-
Nullable flat layout: -/-
*/

/*
*/

import jdk.internal.vm.annotation.*;
import jdk.internal.misc.Unsafe;

class Constants {
    public static final long SOFFSET = 12;
    public static final byte LANE_CNT = 1;
}

@LooselyConsistentValue
value class VectorPayload256MF {
    public float _mfield;
    public VectorPayload256MF(float init) {
        _mfield = init;
    }
}

value class Float256Vector {
    public static Unsafe U = Unsafe.getUnsafe();

    @Strict
    @NullRestricted
    public VectorPayload256MF _payload;
    
    public Float256Vector(VectorPayload256MF payload) {
        _payload = payload;
    }

    // This use of MultiField is an extension to vector API use case 
    // since in vector API we only pass abstract vectors across the
    // method boundaries.
    public static Float256Vector add(Float256Vector augend, Float256Vector addened) {
        augend = U.makePrivateBuffer(augend); 
        for (int i = 0; i < Constants.LANE_CNT; i++) {
            float val1 = U.getFloat(augend, Constants.SOFFSET + Float.BYTES * i);
            float val2 = U.getFloat(addened, Constants.SOFFSET + Float.BYTES * i);
            U.putFloat(augend, Constants.SOFFSET + Float.BYTES * i, val1 + val2);
        }
        augend = U.finishPrivateBuffer(augend);
        return augend; 
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[ " );
        for (int i = 0; i < Constants.LANE_CNT; i++) {
            sb.append(" " + U.getFloat(this, Constants.SOFFSET + Float.BYTES * i));
        }
        sb.append(" ]");
        return sb.toString();
    }
}

public class  valhalla_vector_api_proto {
    public static void main(String [] args) {
        Float256Vector vec = new Float256Vector(new VectorPayload256MF(0.0f));
        for (int i = 0; i < 100000; i++) {
            vec = Float256Vector.add(vec, new Float256Vector(new VectorPayload256MF((float)i)));
        }
        System.out.println("[res] " + vec);
    }
}
