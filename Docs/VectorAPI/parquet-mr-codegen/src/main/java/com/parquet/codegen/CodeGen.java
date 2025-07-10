//
// Author: Jatin Bhateja (jatin.bhateja@intel.com)
// Vectorized Lemire integer unpacking algorithm code generator.
//
//----------------------------------------------------------------------------------------------------------//
// Implementation Notes:                                                                                    //
// 1) Algorithm begins by computing global parameters for a given decode bit size.                          //
// 2) Build a rudimentary IR (intermediate representation) decorated with computed immediate operands.      //
// 3) Introduce partial redundancies for shape conformance of RHS expressions of each assignment IR.        //
// 4) Optimize zero left/right shifts.                                                                      //
// 5) Code generator emitting globals declarations and vectorized implementation.                           //
// Multi-level logging information facilitates easy debugging.                                              //
//----------------------------------------------------------------------------------------------------------//
package com.parquet.codegen;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;
import java.io.FileOutputStream;

class Logger {
  public static int debug_level;
  public static void debug(int level, String msg) {
    if (debug_level >= level) {
      System.out.println("[Debug][" + level + "] : " + msg);
    }
  }
}

public abstract class CodeGen {
  public abstract void start() throws Exception;

  public static void main(String [] args) {
    try {
      int packing = Integer.parseInt(args[0]);
      int bw = Integer.parseInt(args[1]);
      int vw = Integer.parseInt(args[2]);
      Logger.debug_level = Integer.parseInt(args[3]);
      assert bw > 0 && bw < 32;
      assert vw > 0 && vw < 64;
      CodeGen cg = packing == 0 ? new CodeGenUnpacking(bw, vw) : new CodeGenPacking(bw, vw);
      cg.start();
    } catch(Exception e) {
      System.out.println("CodeGen <packing=1/unpacking=0> <decode_bit_width> <vector_size_in_bytes> <debug_level[0:3]>");
    }
  }
}
