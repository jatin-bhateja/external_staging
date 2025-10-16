
import jdk.internal.misc.*;

public class unsafe_memory_fence {
    public static Unsafe U = Unsafe.getUnsafe();

/*  
 12  Parm  === 3  [[ 86 50 64 70 ]] Parm2: int !jvms: unsafe_memory_fence::access_value_no_fence @ bci:-1 (line 8)
 70  StoreI  === 61 7 55 12  |45  [[ 18 ]]  @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; unsafe  Memory: @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; !jvms: unsafe_memory_fence::access_value_no_fence @ bci:12 (line 8)
 86  Return  === 61 6 18 8 9 returns 12  [[ 0 ]]

 Store forwarding to Return.
*/
    public static int access_value_no_fence(int [] arr, int idx, int value) {
        U.putInt(arr, 16 + idx * Integer.BYTES, value);
        return U.getInt(arr, 16 + idx * Integer.BYTES);
    }

/*
  10  Parm  === 3  [[ 41 99 55 55 64 ]] Parm0: int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact * !orig=[37] !jvms: unsafe_memory_fence::access_value_fence @ bci:-1 (line 13)
  22  MergeMem  === _ 1 7 1 1 70  [[ 74 ]]  { - - N70:int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any * }  Memory: @BotPTR *+bot, idx=Bot; !jvms: unsafe_memory_fence::access_value_fence @ bci:-1 (line 13)
  30  ConI  === 0  [[ 35 ]]  #int:16
  33  ConI  === 0  [[ 34 ]]  #int:2
  34  LShiftI  === _ 11 33  [[ 35 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:8 (line 13)
  35  AddI  === _ 34 30  [[ 36 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:9 (line 13)
  36  ConvI2L  === _ 35  [[ 55 64 50 99 ]]  #long:minint..maxint, 0u..maxulong, widen: 3 !jvms: unsafe_memory_fence::access_value_fence @ bci:10 (line 13)
  40  ConP  === 0  [[ 41 50 50 99 64 ]]  #null
  41  CmpP  === _ 10 40  [[ 42 43 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  42  Bool  === _ 41  [[ 43 ]] [ne] !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  43  If  === 5 42 41  [[ 44 45 ]] P=0.999999, C=-1.000000 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  44  IfFalse  === 43  [[ 50 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  45  IfTrue  === 43  [[ 60 105 70 ]] #1 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  49  ConI  === 0  [[ 50 ]]  #int:-172
  50  CallStaticJava  === 44 6 7 8 9 (49 40 11 1 28 40 36 1 12 ) [[ 51 ]] # Static uncommon_trap(reason='speculate_null_check' action='make_not_entrant' debug_id='0')  void ( int ) C=0.000100 unsafe_memory_fence::access_value_fence @ bci:12 (line 13) !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  51  Proj  === 50  [[ 54 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  54  Halt  === 51 1 1 8 1  [[ 0 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  55  AddP  === _ 10 10 36  [[ 70 105 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  57  Bool  === _ 108  [[ 60 ]] [ne] !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  60  If  === 45 57 108  [[ 61 62 ]] P=0.999999, C=-1.000000 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  61  IfTrue  === 60  [[ 74 70 ]] #1 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  62  IfFalse  === 60  [[ 64 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  63  ConI  === 0  [[ 99 ]]  #int:-10
  64  CallStaticJava  === 62 6 7 8 9 (109 1 1 1 40 10 36 1 12 ) [[ 65 ]] # Static uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')  void ( int ) C=0.000100 unsafe_memory_fence::access_value_fence @ bci:12 (line 13) !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  65  Proj  === 64  [[ 68 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  68  Halt  === 65 1 1 8 1  [[ 0 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  70  StoreI  === 61 7 55 12  |45  [[ 22 ]]  @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; unsafe  Memory: @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; !jvms: unsafe_memory_fence::access_value_fence @ bci:12 (line 13)
  74  MemBarCPUOrder  === 61 1 22 1 1  [[ 75 76 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:18 (line 14)
  75  Proj  === 74  [[ 78 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:18 (line 14)
  76  Proj  === 74  [[ 78 ]] #2  Memory: @BotPTR *+bot, idx=Bot; !jvms: unsafe_memory_fence::access_value_fence @ bci:18 (line 14)
  78  LoadFence  === 75 1 76 1 1  [[ 79 80 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:18 (line 14)
  79  Proj  === 78  [[ 96 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:18 (line 14)
  80  Proj  === 78  [[ 106 83 105 99 ]] #2  Memory: @BotPTR *+bot, idx=Bot; !jvms: unsafe_memory_fence::access_value_fence @ bci:18 (line 14)
  83  LoadN  === _ 80 27  [[ 111 ]]  @java/lang/Class (java/io/Serializable,java/lang/constant/Constable,java/lang/reflect/AnnotatedElement,java/lang/invoke/TypeDescriptor,java/lang/reflect/GenericDeclaration,java/lang/reflect/Type,java/lang/invoke/TypeDescriptor$OfField):exact+120 * [narrow], name=U, idx=4; #narrowoop: jdk/internal/misc/Unsafe:exact * !jvms: unsafe_memory_fence::access_value_fence @ bci:21 (line 15)
  93  Bool  === _ 111  [[ 96 ]] [ne] !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
  96  If  === 79 93 111  [[ 97 98 ]] P=0.999999, C=-1.000000 !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
  97  IfTrue  === 96  [[ 106 105 ]] #1 !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
  98  IfFalse  === 96  [[ 99 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
  99  CallStaticJava  === 98 6 80 8 9 (63 1 1 1 40 10 36 1 ) [[ 100 ]] # Static uncommon_trap(reason='null_check' action='maybe_recompile' debug_id='0')  void ( int ) C=0.000100 unsafe_memory_fence::access_value_fence @ bci:32 (line 15) !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
 100  Proj  === 99  [[ 103 ]] #0 !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
 103  Halt  === 100 1 1 8 1  [[ 0 ]]  !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
 105  LoadI  === 97 80 55  |45  [[ 106 ]]  @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=5; unsafe #int (does not depend only on test, unknown control) !jvms: unsafe_memory_fence::access_value_fence @ bci:32 (line 15)
 106  Return  === 97 6 80 8 9 returns 105  [[ 0 ]]

  C2 compiler does not forwards stored value to a later load across full fence 
      - find_previous_store
*/
    public static int access_value_fence(int [] arr, int idx, int value) {
        U.putInt(arr, 16 + idx * Integer.BYTES, value);
        U.fullFence();
        return U.getInt(arr, 16 + idx * Integer.BYTES);
    }

    public static int access_value_fence2(int [] arr, int idx, int value) {
        U.putInt(arr, 16 + idx * Integer.BYTES, value);
        U.putInt(arr, 20, value);
        // Technically a load fence only prevents re-ordering of succeeding memory operations
        // It should allow value forwarding from previous store.
        U.loadFence();
        U.putInt(arr, 16, value);
        return U.getInt(arr, 20);
    }

    interface micro {
        public int apply(int[] arr, int idx, int value);
    }

    public static void main(String [] args) {
        int res = 0;
        int [] arr = new int[1024];
        micro func = 
          Integer.parseInt(args[0]) == 0 ? 
              new micro() {
                 public int apply(int [] arr, int idx, int value) {
                     return access_value_fence2(arr, idx, value); 
                 }
              }
              :
              new micro() {
                 public int apply(int [] arr, int idx, int value) {
                     return access_value_no_fence(arr, idx, value); 
                 }
              };
        
        for (int i = 0; i < 1024; i++) {
            res += func.apply(arr, i, 1000);
        }
        System.out.println("[res] " + res);
    }
}
