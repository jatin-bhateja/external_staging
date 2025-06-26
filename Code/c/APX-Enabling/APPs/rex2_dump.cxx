
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
     DUMP("REX2."##FLD" : %x", val);          \
  } while(0)

class X86_REX2_Encoding {
public:
   uint8_t b0_D5;
   uint8_t rex2_B3  : 1;
   uint8_t rex2_X3  : 1;
   uint8_t rex2_R3  : 1;
   uint8_t rex2_W   : 1;
   uint8_t rex2_B4  : 1;
   uint8_t rex2_X4  : 1;
   uint8_t rex2_R4  : 1;
   uint8_t rex2_M0  : 1;

   uint8_t opcode;

   struct {
     uint8_t RM   : 3;
     uint8_t REG  : 3;
     uint8_t MODE : 2;
   } modrm;

   uint8_t get_base1_reg_bit();
   uint8_t get_index1_reg_bit();
   uint8_t get_reg1_reg_bit();
   uint8_t get_base2_reg_bit();
   uint8_t get_index2_reg_bit();
   uint8_t get_reg2_reg_bit();
   const char* get_GPR(uint8_t reg);
   bool is_64bit_operand();

   static const char* get_XMM(uint8_t xreg);
   static const char* get_legacy_simd_prefix(uint8_t pp);
   static const char* get_legacy_escape_sequence(uint8_t map_select);
};


// Get the register mnemonic based on the REX2.VVVV, ModRM.REG, and ModRM.RM fields (XMM registers)
const char* X86_REX2_Encoding::get_XMM(uint8_t reg) {
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

// Get the register mnemonic based on the REX2.VVVV, ModRM.REG, and ModRM.RM fields (GPRs)
const char* X86_REX2_Encoding::get_GPR(uint8_t reg) {
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
    default: {
        assert(reg >= 8 && reg <= 31 && "Unknown register encoding");
        static char regname[5] = {'\0'};
        sprintf(regname, "%%r%d%c", reg, (is_64bit_operand() ? ' ' : 'd'));
        return regname;
    }
  }
}

// Get the legacy escape sequence corresponding to REX2.MAP_SELECT
const char* X86_REX2_Encoding::get_legacy_escape_sequence(uint8_t map_select) {
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

uint8_t X86_REX2_Encoding::get_base1_reg_bit() {
  assert(modrm.MODE  == 0x3 && "Cannot hold base register");
  return rex2_B3; 
}

uint8_t X86_REX2_Encoding::get_index1_reg_bit() {
  assert(modrm.MODE  == 0x3 && "Cannot hold base register");
  return rex2_X3; 
}

uint8_t X86_REX2_Encoding::get_reg1_reg_bit() {
  assert(modrm.MODE  == 0x3 && "Cannot hold base register");
  return rex2_R3; 
}

uint8_t X86_REX2_Encoding::get_base2_reg_bit() {
  assert(modrm.MODE  == 0x3 && "Cannot hold base register");
  return rex2_B4; 
}

uint8_t X86_REX2_Encoding::get_index2_reg_bit() {
  assert(modrm.MODE  == 0x3 && "Cannot hold base register");
  return rex2_X4; 
}

uint8_t X86_REX2_Encoding::get_reg2_reg_bit() {
  assert(modrm.MODE  == 0x3 && "Cannot hold base register");
  return rex2_R4; 
}

bool X86_REX2_Encoding::is_64bit_operand() {
  return rex2_W; 
}

const char* X86_REX2_Encoding::get_legacy_simd_prefix(uint8_t pp) {
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

void printEncoding(X86_REX2_Encoding instr) {
  DUMP("REX2.B3   : %x", instr.rex2_B3);
  DUMP("REX2.B3   : %x", instr.rex2_B3);
  DUMP("REX2.X3   : %x", instr.rex2_X3);
  DUMP("REX2.R3   : %x", instr.rex2_R3);

  DUMP("REX2.B4   : %x", instr.rex2_B4);
  DUMP("REX2.X4   : %x", instr.rex2_X4);
  DUMP("REX2.R4   : %x", instr.rex2_R4);

  DUMP("REX2.MO   : %x => %s", instr.rex2_M0, (instr.rex2_M0 ? "MAP1" : "MAP0")); 

  DUMP("\nInst.OPCODE : %x", instr.opcode); 

  DUMP("\nModRM.RM   : %x", instr.modrm.RM);
  DUMP("ModRM.REG  : %x", instr.modrm.REG);
  DUMP("ModRM.MODE : %x", instr.modrm.MODE); 

  uint8_t opr1 = -1, opr2 = -1, opr3 = -1;
  // REX2.R3/R4, REX2.B3/B4 and REX2.X3/X4 are used as it is without complimenting the bit..
  opr1 = ((instr.get_base2_reg_bit() << 4) & 0x10) | ((instr.get_base1_reg_bit() << 3) & 0x8) | ((instr.modrm.RM) & 0x7);
  opr2 = ((instr.get_reg2_reg_bit() << 4) & 0x10)  | ((instr.get_reg1_reg_bit() << 3) & 0x8) | ((instr.modrm.REG) & 0x7);
  DUMP("\nDST/SRC1 = %s", instr.get_GPR(opr1));
  DUMP("DST/SRC = %s", instr.get_GPR(opr2));
}

void decodeEncoding(const uint8_t* encodings, int length) {
  X86_REX2_Encoding instr;
  if (length == 0) {
    return;
  }
  instr.b0_D5 = encodings[0];
  assert(instr.b0_D5 == 0xd5);
  memcpy(((char*)&instr) + 1, encodings + 1, 1);
  memcpy(((char*)&instr) + 2, encodings + 2, 2);
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
