
import jdk.internal.misc.*;

public class unsafe_memory_access {
    public static Unsafe U = Unsafe.getUnsafe();

/*
 69  StoreI  === 60 7 54 12  [[ 85 ]]  @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; unsafe  Memory: @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):NotNull:exact+any *, idx=5; !jvms: unsafe_memory_access::set_value @ bci:12 (line 8)
 77  ConI  === 0  [[ 78 ]]  #int:10
 78  AddI  === _ 12 77  [[ 85 ]]  !jvms: unsafe_memory_access::set_value @ bci:29 (line 9)
 85  StoreI  === 60 69 54 78  [[ 18 ]]  @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; unsafe  Memory: @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):NotNull:exact+any *, idx=5; !jvms: unsafe_memory_access::set_value @ bci:30 (line 9)
 18  MergeMem  === _ 1 7 1 1 85  [[ 87 ]]  { - - N85:int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any * }  Memory: @BotPTR *+bot, idx=Bot;
*/
    public static void set_value(int [] arr, int idx, int value) {

        U.putInt(arr, 16 + idx * Integer.BYTES, value);
/*
 a)
 69  StoreI  === 60 7 54 12  [[ 21 ]]  @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; unsafe  Memory: @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):NotNull:exact+any *, idx=5; !jvms: unsafe_memory_access::set_value @ bci:12 (line 8)
  7  Parm  === 3  [[ 4 13 20 21 27 37 46 49 51 57 63 65 69 ]] Memory  Memory: @BotPTR *+bot, idx=Bot; !jvms: unsafe_memory_access::set_value @ bci:-1 (line 8)
  1  Con  === 0  [[ ]]  #top
 21  MergeMem  === _ 1 7 1 1 69  [[ 22 ]]  { - - N69:int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any * }  Memory: @BotPTR *+bot, idx=Bot; !jvms: unsafe_memory_access::set_value @ bci:-1 (line 8)

 b)  Node *mem = memory(adr_idx);
     Node* st = StoreNode::make(_gvn, ctl, mem, adr, adr_type, val, bt, mo, require_atomic_access);

 c)  After second store, MergeMem input corresponding to int[] alias index is updated with new store.

 Result into formation of chain of stores. 

*/
        U.putInt(arr, 16 + idx * Integer.BYTES, value + 10);

/*
 b)  Node *mem = memory(adr_idx);
     Node* st = StoreNode::make(_gvn, ctl, mem, adr, adr_type, val, bt, mo, require_atomic_access);

 c)  After second store, MergeMem input corresponding to int[] alias index is updated with new store.

 Result into formation of chain of stores. 

*/
    }

    public static int get_value(int [] arr, int idx) {
        //    8      +   4   +  4
        // [markWord][Klass*][length] [payload]
        return U.getInt(arr, 16 + idx * Integer.BYTES);
    }

    public static void main(String [] args) {
        int res = 0;
        int [] arr = new int[1024];
        for (int i = 0; i < 1024; i++) {
            set_value(arr, i, 1000);
            res += get_value(arr, i);
        }
        System.out.println("[res] " + res);
    }
}
