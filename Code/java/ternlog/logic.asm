Classfile /home/jatinbha/code/java/ternlog/logic.class
  Last modified Feb 24, 2020; size 1425 bytes
  SHA-256 checksum 4cc6db323461de6733e23b6095d0775aa29cc487f0e2a736e1ddeb68926f5d16
  Compiled from "logic_big_tree.java"
class logic
  minor version: 0
  major version: 59
  flags: (0x0020) ACC_SUPER
  this_class: #7                          // logic
  super_class: #2                         // java/lang/Object
  interfaces: 0, fields: 1, methods: 3, attributes: 3
Constant pool:
   #1 = Methodref          #2.#3          // java/lang/Object."<init>":()V
   #2 = Class              #4             // java/lang/Object
   #3 = NameAndType        #5:#6          // "<init>":()V
   #4 = Utf8               java/lang/Object
   #5 = Utf8               <init>
   #6 = Utf8               ()V
   #7 = Class              #8             // logic
   #8 = Utf8               logic
   #9 = Integer            900000
  #10 = Methodref          #7.#11         // logic.workload:([I[I[I[I)V
  #11 = NameAndType        #12:#13        // workload:([I[I[I[I)V
  #12 = Utf8               workload
  #13 = Utf8               ([I[I[I[I)V
  #14 = Methodref          #15.#16        // java/lang/System.nanoTime:()J
  #15 = Class              #17            // java/lang/System
  #16 = NameAndType        #18:#19        // nanoTime:()J
  #17 = Utf8               java/lang/System
  #18 = Utf8               nanoTime
  #19 = Utf8               ()J
  #20 = Fieldref           #15.#21        // java/lang/System.out:Ljava/io/PrintStream;
  #21 = NameAndType        #22:#23        // out:Ljava/io/PrintStream;
  #22 = Utf8               out
  #23 = Utf8               Ljava/io/PrintStream;
  #24 = Long               1000l
  #26 = InvokeDynamic      #0:#27         // #0:makeConcatWithConstants:(J)Ljava/lang/String;
  #27 = NameAndType        #28:#29        // makeConcatWithConstants:(J)Ljava/lang/String;
  #28 = Utf8               makeConcatWithConstants
  #29 = Utf8               (J)Ljava/lang/String;
  #30 = Methodref          #31.#32        // java/io/PrintStream.println:(Ljava/lang/String;)V
  #31 = Class              #33            // java/io/PrintStream
  #32 = NameAndType        #34:#35        // println:(Ljava/lang/String;)V
  #33 = Utf8               java/io/PrintStream
  #34 = Utf8               println
  #35 = Utf8               (Ljava/lang/String;)V
  #36 = Utf8               VECLEN
  #37 = Utf8               I
  #38 = Utf8               ConstantValue
  #39 = Integer            2048
  #40 = Utf8               Code
  #41 = Utf8               LineNumberTable
  #42 = Utf8               StackMapTable
  #43 = Utf8               main
  #44 = Utf8               ([Ljava/lang/String;)V
  #45 = Class              #46            // "[Ljava/lang/String;"
  #46 = Utf8               [Ljava/lang/String;
  #47 = Class              #48            // "[I"
  #48 = Utf8               [I
  #49 = Utf8               SourceFile
  #50 = Utf8               logic_big_tree.java
  #51 = Utf8               BootstrapMethods
  #52 = MethodHandle       6:#53          // REF_invokeStatic java/lang/invoke/StringConcatFactory.makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #53 = Methodref          #54.#55        // java/lang/invoke/StringConcatFactory.makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #54 = Class              #56            // java/lang/invoke/StringConcatFactory
  #55 = NameAndType        #28:#57        // makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #56 = Utf8               java/lang/invoke/StringConcatFactory
  #57 = Utf8               (Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
  #58 = String             #59            // [Time] \u0001 us
  #59 = Utf8               [Time] \u0001 us
  #60 = Utf8               InnerClasses
  #61 = Class              #62            // java/lang/invoke/MethodHandles$Lookup
  #62 = Utf8               java/lang/invoke/MethodHandles$Lookup
  #63 = Class              #64            // java/lang/invoke/MethodHandles
  #64 = Utf8               java/lang/invoke/MethodHandles
  #65 = Utf8               Lookup
{
  public static final int VECLEN;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 2048

  logic();
    descriptor: ()V
    flags: (0x0000)
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0
         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         4: return
      LineNumberTable:
        line 4: 0

  public static void workload(int[], int[], int[], int[]);
    descriptor: ([I[I[I[I)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=7, locals=5, args_size=4
         0: iconst_0
         1: istore        4
         3: iload         4
         5: aload_0
         6: arraylength
         7: if_icmpge     85
        10: aload_0
        11: iload         4
        13: aload_1
        14: iload         4
        16: iaload
        17: aload_2
        18: iload         4
        20: iaload
        21: iand
        22: aload_1
        23: iload         4
        25: iaload
        26: aload_3
        27: iload         4
        29: iaload
        30: iand
        31: ixor
        32: aload_2
        33: iload         4
        35: iaload
        36: aload_3
        37: iload         4
        39: iaload
        40: iand
        41: ixor
        42: aload_1
        43: iload         4
        45: iaload
        46: iconst_m1
        47: ixor
        48: aload_2
        49: iload         4
        51: iaload
        52: iand
        53: aload_2
        54: iload         4
        56: iaload
        57: iconst_m1
        58: ixor
        59: aload_3
        60: iload         4
        62: iaload
        63: iand
        64: ior
        65: aload_3
        66: iload         4
        68: iaload
        69: iconst_m1
        70: ixor
        71: aload_1
        72: iload         4
        74: iaload
        75: iand
        76: ior
        77: iand
        78: iastore
        79: iinc          4, 1
        82: goto          3
        85: return
      LineNumberTable:
        line 8: 0
        line 9: 10
        line 8: 79
        line 13: 85
      StackMapTable: number_of_entries = 2
        frame_type = 252 /* append */
          offset_delta = 3
          locals = [ int ]
        frame_type = 250 /* chop */
          offset_delta = 81

  public static void main(java.lang.String[]);
    descriptor: ([Ljava/lang/String;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=9, args_size=1
         0: sipush        2048
         3: newarray       int
         5: astore_1
         6: sipush        2048
         9: newarray       int
        11: astore_2
        12: sipush        2048
        15: newarray       int
        17: astore_3
        18: sipush        2048
        21: newarray       int
        23: astore        4
        25: iconst_0
        26: istore        5
        28: iload         5
        30: sipush        2048
        33: if_icmpge     64
        36: aload_2
        37: iload         5
        39: sipush        426
        42: iastore
        43: aload_3
        44: iload         5
        46: sipush        426
        49: iastore
        50: aload         4
        52: iload         5
        54: sipush        426
        57: iastore
        58: iinc          5, 1
        61: goto          28
        64: iconst_0
        65: istore        5
        67: iload         5
        69: ldc           #9                  // int 900000
        71: if_icmpge     88
        74: aload_1
        75: aload_2
        76: aload_3
        77: aload         4
        79: invokestatic  #10                 // Method workload:([I[I[I[I)V
        82: iinc          5, 1
        85: goto          67
        88: invokestatic  #14                 // Method java/lang/System.nanoTime:()J
        91: lstore        5
        93: iconst_0
        94: istore        7
        96: iload         7
        98: sipush        1000
       101: if_icmpge     118
       104: aload_1
       105: aload_2
       106: aload_3
       107: aload         4
       109: invokestatic  #10                 // Method workload:([I[I[I[I)V
       112: iinc          7, 1
       115: goto          96
       118: invokestatic  #14                 // Method java/lang/System.nanoTime:()J
       121: lstore        7
       123: getstatic     #20                 // Field java/lang/System.out:Ljava/io/PrintStream;
       126: lload         7
       128: lload         5
       130: lsub
       131: ldc2_w        #24                 // long 1000l
       134: ldiv
       135: invokedynamic #26,  0             // InvokeDynamic #0:makeConcatWithConstants:(J)Ljava/lang/String;
       140: invokevirtual #30                 // Method java/io/PrintStream.println:(Ljava/lang/String;)V
       143: return
      LineNumberTable:
        line 16: 0
        line 18: 6
        line 19: 12
        line 20: 18
        line 22: 25
        line 23: 36
        line 24: 43
        line 25: 50
        line 22: 58
        line 28: 64
        line 29: 74
        line 28: 82
        line 32: 88
        line 33: 93
        line 34: 104
        line 33: 112
        line 35: 118
        line 39: 123
        line 40: 143
      StackMapTable: number_of_entries = 6
        frame_type = 255 /* full_frame */
          offset_delta = 28
          locals = [ class "[Ljava/lang/String;", class "[I", class "[I", class "[I", class "[I", int ]
          stack = []
        frame_type = 250 /* chop */
          offset_delta = 35
        frame_type = 252 /* append */
          offset_delta = 2
          locals = [ int ]
        frame_type = 250 /* chop */
          offset_delta = 20
        frame_type = 253 /* append */
          offset_delta = 7
          locals = [ long, int ]
        frame_type = 250 /* chop */
          offset_delta = 21
}
SourceFile: "logic_big_tree.java"
BootstrapMethods:
  0: #52 REF_invokeStatic java/lang/invoke/StringConcatFactory.makeConcatWithConstants:(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/invoke/CallSite;
    Method arguments:
      #58 [Time] \u0001 us
InnerClasses:
  public static final #65= #61 of #63;    // Lookup=class java/lang/invoke/MethodHandles$Lookup of class java/lang/invoke/MethodHandles
