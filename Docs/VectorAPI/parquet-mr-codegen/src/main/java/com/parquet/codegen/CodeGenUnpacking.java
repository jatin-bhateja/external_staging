//
// Author: Jatin Bhateja (jatin.bhateja@intel.com)
// Vectorized integer unpacking algorithm code generator.
//
//----------------------------------------------------------------------------------------------------------//
// Implementation Notes:                                                                                    //
// 1) Algorithm begins by computing global parameters for a given decode bit size.                          //
// 2) Build a rudimentary IR (intermediate representation) decorated with computed immediate operands.      //
// 3) Introduce partial redundancies for shape conformance of RHS expressions of each AssignmentUnpck IR.        //
// 4) Optimize zero left/right shifts.                                                                      //
// 5) Code generator emitting globals declarations and vectorized implementation.                           //
// Multi-level logging information facilitates easy debugging.                                              //
//----------------------------------------------------------------------------------------------------------//
package com.parquet.codegen;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;
import java.io.FileOutputStream;

class RExprUnpck {
  public int byte_pos;
  public int right_shift;
  public int left_shift;
  public int start_bit;
  public int end_bit;
  public int filter_mask;
  public boolean is_redundant;
  public int decode_bit_pos_start;

  public boolean sweep_left_shift;
  public boolean sweep_right_shift;

  RExprUnpck(int bp, int rs, int ls, int sb, int eb, int fm, boolean isr, int dbps) {
    this.byte_pos = bp;
    this.right_shift = rs;
    this.left_shift = ls;
    this.start_bit = sb;
    this.end_bit = eb;
    this.filter_mask = fm;
    this.is_redundant = isr;
    this.decode_bit_pos_start = dbps;
  }

  RExprUnpck() {
    this.is_redundant = true;
  }

  String dump2() {
    String debug = "RExprUnpck(byte) : ";
    debug += " byte_pos = " + byte_pos;
    debug += " right_shift = " + right_shift;
    debug += " left_shift = " + left_shift;
    debug += " start_bit = " + start_bit;
    debug += " end_bit = " + end_bit;
    debug += " filter_mask = " + filter_mask;
    debug += " is_redundant = " + (is_redundant ? "true" : "false");
    debug += " sweep_right_shift = " + sweep_right_shift;
    debug += " sweep_left_shift = " + sweep_left_shift;
    debug += " running_bit_pos = " + decode_bit_pos_start;
    return debug;
  }
  String dump1() {
    String lshift = sweep_left_shift ? "" : (" << " + left_shift);
    String rshift = sweep_right_shift ? "" : (" >> " + right_shift);
    String debug = " RExprUnpck(byte) : ((in[";
    debug +=  byte_pos + "] " + rshift + " ) " + lshift + " ) & " + filter_mask + " // BC : " +
              (int)((end_bit - start_bit) + 1) + (is_redundant ? " [R] " : " [NR] ");
    return debug;
  }

  String dump() {
    if (Logger.debug_level <= 0) {
      return null;
    }
    return Logger.debug_level == 1 ? dump1() : dump2();
  }
}

class LExprUnpck {
  public int int_pos;
  LExprUnpck(int ip) {
    this.int_pos = ip;
  }
  public String dump() {
    return "LExprUnpck(int) : " + int_pos;
  }
}

class AssignmentUnpck {
  public int assign_idx;
  public LExprUnpck lexp;
  public List<RExprUnpck> RExprUnpcks;

  public AssignmentUnpck(int aidx) {
    this.assign_idx = aidx;
  }
  public void dump() {
    Logger.debug(1, "=================");
    Logger.debug(1, "Assignment : " + assign_idx);
    Logger.debug(1, "=================");
    Logger.debug(1, lexp.dump());
    for (var rexp : RExprUnpcks) {
       Logger.debug(1, rexp.dump());
    }
  }
}

// package private
class CodeGenUnpacking  extends CodeGen {
  public int scale;
  public int decode_bits;
  public int min_in_bytes;
  public int min_out_ints;
  public int inp_species;
  public int out_species;
  public long or_mask;
  public int scalar_in_cnt;
  public int scaled_in_bytes;
  public int scaled_out_ints;
  public int vector_size_in_bytes;
  public int cg_tables_count;
  public FileOutputStream fout;

  public List<AssignmentUnpck> assigns;

  // Bookkeeping data storage for optimize shift pass.
  public boolean [] redundant_rshift;
  public boolean [] redundant_lshift;

  // Free running global input bit counter for all the assignments.
  public int running_decode_bit_counter;
  public int short_cast_pos_multiplier;
  public int filler_byte_pos;

  enum VectorLaneType {
     BYTE(1),
     SHORT(2),
     INT(4),
     LONG(8);
     public final int size;
     VectorLaneType(int size) {
       this.size = size;
     }
  }

  // Euclid's algorithm.
  public int gcd(int a, int b) {
    if (b == 0) {
      return a;
    }
    return gcd(b, a % b);
  }

  public int lcm(int a, int b) {
    return (a * b) / gcd(a, b);
  }

  public void computeIOBytes() {
    int byte_count = decode_bits / 8;
    Logger.debug(2, "Byte count = " + byte_count);
    int bit_fraction = decode_bits & 7;
    Logger.debug(2, "Bit fraction = " + bit_fraction);
    int bit_fraction_mult8 = lcm(8, bit_fraction);
    Logger.debug(2, "LCM(fraction, 8) = " + bit_fraction_mult8);
    int byte_multiplier = bit_fraction == 0 ? 1 : bit_fraction_mult8 / bit_fraction;
    Logger.debug(2, "Byte multiplier = " + byte_multiplier);
    int bit_fraction_mult8_bytes = bit_fraction_mult8 / 8;
    min_in_bytes = bit_fraction_mult8_bytes + byte_count * byte_multiplier;
    Logger.debug(1, "Minimum input bytes = " + min_in_bytes);
    min_out_ints = byte_multiplier;
    Logger.debug(1, "Minimum output ints = " + min_out_ints);
  }

  public void computeScaleFactor() {
    int max_lanes = decode_bits >= 16 ? vector_size_in_bytes / 4 : vector_size_in_bytes/ 2;
    int lane_size_in_bytes = decode_bits >= 16 ? 4 : 2;
    short_cast_pos_multiplier = decode_bits >= 16 ? 1 : 2;
    filler_byte_pos = decode_bits >= 16 ? -1 : vector_size_in_bytes - 1;
    scale = Integer.max(max_lanes / Integer.max(min_out_ints, min_in_bytes), 1);
    Logger.debug(1, "Scale = " + scale);
    scaled_in_bytes = scale * min_in_bytes;
    Logger.debug(1, "Scaled input bytes = " + scaled_in_bytes);
    scaled_out_ints = scale * min_out_ints;
    Logger.debug(1, "Scaled output ints = " + scaled_out_ints);
  }

 public LExprUnpck createLhsExpr(int aidx) {
    LExprUnpck exp = new LExprUnpck(aidx);
    Logger.debug(1, exp.dump());
    return exp;
 }

 public List<RExprUnpck> createRhsExprs(int aidx) {
    List<RExprUnpck> RExprUnpcks = new ArrayList<RExprUnpck>();
    // Free running bits counter per assignment.
    int consumed_bits = 0;
    int remaining_decode_bits = decode_bits;
    while(remaining_decode_bits > 0) {
      int byte_pos = (consumed_bits + running_decode_bit_counter) / 8;
      int bit_pos = (consumed_bits + running_decode_bit_counter) & 7;
      int remaining_bits_in_curr_byte =  8 - bit_pos;
      int rs = bit_pos;
      int ls = consumed_bits;
      int sb = bit_pos;
      int eb = (remaining_decode_bits >= remaining_bits_in_curr_byte) ? 7 : (sb + remaining_decode_bits - 1);
      int bc = eb - sb + 1;
      consumed_bits += bc;
      int fm = (1 << consumed_bits) - 1;
      RExprUnpck RExprUnpck = new RExprUnpck(byte_pos, rs, ls, sb, eb, fm, false, consumed_bits + running_decode_bit_counter);
      Logger.debug(1, RExprUnpck.dump());
      RExprUnpcks.add(RExprUnpck);
      remaining_decode_bits -= bc;
    }
    // Increase global bit counter in lock steps of decode_bits.
    running_decode_bit_counter += decode_bits;
    return RExprUnpcks;
 }

 public void dumpAssignments(String phase) {
   Logger.debug(1, "==========================================");
   Logger.debug(1, "         " + phase);
   Logger.debug(1, "==========================================");
   for (var assign : assigns) {
      assign.dump();
   }
   Logger.debug(1, "==========================================");
 }

 public void createScalarAssignments() {
    assigns = new ArrayList<AssignmentUnpck>();
    for (int i = 0; i < scaled_out_ints; i++) {
       assigns.add(new AssignmentUnpck(i));
    }
    running_decode_bit_counter = 0;
    for (int i = 0; i < scaled_out_ints; i++) {
       AssignmentUnpck assign = assigns.get(i);
       assign.lexp = createLhsExpr(i);
       assign.RExprUnpcks = createRhsExprs(i);
    }
  }

  public void addRedundancies() {
    int max_expr_count = 0;
    for (var assign : assigns) {
       if (max_expr_count < assign.RExprUnpcks.size()) {
          max_expr_count = assign.RExprUnpcks.size();
       }
    }

    // Introduce redundancies in all the assignments
    // to generate isomorphic RHS expressions.
    for (var assign : assigns) {
       int redundant_expr_count = max_expr_count - assign.RExprUnpcks.size();
       while(redundant_expr_count > 0) {
         assign.RExprUnpcks.add(new RExprUnpck());
         redundant_expr_count--;
       }
    }
    cg_tables_count = assigns.get(0).RExprUnpcks.size();
    dumpAssignments("Post Redundancies Injection");
  }

  public void optimizeShifts() {
    redundant_lshift = new boolean[cg_tables_count];
    redundant_rshift = new boolean[cg_tables_count];
    Arrays.fill(redundant_rshift, true);
    Arrays.fill(redundant_lshift, true);
    for (int i = 0; i < cg_tables_count; i++) {
      for (var assign : assigns) {
        if (assign.RExprUnpcks.get(i).left_shift != 0) {
           redundant_lshift[i] = false;
           break;
        }
      }
      for (var assign : assigns) {
        if (assign.RExprUnpcks.get(i).right_shift != 0) {
           redundant_rshift[i] = false;
           break;
        }
      }
    }
    for (int i = 0; i < cg_tables_count; i++) {
       if(redundant_lshift[i]) {
          for(var assign : assigns) {
             assign.RExprUnpcks.get(i).sweep_left_shift = true;
          }
       }
       if(redundant_rshift[i]) {
          for(var assign : assigns) {
             assign.RExprUnpcks.get(i).sweep_right_shift = true;
          }
       }
    }
    dumpAssignments("Optimize Shifts");
  }

  public String genIndentedTable(int [] table) {
     String str = "";
     for (int i = 0; i < table.length; i++) {
        int idx = table[i];
        if ((i & 7) == 0) {
           str += "\n     ";
        }
        str +=  idx + ",";
     }
     return str;
  }

  public void genPermTables() {
    int tbl_size = decode_bits >= 16 ? 32: 64;
    int [] perm_indices = new int[tbl_size];
    writeToFile("  // Permutation tables.\n");
    for (int i = 0; i < cg_tables_count; i++) {
      int pos = 0;
      for (var assign : assigns) {
         perm_indices[pos++] = assign.RExprUnpcks.get(i).byte_pos * short_cast_pos_multiplier;
	 if (filler_byte_pos > 0) {
            perm_indices[pos++] = filler_byte_pos;
	 }
      }
      String perm_table = "  static int [] perm_table" + i + " = {";
      perm_table += genIndentedTable(perm_indices);
      perm_table += " \n  };\n";
      writeToFile(perm_table);
    }
  }

  public void genLshiftTables() {
    String table_type = decode_bits >= 16 ? "int" : "short";
    writeToFile("  // Left shift tables.\n");
    int tbl_size = decode_bits > 16 ? 32: 64;
    int [] lshift_indices = new int[tbl_size];
    for (int i = 0; i < cg_tables_count; i++) {
      int pos = 0;
      if (redundant_lshift[i]) {
        continue;
      }
      for (var assign : assigns) {
         lshift_indices[pos++] = assign.RExprUnpcks.get(i).left_shift;
      }
      String lshift_table = "  static  " + table_type + " [] lshift_table" + i + " = {";
      lshift_table += genIndentedTable(lshift_indices);
      lshift_table += " \n  };\n";
      writeToFile(lshift_table);
    }
  }

  public void genRshiftTables() {
    String table_type = decode_bits >= 16 ? "int" : "short";
    writeToFile("  // Right shift tables.\n");
    int tbl_size = decode_bits > 16 ? 32: 64;
    int [] rshift_indices = new int[tbl_size];
    for (int i = 0; i < cg_tables_count; i++) {
      int pos = 0;
      if (redundant_rshift[i]) {
        continue;
      }
      for (var assign : assigns) {
         rshift_indices[pos++] = assign.RExprUnpcks.get(i).right_shift;
      }
      String rshift_table = "  static  " + table_type + " [] rshift_table" + i + " = {";
      rshift_table += genIndentedTable(rshift_indices);
      rshift_table += " \n  };\n";
      writeToFile(rshift_table);
    }
  }

  public void genAndMaskTables() {
    String table_type = decode_bits >= 16 ? "int" : "short";
    writeToFile("  // AndMask tables.\n");
    int tbl_size = decode_bits > 16 ? 32: 64;
    int [] mask_values = new int[tbl_size];
    for (int i = 0; i < cg_tables_count; i++) {
      int pos = 0;
      for (var assign : assigns) {
         int filter_mask = assign.RExprUnpcks.get(i).filter_mask;
         mask_values[pos++] = decode_bits >= 16 ? filter_mask : (short)filter_mask;
      }
      String mask_table = "  static  " + table_type + " [] and_mask_table" + i + " = {";
      mask_table += genIndentedTable(mask_values);
      mask_table += " \n  };\n";
      writeToFile(mask_table);
    }
  }

  public void genHeader() {
    writeToFile("\n\n//////////////////////////////////////////////////////////////////////////////////////\n");
    writeToFile("///////// AUTO-GENERATED PARQUET " + decode_bits + " BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////\n");
    writeToFile("//////////////////////////////////////////////////////////////////////////////////////\n");
    writeToFile("\n\nimport jdk.incubator.vector.*;");
    writeToFile("\n\npublic class VectorBitUnpacker" + decode_bits + " {\n");
    writeToFile("\n");
  }

  public void genFooter() {
    writeToFile("} // Class VectorBitUnpacker" + decode_bits + "\n");
  }

  public void genRedundancyElisionMask() {
    for (int i = 0; i < assigns.size(); i++) {
       or_mask |= ((assigns.get(i).RExprUnpcks.get(cg_tables_count-1).is_redundant ? 0L : 1L) << i);
    }
  }

  public int getSpeciesByte(int bytes, VectorLaneType type) {
    bytes = bytes * type.size;
    if (bytes <= 16) {
      return 16;
    } else if (bytes <= 32) {
      return 32;
    } else if (bytes <= 64) {
      return 64;
    }
    assert(false);
    return -1;
  }

  public int getSpeciesBits(int bytes, VectorLaneType type) {
    return getSpeciesByte(bytes, type) * 8;
  }

  public long genInputMask() {
    return (1L << scaled_in_bytes) - 1;
  }

  public long genOutputMask() {
    return (1L << (scaled_out_ints & 15)) - 1;
  }

  // Emit an output mask for NPOT output count OR if output count does not fully fill the output vector.
  public boolean needsOutputMask() {
    return (((scaled_out_ints & (scaled_out_ints - 1)) != 0) || (scaled_out_ints < (out_species >> 5)));
  }

  public void genDeclarations() {
    String box_type = decode_bits >= 16 ? "Integer" : "Short";
    inp_species = getSpeciesBits(scaled_in_bytes, VectorLaneType.BYTE);
    out_species = getSpeciesBits(scaled_out_ints, decode_bits > 16 ? VectorLaneType.INT : VectorLaneType.SHORT);

    writeToFile("\n\n  // Global Initializing declerations.\n");
    writeToFile("  public static final VectorSpecies<Byte> B" + inp_species + " = ByteVector.SPECIES_" + inp_species + ";\n");
    if (decode_bits < 16) {
       writeToFile("  public static final VectorSpecies<Integer> I512 = IntVector.SPECIES_512;\n");
       writeToFile("  public static final VectorSpecies<Short> S512 = ShortVector.SPECIES_512;\n");
       writeToFile("  public static final VectorSpecies<Byte> B512 = ByteVector.SPECIES_512;\n");
    } else {
       writeToFile("  public static final VectorSpecies<Integer> I256 = IntVector.SPECIES_256;\n");
       if (inp_species != 256) {
         writeToFile("  public static final VectorSpecies<Byte> B256 = ByteVector.SPECIES_128;\n");
       }
    }
    writeToFile("  public static final VectorMask<Byte> input_mask = VectorMask.fromLong(B" + inp_species + ",  " + genInputMask() + "L);\n");
    if (needsOutputMask()) {
       writeToFile("  public static final VectorMask<Integer> output_mask = VectorMask.fromLong(I" + out_species + ",  " + genOutputMask() + "L);\n");
    }
    writeToFile("  \n");

    if (decode_bits >= 16) {
      writeToFile("  public static final VectorMask<Integer> or_mask = VectorMask.fromLong(I256, " + or_mask + "L);\n");
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
         writeToFile("  public static final VectorShuffle<Byte> perm_mask" + i + " = VectorShuffle.fromArray(B256, perm_table" + i + ", 0);\n");
      }
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
        writeToFile("  public static final Vector<" + box_type + "> and_vec" + i + " = IntVector.fromArray(I256, and_mask_table" + i + ", 0);\n");
      }
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
        if (!redundant_lshift[i]) {
           writeToFile("  public static final Vector<" + box_type + "> lshift_cnt" + i + " = IntVector.fromArray(I256, lshift_table" + i + ", 0);\n");
        }
      }
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
        if (!redundant_rshift[i]) {
           writeToFile("  public static final Vector<" + box_type + "> rshift_cnt" + i + " = IntVector.fromArray(I256, rshift_table" + i + ", 0);\n");
        }
      }
      writeToFile("  \n");
    } else {
      if (out_species != 512) {
         writeToFile("  public static final VectorSpecies<Short> S" + out_species + " = ShortVector.SPECIES_" + out_species + ";\n");
      }
      writeToFile("  public static final VectorMask<Short> or_mask = VectorMask.fromLong(S512 ," + or_mask + "L);\n");
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
         writeToFile("  public static final VectorShuffle<Byte> perm_mask" + i + " = VectorShuffle.fromArray(B512, perm_table" + i + ", 0);\n");
      }
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
         writeToFile("  public static final Vector<" + box_type + "> and_vec" + i + " = ShortVector.fromArray(S512, and_mask_table" + i + ", 0);\n");
      }
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
        if (!redundant_lshift[i]) {
           writeToFile("  public static final Vector<" + box_type + "> lshift_cnt" + i + " = ShortVector.fromArray(S512, lshift_table" + i + ", 0);\n");
        }
      }
      writeToFile("  \n");
      for (int i = 0; i < cg_tables_count; i++) {
        if (!redundant_rshift[i]) {
           writeToFile("  public static final Vector<" + box_type + "> rshift_cnt" + i + " = ShortVector.fromArray(S512, rshift_table" + i + ", 0);\n");
        }
      }
      writeToFile("  \n");
    }
  }

  public void genMethodBody() {
    writeToFile("\n  public static void unpack8Values_vec(final byte[] in, final int inPos, final int[] out, final int outPos) {\n");
    if (decode_bits < 16) {
       writeToFile("     ByteVector byteVector = ByteVector.fromArray(B" + inp_species + ", in, inPos, input_mask)\n");
       writeToFile("                                       .castShape(S512, 0)\n");
       writeToFile("                                       .reinterpretAsBytes();\n");
       for (int i = 0; i < cg_tables_count; i++) {
            writeToFile("\n     ShortVector tempRes" + i + " = byteVector.rearrange(perm_mask" + i + ")\n");
            writeToFile("               .reinterpretAsShorts()\n");
            if (!redundant_rshift[i]) {
              writeToFile("               .lanewise(VectorOperators.LSHR, rshift_cnt" + i + ")\n");
            }
            if (!redundant_lshift[i]) {
              writeToFile("               .lanewise(VectorOperators.LSHL, lshift_cnt" + i + ")\n");
            }
            writeToFile("               .lanewise(VectorOperators.AND, and_vec" + i + ");\n");
       }

       for (int i = 1; i < cg_tables_count-1; i++) {
            writeToFile("\n     tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes" + i + ");\n");
       }
       writeToFile("\n     tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes" + (cg_tables_count - 1) + ", or_mask);\n");
       writeToFile("     tempRes0.castShape(I512, 0).reinterpretAsInts().intoArray(out, outPos);\n");
       if (scaled_out_ints > 16) {
           // scaled_out_ints is a non-power of two value then emit the output mask.
           if (needsOutputMask()) {
              writeToFile("     tempRes0.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16, output_mask);\n");
           } else {
              writeToFile("     tempRes0.castShape(I512, 1).reinterpretAsInts().intoArray(out, outPos+16);\n");
           }
       }
       writeToFile("  }\n\n");
    } else {
       writeToFile("    ByteVector byteVector = ByteVector.fromArray(B" + inp_species + ", in, inPos, input_mask);\n");
       for (int i = 0; i < cg_tables_count; i++) {
            writeToFile("\n    IntVector tempRes" + i + " = byteVector.rearrange(perm_mask" + i + ")\n");
            writeToFile("              .convertShape(VectorOperators.B2I, I256, 0)\n");
            writeToFile("              .reinterpretAsInts()\n");
            if (!redundant_rshift[i]) {
              writeToFile("               .lanewise(VectorOperators.LSHR, rshift_cnt" + i + ")\n");
            }
            if (!redundant_lshift[i]) {
              writeToFile("               .lanewise(VectorOperators.LSHL, lshift_cnt" + i + ")\n");
            }
            writeToFile("              .lanewise(VectorOperators.AND, and_vec" + i + ");\n");
       }

       for (int i = 1; i < cg_tables_count-1; i++) {
            writeToFile("\n    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes" + i + ");\n");
       }
       writeToFile("\n    tempRes0  = tempRes0.lanewise(VectorOperators.OR, tempRes" + (cg_tables_count - 1) + ", or_mask);\n");
       if (needsOutputMask()) {
          writeToFile("    tempRes0.reinterpretAsInts().intoArray(out, outPos, output_mask);\n");
       } else {
          writeToFile("    tempRes0.reinterpretAsInts().intoArray(out, outPos);\n");
       }

       writeToFile(" }\n\n");
    }
  }

  public void genMainMethod() {
    writeToFile("  public static final int ITERS = 500000;\n");
    writeToFile("\n");
    writeToFile("  public static long addOutputs(int [] out) {\n");
    writeToFile("     long res = 0;\n");
    writeToFile("     // TODO: Tail should be a truely scalar code, currently scalar code is also processed in batches.\n");
    writeToFile("     // Check how parquet handels it and call those appropriate routines for tail processing.\n");
    writeToFile("     for(int i = 0; i < SIZE - 64; i++) {\n");
    writeToFile("        res += out[i];\n");
    writeToFile("     }\n");
    writeToFile("     return res;\n");
    writeToFile("  }\n");
    writeToFile("  \n");
    writeToFile("  public static void scalar_packing(byte [] in , int [] out, int ctr) {\n");
    writeToFile("     for(int i = 0, j = 0 ; i < in.length-" + decode_bits + " ; i+=" + decode_bits + ", j+= 8) {\n");
    writeToFile("        packer.unpack8Values(in, i, out, j);\n");
    writeToFile("     }\n");
    writeToFile("  }\n");
    writeToFile("  \n");
    writeToFile("  public static void vector_packing(byte [] in , int [] out, int ctr) {\n");
    writeToFile("     int i = 0;\n");
    writeToFile("     int j = 0;\n");
    writeToFile("     for(; i < in.length-" + scaled_in_bytes + "; i+=" + scaled_in_bytes + ", j+=" + scaled_out_ints + ") {\n");
    writeToFile("        VectorBitUnpacker"+ decode_bits+ ".unpack8Values_vec(in, i, out, j);\n");
    writeToFile("     }\n");
    // Tail should be scalar code, currently scalar part is also processed in batches, need to check
    // how parquet handles those cases.
    if (scaled_in_bytes > decode_bits) {
        writeToFile("     for(; i < in.length-" + decode_bits + "; i+=" + decode_bits + ", j+= 8) {\n");
        writeToFile("        packer.unpack8Values(in, i, out, j);\n");
        writeToFile("     }\n");
    }
    writeToFile("  }\n");
    writeToFile("\n");
    writeToFile("  public static final BytePacker packer =  ByteBitPackingLE.factory.newBytePacker(" + decode_bits + "); \n");
    writeToFile("  public static final int SIZE = 512;\n");
    writeToFile("\n");
    writeToFile("  public static void main(String [] args) {\n");
    writeToFile("      byte [] in = new byte[SIZE*" + min_in_bytes + "];\n");
    writeToFile("      int [] out = new int[SIZE*" + min_out_ints + "];\n");
    writeToFile("      for(int i = 0 ; i < in.length ;i++) {\n");
    writeToFile("         in[i] = (byte)i;\n");
    writeToFile("      }\n");
    writeToFile("\n");
    writeToFile("      for(int i = 0; i < ITERS; i++) {\n");
    writeToFile("         scalar_packing(in, out, i & (SIZE-1)); \n");
    writeToFile("      } \n");
    writeToFile("      long t1 = System.currentTimeMillis();\n");
    writeToFile("      for(int i = 0; i < ITERS; i++) {\n");
    writeToFile("         scalar_packing(in, out, i & (SIZE-1)); \n");
    writeToFile("      } \n");
    writeToFile("      long t2 = System.currentTimeMillis();\n");
    writeToFile("      long scalar_res = addOutputs(out);\n");
    writeToFile("      System.out.println(\"[Res] \" + scalar_res + \" [Scalar Time] \" + (t2-t1) + \" ms\");\n");
    writeToFile("\n");
    writeToFile("      for(int i = 0; i < ITERS; i++) {\n");
    writeToFile("         vector_packing(in, out, i & (SIZE-1)); \n");
    writeToFile("      } \n");
    writeToFile("      t1 = System.currentTimeMillis();\n");
    writeToFile("      for(int i = 0; i < ITERS; i++) {\n");
    writeToFile("         vector_packing(in, out, i & (SIZE-1)); \n");
    writeToFile("      } \n");
    writeToFile("      t2 = System.currentTimeMillis();\n");
    writeToFile("      long vector_res = addOutputs(out);\n");
    writeToFile("      String validation = vector_res == scalar_res ? \"PASS\" : \"FAIL\"; \n");
    writeToFile("      System.out.println(\"[Res] \" + vector_res + \" [Vector Time] \" + (t2-t1) + \" ms   [Validation] \" + validation); \n");
    writeToFile("  }\n\n");
  }

  public void genVectorMethod() {
    genHeader();
    genRedundancyElisionMask();
    genPermTables();
    genLshiftTables();
    genRshiftTables();
    genAndMaskTables();
    genDeclarations();
    genMethodBody();
    genMainMethod();
    genFooter();
  }

  public void start() throws Exception {
    fout = new FileOutputStream("VectorBitUnpacker"+decode_bits+".java");
    Logger.debug(1, "Decode BitWidth = " + decode_bits);
    computeIOBytes();
    computeScaleFactor();
    createScalarAssignments();
    addRedundancies();
    optimizeShifts();
    genVectorMethod();
    fout.close();
  }

  public CodeGenUnpacking(int bw, int vw) {
    this.decode_bits = bw;
    this.vector_size_in_bytes = vw;
  }

  public void writeToFile(String msg) {
    assert fout != null;
    try {
      fout.write(msg.getBytes());
    } catch(Exception e) {
      System.out.println(e);
    }
  }
}
