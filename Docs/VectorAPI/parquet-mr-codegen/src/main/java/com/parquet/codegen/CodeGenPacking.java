//
// Author: Jatin Bhateja (jatin.bhateja@intel.com)
// Vectorized integer packing algorithm code generator.
//

package com.parquet.codegen;

import java.util.*;
import java.io.FileOutputStream;


class CodeGenPacking extends CodeGen {
   static int [][] io_size = {
     {16, 2},   // 1  (I)
     {16, 4},   // 2  (I)
     {16, 6},   // 3  (I)
     {16, 8},   // 4  (I)
     {16, 10},  // 5  (I)
     {16, 12},  // 6  (I)
     {16, 14},  // 7  (I)
     {16, 16},  // 8  (I)
     {16, 18},  // 9  (S)
     {16, 20},  // 10 (S)
     {16, 22},  // 11 (S)
     {16, 24},  // 12 (S)
     {16, 26},  // 13 (S)
     {16, 28},  // 14 (S)
     {16, 30},  // 15 (S)
     {16, 32},  // 16 (S)
     {8, 17},   // 17 (S)
     {8, 18},   // 18 (S)
     {8, 19},   // 19 (S)
     {8, 20},   // 20 (S)
     {8, 21},   // 21 (S)
     {8, 22},   // 22 (S)
     {8, 23},   // 23 (S)
     {8, 24},   // 24 (S)
     {8, 25},   // 25 (S)
     {8, 26},   // 26 (S)
     {8, 27},   // 27 (S)
     {8, 28},   // 28 (S)
     {8, 29},   // 29 (S)
     {8, 30},   // 30 (S)
     {8, 31},   // 31 (S)
   };

   public int vw;
   public int encode_bits;
   public AssignsPck assigns; 
   public static int running_bits;
   public FileOutputStream fout;
 
   static class AssignsPck {
     public List<AssignPck> assigns;
     public AssignsPck() {
        assigns = new ArrayList<AssignPck>();
     }
     @Override
     public String toString() {
        StringBuffer str = new StringBuffer();
        for(int i = 0; i < assigns.size(); i++) {
           str.append(assigns.get(i).toString());
        }
        return str.toString();
     }
     public void add(AssignPck obj, int idx) {
        assigns.add(idx, obj);
     }
     public AssignPck get(int idx) {
        return assigns.get(idx);
     }
   }

   static class AssignPck {
      public LExprPck lhs;
      public List<RExprPck> rhs;  
      @Override
      public String toString() {
         StringBuffer buf = new StringBuffer();
         for(var rexpr : rhs) {
            buf.append(rexpr.toString() + " | ");
         }
         return lhs.toString() + " = " + buf.toString();
      }
   }

   static class LExprPck {
      public int byteIndex;
      public LExprPck(int idx) {
        byteIndex = idx;
      }
      @Override
      public String toString() {
         return " B" + byteIndex;
      }
   }

   static class RExprPck {
      public int intIdx;
      public int startPos;
      public int endPos;
      public int lShift;
      public int rShift;
      public int andMask;
      @Override
      public String toString() {
         return "(( I" + intIdx + "  >> " + rShift + " ) & " + andMask + "  ) << " + lShift + " )";
      }
      public RExprPck(int intIdx, int startPos, int endPos, int rshift, int lshift, int andMask) {
         this.intIdx = intIdx;
         this.startPos = startPos;
         this.endPos = endPos;
         this.rShift = rshift;
         this.lShift = lshift;
         this.andMask = andMask;
      }
   }

   public void start() throws Exception {
      fout = new FileOutputStream("VectorBitPacker"+encode_bits+".java");
      assigns = new AssignsPck();
      Logger.debug(1, Arrays.toString(io_size[encode_bits - 1]));
      for(int i = 0; i < io_size[encode_bits-1][1]; i++) {
         AssignPck assign = new AssignPck();
         assign.lhs = new LExprPck(i);
         assign.rhs = genRExpres(i);
         Logger.debug(1, assign.toString());
         assigns.add(assign, i);
      }
      genVectorMethod();
   }

  public void genHeader() {
    writeToFile("\n\n//////////////////////////////////////////////////////////////////////////////////////\n");
    writeToFile("///////// AUTO-GENERATED PARQUET " + encode_bits + " BIT VECTORIZED INTEGER UNPACKING ALGORITHM /////////\n");
    writeToFile("//////////////////////////////////////////////////////////////////////////////////////\n");
    writeToFile("\n\nimport jdk.incubator.vector.*;");
    writeToFile("\n\n/*");
    writeToFile("\nIR dump of scalar assignments with shifts and and_mask.\n");
    writeToFile("=======================================================\n");;
    for(int i = 0; i < io_size[encode_bits-1][1]; i++) {
        writeToFile(assigns.get(i).toString() + "\n");
    }
    writeToFile("=======================================================\n");;
    writeToFile("*/\n\n");
    writeToFile("\n\npublic class VectorBitPacker" + encode_bits + " {\n");
    writeToFile("\n");
  }

  public void genFooter() {
    writeToFile("} // Class VectorBitPacker" + encode_bits + "\n");
  }

  public void genVectorMethod() {
    genHeader();
    /*genRedundancyElisionMask();
    genPermTables();
    genLshiftTables();
    genRshiftTables();
    genAndMaskTables();
    genDeclarations();
    genMethodBody();
    genMainMethod();
    */
    genFooter();
  }

  public void writeToFile(String msg) {
     assert fout != null;
     try {
       fout.write(msg.getBytes());
     } catch(Exception e) {
       System.out.println(e);
     }
  }

   public List<RExprPck> genRExpres(int idx) {
      int bits = 0;
      int lastbPos = 0;
      List<RExprPck> rexprs = new ArrayList<RExprPck>();
      while(bits < 8) {
         int intIdx = running_bits / encode_bits;
         int intPos = running_bits % encode_bits;
         int bitPos = running_bits & 7;
         int remaining_bits = encode_bits - intPos;
         int consumableBits = 8 - bitPos;
         if (remaining_bits > consumableBits) {
            rexprs.add(new RExprPck(intIdx, intPos, intPos + consumableBits - 1, intPos, lastbPos, (1 << consumableBits) -1)); 
            running_bits += consumableBits;
            lastbPos = (lastbPos + consumableBits) & 7;
            bits += consumableBits;
         } else {
            rexprs.add(new RExprPck(intIdx, intPos, intPos + remaining_bits - 1, intPos, lastbPos, (1 << remaining_bits) -1));
            running_bits += remaining_bits;
            lastbPos = (lastbPos + remaining_bits) & 7;
            bits += remaining_bits;
         }
      }
      return rexprs;
   }

   public CodeGenPacking(int encode_bits, int vw) {
      this.encode_bits = encode_bits;
      this.vw = vw;
   }
}
