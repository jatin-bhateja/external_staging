

package org.openjdk.bench.java.math;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)

public class raw {
  public static final int SIZE = 4096;
  public static float [] arr;
  @Benchmark
  @OperationsPerInvocation(SIZE*SIZE)
  public static void workload_raw() {
   for (int j = 0; j < SIZE ; j++)
     for (int i = 0 ; i < SIZE-1 ; i++)
        arr[i+1] = arr[i];
  }
  @Benchmark
  @OperationsPerInvocation(SIZE*SIZE)
  public static void workload_war() {
   for (int j = 0; j < SIZE ; j++)
     for (int i = 0 ; i < SIZE-1 ; i++)
        arr[i] = arr[i+1];
  }

  @Setup(Level.Trial)
  public static void setup_workload(Blackhole bh) {
    arr = new float[SIZE];
    for (int i = 0; i < SIZE ;i++)
      arr[i] = 1.0f + i;
    bh.consume(arr[64]);
  }
}
