
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.*;

import java.util.concurrent.TimeUnit;
import java.util.Random;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)


package jmh.tests;

@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
class test {
  @Param({"64","128","256","512","1024","2048","4096"}) private int VECLEN;

  private  int [] src;
  private  int [] dst;
  private Random r = new Random();

 @Setup
  public void init() {
    src = new int[VECLEN];
    dst = new int[VECLEN];
    for (int i=0; i<VECLEN; i++) {
      src[i] = r.nextInt();
      dst[i] = r.nextInt();
    }
  }

   @Benchmark
   public void copyMemUniform(int [] dst, int [] src) {
      assert src.length == dst.length;
      for(int i = 0 ; i < src.length ; i++) {
         dst[i] = src[i]
      }
   }

   @Benchmark
   public void copyMemRandom(int [] dst, int [] src) {
      assert src.length == dst.length;
      Random r = new Random();
      for(int i = 0 ; i < src.length ; i++) {
         int index = r.nextInt();
         dst[index] = src[index];
      }
   }
}
