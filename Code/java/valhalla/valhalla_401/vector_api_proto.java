
// Compile: javac --enable-preview -source 25 --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -cp . vector_api_proto.java

// Run:     java -Xbootclasspath/a:. --enable-preview --add-exports=java.base/jdk.internal.vm.annotation=ALL-UNNAMED -XX:+UseNonAtomicValueFlattening --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED -XX:-PauseAtStartup -XX:PrintInlineLayout -cp . vector_api_proto

/*
    Layout of class VectorPayload256MF@0x7d5c900b39a0 extends java/lang/Object@0x7d5c900b39a0
    Instance fields:
     @0 RESERVED 12/-
     @12 PADDING 4/1
     @16 "_mfield" F 4/4 MULTIFIELD
     @20 "_mfield#1" F 4/4 MULTIFIELD
     @24 "_mfield#2" F 4/4 MULTIFIELD
     @28 "_mfield#3" F 4/4 MULTIFIELD
     @32 "_mfield#4" F 4/4 MULTIFIELD
     @36 "_mfield#5" F 4/4 MULTIFIELD
     @40 "_mfield#6" F 4/4 MULTIFIELD
     @44 "_mfield#7" F 4/4 MULTIFIELD
    Static fields:
     @0 RESERVED 120/-
     @120 REGULAR 4/4 ".null_reset" Ljava/lang/Object;
    Instance size = 48 bytes
    First field offset = 16
    Payload layout: 32/8
    Non atomic flat layout: 32/8
    Atomic flat layout: -/-
    Nullable flat layout: -/-
    ---
    Layout of class Float256Vector@0x7d5c900b39a0 extends java/lang/Object@0x7d5c900b39a0
    Instance fields:
     @0 RESERVED 12/-
     @12 PADDING 4/1
     @16 FLAT 32/8 "_payload" LVectorPayload256MF; VectorPayload256MF@0x7d5c900b39a0 NON_ATOMIC_FLAT
    Static fields:
     @0 RESERVED 120/-
     @120 REGULAR 4/4 "U" Ljdk/internal/misc/Unsafe;
     @124 REGULAR 4/4 ".null_reset" Ljava/lang/Object;
    Instance size = 48 bytes
    First field offset = 16
*/

/*
    (gdb) p vk->extended_sig ()->length()
    $108 = 12
    (gdb) p vk->extended_sig ()->at(0)->_symbol->as_C_string()
    $109 = 0x72e734030208 "Float256Vector"
    (gdb) p vk->extended_sig ()->at(1)->_symbol->as_C_string()
    $110 = 0x72e734030218 "VectorPayload256MF"
    (gdb) p vk->extended_sig ()->at(2)->_symbol->as_C_string()
    $111 = 0x72e734030230 "F"
    (gdb) p vk->extended_sig ()->at(3)->_symbol->as_C_string()
    $112 = 0x72e734030238 "F"
    (gdb) p vk->extended_sig ()->at(4)->_symbol->as_C_string()
    $113 = 0x72e734030240 "F"
    (gdb) p vk->extended_sig ()->at(5)->_symbol->as_C_string()
    $114 = 0x72e734030248 "F"
    (gdb) p vk->extended_sig ()->at(6)->_symbol->as_C_string()
    $115 = 0x72e734030250 "F"
    (gdb) p vk->extended_sig ()->at(7)->_symbol->as_C_string()
    $116 = 0x72e734030258 "F"
    (gdb) p vk->extended_sig ()->at(8)->_symbol->as_C_string()
    $117 = 0x72e734030260 "F"
    (gdb) p vk->extended_sig ()->at(9)->_symbol->as_C_string()
    $118 = 0x72e734030268 "F"
    (gdb) p vk->extended_sig ()->at(10)->_symbol->as_C_string()
    $119 = 0x72e734030270 "VectorPayload256MF"
    (gdb) p vk->extended_sig ()->at(11)->_symbol->as_C_string()
    $120 = 0x72e734030288 "Float256Vector"
    (gdb) f
    #2  CompiledEntrySignature::compute_calling_conventions (this=0x72e73b872010, init=true)
        at /mnt/c/Github/valhalla+vector/src/hotspot/share/runtime/sharedRuntime.cpp:2869
    2869                _sig_cc->appendAll(vk->extended_sig());
    (gdb)

    MultiField
      -> parse_fields
           -> creates multipled FieldInfo one base and each synthetic element of @MultiField
      -> build_layout
           -> MultiFieldGroup (for base multifield)
           -> One LayoutRawBlock for each synthetic multifield.
           -> LayoutRawBlock is assigned offsets and are schedule able entity in layout compuation.
*/

import jdk.internal.vm.annotation.*;
import jdk.internal.misc.Unsafe;

@LooselyConsistentValue
value class VectorPayload256MF {
    @MultiField(value=8)
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

    // This a use of MultiField is an extension to vector API use case 
    // since in vector API we only pass abstract vectors across the
    // method boundaries.
    public static Float256Vector add(Float256Vector augend, Float256Vector addened) {
        augend = U.makePrivateBuffer(augend); 
        for (int i = 0; i < 8; i++) {
            float val1 = U.getFloat(augend, 16 + 4 * i);
            float val2 = U.getFloat(addened, 16 + 4 * i);
            U.putFloat(augend, 16 + 4 * i, val1 + val2);
        }
        augend = U.finishPrivateBuffer(augend);
        return augend; 
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[ " );
        for (int i = 0; i < 8; i++) {
            sb.append(" " + U.getFloat(this, 16 + 4 * i));
        }
        sb.append(" ]");
        return sb.toString();
    }
}

public class  vector_api_proto {
    public static void main(String [] args) {
        Float256Vector vec = new Float256Vector(new VectorPayload256MF(0.0f));
        for (int i = 0; i < 100000; i++) {
            vec = Float256Vector.add(vec, new Float256Vector(new VectorPayload256MF((float)i)));
        }
        System.out.println("[res] " + vec);
    }
}
