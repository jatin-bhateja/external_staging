package jvm.performance.benchmarks.api.vector;

import java.util.stream.IntStream;
import java.util.concurrent.TimeUnit;
import jdk.incubator.vector.*;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

/*
 * Columnar Databases filteration benchmark using new Vector.compress API added as part of JDK 19.
 *
 * References:
 *  - JEP 426: Vector API (Fourth Incubator): https://openjdk.org/jeps/426
 */
@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@Warmup(iterations = 5, time = 10, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 5, time = 10, timeUnit = TimeUnit.SECONDS)
@Fork(value = 5, jvmArgsPrepend = "--add-modules=jdk.incubator.vector")
@State(Scope.Benchmark)
public class ColumnarDBFilterBenchmark {

  // $ java -jar */*/benchmarks.jar ".*ColumnarDBFilterBenchmark.*"

  @Param({"262144", "1048576"})
  private int size;

  private int[] intArr;
  private int[] resultArr;
  private int pivot;

  private static final VectorSpecies<Integer> INT_VECTOR_SPECIES = IntVector.SPECIES_PREFERRED;

  @Setup
  public void setup() {
    intArr = IntStream.range(0, size).toArray();
    resultArr = new int[size];
    pivot = size / 2;
  }

  @Benchmark
  public void baseline_query_GT_pivot() {
    int[] intArr = this.intArr;
    for (int i = 0, j = 0; i < intArr.length; i++) {
      if (intArr[i] > pivot) {
         resultArr[j++] = intArr[i];
      }
    }
  }

  @Benchmark
  public void vectorized_query_GT_pivot() {
    int i = 0, j = 0;
    int[] intArr = this.intArr;

    IntVector pivot_bcast = IntVector.broadcast(INT_VECTOR_SPECIES, pivot);
    for (; i < INT_VECTOR_SPECIES.loopBound(intArr.length); i += INT_VECTOR_SPECIES.length()) {
      var segment = IntVector.fromArray(INT_VECTOR_SPECIES, intArr, i);
      var filter_mask = segment.compare(VectorOperators.GT, pivot_bcast);
      var res_vec = segment.compress(filter_mask);
      j += filter_mask.trueCount();
      res_vec.intoArray(resultArr, i);
    }
    for (; i < intArr.length; i++) {
      if (intArr[i] > pivot) {
         resultArr[j++] = intArr[i];
      }
    }
  }

  @Benchmark
  public void baseline_query_IS_EVEN_pivot() {
    int[] intArr = this.intArr;
    for (int i = 0, j = 0; i < intArr.length; i++) {
      if ((intArr[i] & 1) == 0) {
         resultArr[j++] = intArr[i];
      }
    }
  }

  @Benchmark
  public void vectorized_query_IS_EVEN_pivot() {
    int i = 0, j = 0;
    int[] intArr = this.intArr;
    IntVector even_bcast = IntVector.broadcast(INT_VECTOR_SPECIES, 0x1);
    for (; i < INT_VECTOR_SPECIES.loopBound(intArr.length); i += INT_VECTOR_SPECIES.length()) {
      var segment = IntVector.fromArray(INT_VECTOR_SPECIES, intArr, i);
      var filter_mask = segment.and(even_bcast).compare(VectorOperators.EQ, 0);
      var res_vec = segment.compress(filter_mask);
      j += filter_mask.trueCount();
      res_vec.intoArray(resultArr, i);
    }
    for (; i < intArr.length; i++) {
      if ((intArr[i] & 1) == 0) {
         resultArr[j++] = intArr[i];
      }
    }
  }
}
