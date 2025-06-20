
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#define DUMP(...)                 \
  do {                            \
    fprintf(stdout, __VA_ARGS__); \
    fprintf(stdout, "\n");        \
  } while(0)

#define DUMP_INSTR_FIELD(INSTR, CVAL, FLD)   \
  do {                                       \
     uint8_t val = ##INSTR.bits.##CVAL.##FLD;\
     DUMP("VEX."##FLD" : %x", val);          \
  } while(0)

class X86_VEX_Encoding {
public:
   uint8_t b0;
   union {
     struct {
       uint8_t b1_mmmmm  : 5;
       uint8_t b1_B      : 1;
       uint8_t b1_X      : 1;
       uint8_t b1_R      : 1;
       uint8_t b2_pp     : 2; 
       uint8_t b2_L      : 1;
       uint8_t b2_vvvv   : 4;
       uint8_t b2_W      : 1;
     } c4;
     struct {
       uint8_t b1_pp     : 2;
       uint8_t b1_L      : 1;
       uint8_t b1_vvvv   : 4;
       uint8_t b1_R      : 1;
     } c5;
   } bits;
   uint8_t opcode;
   struct {
     uint8_t RM   : 3;
     uint8_t REG  : 3;
     uint8_t MODE : 2;
   } modrm;

   bool isTwoBytePrefix() { return b0 == 0xc5; }
   bool is_64bit_operand();

   uint8_t get_base_reg_bit();
   uint8_t get_index_reg_bit();
   uint8_t get_reg_reg_bit();
   uint8_t get_vvvv_bits();

   static const char* get_GPR(uint8_t reg);
   static const char* get_XMM(uint8_t xreg);
   static const char* get_vvvv_bits(uint8_t l);
   static const char* get_vector_encoding(uint8_t l);
   static const char* get_legacy_simd_prefix(uint8_t pp);
   static const char* get_legacy_escape_sequence(uint8_t map_select);
};


// Get the register mnemonic based on the VEX.VVVV, ModRM.REG, and ModRM.RM fields (XMM registers)
const char* X86_VEX_Encoding::get_XMM(uint8_t reg) {
  switch (reg) {
    case 0:
        return "%xmm0";
    case 1:
        return "%xmm1";
    case 2:
        return "%xmm2";
    case 3:
        return "%xmm3";
    case 4:
        return "%xmm4";
    case 5:
        return "%xmm5";
    case 6:
        return "%xmm6";
    case 7:
        return "%xmm7";
    case 8:
        return "%xmm8";
    case 9:
        return "%xmm9";
    case 10:
        return "%xmm10";
    case 11:
        return "%xmm11";
    case 12:
        return "%xmm12";
    case 13:
        return "%xmm13";
    case 14:
        return "%xmm14";
    case 15:
        return "%xmm15";
    default:
        return "Unknown";
  }
}

// Get the register mnemonic based on the VEX.VVVV, ModRM.REG, and ModRM.RM fields (GPRs)
const char* X86_VEX_Encoding::get_GPR(uint8_t reg) {
  switch (reg) {
    case 0:
       return "%rax";
    case 1:
        return "%rcx";
    case 2:
        return "%rdx";
    case 3:
        return "%rbx";
    case 4:
        return "%rsp";
    case 5:
        return "%rbp";
    case 6:
        return "%rsi";
    case 7:
        return "%rdi";
    case 8:
        return "%r8";
    case 9:
        return "%r9";
    case 10:
        return "%r10";
    case 11:
        return "%r11";
    case 12:
        return "%r12";
    case 13:
        return "%r13";
    case 14:
        return "%r14";
    case 15:
        return "%r15";
    default:
        return "Unknown";
  }
}

// Get the legacy escape sequence corresponding to VEX.MAP_SELECT
const char* X86_VEX_Encoding::get_legacy_escape_sequence(uint8_t map_select) {
  switch (map_select) {
    case 1:
      return "0F";
    case 2:
      return "0F_38";
    case 3:
      return "0F_3A";
    default:
      return "Unknown";
  }
}

uint8_t X86_VEX_Encoding::get_base_reg_bit() {
  assert(!isTwoBytePrefix() && "Cannot hold base register");
  return bits.c4.b1_B; 
}

uint8_t X86_VEX_Encoding::get_index_reg_bit() {
  assert(!isTwoBytePrefix() && "Cannot hold index register"); 
  return bits.c4.b1_X; 
}

uint8_t X86_VEX_Encoding::get_reg_reg_bit() {
  return isTwoBytePrefix() ? bits.c5.b1_R : bits.c4.b1_R; 
}

uint8_t X86_VEX_Encoding::get_vvvv_bits() {
  return isTwoBytePrefix() ? bits.c5.b1_vvvv : bits.c4.b2_vvvv; 
}

bool X86_VEX_Encoding::is_64bit_operand() {
  return isTwoBytePrefix() ? false  : bits.c4.b2_W; 
}


const char* X86_VEX_Encoding::get_legacy_simd_prefix(uint8_t pp) {
  switch (pp) {
    case 1:
      return "66";
    case 2:
      return "F3";
    case 3:
      return "F2";
    default:
      return "Unknown";
  }
}

const char* X86_VEX_Encoding::get_vector_encoding(uint8_t l) {
  return l ? "VEX_256" : "VEX_128";
}

void printEncoding(X86_VEX_Encoding instr) {
  DUMP("isTwoBytePrefix  : %s", (instr.isTwoBytePrefix() ? "True" : "False"));
  DUMP("is64Bit Operand  : %s", (instr.is_64bit_operand() ? "True" : "False"));
  if (!instr.isTwoBytePrefix()) {
     DUMP("VEX.B1.mmmmm : %x => %s", instr.bits.c4.b1_mmmmm, X86_VEX_Encoding::get_legacy_escape_sequence(instr.bits.c4.b1_mmmmm));
     DUMP("VEX.B1.B : %x", instr.bits.c4.b1_B);
     DUMP("VEX.B1.X : %x", instr.bits.c4.b1_X);
     DUMP("VEX.B1_R : %x", instr.bits.c4.b1_R);

     DUMP("VEX.B2.pp : %x => %s", instr.bits.c4.b2_pp, X86_VEX_Encoding::get_legacy_simd_prefix(instr.bits.c4.b2_pp)); 
     DUMP("VEX.B2.L : %x", instr.bits.c4.b2_L);
     DUMP("VEX.B2.vvvv: %x", instr.bits.c4.b2_vvvv);
     DUMP("VEX.B2.W : %x", instr.bits.c4.b2_W);
  } else {
     DUMP("VEX.B1.pp : %x", instr.bits.c5.b1_pp); 
     DUMP("VEX.B1.L : %x", instr.bits.c5.b1_L);
     DUMP("VEX.B1.vvvv: %x", instr.bits.c5.b1_vvvv);
     DUMP("VEX.B1_R : %x", instr.bits.c5.b1_R);
  }
  DUMP("\nInst.OPCODE : %x", instr.opcode); 
  DUMP("\nModRM.RM   : %x", instr.modrm.RM);
  DUMP("ModRM.REG  : %x", instr.modrm.REG);
  DUMP("ModRM.MODE : %x", instr.modrm.MODE); 

  uint8_t opr1 = -1, opr2 = -1, opr3 = -1;
  // REX.R, REX.B and REX.X bits are complimented to compute effective register encoding.
  opr1 = (~(instr.get_base_reg_bit() << 3) & 0x8) | ((instr.modrm.RM) & 0x7);
  if (!instr.isTwoBytePrefix()) {
    opr2 = (~(instr.get_reg_reg_bit() << 3) & 0x8) | ((instr.modrm.REG) & 0x7);
    opr3 = (~instr.get_vvvv_bits()) & 0xF;
  }
  DUMP("\nSRC1 = %s", X86_VEX_Encoding::get_GPR(opr1));
  DUMP("SRC2 = %s", X86_VEX_Encoding::get_GPR(opr2));
  DUMP("SRC3 = %s", X86_VEX_Encoding::get_GPR(opr3));
}

void decodeEncoding(const uint8_t* encodings, int length) {
  X86_VEX_Encoding instr;
  if (length == 0) {
    return;
  }
  instr.b0 = encodings[0];
  if (instr.b0 == 0xc5) {
    memcpy(((char*)&instr) + 1, encodings + 1, 1);
    memcpy(((char*)&instr) + 2, encodings + 2, 1);
    memcpy(((char*)&instr) + 3, encodings + 3, 1);
  } else {
    assert(instr.b0 == 0xc4 && "Incorrect prefix!");
    memcpy(((char*)&instr) + 1, encodings + 1, 2);
    memcpy(((char*)&instr) + 3, encodings + 3, 1);
    memcpy(((char*)&instr) + 4, encodings + 4, 1);
  }
  printEncoding(instr);
}

uint8_t hex_to_int[128];

uint8_t get_int(const char* hex) {
   uint8_t res = 0;
   for (int i = 0; i < strlen(hex); i++) {
      assert ((hex[i] >= '0' && hex[i] <= '9') || (hex[i] >= 'a' && hex[i] <= 'f'));
      res = res * 16 + hex_to_int[hex[i]];
   }
   return res;
}

char* get_bin(uint8_t val) {
   static char bin[32] = {0};
   static char rbin[32] = {0};
   int idx = 0;
   memset(bin, 0, 128);
   while(val) {
     bin[idx++] = val & 0x1 ? '1' : '0';
     val >>= 1;
   }
   for (int i = idx - 1, j = 0; i >= 0; i--) {
     rbin[j++] = bin[i];
   }
   return rbin;
}

int main(int argc, char* argv[]) {
   int length = 0;
   uint8_t encodings[15] = {0};

   if (argc < 2) {
     fprintf(stderr, "Missing encoding argument[s]\n");
     return -1;
   } 

   for (int i = 0; i < 128; i++) {
      if (i >= '0' && i <= '9') {
         hex_to_int[i] = i - '0';
      } else if (i >= 'a' && i <= 'z') {
         hex_to_int[i] = i - 'a' + 10;
      }
   }

   for (int i = 1; i < argc; i++) {
      encodings[length++] = get_int(argv[i]);
      DUMP("%s => %d (%s)\n", argv[i], encodings[length-1], get_bin(encodings[length-1]));
   }

   decodeEncoding(encodings, length);
   return 0;
}
