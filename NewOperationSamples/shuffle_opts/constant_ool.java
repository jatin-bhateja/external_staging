
import jdk.incubator.vector.*;
import java.util.Arrays;
import java.util.stream.IntStream;
import jdk.internal.misc.Unsafe;

public class constant_ool {

   public static final Unsafe U = Unsafe.getUnsafe();

   // ONE is a constant reference, always points to same object in heap.
   // Vectors are immutable.
   //    Any modification to vector lane produces a new vector.
   // Thus constant reference to a vector is also thread safe, unless someone modifies the payload contents 
   // using unsafe APIs, but compiler optimization are agnostic to such unsafe modification.
   
   public static final Vector<Integer> ONE = IntVector.broadcast(IntVector.SPECIES_256, 1);

   public static final VectorSpecies<Integer> ISP = IntVector.SPECIES_256;

   public static void modify_one_lane(int idx, int val) {
       Object payload = U.getReference(ONE, 12);
       U.putInt(payload, 16 + idx * Integer.BYTES, val);
   }

   public static final int ubound_loop(int res, int length) {
      assert ((length > 0) && ((length & (length - 1)) == 0));
      return res & ~(length - 1);
   }

/*
 IR corresponding to lanewise ADD:
 -----------------------------------
 119  loadConP  === _  [[ 118 ]]   [720000000119]
 118  loadV  === _ 120 119  [[ 117 ]] #16/0x0000000000000010vectory[8]:{int} !jvms: IntVector::intoArray @ bci:44 (line 3224) constant_ool::micro @ bci:35 (line 36)
 117  vaddI_mem_0  === 39 120 63 107 118  |53  [[ 116 ]] #2/0x00000002#16/0x0000000000000010vectory[8]:{int} !jvms: IntVector::intoArray @ bci:44 (line 3224) constant_ool::micro @ bci:35 (line 36)
 120  Phi  === 97 121 116  [[ 116 117 118 ]]  #memory  Memory: @int[int:>=0] (java/lang/Cloneable,java/io/Serializable):exact+any *, idx=8; !jvms: constant_ool::micro @ bci:16 (line 34)
  97  CountedLoop  === 97 98 104  [[ 97 90 107 116 120 ]] inner  strip mined !jvms: IntVector::intoArray @ bci:44 (line 3224) constant_ool::micro @ bci:35 (line 36)

 1) loadV (ONE:ConP) is scheduled within the loop due to its data dependency on memory(120) and address(119) during early GCM, since it users are also part of loop
 hence late scheduling does not alter its schedule.
 2) Manualy unrolled loop, emits a seperate loadV (ONE) for each lanewise because each load vector observes a different memory state (storeV poisons memory), thus GVN
    cannot share the constant load vectors.

*/
   public static void micro1(int [] res, int [] src) {
      for (int i = 0; i < ubound_loop(res.length, ISP.length() * 4); i += ISP.length() * 4) {
          IntVector.fromArray(ISP, src, i)
                   .lanewise(VectorOperators.ADD, ONE)
                   .intoArray(res, i);
          IntVector.fromArray(ISP, src, i + 8)
                   .lanewise(VectorOperators.ADD, ONE)
                   .intoArray(res, i + 8);
          IntVector.fromArray(ISP, src, i + 16)
                   .lanewise(VectorOperators.ADD, ONE)
                   .intoArray(res, i + 16);
          IntVector.fromArray(ISP, src, i + 24)
                   .lanewise(VectorOperators.ADD, ONE)
                   .intoArray(res, i + 24);
      }
   }

   public static void micro2(int [] res, int [] src) {
      for (int i = 0; i < ubound_loop(res.length, ISP.length() * 4); i += ISP.length() * 4) {
          IntVector v1 = IntVector.fromArray(ISP, src, i);
          IntVector v2 = IntVector.fromArray(ISP, src, i + 8);
          IntVector v3 = IntVector.fromArray(ISP, src, i + 16);
          IntVector v4 = IntVector.fromArray(ISP, src, i + 24);
          IntVector v5 = v1.lanewise(VectorOperators.ADD, ONE);
          IntVector v6 = v2.lanewise(VectorOperators.ADD, ONE);
          IntVector v7 = v3.lanewise(VectorOperators.ADD, ONE);
          IntVector v8 = v4.lanewise(VectorOperators.ADD, ONE);
          v5.intoArray(res, i);
          v6.intoArray(res, i + 8);
          v7.intoArray(res, i + 16);
          v8.intoArray(res, i + 24);
      }
   }

   public static void main(String [] args) {
      int algo = Integer.parseInt(args[0]);
      modify_one_lane(1, 1000);
      int [] src = IntStream.range(0, 4096).toArray();
      int [] res = new int[4096];
      if (algo == 0 || algo == -1) {
          for (int i = 0; i < 100000; i++) {
              micro1(res, src);
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 100000; i++) {
              micro1(res, src);
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
      }

      if (algo == 1 || algo == -1) {
          for (int i = 0; i < 100000; i++) {
              micro2(res, src);
          }
          long t1 = System.currentTimeMillis();
          for (int i = 0; i < 100000; i++) {
              micro2(res, src);
          }
          long t2 = System.currentTimeMillis();
          System.out.println("[time] " + (t2-t1) + " ms [res] " + Arrays.toString(Arrays.copyOfRange(res, 0, 16)));
      }
   }
}

/*

  Linux PERF:

CPROMPT>perf stat -e instructions,cycles,mem_inst_retired.all_loads  numactl --cpunodebind=1 -l java --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-modules=jdk.incubator.vector -XX:-TieredCompilation -XX:-UseOnStackReplacement -XX:LoopUnrollLimit=0 -Xbatch -cp . constant_ool 0
WARNING: Using incubator modules: jdk.incubator.vector
[time] 47 ms [res] [1, 1001, 3, 4, 5, 6, 7, 8, 9, 1009, 11, 12, 13, 14, 15, 16]

 Performance counter stats for 'numactl --cpunodebind=1 -l java --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-modules=jdk.incubator.vector -XX:-TieredCompilation -XX:-UseOnStackReplacement -XX:LoopUnrollLimit=0 -Xbatch -cp . constant_ool 0':

   35,75,28,19,000      instructions              #    1.57  insn per cycle
   22,73,16,55,539      cycles
   11,32,81,71,988      mem_inst_retired.all_loads

       6.553707509 seconds time elapsed

       6.498244000 seconds user
       0.112315000 seconds sys


CPROMPT>perf stat -e instructions,cycles,mem_inst_retired.all_loads  numactl --cpunodebind=1 -l java --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-modules=jdk.incubator.vector -XX:-TieredCompilation -XX:-UseOnStackReplacement -XX:LoopUnrollLimit=0 -Xbatch -cp . constant_ool 1
WARNING: Using incubator modules: jdk.incubator.vector
[time] 42 ms [res] [1, 1001, 3, 4, 5, 6, 7, 8, 9, 1009, 11, 12, 13, 14, 15, 16]

 Performance counter stats for 'numactl --cpunodebind=1 -l java --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED --add-modules=jdk.incubator.vector -XX:-TieredCompilation -XX:-UseOnStackReplacement -XX:LoopUnrollLimit=0 -Xbatch -cp . constant_ool 1':

   35,75,87,05,011      instructions              #    1.58  insn per cycle
   22,58,49,56,435      cycles
   11,25,75,37,563      mem_inst_retired.all_loads

       6.579572566 seconds time elapsed

       6.512997000 seconds user
       0.124401000 seconds sys

*/
