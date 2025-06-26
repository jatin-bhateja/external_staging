Classfile /home/jatinbha/sandboxes/valhalla/valhalla/build/linux-x86_64-server-slowdebug/jdk/modules/java.base/jdk/internal/vm/vector/VectorSupport.class
  Last modified 15-Nov-2022; size 35133 bytes
  SHA-256 checksum d4ede0f18ac1c7a52deb3a3ce16d72a491e0a277fb069362c920993c289f1b6e
  Compiled from "VectorSupport.java"
public class jdk.internal.vm.vector.VectorSupport
  minor version: 0
  major version: 64
  flags: (0x0021) ACC_PUBLIC, ACC_SUPER
  this_class: #1                          // jdk/internal/vm/vector/VectorSupport
  super_class: #4                         // java/lang/Object
  interfaces: 0, fields: 76, methods: 30, attributes: 3
Constant pool:
    #1 = Class              #2            // jdk/internal/vm/vector/VectorSupport
    #2 = Utf8               jdk/internal/vm/vector/VectorSupport
    #3 = Methodref          #4.#5         // java/lang/Object."<init>":()V
    #4 = Class              #6            // java/lang/Object
    #5 = NameAndType        #7:#8         // "<init>":()V
    #6 = Utf8               java/lang/Object
    #7 = Utf8               <init>
    #8 = Utf8               ()V
    #9 = Fieldref           #1.#10        // jdk/internal/vm/vector/VectorSupport.$assertionsDisabled:Z
   #10 = NameAndType        #11:#12       // $assertionsDisabled:Z
   #11 = Utf8               $assertionsDisabled
   #12 = Utf8               Z
   #13 = Methodref          #1.#14        // jdk/internal/vm/vector/VectorSupport.isNonCapturingLambda:(Ljava/lang/Object;)Z
   #14 = NameAndType        #15:#16       // isNonCapturingLambda:(Ljava/lang/Object;)Z
   #15 = Utf8               isNonCapturingLambda
   #16 = Utf8               (Ljava/lang/Object;)Z
   #17 = Class              #18           // java/lang/AssertionError
   #18 = Utf8               java/lang/AssertionError
   #19 = Methodref          #17.#20       // java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
   #20 = NameAndType        #7:#21        // "<init>":(Ljava/lang/Object;)V
   #21 = Utf8               (Ljava/lang/Object;)V
   #22 = InterfaceMethodref #23.#24       // jdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation.fromBits:(JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #23 = Class              #25           // jdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation
   #24 = NameAndType        #26:#27       // fromBits:(JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #25 = Utf8               jdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation
   #26 = Utf8               fromBits
   #27 = Utf8               (JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #28 = InterfaceMethodref #29.#30       // jdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation.apply:(IIILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
   #29 = Class              #31           // jdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation
   #30 = NameAndType        #32:#33       // apply:(IIILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
   #31 = Utf8               jdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation
   #32 = Utf8               apply
   #33 = Utf8               (IIILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
   #34 = InterfaceMethodref #35.#36       // jdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #35 = Class              #37           // jdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation
   #36 = NameAndType        #32:#38       // apply:(Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #37 = Utf8               jdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation
   #38 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #39 = InterfaceMethodref #40.#41       // jdk/internal/vm/vector/VectorSupport$IndexOperation.index:(Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #40 = Class              #42           // jdk/internal/vm/vector/VectorSupport$IndexOperation
   #41 = NameAndType        #43:#44       // index:(Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #42 = Utf8               jdk/internal/vm/vector/VectorSupport$IndexOperation
   #43 = Utf8               index
   #44 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #45 = InterfaceMethodref #46.#47       // jdk/internal/vm/vector/VectorSupport$ReductionOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
   #46 = Class              #48           // jdk/internal/vm/vector/VectorSupport$ReductionOperation
   #47 = NameAndType        #32:#49       // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
   #48 = Utf8               jdk/internal/vm/vector/VectorSupport$ReductionOperation
   #49 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
   #50 = InterfaceMethodref #51.#52       // jdk/internal/vm/vector/VectorSupport$VecExtractOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;I)J
   #51 = Class              #53           // jdk/internal/vm/vector/VectorSupport$VecExtractOp
   #52 = NameAndType        #32:#54       // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;I)J
   #53 = Utf8               jdk/internal/vm/vector/VectorSupport$VecExtractOp
   #54 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;I)J
   #55 = InterfaceMethodref #56.#57       // jdk/internal/vm/vector/VectorSupport$VecInsertOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;IJ)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #56 = Class              #58           // jdk/internal/vm/vector/VectorSupport$VecInsertOp
   #57 = NameAndType        #32:#59       // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;IJ)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #58 = Utf8               jdk/internal/vm/vector/VectorSupport$VecInsertOp
   #59 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;IJ)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #60 = InterfaceMethodref #61.#62       // jdk/internal/vm/vector/VectorSupport$UnaryOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #61 = Class              #63           // jdk/internal/vm/vector/VectorSupport$UnaryOperation
   #62 = NameAndType        #32:#64       // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #63 = Utf8               jdk/internal/vm/vector/VectorSupport$UnaryOperation
   #64 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #65 = InterfaceMethodref #66.#67       // jdk/internal/vm/vector/VectorSupport$BinaryOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #66 = Class              #68           // jdk/internal/vm/vector/VectorSupport$BinaryOperation
   #67 = NameAndType        #32:#69       // apply:(Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #68 = Utf8               jdk/internal/vm/vector/VectorSupport$BinaryOperation
   #69 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #70 = InterfaceMethodref #71.#72       // jdk/internal/vm/vector/VectorSupport$TernaryOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #71 = Class              #73           // jdk/internal/vm/vector/VectorSupport$TernaryOperation
   #72 = NameAndType        #32:#74       // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #73 = Utf8               jdk/internal/vm/vector/VectorSupport$TernaryOperation
   #74 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #75 = InterfaceMethodref #76.#77       // jdk/internal/vm/vector/VectorSupport$LoadOperation.load:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #76 = Class              #78           // jdk/internal/vm/vector/VectorSupport$LoadOperation
   #77 = NameAndType        #79:#80       // load:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #78 = Utf8               jdk/internal/vm/vector/VectorSupport$LoadOperation
   #79 = Utf8               load
   #80 = Utf8               (Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
   #81 = InterfaceMethodref #82.#83       // jdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation.load:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #82 = Class              #84           // jdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation
   #83 = NameAndType        #79:#85       // load:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #84 = Utf8               jdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation
   #85 = Utf8               (Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #86 = InterfaceMethodref #87.#88       // jdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap.loadWithMap:(Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #87 = Class              #89           // jdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap
   #88 = NameAndType        #90:#91       // loadWithMap:(Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #89 = Utf8               jdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap
   #90 = Utf8               loadWithMap
   #91 = Utf8               (Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
   #92 = InterfaceMethodref #93.#94       // jdk/internal/vm/vector/VectorSupport$StoreVectorOperation.store:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorPayload;)V
   #93 = Class              #95           // jdk/internal/vm/vector/VectorSupport$StoreVectorOperation
   #94 = NameAndType        #96:#97       // store:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorPayload;)V
   #95 = Utf8               jdk/internal/vm/vector/VectorSupport$StoreVectorOperation
   #96 = Utf8               store
   #97 = Utf8               (Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorPayload;)V
   #98 = InterfaceMethodref #99.#100      // jdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation.store:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)V
   #99 = Class              #101          // jdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation
  #100 = NameAndType        #96:#102      // store:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)V
  #101 = Utf8               jdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation
  #102 = Utf8               (Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)V
  #103 = InterfaceMethodref #104.#105     // jdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap.storeWithMap:(Ljava/lang/Object;ILjdk/internal/vm/vector/VectorSupport$Vector;[IILjdk/internal/vm/vector/VectorSupport$VectorMask;)V
  #104 = Class              #106          // jdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap
  #105 = NameAndType        #107:#108     // storeWithMap:(Ljava/lang/Object;ILjdk/internal/vm/vector/VectorSupport$Vector;[IILjdk/internal/vm/vector/VectorSupport$VectorMask;)V
  #106 = Utf8               jdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap
  #107 = Utf8               storeWithMap
  #108 = Utf8               (Ljava/lang/Object;ILjdk/internal/vm/vector/VectorSupport$Vector;[IILjdk/internal/vm/vector/VectorSupport$VectorMask;)V
  #109 = InterfaceMethodref #110.#111     // java/util/function/BiFunction.apply:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  #110 = Class              #112          // java/util/function/BiFunction
  #111 = NameAndType        #32:#113      // apply:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  #112 = Utf8               java/util/function/BiFunction
  #113 = Utf8               (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  #114 = Class              #115          // java/lang/Boolean
  #115 = Utf8               java/lang/Boolean
  #116 = Methodref          #114.#117     // java/lang/Boolean.booleanValue:()Z
  #117 = NameAndType        #118:#119     // booleanValue:()Z
  #118 = Utf8               booleanValue
  #119 = Utf8               ()Z
  #120 = InterfaceMethodref #121.#122     // jdk/internal/vm/vector/VectorSupport$VectorCompareOp.apply:(ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorMask;
  #121 = Class              #123          // jdk/internal/vm/vector/VectorSupport$VectorCompareOp
  #122 = NameAndType        #32:#124      // apply:(ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorMask;
  #123 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorCompareOp
  #124 = Utf8               (ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorMask;
  #125 = InterfaceMethodref #126.#127     // jdk/internal/vm/vector/VectorSupport$VectorRearrangeOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #126 = Class              #128          // jdk/internal/vm/vector/VectorSupport$VectorRearrangeOp
  #127 = NameAndType        #32:#129      // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #128 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorRearrangeOp
  #129 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #130 = InterfaceMethodref #131.#132     // jdk/internal/vm/vector/VectorSupport$VectorBlendOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #131 = Class              #133          // jdk/internal/vm/vector/VectorSupport$VectorBlendOp
  #132 = NameAndType        #32:#134      // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #133 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorBlendOp
  #134 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #135 = InterfaceMethodref #136.#137     // jdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #136 = Class              #138          // jdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp
  #137 = NameAndType        #32:#139      // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #138 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp
  #139 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #140 = InterfaceMethodref #141.#142     // jdk/internal/vm/vector/VectorSupport$VectorConvertOp.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #141 = Class              #143          // jdk/internal/vm/vector/VectorSupport$VectorConvertOp
  #142 = NameAndType        #32:#144      // apply:(Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #143 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorConvertOp
  #144 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #145 = InterfaceMethodref #146.#147     // jdk/internal/vm/vector/VectorSupport$CompressExpandOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #146 = Class              #148          // jdk/internal/vm/vector/VectorSupport$CompressExpandOperation
  #147 = NameAndType        #32:#149      // apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #148 = Utf8               jdk/internal/vm/vector/VectorSupport$CompressExpandOperation
  #149 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #150 = Fieldref           #1.#151       // jdk/internal/vm/vector/VectorSupport.U:Ljdk/internal/misc/Unsafe;
  #151 = NameAndType        #152:#153     // U:Ljdk/internal/misc/Unsafe;
  #152 = Utf8               U
  #153 = Utf8               Ljdk/internal/misc/Unsafe;
  #154 = Methodref          #155.#156     // jdk/internal/misc/Unsafe.loadFence:()V
  #155 = Class              #157          // jdk/internal/misc/Unsafe
  #156 = NameAndType        #158:#8       // loadFence:()V
  #157 = Utf8               jdk/internal/misc/Unsafe
  #158 = Utf8               loadFence
  #159 = InterfaceMethodref #160.#161     // jdk/internal/vm/vector/VectorSupport$VectorMaskOp.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
  #160 = Class              #162          // jdk/internal/vm/vector/VectorSupport$VectorMaskOp
  #161 = NameAndType        #32:#163      // apply:(Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
  #162 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorMaskOp
  #163 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
  #164 = Methodref          #4.#165       // java/lang/Object.getClass:()Ljava/lang/Class;
  #165 = NameAndType        #166:#167     // getClass:()Ljava/lang/Class;
  #166 = Utf8               getClass
  #167 = Utf8               ()Ljava/lang/Class;
  #168 = Methodref          #169.#170     // java/lang/Class.getDeclaredFields:()[Ljava/lang/reflect/Field;
  #169 = Class              #171          // java/lang/Class
  #170 = NameAndType        #172:#173     // getDeclaredFields:()[Ljava/lang/reflect/Field;
  #171 = Utf8               java/lang/Class
  #172 = Utf8               getDeclaredFields
  #173 = Utf8               ()[Ljava/lang/reflect/Field;
  #174 = Methodref          #169.#175     // java/lang/Class.desiredAssertionStatus:()Z
  #175 = NameAndType        #176:#119     // desiredAssertionStatus:()Z
  #176 = Utf8               desiredAssertionStatus
  #177 = Methodref          #1.#178       // jdk/internal/vm/vector/VectorSupport.registerNatives:()I
  #178 = NameAndType        #179:#180     // registerNatives:()I
  #179 = Utf8               registerNatives
  #180 = Utf8               ()I
  #181 = Methodref          #155.#182     // jdk/internal/misc/Unsafe.getUnsafe:()Ljdk/internal/misc/Unsafe;
  #182 = NameAndType        #183:#184     // getUnsafe:()Ljdk/internal/misc/Unsafe;
  #183 = Utf8               getUnsafe
  #184 = Utf8               ()Ljdk/internal/misc/Unsafe;
  #185 = Utf8               VECTOR_OP_ABS
  #186 = Utf8               I
  #187 = Utf8               ConstantValue
  #188 = Integer            0
  #189 = Utf8               VECTOR_OP_NEG
  #190 = Integer            1
  #191 = Utf8               VECTOR_OP_SQRT
  #192 = Integer            2
  #193 = Utf8               VECTOR_OP_BIT_COUNT
  #194 = Integer            3
  #195 = Utf8               VECTOR_OP_ADD
  #196 = Integer            4
  #197 = Utf8               VECTOR_OP_SUB
  #198 = Integer            5
  #199 = Utf8               VECTOR_OP_MUL
  #200 = Integer            6
  #201 = Utf8               VECTOR_OP_DIV
  #202 = Integer            7
  #203 = Utf8               VECTOR_OP_MIN
  #204 = Integer            8
  #205 = Utf8               VECTOR_OP_MAX
  #206 = Integer            9
  #207 = Utf8               VECTOR_OP_AND
  #208 = Integer            10
  #209 = Utf8               VECTOR_OP_OR
  #210 = Integer            11
  #211 = Utf8               VECTOR_OP_XOR
  #212 = Integer            12
  #213 = Utf8               VECTOR_OP_FMA
  #214 = Integer            13
  #215 = Utf8               VECTOR_OP_LSHIFT
  #216 = Integer            14
  #217 = Utf8               VECTOR_OP_RSHIFT
  #218 = Integer            15
  #219 = Utf8               VECTOR_OP_URSHIFT
  #220 = Integer            16
  #221 = Utf8               VECTOR_OP_CAST
  #222 = Integer            17
  #223 = Utf8               VECTOR_OP_UCAST
  #224 = Integer            18
  #225 = Utf8               VECTOR_OP_REINTERPRET
  #226 = Integer            19
  #227 = Utf8               VECTOR_OP_MASK_TRUECOUNT
  #228 = Integer            20
  #229 = Utf8               VECTOR_OP_MASK_FIRSTTRUE
  #230 = Integer            21
  #231 = Utf8               VECTOR_OP_MASK_LASTTRUE
  #232 = Integer            22
  #233 = Utf8               VECTOR_OP_MASK_TOLONG
  #234 = Integer            23
  #235 = Utf8               VECTOR_OP_LROTATE
  #236 = Integer            24
  #237 = Utf8               VECTOR_OP_RROTATE
  #238 = Integer            25
  #239 = Utf8               VECTOR_OP_COMPRESS
  #240 = Integer            26
  #241 = Utf8               VECTOR_OP_EXPAND
  #242 = Integer            27
  #243 = Utf8               VECTOR_OP_MASK_COMPRESS
  #244 = Integer            28
  #245 = Utf8               VECTOR_OP_TZ_COUNT
  #246 = Integer            29
  #247 = Utf8               VECTOR_OP_LZ_COUNT
  #248 = Integer            30
  #249 = Utf8               VECTOR_OP_REVERSE
  #250 = Integer            31
  #251 = Utf8               VECTOR_OP_REVERSE_BYTES
  #252 = Integer            32
  #253 = Utf8               VECTOR_OP_COMPRESS_BITS
  #254 = Integer            33
  #255 = Utf8               VECTOR_OP_EXPAND_BITS
  #256 = Integer            34
  #257 = Utf8               VECTOR_OP_TAN
  #258 = Integer            101
  #259 = Utf8               VECTOR_OP_TANH
  #260 = Integer            102
  #261 = Utf8               VECTOR_OP_SIN
  #262 = Integer            103
  #263 = Utf8               VECTOR_OP_SINH
  #264 = Integer            104
  #265 = Utf8               VECTOR_OP_COS
  #266 = Integer            105
  #267 = Utf8               VECTOR_OP_COSH
  #268 = Integer            106
  #269 = Utf8               VECTOR_OP_ASIN
  #270 = Integer            107
  #271 = Utf8               VECTOR_OP_ACOS
  #272 = Integer            108
  #273 = Utf8               VECTOR_OP_ATAN
  #274 = Integer            109
  #275 = Utf8               VECTOR_OP_ATAN2
  #276 = Integer            110
  #277 = Utf8               VECTOR_OP_CBRT
  #278 = Integer            111
  #279 = Utf8               VECTOR_OP_LOG
  #280 = Integer            112
  #281 = Utf8               VECTOR_OP_LOG10
  #282 = Integer            113
  #283 = Utf8               VECTOR_OP_LOG1P
  #284 = Integer            114
  #285 = Utf8               VECTOR_OP_POW
  #286 = Integer            115
  #287 = Utf8               VECTOR_OP_EXP
  #288 = Integer            116
  #289 = Utf8               VECTOR_OP_EXPM1
  #290 = Integer            117
  #291 = Utf8               VECTOR_OP_HYPOT
  #292 = Integer            118
  #293 = Utf8               BT_eq
  #294 = Utf8               BT_ne
  #295 = Utf8               BT_le
  #296 = Utf8               BT_ge
  #297 = Utf8               BT_lt
  #298 = Utf8               BT_gt
  #299 = Utf8               BT_overflow
  #300 = Utf8               BT_no_overflow
  #301 = Utf8               BT_unsigned_compare
  #302 = Utf8               BT_ule
  #303 = Utf8               BT_uge
  #304 = Utf8               BT_ult
  #305 = Utf8               BT_ugt
  #306 = Utf8               MODE_BROADCAST
  #307 = Utf8               MODE_BITS_COERCED_LONG_TO_MASK
  #308 = Utf8               T_FLOAT
  #309 = Utf8               T_DOUBLE
  #310 = Utf8               T_BYTE
  #311 = Utf8               T_SHORT
  #312 = Utf8               T_INT
  #313 = Utf8               T_LONG
  #314 = Utf8               Code
  #315 = Utf8               LineNumberTable
  #316 = Utf8               LocalVariableTable
  #317 = Utf8               this
  #318 = Utf8               Ljdk/internal/vm/vector/VectorSupport;
  #319 = Utf8               fromBitsCoerced
  #320 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;IJILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #321 = Utf8               vmClass
  #322 = Utf8               Ljava/lang/Class;
  #323 = Utf8               eClass
  #324 = Utf8               length
  #325 = Utf8               bits
  #326 = Utf8               J
  #327 = Utf8               mode
  #328 = Utf8               s
  #329 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
  #330 = Utf8               defaultImpl
  #331 = Utf8               Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation;
  #332 = Utf8               LocalVariableTypeTable
  #333 = Utf8               Ljava/lang/Class<+TVM;>;
  #334 = Utf8               Ljava/lang/Class<TE;>;
  #335 = Utf8               TS;
  #336 = Utf8               Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation<TVM;TS;>;
  #337 = Utf8               StackMapTable
  #338 = Utf8               Signature
  #339 = Utf8               <VM:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TVM;>;Ljava/lang/Class<TE;>;IJITS;Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation<TVM;TS;>;)TVM;
  #340 = Utf8               RuntimeVisibleAnnotations
  #341 = Utf8               Ljdk/internal/vm/annotation/IntrinsicCandidate;
  #342 = Utf8               shuffleIota
  #343 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;IIIILjdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
  #344 = Utf8               shClass
  #345 = Utf8               start
  #346 = Utf8               step
  #347 = Utf8               wrap
  #348 = Utf8               Ljdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation;
  #349 = Utf8               Ljava/lang/Class<+TSH;>;
  #350 = Utf8               Ljdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation<TS;TSH;>;
  #351 = Utf8               <E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;SH:Ljdk/internal/vm/vector/VectorSupport$VectorShuffle<TE;>;>(Ljava/lang/Class<TE;>;Ljava/lang/Class<+TSH;>;TS;IIIILjdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation<TS;TSH;>;)TSH;
  #352 = Utf8               shuffleToVector
  #353 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;ILjdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #354 = Utf8               vClass
  #355 = Utf8               sh
  #356 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
  #357 = Utf8               Ljdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation;
  #358 = Utf8               Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;>;
  #359 = Utf8               TSH;
  #360 = Utf8               Ljdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation<TV;TSH;>;
  #361 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;SH:Ljdk/internal/vm/vector/VectorSupport$VectorShuffle<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;>;Ljava/lang/Class<TE;>;Ljava/lang/Class<+TSH;>;TSH;ILjdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation<TV;TSH;>;)TV;
  #362 = Utf8               indexVector
  #363 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$IndexOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #364 = Utf8               v
  #365 = Utf8               Ljdk/internal/vm/vector/VectorSupport$Vector;
  #366 = Utf8               Ljdk/internal/vm/vector/VectorSupport$IndexOperation;
  #367 = Utf8               Ljava/lang/Class<+TV;>;
  #368 = Utf8               TV;
  #369 = Utf8               Ljdk/internal/vm/vector/VectorSupport$IndexOperation<TV;TS;>;
  #370 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TE;>;ITV;ITS;Ljdk/internal/vm/vector/VectorSupport$IndexOperation<TV;TS;>;)TV;
  #371 = Utf8               reductionCoerced
  #372 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$ReductionOperation;)J
  #373 = Utf8               oprId
  #374 = Utf8               mClass
  #375 = Utf8               m
  #376 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorMask;
  #377 = Utf8               Ljdk/internal/vm/vector/VectorSupport$ReductionOperation;
  #378 = Utf8               Ljava/lang/Class<+TM;>;
  #379 = Utf8               TM;
  #380 = Utf8               Ljdk/internal/vm/vector/VectorSupport$ReductionOperation<TV;TM;>;
  #381 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TM;Ljdk/internal/vm/vector/VectorSupport$ReductionOperation<TV;TM;>;)J
  #382 = Utf8               extract
  #383 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VecExtractOp;)J
  #384 = Utf8               i
  #385 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VecExtractOp;
  #386 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VecExtractOp<TV;>;
  #387 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TE;>;ITV;ILjdk/internal/vm/vector/VectorSupport$VecExtractOp<TV;>;)J
  #388 = Utf8               insert
  #389 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;IJLjdk/internal/vm/vector/VectorSupport$VecInsertOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #390 = Utf8               val
  #391 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VecInsertOp;
  #392 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VecInsertOp<TV;>;
  #393 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TE;>;ITV;IJLjdk/internal/vm/vector/VectorSupport$VecInsertOp<TV;>;)TV;
  #394 = Utf8               unaryOp
  #395 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$UnaryOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #396 = Utf8               Ljdk/internal/vm/vector/VectorSupport$UnaryOperation;
  #397 = Utf8               Ljdk/internal/vm/vector/VectorSupport$UnaryOperation<TV;TM;>;
  #398 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TM;Ljdk/internal/vm/vector/VectorSupport$UnaryOperation<TV;TM;>;)TV;
  #399 = Utf8               binaryOp
  #400 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$BinaryOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #401 = Utf8               v1
  #402 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #403 = Utf8               v2
  #404 = Utf8               Ljdk/internal/vm/vector/VectorSupport$BinaryOperation;
  #405 = Utf8               TVM;
  #406 = Utf8               Ljdk/internal/vm/vector/VectorSupport$BinaryOperation<TVM;TM;>;
  #407 = Utf8               <VM:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TVM;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITVM;TVM;TM;Ljdk/internal/vm/vector/VectorSupport$BinaryOperation<TVM;TM;>;)TVM;
  #408 = Utf8               ternaryOp
  #409 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$TernaryOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #410 = Utf8               v3
  #411 = Utf8               Ljdk/internal/vm/vector/VectorSupport$TernaryOperation;
  #412 = Utf8               Ljdk/internal/vm/vector/VectorSupport$TernaryOperation<TV;TM;>;
  #413 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TV;TV;TM;Ljdk/internal/vm/vector/VectorSupport$TernaryOperation<TV;TM;>;)TV;
  #414 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$LoadOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #415 = Utf8               base
  #416 = Utf8               Ljava/lang/Object;
  #417 = Utf8               offset
  #418 = Utf8               container
  #419 = Utf8               Ljdk/internal/vm/vector/VectorSupport$LoadOperation;
  #420 = Utf8               TC;
  #421 = Utf8               Ljdk/internal/vm/vector/VectorSupport$LoadOperation<TC;TVM;TS;>;
  #422 = Utf8               <C:Ljava/lang/Object;VM:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;>(Ljava/lang/Class<+TVM;>;Ljava/lang/Class<TE;>;ILjava/lang/Object;JTC;JTS;Ljdk/internal/vm/vector/VectorSupport$LoadOperation<TC;TVM;TS;>;)TVM;
  #423 = Utf8               loadMasked
  #424 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorMask;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #425 = Utf8               offsetInRange
  #426 = Utf8               Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation;
  #427 = Utf8               Ljava/lang/Class<TM;>;
  #428 = Utf8               Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation<TC;TV;TS;TM;>;
  #429 = Utf8               <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<*>;E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Object;JTM;ITC;JTS;Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation<TC;TV;TS;TM;>;)TV;
  #430 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #431 = Utf8               vectorIndexClass
  #432 = Utf8               index_vector
  #433 = Utf8               indexMap
  #434 = Utf8               [I
  #435 = Utf8               indexM
  #436 = Utf8               Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap;
  #437 = Utf8               Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;
  #438 = Utf8               TW;
  #439 = Utf8               Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap<TC;TV;TS;TM;>;
  #440 = Utf8               <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<*>;W:Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;Ljava/lang/Object;JTW;TM;TC;I[IITS;Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap<TC;TV;TS;TM;>;)TV;
  #441 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorPayload;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$StoreVectorOperation;)V
  #442 = Utf8               Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperation;
  #443 = Utf8               Ljava/lang/Class<*>;
  #444 = Utf8               Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperation<TC;TV;>;
  #445 = Utf8               <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;>(Ljava/lang/Class<*>;Ljava/lang/Class<*>;ILjava/lang/Object;JTV;TC;JLjdk/internal/vm/vector/VectorSupport$StoreVectorOperation<TC;TV;>;)V
  #446 = Utf8               storeMasked
  #447 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation;)V
  #448 = Utf8               Ljdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation;
  #449 = Utf8               Ljdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation<TC;TV;TM;>;
  #450 = Utf8               <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Object;JTV;TM;TC;JLjdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation<TC;TV;TM;>;)V
  #451 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap;)V
  #452 = Utf8               Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap;
  #453 = Utf8               Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap<TC;TV;TM;>;
  #454 = Utf8               <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;W:Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;Ljava/lang/Object;JTW;TV;TM;TC;I[IILjdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap<TC;TV;TM;>;)V
  #455 = Utf8               test
  #456 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/util/function/BiFunction;)Z
  #457 = Utf8               cond
  #458 = Utf8               m1
  #459 = Utf8               m2
  #460 = Utf8               Ljava/util/function/BiFunction;
  #461 = Utf8               Ljava/util/function/BiFunction<TM;TM;Ljava/lang/Boolean;>;
  #462 = Utf8               <M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<*>;Ljava/lang/Class<*>;ITM;TM;Ljava/util/function/BiFunction<TM;TM;Ljava/lang/Boolean;>;)Z
  #463 = Utf8               compare
  #464 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp;)Ljdk/internal/vm/vector/VectorSupport$VectorMask;
  #465 = Utf8               vectorClass
  #466 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp;
  #467 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp<TV;TM;>;
  #468 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ITV;TV;TM;Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp<TV;TM;>;)TM;
  #469 = Utf8               rearrangeOp
  #470 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #471 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp;
  #472 = Utf8               Ljava/lang/Class<TSH;>;
  #473 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp<TV;TSH;TM;>;
  #474 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;SH:Ljdk/internal/vm/vector/VectorSupport$VectorShuffle<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TSH;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ITV;TSH;TM;Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp<TV;TSH;TM;>;)TV;
  #475 = Utf8               blend
  #476 = Utf8               (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #477 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp;
  #478 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp<TV;TM;>;
  #479 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ITV;TV;TM;Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp<TV;TM;>;)TV;
  #480 = Utf8               broadcastInt
  #481 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
  #482 = Utf8               opr
  #483 = Utf8               n
  #484 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp;
  #485 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp<TV;TM;>;
  #486 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;ITM;Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp<TV;TM;>;)TV;
  #487 = Utf8               convert
  #488 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #489 = Utf8               fromVectorClass
  #490 = Utf8               fromeClass
  #491 = Utf8               fromVLen
  #492 = Utf8               toVectorClass
  #493 = Utf8               toeClass
  #494 = Utf8               toVLen
  #495 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp;
  #496 = Utf8               TVIN;
  #497 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp<TVOUT;TVIN;TS;>;
  #498 = Utf8               <VOUT:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;VIN:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<*>;>(ILjava/lang/Class<*>;Ljava/lang/Class<*>;ILjava/lang/Class<*>;Ljava/lang/Class<*>;ITVIN;TS;Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp<TVOUT;TVIN;TS;>;)TVOUT;
  #499 = Utf8               compressExpandOp
  #500 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #501 = Utf8               Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation;
  #502 = Utf8               Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation<TV;TM;>;
  #503 = Utf8               <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TM;Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation<TV;TM;>;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #504 = Utf8               maybeRebox
  #505 = Utf8               (Ljdk/internal/vm/vector/VectorSupport$VectorPayload;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
  #506 = Utf8               TVP;
  #507 = Utf8               <VP:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;>(TVP;)TVP;
  #508 = Utf8               maskReductionCoerced
  #509 = Utf8               (ILjava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp;)J
  #510 = Utf8               oper
  #511 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp;
  #512 = Utf8               Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp<TM;>;
  #513 = Utf8               <M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TM;>;Ljava/lang/Class<*>;ITM;Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp<TM;>;)J
  #514 = Utf8               getMaxLaneCount
  #515 = Utf8               (Ljava/lang/Class;)I
  #516 = Utf8               (Ljava/lang/Class<*>;)I
  #517 = Utf8               o
  #518 = Utf8               <clinit>
  #519 = Utf8               SourceFile
  #520 = Utf8               VectorSupport.java
  #521 = Utf8               NestMembers
  #522 = Class              #523          // jdk/internal/vm/vector/VectorSupport$VectorPayloadMF512
  #523 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorPayloadMF512
  #524 = Class              #525          // jdk/internal/vm/vector/VectorSupport$VectorPayloadMF256
  #525 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorPayloadMF256
  #526 = Class              #527          // jdk/internal/vm/vector/VectorSupport$VectorPayloadMF128
  #527 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorPayloadMF128
  #528 = Class              #529          // jdk/internal/vm/vector/VectorSupport$VectorPayloadMF64
  #529 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorPayloadMF64
  #530 = Class              #531          // jdk/internal/vm/vector/VectorSupport$VectorPayloadMF
  #531 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorPayloadMF
  #532 = Class              #533          // jdk/internal/vm/vector/VectorSupport$VectorMask
  #533 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorMask
  #534 = Class              #535          // jdk/internal/vm/vector/VectorSupport$VectorShuffle
  #535 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorShuffle
  #536 = Class              #537          // jdk/internal/vm/vector/VectorSupport$Vector
  #537 = Utf8               jdk/internal/vm/vector/VectorSupport$Vector
  #538 = Class              #539          // jdk/internal/vm/vector/VectorSupport$VectorPayload
  #539 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorPayload
  #540 = Class              #541          // jdk/internal/vm/vector/VectorSupport$VectorSpecies
  #541 = Utf8               jdk/internal/vm/vector/VectorSupport$VectorSpecies
  #542 = Utf8               InnerClasses
  #543 = Utf8               FromBitsCoercedOperation
  #544 = Utf8               VectorSpecies
  #545 = Utf8               VectorPayload
  #546 = Utf8               ShuffleIotaOperation
  #547 = Utf8               VectorShuffle
  #548 = Utf8               ShuffleToVectorOperation
  #549 = Utf8               Vector
  #550 = Utf8               IndexOperation
  #551 = Utf8               ReductionOperation
  #552 = Utf8               VectorMask
  #553 = Utf8               VecExtractOp
  #554 = Utf8               VecInsertOp
  #555 = Utf8               UnaryOperation
  #556 = Utf8               BinaryOperation
  #557 = Utf8               TernaryOperation
  #558 = Utf8               LoadOperation
  #559 = Utf8               LoadVectorMaskedOperation
  #560 = Utf8               LoadVectorOperationWithMap
  #561 = Utf8               StoreVectorOperation
  #562 = Utf8               StoreVectorMaskedOperation
  #563 = Utf8               StoreVectorOperationWithMap
  #564 = Utf8               VectorCompareOp
  #565 = Utf8               VectorRearrangeOp
  #566 = Utf8               VectorBlendOp
  #567 = Utf8               VectorBroadcastIntOp
  #568 = Utf8               VectorConvertOp
  #569 = Utf8               CompressExpandOperation
  #570 = Utf8               VectorMaskOp
  #571 = Utf8               VectorPayloadMF512
  #572 = Utf8               VectorPayloadMF256
  #573 = Utf8               VectorPayloadMF128
  #574 = Utf8               VectorPayloadMF64
  #575 = Utf8               VectorPayloadMF
{
  public static final int VECTOR_OP_ABS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 0

  public static final int VECTOR_OP_NEG;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 1

  public static final int VECTOR_OP_SQRT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 2

  public static final int VECTOR_OP_BIT_COUNT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 3

  public static final int VECTOR_OP_ADD;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 4

  public static final int VECTOR_OP_SUB;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 5

  public static final int VECTOR_OP_MUL;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 6

  public static final int VECTOR_OP_DIV;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 7

  public static final int VECTOR_OP_MIN;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 8

  public static final int VECTOR_OP_MAX;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 9

  public static final int VECTOR_OP_AND;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 10

  public static final int VECTOR_OP_OR;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 11

  public static final int VECTOR_OP_XOR;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 12

  public static final int VECTOR_OP_FMA;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 13

  public static final int VECTOR_OP_LSHIFT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 14

  public static final int VECTOR_OP_RSHIFT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 15

  public static final int VECTOR_OP_URSHIFT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 16

  public static final int VECTOR_OP_CAST;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 17

  public static final int VECTOR_OP_UCAST;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 18

  public static final int VECTOR_OP_REINTERPRET;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 19

  public static final int VECTOR_OP_MASK_TRUECOUNT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 20

  public static final int VECTOR_OP_MASK_FIRSTTRUE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 21

  public static final int VECTOR_OP_MASK_LASTTRUE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 22

  public static final int VECTOR_OP_MASK_TOLONG;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 23

  public static final int VECTOR_OP_LROTATE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 24

  public static final int VECTOR_OP_RROTATE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 25

  public static final int VECTOR_OP_COMPRESS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 26

  public static final int VECTOR_OP_EXPAND;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 27

  public static final int VECTOR_OP_MASK_COMPRESS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 28

  public static final int VECTOR_OP_TZ_COUNT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 29

  public static final int VECTOR_OP_LZ_COUNT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 30

  public static final int VECTOR_OP_REVERSE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 31

  public static final int VECTOR_OP_REVERSE_BYTES;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 32

  public static final int VECTOR_OP_COMPRESS_BITS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 33

  public static final int VECTOR_OP_EXPAND_BITS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 34

  public static final int VECTOR_OP_TAN;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 101

  public static final int VECTOR_OP_TANH;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 102

  public static final int VECTOR_OP_SIN;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 103

  public static final int VECTOR_OP_SINH;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 104

  public static final int VECTOR_OP_COS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 105

  public static final int VECTOR_OP_COSH;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 106

  public static final int VECTOR_OP_ASIN;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 107

  public static final int VECTOR_OP_ACOS;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 108

  public static final int VECTOR_OP_ATAN;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 109

  public static final int VECTOR_OP_ATAN2;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 110

  public static final int VECTOR_OP_CBRT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 111

  public static final int VECTOR_OP_LOG;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 112

  public static final int VECTOR_OP_LOG10;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 113

  public static final int VECTOR_OP_LOG1P;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 114

  public static final int VECTOR_OP_POW;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 115

  public static final int VECTOR_OP_EXP;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 116

  public static final int VECTOR_OP_EXPM1;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 117

  public static final int VECTOR_OP_HYPOT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 118

  public static final int BT_eq;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 0

  public static final int BT_ne;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 4

  public static final int BT_le;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 5

  public static final int BT_ge;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 7

  public static final int BT_lt;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 3

  public static final int BT_gt;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 1

  public static final int BT_overflow;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 2

  public static final int BT_no_overflow;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 6

  public static final int BT_unsigned_compare;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 16

  public static final int BT_ule;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 21

  public static final int BT_uge;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 23

  public static final int BT_ult;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 19

  public static final int BT_ugt;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 17

  public static final int MODE_BROADCAST;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 0

  public static final int MODE_BITS_COERCED_LONG_TO_MASK;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 1

  public static final int T_FLOAT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 6

  public static final int T_DOUBLE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 7

  public static final int T_BYTE;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 8

  public static final int T_SHORT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 9

  public static final int T_INT;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 10

  public static final int T_LONG;
    descriptor: I
    flags: (0x0019) ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    ConstantValue: int 11

  static final boolean $assertionsDisabled;
    descriptor: Z
    flags: (0x1018) ACC_STATIC, ACC_FINAL, ACC_SYNTHETIC

  public jdk.internal.vm.vector.VectorSupport();
    descriptor: ()V
    flags: (0x0001) ACC_PUBLIC
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0
         1: invokespecial #3                  // Method java/lang/Object."<init>":()V
         4: return
      LineNumberTable:
        line 37: 0
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0       5     0  this   Ljdk/internal/vm/vector/VectorSupport;

  public static <VM extends jdk.internal.vm.vector.VectorSupport$VectorPayload, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<E>, E extends java.lang.Object> VM fromBitsCoerced(java.lang.Class<? extends VM>, java.lang.Class<E>, int, long, int, S, jdk.internal.vm.vector.VectorSupport$FromBitsCoercedOperation<VM, S>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;IJILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=8, args_size=7
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: lload_3
        27: aload         6
        29: invokeinterface #22,  4           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation.fromBits:(JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
        34: areturn
      LineNumberTable:
        line 348: 0
        line 349: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      35     0 vmClass   Ljava/lang/Class;
            0      35     1 eClass   Ljava/lang/Class;
            0      35     2 length   I
            0      35     3  bits   J
            0      35     5  mode   I
            0      35     6     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      35     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      35     0 vmClass   Ljava/lang/Class<+TVM;>;
            0      35     1 eClass   Ljava/lang/Class<TE;>;
            0      35     6     s   TS;
            0      35     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation<TVM;TS;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #339                         // <VM:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TVM;>;Ljava/lang/Class<TE;>;IJITS;Ljdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation<TVM;TS;>;)TVM;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <E extends java.lang.Object, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<E>, SH extends jdk.internal.vm.vector.VectorSupport$VectorShuffle<E>> SH shuffleIota(java.lang.Class<E>, java.lang.Class<? extends SH>, S, int, int, int, int, jdk.internal.vm.vector.VectorSupport$ShuffleIotaOperation<S, SH>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;IIIILjdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=8, args_size=8
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: iload_3
        27: iload         4
        29: iload         5
        31: aload_2
        32: invokeinterface #28,  5           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation.apply:(IIILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
        37: areturn
      LineNumberTable:
        line 367: 0
        line 368: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0 eClass   Ljava/lang/Class;
            0      38     1 shClass   Ljava/lang/Class;
            0      38     2     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      38     3 length   I
            0      38     4 start   I
            0      38     5  step   I
            0      38     6  wrap   I
            0      38     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     0 eClass   Ljava/lang/Class<TE;>;
            0      38     1 shClass   Ljava/lang/Class<+TSH;>;
            0      38     2     s   TS;
            0      38     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation<TS;TSH;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #351                         // <E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;SH:Ljdk/internal/vm/vector/VectorSupport$VectorShuffle<TE;>;>(Ljava/lang/Class<TE;>;Ljava/lang/Class<+TSH;>;TS;IIIILjdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation<TS;TSH;>;)TSH;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, SH extends jdk.internal.vm.vector.VectorSupport$VectorShuffle<E>, E extends java.lang.Object> V shuffleToVector(java.lang.Class<? extends jdk.internal.vm.vector.VectorSupport$Vector<E>>, java.lang.Class<E>, java.lang.Class<? extends SH>, SH, int, jdk.internal.vm.vector.VectorSupport$ShuffleToVectorOperation<V, SH>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;ILjdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=6, args_size=6
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         5
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         5
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         5
        26: aload_3
        27: invokeinterface #34,  2           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        32: areturn
      LineNumberTable:
        line 384: 0
        line 385: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      33     0 vClass   Ljava/lang/Class;
            0      33     1 eClass   Ljava/lang/Class;
            0      33     2 shClass   Ljava/lang/Class;
            0      33     3    sh   Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
            0      33     4 length   I
            0      33     5 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      33     0 vClass   Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;>;
            0      33     1 eClass   Ljava/lang/Class<TE;>;
            0      33     2 shClass   Ljava/lang/Class<+TSH;>;
            0      33     3    sh   TSH;
            0      33     5 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation<TV;TSH;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #361                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;SH:Ljdk/internal/vm/vector/VectorSupport$VectorShuffle<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;>;Ljava/lang/Class<TE;>;Ljava/lang/Class<+TSH;>;TSH;ILjdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation<TV;TSH;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, E extends java.lang.Object, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<E>> V indexVector(java.lang.Class<? extends V>, java.lang.Class<E>, int, V, int, S, jdk.internal.vm.vector.VectorSupport$IndexOperation<V, S>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$IndexOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=7, args_size=7
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         6
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         6
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         6
        26: aload_3
        27: iload         4
        29: aload         5
        31: invokeinterface #39,  4           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$IndexOperation.index:(Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        36: areturn
      LineNumberTable:
        line 403: 0
        line 404: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      37     0 vClass   Ljava/lang/Class;
            0      37     1 eClass   Ljava/lang/Class;
            0      37     2 length   I
            0      37     3     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      37     4  step   I
            0      37     5     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      37     6 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$IndexOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      37     0 vClass   Ljava/lang/Class<+TV;>;
            0      37     1 eClass   Ljava/lang/Class<TE;>;
            0      37     3     v   TV;
            0      37     5     s   TS;
            0      37     6 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$IndexOperation<TV;TS;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #370                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TE;>;ITV;ITS;Ljdk/internal/vm/vector/VectorSupport$IndexOperation<TV;TS;>;)TV;

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> long reductionCoerced(int, java.lang.Class<? extends V>, java.lang.Class<? extends M>, java.lang.Class<E>, int, V, M, jdk.internal.vm.vector.VectorSupport$ReductionOperation<V, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$ReductionOperation;)J
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=8, args_size=8
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: aload         5
        28: aload         6
        30: invokeinterface #45,  3           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$ReductionOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
        35: lreturn
      LineNumberTable:
        line 424: 0
        line 425: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      36     0 oprId   I
            0      36     1 vClass   Ljava/lang/Class;
            0      36     2 mClass   Ljava/lang/Class;
            0      36     3 eClass   Ljava/lang/Class;
            0      36     4 length   I
            0      36     5     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      36     6     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      36     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$ReductionOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      36     1 vClass   Ljava/lang/Class<+TV;>;
            0      36     2 mClass   Ljava/lang/Class<+TM;>;
            0      36     3 eClass   Ljava/lang/Class<TE;>;
            0      36     5     v   TV;
            0      36     6     m   TM;
            0      36     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$ReductionOperation<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #381                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TM;Ljdk/internal/vm/vector/VectorSupport$ReductionOperation<TV;TM;>;)J
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, E extends java.lang.Object> long extract(java.lang.Class<? extends V>, java.lang.Class<E>, int, V, int, jdk.internal.vm.vector.VectorSupport$VecExtractOp<V>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VecExtractOp;)J
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=6, args_size=6
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         5
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         5
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         5
        26: aload_3
        27: iload         4
        29: invokeinterface #50,  3           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VecExtractOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;I)J
        34: lreturn
      LineNumberTable:
        line 443: 0
        line 444: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      35     0 vClass   Ljava/lang/Class;
            0      35     1 eClass   Ljava/lang/Class;
            0      35     2 length   I
            0      35     3     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      35     4     i   I
            0      35     5 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VecExtractOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      35     0 vClass   Ljava/lang/Class<+TV;>;
            0      35     1 eClass   Ljava/lang/Class<TE;>;
            0      35     3     v   TV;
            0      35     5 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VecExtractOp<TV;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #387                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TE;>;ITV;ILjdk/internal/vm/vector/VectorSupport$VecExtractOp<TV;>;)J
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, E extends java.lang.Object> V insert(java.lang.Class<? extends V>, java.lang.Class<E>, int, V, int, long, jdk.internal.vm.vector.VectorSupport$VecInsertOp<V>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;IJLjdk/internal/vm/vector/VectorSupport$VecInsertOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=8, args_size=7
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: aload_3
        27: iload         4
        29: lload         5
        31: invokeinterface #55,  5           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VecInsertOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;IJ)Ljdk/internal/vm/vector/VectorSupport$Vector;
        36: areturn
      LineNumberTable:
        line 461: 0
        line 462: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      37     0 vClass   Ljava/lang/Class;
            0      37     1 eClass   Ljava/lang/Class;
            0      37     2 length   I
            0      37     3     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      37     4     i   I
            0      37     5   val   J
            0      37     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VecInsertOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      37     0 vClass   Ljava/lang/Class<+TV;>;
            0      37     1 eClass   Ljava/lang/Class<TE;>;
            0      37     3     v   TV;
            0      37     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VecInsertOp<TV;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #393                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TE;>;ITV;IJLjdk/internal/vm/vector/VectorSupport$VecInsertOp<TV;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> V unaryOp(int, java.lang.Class<? extends V>, java.lang.Class<? extends M>, java.lang.Class<E>, int, V, M, jdk.internal.vm.vector.VectorSupport$UnaryOperation<V, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$UnaryOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=8, args_size=8
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: aload         5
        28: aload         6
        30: invokeinterface #60,  3           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$UnaryOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        35: areturn
      LineNumberTable:
        line 482: 0
        line 483: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      36     0 oprId   I
            0      36     1 vClass   Ljava/lang/Class;
            0      36     2 mClass   Ljava/lang/Class;
            0      36     3 eClass   Ljava/lang/Class;
            0      36     4 length   I
            0      36     5     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      36     6     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      36     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$UnaryOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      36     1 vClass   Ljava/lang/Class<+TV;>;
            0      36     2 mClass   Ljava/lang/Class<+TM;>;
            0      36     3 eClass   Ljava/lang/Class<TE;>;
            0      36     5     v   TV;
            0      36     6     m   TM;
            0      36     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$UnaryOperation<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #398                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TM;Ljdk/internal/vm/vector/VectorSupport$UnaryOperation<TV;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <VM extends jdk.internal.vm.vector.VectorSupport$VectorPayload, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> VM binaryOp(int, java.lang.Class<? extends VM>, java.lang.Class<? extends M>, java.lang.Class<E>, int, VM, VM, M, jdk.internal.vm.vector.VectorSupport$BinaryOperation<VM, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$BinaryOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=9, args_size=9
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         8
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         8
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         8
        26: aload         5
        28: aload         6
        30: aload         7
        32: invokeinterface #65,  4           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$BinaryOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
        37: areturn
      LineNumberTable:
        line 503: 0
        line 504: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0 oprId   I
            0      38     1 vmClass   Ljava/lang/Class;
            0      38     2 mClass   Ljava/lang/Class;
            0      38     3 eClass   Ljava/lang/Class;
            0      38     4 length   I
            0      38     5    v1   Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
            0      38     6    v2   Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
            0      38     7     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      38     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$BinaryOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     1 vmClass   Ljava/lang/Class<+TVM;>;
            0      38     2 mClass   Ljava/lang/Class<+TM;>;
            0      38     3 eClass   Ljava/lang/Class<TE;>;
            0      38     5    v1   TVM;
            0      38     6    v2   TVM;
            0      38     7     m   TM;
            0      38     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$BinaryOperation<TVM;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #407                         // <VM:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TVM;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITVM;TVM;TM;Ljdk/internal/vm/vector/VectorSupport$BinaryOperation<TVM;TM;>;)TVM;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> V ternaryOp(int, java.lang.Class<? extends V>, java.lang.Class<? extends M>, java.lang.Class<E>, int, V, V, V, M, jdk.internal.vm.vector.VectorSupport$TernaryOperation<V, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$TernaryOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=10, args_size=10
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         9
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         9
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         9
        26: aload         5
        28: aload         6
        30: aload         7
        32: aload         8
        34: invokeinterface #70,  5           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$TernaryOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        39: areturn
      LineNumberTable:
        line 524: 0
        line 525: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      40     0 oprId   I
            0      40     1 vClass   Ljava/lang/Class;
            0      40     2 mClass   Ljava/lang/Class;
            0      40     3 eClass   Ljava/lang/Class;
            0      40     4 length   I
            0      40     5    v1   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      40     6    v2   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      40     7    v3   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      40     8     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      40     9 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$TernaryOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      40     1 vClass   Ljava/lang/Class<+TV;>;
            0      40     2 mClass   Ljava/lang/Class<+TM;>;
            0      40     3 eClass   Ljava/lang/Class<TE;>;
            0      40     5    v1   TV;
            0      40     6    v2   TV;
            0      40     7    v3   TV;
            0      40     8     m   TM;
            0      40     9 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$TernaryOperation<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #413                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TV;TV;TM;Ljdk/internal/vm/vector/VectorSupport$TernaryOperation<TV;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <C extends java.lang.Object, VM extends jdk.internal.vm.vector.VectorSupport$VectorPayload, E extends java.lang.Object, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<E>> VM load(java.lang.Class<? extends VM>, java.lang.Class<E>, int, java.lang.Object, long, C, long, S, jdk.internal.vm.vector.VectorSupport$LoadOperation<C, VM, S>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$LoadOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=11, args_size=9
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         10
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         10
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         10
        26: aload         6
        28: lload         7
        30: aload         9
        32: invokeinterface #75,  5           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$LoadOperation.load:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
        37: areturn
      LineNumberTable:
        line 549: 0
        line 550: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vmClass   Ljava/lang/Class;
            0      38     1 eClass   Ljava/lang/Class;
            0      38     2 length   I
            0      38     3  base   Ljava/lang/Object;
            0      38     4 offset   J
            0      38     6 container   Ljava/lang/Object;
            0      38     7 index   J
            0      38     9     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      38    10 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$LoadOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vmClass   Ljava/lang/Class<+TVM;>;
            0      38     1 eClass   Ljava/lang/Class<TE;>;
            0      38     6 container   TC;
            0      38     9     s   TS;
            0      38    10 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$LoadOperation<TC;TVM;TS;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #422                         // <C:Ljava/lang/Object;VM:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;>(Ljava/lang/Class<+TVM;>;Ljava/lang/Class<TE;>;ILjava/lang/Object;JTC;JTS;Ljdk/internal/vm/vector/VectorSupport$LoadOperation<TC;TVM;TS;>;)TVM;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <C extends java.lang.Object, V extends jdk.internal.vm.vector.VectorSupport$Vector<?>, E extends java.lang.Object, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>> V loadMasked(java.lang.Class<? extends V>, java.lang.Class<M>, java.lang.Class<E>, int, java.lang.Object, long, M, int, C, long, S, jdk.internal.vm.vector.VectorSupport$LoadVectorMaskedOperation<C, V, S, M>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorMask;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=6, locals=14, args_size=12
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         13
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         13
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         13
        26: aload         9
        28: lload         10
        30: aload         12
        32: aload         7
        34: invokeinterface #81,  6           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation.load:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        39: areturn
      LineNumberTable:
        line 574: 0
        line 575: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      40     0 vClass   Ljava/lang/Class;
            0      40     1 mClass   Ljava/lang/Class;
            0      40     2 eClass   Ljava/lang/Class;
            0      40     3 length   I
            0      40     4  base   Ljava/lang/Object;
            0      40     5 offset   J
            0      40     7     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      40     8 offsetInRange   I
            0      40     9 container   Ljava/lang/Object;
            0      40    10 index   J
            0      40    12     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      40    13 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      40     0 vClass   Ljava/lang/Class<+TV;>;
            0      40     1 mClass   Ljava/lang/Class<TM;>;
            0      40     2 eClass   Ljava/lang/Class<TE;>;
            0      40     7     m   TM;
            0      40     9 container   TC;
            0      40    12     s   TS;
            0      40    13 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation<TC;TV;TS;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #429                         // <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<*>;E:Ljava/lang/Object;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Object;JTM;ITC;JTS;Ljdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation<TC;TV;TS;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <C extends java.lang.Object, V extends jdk.internal.vm.vector.VectorSupport$Vector<?>, W extends jdk.internal.vm.vector.VectorSupport$Vector<java.lang.Integer>, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> V loadWithMap(java.lang.Class<? extends V>, java.lang.Class<M>, java.lang.Class<E>, int, java.lang.Class<? extends jdk.internal.vm.vector.VectorSupport$Vector<java.lang.Integer>>, java.lang.Object, long, W, M, C, int, int[], int, S, jdk.internal.vm.vector.VectorSupport$LoadVectorOperationWithMap<C, V, S, M>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=7, locals=16, args_size=15
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         15
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         15
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         15
        26: aload         10
        28: iload         11
        30: aload         12
        32: iload         13
        34: aload         14
        36: aload         9
        38: invokeinterface #86,  7           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap.loadWithMap:(Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        43: areturn
      LineNumberTable:
        line 602: 0
        line 603: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      44     0 vClass   Ljava/lang/Class;
            0      44     1 mClass   Ljava/lang/Class;
            0      44     2 eClass   Ljava/lang/Class;
            0      44     3 length   I
            0      44     4 vectorIndexClass   Ljava/lang/Class;
            0      44     5  base   Ljava/lang/Object;
            0      44     6 offset   J
            0      44     8 index_vector   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      44     9     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      44    10 container   Ljava/lang/Object;
            0      44    11 index   I
            0      44    12 indexMap   [I
            0      44    13 indexM   I
            0      44    14     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      44    15 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      44     0 vClass   Ljava/lang/Class<+TV;>;
            0      44     1 mClass   Ljava/lang/Class<TM;>;
            0      44     2 eClass   Ljava/lang/Class<TE;>;
            0      44     4 vectorIndexClass   Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;
            0      44     8 index_vector   TW;
            0      44     9     m   TM;
            0      44    10 container   TC;
            0      44    14     s   TS;
            0      44    15 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap<TC;TV;TS;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #440                         // <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<*>;W:Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;Ljava/lang/Object;JTW;TM;TC;I[IITS;Ljdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap<TC;TV;TS;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <C extends java.lang.Object, V extends jdk.internal.vm.vector.VectorSupport$VectorPayload> void store(java.lang.Class<?>, java.lang.Class<?>, int, java.lang.Object, long, V, C, long, jdk.internal.vm.vector.VectorSupport$StoreVectorOperation<C, V>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorPayload;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$StoreVectorOperation;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=11, args_size=9
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         10
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         10
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         10
        26: aload         7
        28: lload         8
        30: aload         6
        32: invokeinterface #92,  5           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$StoreVectorOperation.store:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$VectorPayload;)V
        37: return
      LineNumberTable:
        line 622: 0
        line 623: 24
        line 624: 37
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vClass   Ljava/lang/Class;
            0      38     1 eClass   Ljava/lang/Class;
            0      38     2 length   I
            0      38     3  base   Ljava/lang/Object;
            0      38     4 offset   J
            0      38     6     v   Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
            0      38     7 container   Ljava/lang/Object;
            0      38     8 index   J
            0      38    10 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vClass   Ljava/lang/Class<*>;
            0      38     1 eClass   Ljava/lang/Class<*>;
            0      38     6     v   TV;
            0      38     7 container   TC;
            0      38    10 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperation<TC;TV;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #445                         // <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;>(Ljava/lang/Class<*>;Ljava/lang/Class<*>;ILjava/lang/Object;JTV;TC;JLjdk/internal/vm/vector/VectorSupport$StoreVectorOperation<TC;TV;>;)V
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <C extends java.lang.Object, V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> void storeMasked(java.lang.Class<? extends V>, java.lang.Class<M>, java.lang.Class<E>, int, java.lang.Object, long, V, M, C, long, jdk.internal.vm.vector.VectorSupport$StoreVectorMaskedOperation<C, V, M>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=6, locals=13, args_size=11
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         12
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         12
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         12
        26: aload         9
        28: lload         10
        30: aload         7
        32: aload         8
        34: invokeinterface #98,  6           // InterfaceMethod jdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation.store:(Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)V
        39: return
      LineNumberTable:
        line 643: 0
        line 644: 24
        line 645: 39
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      40     0 vClass   Ljava/lang/Class;
            0      40     1 mClass   Ljava/lang/Class;
            0      40     2 eClass   Ljava/lang/Class;
            0      40     3 length   I
            0      40     4  base   Ljava/lang/Object;
            0      40     5 offset   J
            0      40     7     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      40     8     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      40     9 container   Ljava/lang/Object;
            0      40    10 index   J
            0      40    12 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      40     0 vClass   Ljava/lang/Class<+TV;>;
            0      40     1 mClass   Ljava/lang/Class<TM;>;
            0      40     2 eClass   Ljava/lang/Class<TE;>;
            0      40     7     v   TV;
            0      40     8     m   TM;
            0      40     9 container   TC;
            0      40    12 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation<TC;TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #450                         // <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Object;JTV;TM;TC;JLjdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation<TC;TV;TM;>;)V
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <C extends java.lang.Object, V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, W extends jdk.internal.vm.vector.VectorSupport$Vector<java.lang.Integer>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> void storeWithMap(java.lang.Class<? extends V>, java.lang.Class<M>, java.lang.Class<E>, int, java.lang.Class<? extends jdk.internal.vm.vector.VectorSupport$Vector<java.lang.Integer>>, java.lang.Object, long, W, V, M, C, int, int[], int, jdk.internal.vm.vector.VectorSupport$StoreVectorOperationWithMap<C, V, M>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/Object;JLjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/lang/Object;I[IILjdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap;)V
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=7, locals=16, args_size=15
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         15
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         15
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         15
        26: aload         11
        28: iload         12
        30: aload         9
        32: aload         13
        34: iload         14
        36: aload         10
        38: invokeinterface #103,  7          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap.storeWithMap:(Ljava/lang/Object;ILjdk/internal/vm/vector/VectorSupport$Vector;[IILjdk/internal/vm/vector/VectorSupport$VectorMask;)V
        43: return
      LineNumberTable:
        line 669: 0
        line 670: 24
        line 671: 43
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      44     0 vClass   Ljava/lang/Class;
            0      44     1 mClass   Ljava/lang/Class;
            0      44     2 eClass   Ljava/lang/Class;
            0      44     3 length   I
            0      44     4 vectorIndexClass   Ljava/lang/Class;
            0      44     5  base   Ljava/lang/Object;
            0      44     6 offset   J
            0      44     8 index_vector   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      44     9     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      44    10     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      44    11 container   Ljava/lang/Object;
            0      44    12 index   I
            0      44    13 indexMap   [I
            0      44    14 indexM   I
            0      44    15 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      44     0 vClass   Ljava/lang/Class<+TV;>;
            0      44     1 mClass   Ljava/lang/Class<TM;>;
            0      44     2 eClass   Ljava/lang/Class<TE;>;
            0      44     4 vectorIndexClass   Ljava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;
            0      44     8 index_vector   TW;
            0      44     9     v   TV;
            0      44    10     m   TM;
            0      44    11 container   TC;
            0      44    15 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap<TC;TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #454                         // <C:Ljava/lang/Object;V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;W:Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ILjava/lang/Class<+Ljdk/internal/vm/vector/VectorSupport$Vector<Ljava/lang/Integer;>;>;Ljava/lang/Object;JTW;TV;TM;TC;I[IILjdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap<TC;TV;TM;>;)V
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> boolean test(int, java.lang.Class<?>, java.lang.Class<?>, int, M, M, java.util.function.BiFunction<M, M, java.lang.Boolean>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljava/util/function/BiFunction;)Z
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=7, args_size=7
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         6
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         6
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         6
        26: aload         4
        28: aload         5
        30: invokeinterface #109,  3          // InterfaceMethod java/util/function/BiFunction.apply:(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        35: checkcast     #114                // class java/lang/Boolean
        38: invokevirtual #116                // Method java/lang/Boolean.booleanValue:()Z
        41: ireturn
      LineNumberTable:
        line 684: 0
        line 685: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      42     0  cond   I
            0      42     1 mClass   Ljava/lang/Class;
            0      42     2 eClass   Ljava/lang/Class;
            0      42     3 length   I
            0      42     4    m1   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      42     5    m2   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      42     6 defaultImpl   Ljava/util/function/BiFunction;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      42     1 mClass   Ljava/lang/Class<*>;
            0      42     2 eClass   Ljava/lang/Class<*>;
            0      42     4    m1   TM;
            0      42     5    m2   TM;
            0      42     6 defaultImpl   Ljava/util/function/BiFunction<TM;TM;Ljava/lang/Boolean;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #462                         // <M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<*>;Ljava/lang/Class<*>;ITM;TM;Ljava/util/function/BiFunction<TM;TM;Ljava/lang/Boolean;>;)Z
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> M compare(int, java.lang.Class<? extends V>, java.lang.Class<M>, java.lang.Class<E>, int, V, V, M, jdk.internal.vm.vector.VectorSupport$VectorCompareOp<V, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp;)Ljdk/internal/vm/vector/VectorSupport$VectorMask;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=5, locals=9, args_size=9
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         8
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         8
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         8
        26: iload_0
        27: aload         5
        29: aload         6
        31: aload         7
        33: invokeinterface #120,  5          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VectorCompareOp.apply:(ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorMask;
        38: areturn
      LineNumberTable:
        line 705: 0
        line 706: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      39     0  cond   I
            0      39     1 vectorClass   Ljava/lang/Class;
            0      39     2 mClass   Ljava/lang/Class;
            0      39     3 eClass   Ljava/lang/Class;
            0      39     4 length   I
            0      39     5    v1   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      39     6    v2   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      39     7     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      39     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      39     1 vectorClass   Ljava/lang/Class<+TV;>;
            0      39     2 mClass   Ljava/lang/Class<TM;>;
            0      39     3 eClass   Ljava/lang/Class<TE;>;
            0      39     5    v1   TV;
            0      39     6    v2   TV;
            0      39     7     m   TM;
            0      39     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #468                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ITV;TV;TM;Ljdk/internal/vm/vector/VectorSupport$VectorCompareOp<TV;TM;>;)TM;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, SH extends jdk.internal.vm.vector.VectorSupport$VectorShuffle<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> V rearrangeOp(java.lang.Class<? extends V>, java.lang.Class<SH>, java.lang.Class<M>, java.lang.Class<E>, int, V, SH, M, jdk.internal.vm.vector.VectorSupport$VectorRearrangeOp<V, SH, M>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=9, args_size=9
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         8
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         8
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         8
        26: aload         5
        28: aload         6
        30: aload         7
        32: invokeinterface #125,  4          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VectorRearrangeOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        37: areturn
      LineNumberTable:
        line 726: 0
        line 727: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vClass   Ljava/lang/Class;
            0      38     1 shClass   Ljava/lang/Class;
            0      38     2 mClass   Ljava/lang/Class;
            0      38     3 eClass   Ljava/lang/Class;
            0      38     4 length   I
            0      38     5     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      38     6    sh   Ljdk/internal/vm/vector/VectorSupport$VectorShuffle;
            0      38     7     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      38     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vClass   Ljava/lang/Class<+TV;>;
            0      38     1 shClass   Ljava/lang/Class<TSH;>;
            0      38     2 mClass   Ljava/lang/Class<TM;>;
            0      38     3 eClass   Ljava/lang/Class<TE;>;
            0      38     5     v   TV;
            0      38     6    sh   TSH;
            0      38     7     m   TM;
            0      38     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp<TV;TSH;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #474                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;SH:Ljdk/internal/vm/vector/VectorSupport$VectorShuffle<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TSH;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ITV;TSH;TM;Ljdk/internal/vm/vector/VectorSupport$VectorRearrangeOp<TV;TSH;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> V blend(java.lang.Class<? extends V>, java.lang.Class<M>, java.lang.Class<E>, int, V, V, M, jdk.internal.vm.vector.VectorSupport$VectorBlendOp<V, M>);
    descriptor: (Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=8, args_size=8
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: aload         4
        28: aload         5
        30: aload         6
        32: invokeinterface #130,  4          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VectorBlendOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        37: areturn
      LineNumberTable:
        line 746: 0
        line 747: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vClass   Ljava/lang/Class;
            0      38     1 mClass   Ljava/lang/Class;
            0      38     2 eClass   Ljava/lang/Class;
            0      38     3 length   I
            0      38     4    v1   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      38     5    v2   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      38     6     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      38     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     0 vClass   Ljava/lang/Class<+TV;>;
            0      38     1 mClass   Ljava/lang/Class<TM;>;
            0      38     2 eClass   Ljava/lang/Class<TE;>;
            0      38     4    v1   TV;
            0      38     5    v2   TV;
            0      38     6     m   TM;
            0      38     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #479                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(Ljava/lang/Class<+TV;>;Ljava/lang/Class<TM;>;Ljava/lang/Class<TE;>;ITV;TV;TM;Ljdk/internal/vm/vector/VectorSupport$VectorBlendOp<TV;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> V broadcastInt(int, java.lang.Class<? extends V>, java.lang.Class<? extends M>, java.lang.Class<E>, int, V, int, M, jdk.internal.vm.vector.VectorSupport$VectorBroadcastIntOp<V, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp;)Ljdk/internal/vm/vector/VectorSupport$Vector;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=4, locals=9, args_size=9
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         8
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         8
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         8
        26: aload         5
        28: iload         6
        30: aload         7
        32: invokeinterface #135,  4          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;ILjdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$Vector;
        37: areturn
      LineNumberTable:
        line 767: 0
        line 768: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      38     0   opr   I
            0      38     1 vClass   Ljava/lang/Class;
            0      38     2 mClass   Ljava/lang/Class;
            0      38     3 eClass   Ljava/lang/Class;
            0      38     4 length   I
            0      38     5     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      38     6     n   I
            0      38     7     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      38     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      38     1 vClass   Ljava/lang/Class<+TV;>;
            0      38     2 mClass   Ljava/lang/Class<+TM;>;
            0      38     3 eClass   Ljava/lang/Class<TE;>;
            0      38     5     v   TV;
            0      38     7     m   TM;
            0      38     8 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #486                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;ITM;Ljdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp<TV;TM;>;)TV;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <VOUT extends jdk.internal.vm.vector.VectorSupport$VectorPayload, VIN extends jdk.internal.vm.vector.VectorSupport$VectorPayload, S extends jdk.internal.vm.vector.VectorSupport$VectorSpecies<?>> VOUT convert(int, java.lang.Class<?>, java.lang.Class<?>, int, java.lang.Class<?>, java.lang.Class<?>, int, VIN, S, jdk.internal.vm.vector.VectorSupport$VectorConvertOp<VOUT, VIN, S>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=10, args_size=10
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         9
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         9
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         9
        26: aload         7
        28: aload         8
        30: invokeinterface #140,  3          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VectorConvertOp.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorPayload;Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
        35: areturn
      LineNumberTable:
        line 792: 0
        line 793: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      36     0 oprId   I
            0      36     1 fromVectorClass   Ljava/lang/Class;
            0      36     2 fromeClass   Ljava/lang/Class;
            0      36     3 fromVLen   I
            0      36     4 toVectorClass   Ljava/lang/Class;
            0      36     5 toeClass   Ljava/lang/Class;
            0      36     6 toVLen   I
            0      36     7     v   Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
            0      36     8     s   Ljdk/internal/vm/vector/VectorSupport$VectorSpecies;
            0      36     9 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      36     1 fromVectorClass   Ljava/lang/Class<*>;
            0      36     2 fromeClass   Ljava/lang/Class<*>;
            0      36     4 toVectorClass   Ljava/lang/Class<*>;
            0      36     5 toeClass   Ljava/lang/Class<*>;
            0      36     7     v   TVIN;
            0      36     8     s   TS;
            0      36     9 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp<TVOUT;TVIN;TS;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #498                         // <VOUT:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;VIN:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;S:Ljdk/internal/vm/vector/VectorSupport$VectorSpecies<*>;>(ILjava/lang/Class<*>;Ljava/lang/Class<*>;ILjava/lang/Class<*>;Ljava/lang/Class<*>;ITVIN;TS;Ljdk/internal/vm/vector/VectorSupport$VectorConvertOp<TVOUT;TVIN;TS;>;)TVOUT;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <V extends jdk.internal.vm.vector.VectorSupport$Vector<E>, M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> jdk.internal.vm.vector.VectorSupport$VectorPayload compressExpandOp(int, java.lang.Class<? extends V>, java.lang.Class<? extends M>, java.lang.Class<E>, int, V, M, jdk.internal.vm.vector.VectorSupport$CompressExpandOperation<V, M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=8, args_size=8
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         7
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         7
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         7
        26: aload         5
        28: aload         6
        30: invokeinterface #145,  3          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$CompressExpandOperation.apply:(Ljdk/internal/vm/vector/VectorSupport$Vector;Ljdk/internal/vm/vector/VectorSupport$VectorMask;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
        35: areturn
      LineNumberTable:
        line 812: 0
        line 813: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      36     0   opr   I
            0      36     1 vClass   Ljava/lang/Class;
            0      36     2 mClass   Ljava/lang/Class;
            0      36     3 eClass   Ljava/lang/Class;
            0      36     4 length   I
            0      36     5     v   Ljdk/internal/vm/vector/VectorSupport$Vector;
            0      36     6     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      36     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      36     1 vClass   Ljava/lang/Class<+TV;>;
            0      36     2 mClass   Ljava/lang/Class<+TM;>;
            0      36     3 eClass   Ljava/lang/Class<TE;>;
            0      36     5     v   TV;
            0      36     6     m   TM;
            0      36     7 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation<TV;TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #503                         // <V:Ljdk/internal/vm/vector/VectorSupport$Vector<TE;>;M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TV;>;Ljava/lang/Class<+TM;>;Ljava/lang/Class<TE;>;ITV;TM;Ljdk/internal/vm/vector/VectorSupport$CompressExpandOperation<TV;TM;>;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <VP extends jdk.internal.vm.vector.VectorSupport$VectorPayload> VP maybeRebox(VP);
    descriptor: (Ljdk/internal/vm/vector/VectorSupport$VectorPayload;)Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=1, locals=1, args_size=1
         0: getstatic     #150                // Field U:Ljdk/internal/misc/Unsafe;
         3: invokevirtual #154                // Method jdk/internal/misc/Unsafe.loadFence:()V
         6: aload_0
         7: areturn
      LineNumberTable:
        line 824: 0
        line 825: 6
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0       8     0     v   Ljdk/internal/vm/vector/VectorSupport$VectorPayload;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0       8     0     v   TVP;
    Signature: #507                         // <VP:Ljdk/internal/vm/vector/VectorSupport$VectorPayload;>(TVP;)TVP;
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static <M extends jdk.internal.vm.vector.VectorSupport$VectorMask<E>, E extends java.lang.Object> long maskReductionCoerced(int, java.lang.Class<? extends M>, java.lang.Class<?>, int, M, jdk.internal.vm.vector.VectorSupport$VectorMaskOp<M>);
    descriptor: (ILjava/lang/Class;Ljava/lang/Class;ILjdk/internal/vm/vector/VectorSupport$VectorMask;Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp;)J
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=3, locals=6, args_size=6
         0: getstatic     #9                  // Field $assertionsDisabled:Z
         3: ifne          24
         6: aload         5
         8: invokestatic  #13                 // Method isNonCapturingLambda:(Ljava/lang/Object;)Z
        11: ifne          24
        14: new           #17                 // class java/lang/AssertionError
        17: dup
        18: aload         5
        20: invokespecial #19                 // Method java/lang/AssertionError."<init>":(Ljava/lang/Object;)V
        23: athrow
        24: aload         5
        26: aload         4
        28: invokeinterface #159,  2          // InterfaceMethod jdk/internal/vm/vector/VectorSupport$VectorMaskOp.apply:(Ljdk/internal/vm/vector/VectorSupport$VectorMask;)J
        33: lreturn
      LineNumberTable:
        line 842: 0
        line 843: 24
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      34     0  oper   I
            0      34     1 mClass   Ljava/lang/Class;
            0      34     2 eClass   Ljava/lang/Class;
            0      34     3 length   I
            0      34     4     m   Ljdk/internal/vm/vector/VectorSupport$VectorMask;
            0      34     5 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp;
      LocalVariableTypeTable:
        Start  Length  Slot  Name   Signature
            0      34     1 mClass   Ljava/lang/Class<+TM;>;
            0      34     2 eClass   Ljava/lang/Class<*>;
            0      34     4     m   TM;
            0      34     5 defaultImpl   Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp<TM;>;
      StackMapTable: number_of_entries = 1
        frame_type = 24 /* same */
    Signature: #513                         // <M:Ljdk/internal/vm/vector/VectorSupport$VectorMask<TE;>;E:Ljava/lang/Object;>(ILjava/lang/Class<+TM;>;Ljava/lang/Class<*>;ITM;Ljdk/internal/vm/vector/VectorSupport$VectorMaskOp<TM;>;)J
    RuntimeVisibleAnnotations:
      0: #341()
        jdk.internal.vm.annotation.IntrinsicCandidate

  public static native int getMaxLaneCount(java.lang.Class<?>);
    descriptor: (Ljava/lang/Class;)I
    flags: (0x0109) ACC_PUBLIC, ACC_STATIC, ACC_NATIVE
    Signature: #516                         // (Ljava/lang/Class<*>;)I

  public static boolean isNonCapturingLambda(java.lang.Object);
    descriptor: (Ljava/lang/Object;)Z
    flags: (0x0009) ACC_PUBLIC, ACC_STATIC
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0
         1: invokevirtual #164                // Method java/lang/Object.getClass:()Ljava/lang/Class;
         4: invokevirtual #168                // Method java/lang/Class.getDeclaredFields:()[Ljava/lang/reflect/Field;
         7: arraylength
         8: ifne          15
        11: iconst_1
        12: goto          16
        15: iconst_0
        16: ireturn
      LineNumberTable:
        line 854: 0
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
            0      17     0     o   Ljava/lang/Object;
      StackMapTable: number_of_entries = 2
        frame_type = 15 /* same */
        frame_type = 64 /* same_locals_1_stack_item */
          stack = [ int ]

  static {};
    descriptor: ()V
    flags: (0x0008) ACC_STATIC
    Code:
      stack=1, locals=0, args_size=0
         0: ldc           #1                  // class jdk/internal/vm/vector/VectorSupport
         2: invokevirtual #174                // Method java/lang/Class.desiredAssertionStatus:()Z
         5: ifne          12
         8: iconst_1
         9: goto          13
        12: iconst_0
        13: putstatic     #9                  // Field $assertionsDisabled:Z
        16: invokestatic  #177                // Method registerNatives:()I
        19: pop
        20: invokestatic  #181                // Method jdk/internal/misc/Unsafe.getUnsafe:()Ljdk/internal/misc/Unsafe;
        23: putstatic     #150                // Field U:Ljdk/internal/misc/Unsafe;
        26: return
      LineNumberTable:
        line 37: 0
        line 39: 16
        line 42: 20
      StackMapTable: number_of_entries = 2
        frame_type = 12 /* same */
        frame_type = 64 /* same_locals_1_stack_item */
          stack = [ int ]
}
SourceFile: "VectorSupport.java"
NestMembers:
  jdk/internal/vm/vector/VectorSupport$VectorMaskOp
  jdk/internal/vm/vector/VectorSupport$CompressExpandOperation
  jdk/internal/vm/vector/VectorSupport$VectorConvertOp
  jdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp
  jdk/internal/vm/vector/VectorSupport$VectorBlendOp
  jdk/internal/vm/vector/VectorSupport$VectorRearrangeOp
  jdk/internal/vm/vector/VectorSupport$VectorCompareOp
  jdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap
  jdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation
  jdk/internal/vm/vector/VectorSupport$StoreVectorOperation
  jdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap
  jdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation
  jdk/internal/vm/vector/VectorSupport$LoadOperation
  jdk/internal/vm/vector/VectorSupport$TernaryOperation
  jdk/internal/vm/vector/VectorSupport$BinaryOperation
  jdk/internal/vm/vector/VectorSupport$UnaryOperation
  jdk/internal/vm/vector/VectorSupport$VecInsertOp
  jdk/internal/vm/vector/VectorSupport$VecExtractOp
  jdk/internal/vm/vector/VectorSupport$ReductionOperation
  jdk/internal/vm/vector/VectorSupport$IndexOperation
  jdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation
  jdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation
  jdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation
  jdk/internal/vm/vector/VectorSupport$VectorPayloadMF512
  jdk/internal/vm/vector/VectorSupport$VectorPayloadMF256
  jdk/internal/vm/vector/VectorSupport$VectorPayloadMF128
  jdk/internal/vm/vector/VectorSupport$VectorPayloadMF64
  jdk/internal/vm/vector/VectorSupport$VectorPayloadMF
  jdk/internal/vm/vector/VectorSupport$VectorMask
  jdk/internal/vm/vector/VectorSupport$VectorShuffle
  jdk/internal/vm/vector/VectorSupport$Vector
  jdk/internal/vm/vector/VectorSupport$VectorPayload
  jdk/internal/vm/vector/VectorSupport$VectorSpecies
InnerClasses:
  public static #543= #23 of #1;          // FromBitsCoercedOperation=class jdk/internal/vm/vector/VectorSupport$FromBitsCoercedOperation of class jdk/internal/vm/vector/VectorSupport
  public static #544= #540 of #1;         // VectorSpecies=class jdk/internal/vm/vector/VectorSupport$VectorSpecies of class jdk/internal/vm/vector/VectorSupport
  public static abstract #545= #538 of #1; // VectorPayload=class jdk/internal/vm/vector/VectorSupport$VectorPayload of class jdk/internal/vm/vector/VectorSupport
  public static #546= #29 of #1;          // ShuffleIotaOperation=class jdk/internal/vm/vector/VectorSupport$ShuffleIotaOperation of class jdk/internal/vm/vector/VectorSupport
  public static #547= #534 of #1;         // VectorShuffle=class jdk/internal/vm/vector/VectorSupport$VectorShuffle of class jdk/internal/vm/vector/VectorSupport
  public static #548= #35 of #1;          // ShuffleToVectorOperation=class jdk/internal/vm/vector/VectorSupport$ShuffleToVectorOperation of class jdk/internal/vm/vector/VectorSupport
  public static abstract #549= #536 of #1; // Vector=class jdk/internal/vm/vector/VectorSupport$Vector of class jdk/internal/vm/vector/VectorSupport
  public static #550= #40 of #1;          // IndexOperation=class jdk/internal/vm/vector/VectorSupport$IndexOperation of class jdk/internal/vm/vector/VectorSupport
  public static #551= #46 of #1;          // ReductionOperation=class jdk/internal/vm/vector/VectorSupport$ReductionOperation of class jdk/internal/vm/vector/VectorSupport
  public static #552= #532 of #1;         // VectorMask=class jdk/internal/vm/vector/VectorSupport$VectorMask of class jdk/internal/vm/vector/VectorSupport
  public static #553= #51 of #1;          // VecExtractOp=class jdk/internal/vm/vector/VectorSupport$VecExtractOp of class jdk/internal/vm/vector/VectorSupport
  public static #554= #56 of #1;          // VecInsertOp=class jdk/internal/vm/vector/VectorSupport$VecInsertOp of class jdk/internal/vm/vector/VectorSupport
  public static #555= #61 of #1;          // UnaryOperation=class jdk/internal/vm/vector/VectorSupport$UnaryOperation of class jdk/internal/vm/vector/VectorSupport
  public static #556= #66 of #1;          // BinaryOperation=class jdk/internal/vm/vector/VectorSupport$BinaryOperation of class jdk/internal/vm/vector/VectorSupport
  public static #557= #71 of #1;          // TernaryOperation=class jdk/internal/vm/vector/VectorSupport$TernaryOperation of class jdk/internal/vm/vector/VectorSupport
  public static #558= #76 of #1;          // LoadOperation=class jdk/internal/vm/vector/VectorSupport$LoadOperation of class jdk/internal/vm/vector/VectorSupport
  public static #559= #82 of #1;          // LoadVectorMaskedOperation=class jdk/internal/vm/vector/VectorSupport$LoadVectorMaskedOperation of class jdk/internal/vm/vector/VectorSupport
  public static #560= #87 of #1;          // LoadVectorOperationWithMap=class jdk/internal/vm/vector/VectorSupport$LoadVectorOperationWithMap of class jdk/internal/vm/vector/VectorSupport
  public static #561= #93 of #1;          // StoreVectorOperation=class jdk/internal/vm/vector/VectorSupport$StoreVectorOperation of class jdk/internal/vm/vector/VectorSupport
  public static #562= #99 of #1;          // StoreVectorMaskedOperation=class jdk/internal/vm/vector/VectorSupport$StoreVectorMaskedOperation of class jdk/internal/vm/vector/VectorSupport
  public static #563= #104 of #1;         // StoreVectorOperationWithMap=class jdk/internal/vm/vector/VectorSupport$StoreVectorOperationWithMap of class jdk/internal/vm/vector/VectorSupport
  public static #564= #121 of #1;         // VectorCompareOp=class jdk/internal/vm/vector/VectorSupport$VectorCompareOp of class jdk/internal/vm/vector/VectorSupport
  public static #565= #126 of #1;         // VectorRearrangeOp=class jdk/internal/vm/vector/VectorSupport$VectorRearrangeOp of class jdk/internal/vm/vector/VectorSupport
  public static #566= #131 of #1;         // VectorBlendOp=class jdk/internal/vm/vector/VectorSupport$VectorBlendOp of class jdk/internal/vm/vector/VectorSupport
  public static #567= #136 of #1;         // VectorBroadcastIntOp=class jdk/internal/vm/vector/VectorSupport$VectorBroadcastIntOp of class jdk/internal/vm/vector/VectorSupport
  public static #568= #141 of #1;         // VectorConvertOp=class jdk/internal/vm/vector/VectorSupport$VectorConvertOp of class jdk/internal/vm/vector/VectorSupport
  public static #569= #146 of #1;         // CompressExpandOperation=class jdk/internal/vm/vector/VectorSupport$CompressExpandOperation of class jdk/internal/vm/vector/VectorSupport
  public static #570= #160 of #1;         // VectorMaskOp=class jdk/internal/vm/vector/VectorSupport$VectorMaskOp of class jdk/internal/vm/vector/VectorSupport
  public static final #571= #522 of #1;   // VectorPayloadMF512=class jdk/internal/vm/vector/VectorSupport$VectorPayloadMF512 of class jdk/internal/vm/vector/VectorSupport
  public static final #572= #524 of #1;   // VectorPayloadMF256=class jdk/internal/vm/vector/VectorSupport$VectorPayloadMF256 of class jdk/internal/vm/vector/VectorSupport
  public static final #573= #526 of #1;   // VectorPayloadMF128=class jdk/internal/vm/vector/VectorSupport$VectorPayloadMF128 of class jdk/internal/vm/vector/VectorSupport
  public static final #574= #528 of #1;   // VectorPayloadMF64=class jdk/internal/vm/vector/VectorSupport$VectorPayloadMF64 of class jdk/internal/vm/vector/VectorSupport
  public static abstract #575= #530 of #1; // VectorPayloadMF=class jdk/internal/vm/vector/VectorSupport$VectorPayloadMF of class jdk/internal/vm/vector/VectorSupport
