
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
     DUMP("EVEX."##FLD" : %x", val);         \
  } while(0)

class X86_EVEX_Encoding {
public:
   uint8_t b0;

   uint8_t p0_mmm  : 3;
   uint8_t blank0  : 1;
   uint8_t p0_R1   : 1;
   uint8_t p0_B    : 1;
   uint8_t p0_X    : 1;
   uint8_t p0_R    : 1;
   
   uint8_t p1_pp   : 2;
   uint8_t blank1  : 1;
   uint8_t p1_vvvv : 4;
   uint8_t p1_W    : 1;

   uint8_t p2_aaa  : 3;
   uint8_t p2_V1   : 1;
   uint8_t p2_b    : 1;
   uint8_t p2_LL1  : 2;
   uint8_t p2_z    : 1;

   uint8_t opcode;

   struct {
     uint8_t RM   : 3;
     uint8_t REG  : 3;
     uint8_t MODE : 2;
   } modrm;

   bool is_64bit_operand();

   uint8_t get_rm_index_reg_bit();
   uint8_t get_rm_base_reg_bit();
   uint8_t get_index_reg_bit();
   uint8_t get_reg_reg_bit();
   uint8_t get_reg_reg1_bit();
   uint8_t get_vvvv_bits();
   uint8_t get_v1_bit();
   const char* get_XMM(uint8_t xreg);

   static const char* get_GPR(uint8_t reg);
   static const char* get_vvvv_bits(uint8_t l);
   static const char* get_vector_encoding(uint8_t l);
   static const char* get_legacy_simd_prefix(uint8_t pp);
   static const char* get_legacy_escape_sequence(uint8_t map_select);
};


// Get the register mnemonic based on the EVEX.VVVV, ModRM.REG, and ModRM.RM fields (XMM registers)
const char* X86_EVEX_Encoding::get_XMM(uint8_t reg) {
  assert(reg >= 0 || reg <= 15 && "Unknown XMM encoding");
  static char regname[7] = {0};
  auto reg_prefix = [&] ( ) {
     switch (p2_LL1) {
        case 0 : return 'x';
        case 1 : return 'y';
        case 2 : return 'z';
        default: return (char)0;
     }
  };
  sprintf(regname, "%cmm%d", reg_prefix(), reg); 
  return regname;
}

// Get the register mnemonic based on the EVEX.VVVV, ModRM.REG, and ModRM.RM fields (GPRs)
const char* X86_EVEX_Encoding::get_GPR(uint8_t reg) {
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

// Get the legacy escape sequence corresponding to EVEX.MAP_SELECT
const char* X86_EVEX_Encoding::get_legacy_escape_sequence(uint8_t map_select) {
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

uint8_t X86_EVEX_Encoding::get_rm_base_reg_bit() {
  assert(modrm.MODE == 0x3);
  return p0_B; 
}

uint8_t X86_EVEX_Encoding::get_rm_index_reg_bit() {
  assert(modrm.MODE == 0x3);
  return p0_X; 
}

uint8_t X86_EVEX_Encoding::get_index_reg_bit() {
  return p0_X; 
}

uint8_t X86_EVEX_Encoding::get_reg_reg_bit() {
  assert(modrm.MODE == 0x3);
  return p0_R; 

}
uint8_t X86_EVEX_Encoding::get_reg_reg1_bit() {
  assert(modrm.MODE == 0x3);
  return p0_R1; 
}

uint8_t X86_EVEX_Encoding::get_vvvv_bits() {
  return p1_vvvv; 
}

uint8_t X86_EVEX_Encoding::get_v1_bit() {
  return p2_V1; 
}

bool X86_EVEX_Encoding::is_64bit_operand() {
  return p1_W; 
}


const char* X86_EVEX_Encoding::get_legacy_simd_prefix(uint8_t pp) {
  switch (pp) {
    case 1:
      return "66";
    case 2:
      return "F3";
    case 3:
      return "F2";
    case 5:
      return "MAP5";
    case 6:
      return "MAP6";
    default:
      return "Unknown map";
  }
}

const char* X86_EVEX_Encoding::get_vector_encoding(uint8_t ll1) {
  switch(ll1) {
    case 0 : return "EVEX_128";
    case 1 : return "EVEX_256";
    case 2 : return "EVEX_512";
    default : return "Unknown vector width";
  }
}

void printEncoding(X86_EVEX_Encoding instr) {
  DUMP("is64Bit Operand  : %s", (instr.is_64bit_operand() ? "True" : "False"));
  DUMP("EVEX.p0.mmm : %x => %s", instr.p0_mmm, X86_EVEX_Encoding::get_legacy_escape_sequence(instr.p0_mmm));
  DUMP("EVEX.p0_R1 : %x", instr.p0_R1);
  DUMP("EVEX.p0.B : %x", instr.p0_B);
  DUMP("EVEX.p0.X : %x", instr.p0_X);
  DUMP("EVEX.p0_R : %x", instr.p0_R);

  DUMP("EVEX.p1.pp : %x => %s", instr.p1_pp, X86_EVEX_Encoding::get_legacy_simd_prefix(instr.p1_pp)); 
  DUMP("EVEX.p1.vvvv: %x", instr.p1_vvvv);
  DUMP("EVEX.p1.W : %x", instr.p1_W);

  DUMP("EVEX.p2.aaa : %x", instr.p2_aaa);
  DUMP("EVEX.p2.V1  : %x", instr.p2_V1);
  DUMP("EVEX.p2.b   : %x", instr.p2_b);
  DUMP("EVEX.p2_LL1 : %x => %s", instr.p2_LL1, X86_EVEX_Encoding::get_vector_encoding(instr.p2_LL1));
  DUMP("EVEX.p2_z   : %x", instr.p2_z);

  DUMP("\nInst.OPCODE : %x", instr.opcode); 
  DUMP("\nModRM.RM   : %x", instr.modrm.RM);
  DUMP("ModRM.REG  : %x", instr.modrm.REG);
  DUMP("ModRM.MODE : %x", instr.modrm.MODE); 

  uint8_t opr1 = -1, nds = -1, opr3 = -1;

  // REX.R, REX.B and REX.X bits are complimented to compute effective register encodings.
  opr1 = (~(instr.get_rm_index_reg_bit() << 4) & 0x10) | (~(instr.get_rm_base_reg_bit() << 3) & 0x8) | instr.modrm.RM & 0x7;
  nds = (~instr.get_vvvv_bits() & 0xF) | (~(instr.p2_V1 << 4) & 0x10);
  opr3 = (instr.modrm.REG & 0x7) | (~(instr.get_reg_reg_bit() << 3) & 0x8) | (~(instr.get_reg_reg1_bit() << 4) & 0x10);
  DUMP("\nSRC1 = %s", instr.get_XMM(opr1));
  DUMP("NDS = %s", instr.get_XMM(nds));
  DUMP("SRC2 = %s", instr.get_XMM(opr3));
}

void decodeEncoding(const uint8_t* encodings, int length) {
  X86_EVEX_Encoding instr;
  if (length == 0) {
    return;
  }
  instr.b0 = encodings[0];
  assert(instr.b0 == 0x62 && "Incorrect prefix!");
  memcpy(((char*)&instr) + 1, encodings + 1, 3);
  memcpy(((char*)&instr) + 4, encodings + 4, 1);
  memcpy(((char*)&instr) + 5, encodings + 5, 1);
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
