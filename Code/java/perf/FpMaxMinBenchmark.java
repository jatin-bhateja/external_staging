/*
 * Copyright (c) 2014, Oracle America, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 *  * Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 *  * Neither the name of Oracle nor the names of its contributors may be used
 *    to endorse or promote products derived from this software without
 *    specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

package org.openjdk.bench.java.math;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

@OutputTimeUnit(TimeUnit.MICROSECONDS)
@State(Scope.Thread)
public class FpMaxMinBenchmark {

  public final int TESTSIZE = 4096;

  public float[] FargV1;
  public float[] FargV2;
  public double[] DargV1;
  public double[] DargV2;

  public final float[] FspecialVals = {
      0.0f, -0.0f, Float.NaN, Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY};

  public final double[] DspecialVals = {
      0.0, -0.0, Double.NaN, Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY};

  @Setup(Level.Trial)
  public void BmSetup() {
    Random r = new Random();
    FargV1 = new float[TESTSIZE];
    FargV2 = new float[TESTSIZE];
    DargV1 = new double[TESTSIZE];
    DargV2 = new double[TESTSIZE];

    for (int i = 0; i < TESTSIZE; i++) {
//      FargV1[i] = r.nextFloat() * 100f;
//      FargV2[i] = r.nextFloat() * 100f;
      DargV1[i] = 10.0f;
//      DargV2[i] = r.nextDouble() * 100f;
//      FargV1[i] = 12.0f;
//      FargV2[i] = 13.0f;
//      DargV1[i] = 12.0;
//      DargV2[i] = 13.0;
    }

//    for (int i = 0, j = 0; i < TESTSIZE; i += 100) {
//      FargV1[i] = FspecialVals[j++ % FspecialVals.length];
//      DargV1[i] = DspecialVals[j++ % DspecialVals.length];
//    }

//    for (int i = 50, j = 0; i < TESTSIZE; i += 50) {
//      FargV2[i] = FspecialVals[j++ % FspecialVals.length];
//      DargV2[i] = DspecialVals[j++ % DspecialVals.length];
//    }
  }

  @Benchmark
  @OperationsPerInvocation(TESTSIZE)
  public void testMaxD(Blackhole bh) {
    double Res = 0.0;
    for (int i = 0; i < TESTSIZE; i++) 
       Res = Math.max(Res, DargV1[i]); // True depencence with no-data variation (absolute balanaced case). 
    bh.consume(Res);
  }
}
