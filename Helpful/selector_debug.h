#ifndef _SELECTOR_DEBUG
#define _SELECTOR_DEBUG

#include <iostream>
#include <string>
#include <fstream>

static int _ws = 10;
extern outputStream* tty;           // tty output

class DebugSelector {
public:
   DebugSelector(bool file=true) {
     _ws += 10; 
   }

  ~DebugSelector() {
     _ws -= 10; 
   }

  char *GetBlankSpace() {
    int i = 0;
    static char BLANKS[4096] = {'\0'};
    for (; i < _ws; i++)
      BLANKS[i] = ' ';
    BLANKS[i + 1] = '\0';
    return BLANKS;
  }

  void dumprule(int rule) {
    tty->print("%s",GetBlankSpace());
    tty->print("%s",GetRule(rule));
    tty->print("\n");
  }

  void dumpoper(int oper) {
    tty->print("%s",GetBlankSpace());
    tty->print("%s",GetOper(oper));
    tty->print("\n");
  }

  static const char *GetOper(int oper) {
    switch (oper) {
    default:
      assert(0, "Unhandled operand");
    case 0:
      return "  UNIVERSE";
    case 1:
      return "  LABEL";
    case 2:
      return "  SREGI";
    case 3:
      return "  SREGP";
    case 4:
      return "  SREGF";
    case 5:
      return "  SREGD";
    case 6:
      return "  SREGL";
    case 7:
      return "  METHOD";
    case 8:
      return "  IMMI";
    case 9:
      return "  IMMI0";
    case 10:
      return "  IMMI1";
    case 11:
      return "  IMMI_M1";
    case 12:
      return "  IMMI2";
    case 13:
      return "  IMMI8";
    case 14:
      return "  IMMU8";
    case 15:
      return "  IMMI16";
    case 16:
      return "  IMMU31";
    case 17:
      return "  IMMI_32";
    case 18:
      return "  IMMI_64";
    case 19:
      return "  IMMP";
    case 20:
      return "  IMMP0";
    case 21:
      return "  IMMN";
    case 22:
      return "  IMMNKLASS";
    case 23:
      return "  IMMN0";
    case 24:
      return "  IMMP31";
    case 25:
      return "  IMML";
    case 26:
      return "  IMML8";
    case 27:
      return "  IMMUL32";
    case 28:
      return "  IMML32";
    case 29:
      return "  IMML0";
    case 30:
      return "  IMML1";
    case 31:
      return "  IMML_M1";
    case 32:
      return "  IMML10";
    case 33:
      return "  IMML_127";
    case 34:
      return "  IMML_32BITS";
    case 35:
      return "  IMMF0";
    case 36:
      return "  IMMF";
    case 37:
      return "  IMMD0";
    case 38:
      return "  IMMD";
    case 39:
      return "  IMMI_16";
    case 40:
      return "  IMMI_24";
    case 41:
      return "  IMMI_255";
    case 42:
      return "  IMMI_65535";
    case 43:
      return "  IMML_255";
    case 44:
      return "  IMML_65535";
    case 45:
      return "  RREGI";
    case 46:
      return "  RAX_REGI";
    case 47:
      return "  RBX_REGI";
    case 48:
      return "  RCX_REGI";
    case 49:
      return "  RDX_REGI";
    case 50:
      return "  RDI_REGI";
    case 51:
      return "  NO_RCX_REGI";
    case 52:
      return "  NO_RAX_RDX_REGI";
    case 53:
      return "  ANY_REGP";
    case 54:
      return "  RREGP";
    case 55:
      return "  RREGN";
    case 56:
      return "  NO_RAX_REGP";
    case 57:
      return "  NO_RBP_REGP";
    case 58:
      return "  NO_RAX_RBX_REGP";
    case 59:
      return "  RAX_REGP";
    case 60:
      return "  RAX_REGN";
    case 61:
      return "  RBX_REGP";
    case 62:
      return "  RSI_REGP";
    case 63:
      return "  RDI_REGP";
    case 64:
      return "  R15_REGP";
    case 65:
      return "  RREGL";
    case 66:
      return "  NO_RAX_RDX_REGL";
    case 67:
      return "  NO_RAX_REGL";
    case 68:
      return "  NO_RCX_REGL";
    case 69:
      return "  RAX_REGL";
    case 70:
      return "  RCX_REGL";
    case 71:
      return "  RDX_REGL";
    case 72:
      return "  RFLAGSREG";
    case 73:
      return "  RFLAGSREGU";
    case 74:
      return "  RFLAGSREGUCF";
    case 75:
      return "  REGF";
    case 76:
      return "  LEGREGF";
    case 77:
      return "  VLREGF";
    case 78:
      return "  REGD";
    case 79:
      return "  LEGREGD";
    case 80:
      return "  VLREGD";
    case 81:
      return "  VECS";
    case 82:
      return "  LEGVECS";
    case 83:
      return "  VECD";
    case 84:
      return "  LEGVECD";
    case 85:
      return "  VECX";
    case 86:
      return "  LEGVECX";
    case 87:
      return "  VECY";
    case 88:
      return "  LEGVECY";
    case 89:
      return "  VECZ";
    case 90:
      return "  LEGVECZ";
    case 91:
      return "  INDIRECT";
    case 92:
      return "  INDOFFSET8";
    case 93:
      return "  INDOFFSET32";
    case 94:
      return "  INDINDEXOFFSET";
    case 95:
      return "  INDINDEX";
    case 96:
      return "  INDINDEXSCALE";
    case 97:
      return "  INDPOSINDEXSCALE";
    case 98:
      return "  INDINDEXSCALEOFFSET";
    case 99:
      return "  INDPOSINDEXOFFSET";
    case 100:
      return "  INDPOSINDEXSCALEOFFSET";
    case 101:
      return "  INDCOMPRESSEDOOPOFFSET";
    case 102:
      return "  INDIRECTNARROW";
    case 103:
      return "  INDOFFSET8NARROW";
    case 104:
      return "  INDOFFSET32NARROW";
    case 105:
      return "  INDINDEXOFFSETNARROW";
    case 106:
      return "  INDINDEXNARROW";
    case 107:
      return "  INDINDEXSCALENARROW";
    case 108:
      return "  INDINDEXSCALEOFFSETNARROW";
    case 109:
      return "  INDPOSINDEXOFFSETNARROW";
    case 110:
      return "  INDPOSINDEXSCALEOFFSETNARROW";
    case 111:
      return "  STACKSLOTP";
    case 112:
      return "  STACKSLOTI";
    case 113:
      return "  STACKSLOTF";
    case 114:
      return "  STACKSLOTD";
    case 115:
      return "  STACKSLOTL";
    case 116:
      return "  CMPOP";
    case 117:
      return "  CMPOPU";
    case 118:
      return "  CMPOPUCF";
    case 119:
      return "  CMPOPUCF2";
    case 120:
      return "  RXMM0";
    case 121:
      return "  RXMM1";
    case 122:
      return "  RXMM2";
    case 123:
      return "  RXMM3";
    case 124:
      return "  RXMM4";
    case 125:
      return "  RXMM5";
    case 126:
      return "  RXMM6";
    case 127:
      return "  RXMM7";
    case 128:
      return "  RXMM8";
    case 129:
      return "  RXMM9";
    case 130:
      return "  RXMM10";
    case 131:
      return "  RXMM11";
    case 132:
      return "  RXMM12";
    case 133:
      return "  RXMM13";
    case 134:
      return "  RXMM14";
    case 135:
      return "  RXMM15";
    case 136:
      return "  RXMM16";
    case 137:
      return "  RXMM17";
    case 138:
      return "  RXMM18";
    case 139:
      return "  RXMM19";
    case 140:
      return "  RXMM20";
    case 141:
      return "  RXMM21";
    case 142:
      return "  RXMM22";
    case 143:
      return "  RXMM23";
    case 144:
      return "  RXMM24";
    case 145:
      return "  RXMM25";
    case 146:
      return "  RXMM26";
    case 147:
      return "  RXMM27";
    case 148:
      return "  RXMM28";
    case 149:
      return "  RXMM29";
    case 150:
      return "  RXMM30";
    case 151:
      return "  RXMM31";
    case 152:
      return "  IMMU1";
    case 153:
      return "  IMMU2";
    case 154:
      return "  IMMU3";
    case 155:
      return "  IMMU4";
    case 156:
      return "  IMMU5";
    case 157:
      return "  IMMU6";
    case 158:
      return "  CMPOP_VCMPPD";
    case 159:
      return "  MEMORY";
    case 160:
      return "  _ADDP_ANY_REGP_RREGL";
    case 161:
      return "  _LSHIFTL_RREGL_IMMI2";
    case 162:
      return "  _CONVI2L_RREGI_";
    case 163:
      return "  _LSHIFTL__CONVI2L_RREGI__IMMI2";
    case 164:
      return "  _ADDP_ANY_REGP__LSHIFTL_RREGL_IMMI2";
    case 165:
      return "  _ADDP_ANY_REGP__CONVI2L_RREGI_";
    case 166:
      return "  _ADDP_ANY_REGP__LSHIFTL__CONVI2L_RREGI__IMMI2";
    case 167:
      return "  _DECODEN_RREGN_";
    case 168:
      return "  _ADDP__DECODEN_RREGN__RREGL";
    case 169:
      return "  _ADDP__DECODEN_RREGN___LSHIFTL_RREGL_IMMI2";
    case 170:
      return "  _ADDP__DECODEN_RREGN___CONVI2L_RREGI_";
    case 171:
      return "  _ADDP__DECODEN_RREGN___LSHIFTL__CONVI2L_RREGI__IMMI2";
    case 172:
      return "  _LOADB_MEMORY_";
    case 173:
      return "  _LOADUB_MEMORY_";
    case 174:
      return "  _ANDI__LOADUB_MEMORY__IMMI";
    case 175:
      return "  _LOADS_MEMORY_";
    case 176:
      return "  _LSHIFTI__LOADS_MEMORY__IMMI_24";
    case 177:
      return "  _LOADUS_MEMORY_";
    case 178:
      return "  _LSHIFTI__LOADUS_MEMORY__IMMI_24";
    case 179:
      return "  _ANDI__LOADUS_MEMORY__IMMI_255";
    case 180:
      return "  _ANDI__LOADUS_MEMORY__IMMI";
    case 181:
      return "  _LOADI_MEMORY_";
    case 182:
      return "  _LSHIFTI__LOADI_MEMORY__IMMI_24";
    case 183:
      return "  _LSHIFTI__LOADI_MEMORY__IMMI_16";
    case 184:
      return "  _ANDI__LOADI_MEMORY__IMMI_255";
    case 185:
      return "  _ANDI__LOADI_MEMORY__IMMI_65535";
    case 186:
      return "  _ANDI__LOADI_MEMORY__IMMU31";
    case 187:
      return "  _CONVI2L__LOADI_MEMORY__";
    case 188:
      return "  _BINARY_VECX_VECX";
    case 189:
      return "  _BINARY_VECY_VECY";
    case 190:
      return "  _BINARY_VECZ_VECZ";
    case 191:
      return "  _BINARY_VECX_VECD";
    case 192:
      return "  _BINARY_VECY_VECX";
    case 193:
      return "  _BINARY_VECZ_VECY";
    case 194:
      return "  _LOADL_MEMORY_";
    case 195:
      return "  _CASTP2X_RREGP_";
    case 196:
      return "  _CASTP2X__DECODEN_RREGN__";
    case 197:
      return "  _ADDL__LSHIFTL_RREGL_IMMI2_IMML32";
    case 198:
      return "  _BINARY_CMPOP_RFLAGSREG";
    case 199:
      return "  _BINARY_RREGI_RREGI";
    case 200:
      return "  _BINARY_CMPOPU_RFLAGSREGU";
    case 201:
      return "  _BINARY_CMPOPUCF_RFLAGSREGUCF";
    case 202:
      return "  _BINARY_RREGI__LOADI_MEMORY_";
    case 203:
      return "  _BINARY_RREGN_RREGN";
    case 204:
      return "  _BINARY_RREGP_RREGP";
    case 205:
      return "  _BINARY_RREGL_RREGL";
    case 206:
      return "  _BINARY_RREGL__LOADL_MEMORY_";
    case 207:
      return "  _BINARY_REGF_REGF";
    case 208:
      return "  _BINARY_REGD_REGD";
    case 209:
      return "  _ADDI__LOADI_MEMORY__RREGI";
    case 210:
      return "  _ADDI_RREGI__LOADI_MEMORY_";
    case 211:
      return "  _ADDI__LOADI_MEMORY__IMMI";
    case 212:
      return "  _ADDI__LOADI_MEMORY__IMMI1";
    case 213:
      return "  _ADDI__LOADI_MEMORY__IMMI_M1";
    case 214:
      return "  _ADDL__LOADL_MEMORY__RREGL";
    case 215:
      return "  _ADDL_RREGL__LOADL_MEMORY_";
    case 216:
      return "  _ADDL__LOADL_MEMORY__IMML32";
    case 217:
      return "  _ADDL__LOADL_MEMORY__IMML1";
    case 218:
      return "  _ADDL__LOADL_MEMORY__IMML_M1";
    case 219:
      return "  _BINARY_RAX_REGP_RREGP";
    case 220:
      return "  _BINARY_RAX_REGI_RREGI";
    case 221:
      return "  _BINARY_RAX_REGL_RREGL";
    case 222:
      return "  _BINARY_RAX_REGN_RREGN";
    case 223:
      return "  _SUBI__LOADI_MEMORY__RREGI";
    case 224:
      return "  _SUBI__LOADI_MEMORY__IMMI";
    case 225:
      return "  _SUBL__LOADL_MEMORY__RREGL";
    case 226:
      return "  _SUBL__LOADL_MEMORY__IMML32";
    case 227:
      return "  _SUBI_IMMI0_RREGI";
    case 228:
      return "  _SUBI_IMMI0__LOADI_MEMORY_";
    case 229:
      return "  _SUBL_IMML0__LOADL_MEMORY_";
    case 230:
      return "  _LSHIFTI__LOADI_MEMORY__IMMI1";
    case 231:
      return "  _LSHIFTI__LOADI_MEMORY__IMMI8";
    case 232:
      return "  _LSHIFTI__LOADI_MEMORY__RCX_REGI";
    case 233:
      return "  _RSHIFTI__LOADI_MEMORY__IMMI1";
    case 234:
      return "  _RSHIFTI__LOADI_MEMORY__IMMI8";
    case 235:
      return "  _RSHIFTI__LOADI_MEMORY__RCX_REGI";
    case 236:
      return "  _URSHIFTI__LOADI_MEMORY__IMMI1";
    case 237:
      return "  _URSHIFTI__LOADI_MEMORY__IMMI8";
    case 238:
      return "  _URSHIFTI__LOADI_MEMORY__RCX_REGI";
    case 239:
      return "  _LSHIFTL__LOADL_MEMORY__IMMI1";
    case 240:
      return "  _LSHIFTL__LOADL_MEMORY__IMMI8";
    case 241:
      return "  _LSHIFTL__LOADL_MEMORY__RCX_REGI";
    case 242:
      return "  _RSHIFTL__LOADL_MEMORY__IMMI1";
    case 243:
      return "  _RSHIFTL__LOADL_MEMORY__IMMI8";
    case 244:
      return "  _RSHIFTL__LOADL_MEMORY__RCX_REGI";
    case 245:
      return "  _URSHIFTL__LOADL_MEMORY__IMMI1";
    case 246:
      return "  _URSHIFTL__LOADL_MEMORY__IMMI8";
    case 247:
      return "  _URSHIFTL__LOADL_MEMORY__RCX_REGI";
    case 248:
      return "  _LSHIFTI_RREGI_IMMI_24";
    case 249:
      return "  _LSHIFTI_RREGI_IMMI_16";
    case 250:
      return "  _LSHIFTI_RREGI_IMMI1";
    case 251:
      return "  _URSHIFTI_RREGI_IMMI_M1";
    case 252:
      return "  _LSHIFTI_RREGI_IMMI8";
    case 253:
      return "  _URSHIFTI_RREGI_IMMI8";
    case 254:
      return "  _LSHIFTI_NO_RCX_REGI_RCX_REGI";
    case 255:
      return "  _SUBI_IMMI0_RCX_REGI";
    case 256:
      return "  _URSHIFTI_NO_RCX_REGI__SUBI_IMMI0_RCX_REGI";
    case 257:
      return "  _SUBI_IMMI_32_RCX_REGI";
    case 258:
      return "  _URSHIFTI_NO_RCX_REGI__SUBI_IMMI_32_RCX_REGI";
    case 259:
      return "  _URSHIFTI_RREGI_IMMI1";
    case 260:
      return "  _LSHIFTI_RREGI_IMMI_M1";
    case 261:
      return "  _URSHIFTI_NO_RCX_REGI_RCX_REGI";
    case 262:
      return "  _LSHIFTI_NO_RCX_REGI__SUBI_IMMI0_RCX_REGI";
    case 263:
      return "  _LSHIFTI_NO_RCX_REGI__SUBI_IMMI_32_RCX_REGI";
    case 264:
      return "  _LSHIFTL_RREGL_IMMI1";
    case 265:
      return "  _URSHIFTL_RREGL_IMMI_M1";
    case 266:
      return "  _LSHIFTL_RREGL_IMMI8";
    case 267:
      return "  _URSHIFTL_RREGL_IMMI8";
    case 268:
      return "  _LSHIFTL_NO_RCX_REGL_RCX_REGI";
    case 269:
      return "  _URSHIFTL_NO_RCX_REGL__SUBI_IMMI0_RCX_REGI";
    case 270:
      return "  _SUBI_IMMI_64_RCX_REGI";
    case 271:
      return "  _URSHIFTL_NO_RCX_REGL__SUBI_IMMI_64_RCX_REGI";
    case 272:
      return "  _URSHIFTL_RREGL_IMMI1";
    case 273:
      return "  _LSHIFTL_RREGL_IMMI_M1";
    case 274:
      return "  _URSHIFTL_NO_RCX_REGL_RCX_REGI";
    case 275:
      return "  _LSHIFTL_NO_RCX_REGL__SUBI_IMMI0_RCX_REGI";
    case 276:
      return "  _LSHIFTL_NO_RCX_REGL__SUBI_IMMI_64_RCX_REGI";
    case 277:
      return "  _ANDI_RREGI_IMMI_255";
    case 278:
      return "  _ANDI_RREGI_IMMI_65535";
    case 279:
      return "  _ANDI__LOADB_MEMORY__RREGI";
    case 280:
      return "  _ANDI_RREGI__LOADB_MEMORY_";
    case 281:
      return "  _ANDI__LOADI_MEMORY__RREGI";
    case 282:
      return "  _ANDI_RREGI__LOADI_MEMORY_";
    case 283:
      return "  _ANDI__LOADI_MEMORY__IMMI";
    case 284:
      return "  _XORI_RREGI_IMMI_M1";
    case 285:
      return "  _ADDI_RREGI_IMMI_M1";
    case 286:
      return "  _ORI__LOADB_MEMORY__RREGI";
    case 287:
      return "  _ORI_RREGI__LOADB_MEMORY_";
    case 288:
      return "  _ORI__LOADI_MEMORY__RREGI";
    case 289:
      return "  _ORI_RREGI__LOADI_MEMORY_";
    case 290:
      return "  _ORI__LOADI_MEMORY__IMMI";
    case 291:
      return "  _XORI__LOADB_MEMORY__RREGI";
    case 292:
      return "  _XORI_RREGI__LOADB_MEMORY_";
    case 293:
      return "  _XORI__LOADI_MEMORY__RREGI";
    case 294:
      return "  _XORI_RREGI__LOADI_MEMORY_";
    case 295:
      return "  _XORI__LOADI_MEMORY__IMMI";
    case 296:
      return "  _ANDL__LOADL_MEMORY__RREGL";
    case 297:
      return "  _ANDL_RREGL__LOADL_MEMORY_";
    case 298:
      return "  _ANDL__LOADL_MEMORY__IMML32";
    case 299:
      return "  _XORL_RREGL_IMML_M1";
    case 300:
      return "  _SUBL_IMML0_RREGL";
    case 301:
      return "  _ADDL_RREGL_IMML_M1";
    case 302:
      return "  _CASTP2X_ANY_REGP_";
    case 303:
      return "  _ORL__LOADL_MEMORY__RREGL";
    case 304:
      return "  _ORL_RREGL__LOADL_MEMORY_";
    case 305:
      return "  _ORL__LOADL_MEMORY__IMML32";
    case 306:
      return "  _XORL__LOADL_MEMORY__RREGL";
    case 307:
      return "  _XORL_RREGL__LOADL_MEMORY_";
    case 308:
      return "  _XORL__LOADL_MEMORY__IMML32";
    case 309:
      return "  _CMPLTMASK_RREGI_RREGI";
    case 310:
      return "  _ANDI__CMPLTMASK_RREGI_RREGI_RREGI";
    case 311:
      return "  _SUBI_RREGI_RREGI";
    case 312:
      return "  _ANDI_RREGI__CMPLTMASK_RREGI_RREGI";
    case 313:
      return "  _LOADF_MEMORY_";
    case 314:
      return "  _LOADD_MEMORY_";
    case 315:
      return "  _BINARY_RDI_REGP_RCX_REGI";
    case 316:
      return "  _BINARY_RSI_REGP_RDX_REGI";
    case 317:
      return "  _BINARY_RDI_REGP_RDX_REGI";
    case 318:
      return "  _BINARY_RSI_REGP_IMMI";
    case 319:
      return "  _BINARY_RSI_REGP_RAX_REGI";
    case 320:
      return "  _BINARY_RDI_REGP_RSI_REGP";
    case 321:
      return "  _ANDI_RREGI_IMMI";
    case 322:
      return "  _LOADP_MEMORY_";
    case 323:
      return "  _LOADN_MEMORY_";
    case 324:
      return "  _LOADNKLASS_MEMORY_";
    case 325:
      return "  _ANDL_RREGL_IMML32";
    case 326:
      return "  _ANDL__CASTP2X_RREGP___LOADL_MEMORY_";
    case 327:
      return "  _ANDL__LOADL_MEMORY___CASTP2X_RREGP_";
    case 328:
      return "  _ANDI__LOADUB_MEMORY__IMMU8";
    case 329:
      return "  _ANDI__LOADB_MEMORY__IMMI8";
    case 330:
      return "  _PARTIALSUBTYPECHECK_RSI_REGP_RAX_REGP";
    case 331:
      return "  _BINARY_VECD_RREGI";
    case 332:
      return "  _BINARY_VECX_RREGI";
    case 333:
      return "  _BINARY_VECY_RREGI";
    case 334:
      return "  _BINARY_VECZ_RREGI";
    case 335:
      return "  _BINARY_VECD_RREGL";
    case 336:
      return "  _BINARY_VECX_RREGL";
    case 337:
      return "  _BINARY_VECY_RREGL";
    case 338:
      return "  _BINARY_VECZ_RREGL";
    case 339:
      return "  _BINARY_VECD_REGF";
    case 340:
      return "  _BINARY_VECX_REGF";
    case 341:
      return "  _BINARY_VECY_REGF";
    case 342:
      return "  _BINARY_VECZ_REGF";
    case 343:
      return "  _BINARY_VECD_REGD";
    case 344:
      return "  _BINARY_VECX_REGD";
    case 345:
      return "  _BINARY_VECY_REGD";
    case 346:
      return "  _BINARY_VECZ_REGD";
    case 347:
      return "  _LOADVECTOR_MEMORY_";
    case 348:
      return "  _BINARY_CMPOP_VCMPPD_IMMI8";
    case 349:
      return "  _BINARY_LEGVECY_LEGVECY";
    case 350:
      return "  _LSHIFTCNTV_IMMI8_";
    case 351:
      return "  _RSHIFTCNTV_IMMI8_";
    case 352:
      return "  _BINARY_VECD_VECD";
    case 353:
      return "  _BINARY_LEGVECD_LEGVECD";
    case 354:
      return "  _BINARY_LEGVECX_LEGVECX";
    case 355:
      return "  _BINARY_VECX__LOADVECTOR_MEMORY_";
    case 356:
      return "  _BINARY_VECY__LOADVECTOR_MEMORY_";
    case 357:
      return "  _BINARY_VECZ__LOADVECTOR_MEMORY_";
    case 358:
      return "  _BINARY_VECD__LOADVECTOR_MEMORY_";
    case 359:
      return "  _MULADDVS2VI_VECD_VECD";
    case 360:
      return "  _MULADDVS2VI_VECX_VECX";
    case 361:
      return "  _MULADDVS2VI_VECY_VECY";
    case 362:
      return "  _MULADDVS2VI_VECZ_VECZ";
    }
  }

  static const char *GetRule(int rule) {
    switch (rule) {
    default: 
      assert(0,"Unhandled rule");
    case 0:
      return "  Universe_rule";
    case 1:
      return "  label_rule";
    case 2:
      return "  sRegI_rule";
    case 3:
      return "  sRegP_rule";
    case 4:
      return "  sRegF_rule";
    case 5:
      return "  sRegD_rule";
    case 6:
      return "  sRegL_rule";
    case 7:
      return "  method_rule";
    case 8:
      return "  immI_rule";
    case 9:
      return "  immI0_rule";
    case 10:
      return "  immI1_rule";
    case 11:
      return "  immI_M1_rule";
    case 12:
      return "  immI2_rule";
    case 13:
      return "  immI8_rule";
    case 14:
      return "  immU8_rule";
    case 15:
      return "  immI16_rule";
    case 16:
      return "  immU31_rule";
    case 17:
      return "  immI_32_rule";
    case 18:
      return "  immI_64_rule";
    case 19:
      return "  immP_rule";
    case 20:
      return "  immP0_rule";
    case 21:
      return "  immN_rule";
    case 22:
      return "  immNKlass_rule";
    case 23:
      return "  immN0_rule";
    case 24:
      return "  immP31_rule";
    case 25:
      return "  immL_rule";
    case 26:
      return "  immL8_rule";
    case 27:
      return "  immUL32_rule";
    case 28:
      return "  immL32_rule";
    case 29:
      return "  immL0_rule";
    case 30:
      return "  immL1_rule";
    case 31:
      return "  immL_M1_rule";
    case 32:
      return "  immL10_rule";
    case 33:
      return "  immL_127_rule";
    case 34:
      return "  immL_32bits_rule";
    case 35:
      return "  immF0_rule";
    case 36:
      return "  immF_rule";
    case 37:
      return "  immD0_rule";
    case 38:
      return "  immD_rule";
    case 39:
      return "  immI_16_rule";
    case 40:
      return "  immI_24_rule";
    case 41:
      return "  immI_255_rule";
    case 42:
      return "  immI_65535_rule";
    case 43:
      return "  immL_255_rule";
    case 44:
      return "  immL_65535_rule";
    case 45:
      return "  rRegI_rule";
    case 46:
      return "  rax_RegI_rule";
    case 47:
      return "  rbx_RegI_rule";
    case 48:
      return "  rcx_RegI_rule";
    case 49:
      return "  rdx_RegI_rule";
    case 50:
      return "  rdi_RegI_rule";
    case 51:
      return "  no_rcx_RegI_rule";
    case 52:
      return "  no_rax_rdx_RegI_rule";
    case 53:
      return "  any_RegP_rule";
    case 54:
      return "  rRegP_rule";
    case 55:
      return "  rRegN_rule";
    case 56:
      return "  no_rax_RegP_rule";
    case 57:
      return "  no_rbp_RegP_rule";
    case 58:
      return "  no_rax_rbx_RegP_rule";
    case 59:
      return "  rax_RegP_rule";
    case 60:
      return "  rax_RegN_rule";
    case 61:
      return "  rbx_RegP_rule";
    case 62:
      return "  rsi_RegP_rule";
    case 63:
      return "  rdi_RegP_rule";
    case 64:
      return "  r15_RegP_rule";
    case 65:
      return "  rRegL_rule";
    case 66:
      return "  no_rax_rdx_RegL_rule";
    case 67:
      return "  no_rax_RegL_rule";
    case 68:
      return "  no_rcx_RegL_rule";
    case 69:
      return "  rax_RegL_rule";
    case 70:
      return "  rcx_RegL_rule";
    case 71:
      return "  rdx_RegL_rule";
    case 72:
      return "  rFlagsReg_rule";
    case 73:
      return "  rFlagsRegU_rule";
    case 74:
      return "  rFlagsRegUCF_rule";
    case 75:
      return "  regF_rule";
    case 76:
      return "  legRegF_rule";
    case 77:
      return "  vlRegF_rule";
    case 78:
      return "  regD_rule";
    case 79:
      return "  legRegD_rule";
    case 80:
      return "  vlRegD_rule";
    case 81:
      return "  vecS_rule";
    case 82:
      return "  legVecS_rule";
    case 83:
      return "  vecD_rule";
    case 84:
      return "  legVecD_rule";
    case 85:
      return "  vecX_rule";
    case 86:
      return "  legVecX_rule";
    case 87:
      return "  vecY_rule";
    case 88:
      return "  legVecY_rule";
    case 89:
      return "  vecZ_rule";
    case 90:
      return "  legVecZ_rule";
    case 91:
      return "  indirect_rule";
    case 92:
      return "  indOffset8_rule";
    case 93:
      return "  indOffset32_rule";
    case 94:
      return "  indIndexOffset_rule";
    case 95:
      return "  indIndex_rule";
    case 96:
      return "  indIndexScale_rule";
    case 97:
      return "  indPosIndexScale_rule";
    case 98:
      return "  indIndexScaleOffset_rule";
    case 99:
      return "  indPosIndexOffset_rule";
    case 100:
      return "  indPosIndexScaleOffset_rule";
    case 101:
      return "  indCompressedOopOffset_rule";
    case 102:
      return "  indirectNarrow_rule";
    case 103:
      return "  indOffset8Narrow_rule";
    case 104:
      return "  indOffset32Narrow_rule";
    case 105:
      return "  indIndexOffsetNarrow_rule";
    case 106:
      return "  indIndexNarrow_rule";
    case 107:
      return "  indIndexScaleNarrow_rule";
    case 108:
      return "  indIndexScaleOffsetNarrow_rule";
    case 109:
      return "  indPosIndexOffsetNarrow_rule";
    case 110:
      return "  indPosIndexScaleOffsetNarrow_rule";
    case 111:
      return "  stackSlotP_rule";
    case 112:
      return "  stackSlotI_rule";
    case 113:
      return "  stackSlotF_rule";
    case 114:
      return "  stackSlotD_rule";
    case 115:
      return "  stackSlotL_rule";
    case 116:
      return "  cmpOp_rule";
    case 117:
      return "  cmpOpU_rule";
    case 118:
      return "  cmpOpUCF_rule";
    case 119:
      return "  cmpOpUCF2_rule";
    case 120:
      return "  rxmm0_rule";
    case 121:
      return "  rxmm1_rule";
    case 122:
      return "  rxmm2_rule";
    case 123:
      return "  rxmm3_rule";
    case 124:
      return "  rxmm4_rule";
    case 125:
      return "  rxmm5_rule";
    case 126:
      return "  rxmm6_rule";
    case 127:
      return "  rxmm7_rule";
    case 128:
      return "  rxmm8_rule";
    case 129:
      return "  rxmm9_rule";
    case 130:
      return "  rxmm10_rule";
    case 131:
      return "  rxmm11_rule";
    case 132:
      return "  rxmm12_rule";
    case 133:
      return "  rxmm13_rule";
    case 134:
      return "  rxmm14_rule";
    case 135:
      return "  rxmm15_rule";
    case 136:
      return "  rxmm16_rule";
    case 137:
      return "  rxmm17_rule";
    case 138:
      return "  rxmm18_rule";
    case 139:
      return "  rxmm19_rule";
    case 140:
      return "  rxmm20_rule";
    case 141:
      return "  rxmm21_rule";
    case 142:
      return "  rxmm22_rule";
    case 143:
      return "  rxmm23_rule";
    case 144:
      return "  rxmm24_rule";
    case 145:
      return "  rxmm25_rule";
    case 146:
      return "  rxmm26_rule";
    case 147:
      return "  rxmm27_rule";
    case 148:
      return "  rxmm28_rule";
    case 149:
      return "  rxmm29_rule";
    case 150:
      return "  rxmm30_rule";
    case 151:
      return "  rxmm31_rule";
    case 152:
      return "  immU1_rule";
    case 153:
      return "  immU2_rule";
    case 154:
      return "  immU3_rule";
    case 155:
      return "  immU4_rule";
    case 156:
      return "  immU5_rule";
    case 157:
      return "  immU6_rule";
    case 158:
      return "  cmpOp_vcmppd_rule";
      // last operand
    case 159:
      return "  memory_rule";
      // last operand class
    case 160:
      return "  _AddP_any_RegP_rRegL_rule";
    case 161:
      return "  _LShiftL_rRegL_immI2_rule";
    case 162:
      return "  _ConvI2L_rRegI__rule";
    case 163:
      return "  _LShiftL__ConvI2L_rRegI__immI2_rule";
    case 164:
      return "  _AddP_any_RegP__LShiftL_rRegL_immI2_rule";
    case 165:
      return "  _AddP_any_RegP__ConvI2L_rRegI__rule";
    case 166:
      return "  _AddP_any_RegP__LShiftL__ConvI2L_rRegI__immI2_rule";
    case 167:
      return "  _DecodeN_rRegN__rule";
    case 168:
      return "  _AddP__DecodeN_rRegN__rRegL_rule";
    case 169:
      return "  _AddP__DecodeN_rRegN___LShiftL_rRegL_immI2_rule";
    case 170:
      return "  _AddP__DecodeN_rRegN___ConvI2L_rRegI__rule";
    case 171:
      return "  _AddP__DecodeN_rRegN___LShiftL__ConvI2L_rRegI__immI2_rule";
    case 172:
      return "  _LoadB_memory__rule";
    case 173:
      return "  _LoadUB_memory__rule";
    case 174:
      return "  _AndI__LoadUB_memory__immI_rule";
    case 175:
      return "  _LoadS_memory__rule";
    case 176:
      return "  _LShiftI__LoadS_memory__immI_24_rule";
    case 177:
      return "  _LoadUS_memory__rule";
    case 178:
      return "  _LShiftI__LoadUS_memory__immI_24_rule";
    case 179:
      return "  _AndI__LoadUS_memory__immI_255_rule";
    case 180:
      return "  _AndI__LoadUS_memory__immI_rule";
    case 181:
      return "  _LoadI_memory__rule";
    case 182:
      return "  _LShiftI__LoadI_memory__immI_24_rule";
    case 183:
      return "  _LShiftI__LoadI_memory__immI_16_rule";
    case 184:
      return "  _AndI__LoadI_memory__immI_255_rule";
    case 185:
      return "  _AndI__LoadI_memory__immI_65535_rule";
    case 186:
      return "  _AndI__LoadI_memory__immU31_rule";
    case 187:
      return "  _ConvI2L__LoadI_memory___rule";
    case 188:
      return "  _Binary_vecX_vecX_rule";
    case 189:
      return "  _Binary_vecY_vecY_rule";
    case 190:
      return "  _Binary_vecZ_vecZ_rule";
    case 191:
      return "  _Binary_vecX_vecD_rule";
    case 192:
      return "  _Binary_vecY_vecX_rule";
    case 193:
      return "  _Binary_vecZ_vecY_rule";
    case 194:
      return "  _LoadL_memory__rule";
    case 195:
      return "  _CastP2X_rRegP__rule";
    case 196:
      return "  _CastP2X__DecodeN_rRegN___rule";
    case 197:
      return "  _AddL__LShiftL_rRegL_immI2_immL32_rule";
    case 198:
      return "  _Binary_cmpOp_rFlagsReg_rule";
    case 199:
      return "  _Binary_rRegI_rRegI_rule";
    case 200:
      return "  _Binary_cmpOpU_rFlagsRegU_rule";
    case 201:
      return "  _Binary_cmpOpUCF_rFlagsRegUCF_rule";
    case 202:
      return "  _Binary_rRegI__LoadI_memory__rule";
    case 203:
      return "  _Binary_rRegN_rRegN_rule";
    case 204:
      return "  _Binary_rRegP_rRegP_rule";
    case 205:
      return "  _Binary_rRegL_rRegL_rule";
    case 206:
      return "  _Binary_rRegL__LoadL_memory__rule";
    case 207:
      return "  _Binary_regF_regF_rule";
    case 208:
      return "  _Binary_regD_regD_rule";
    case 209:
      return "  _AddI__LoadI_memory__rRegI_rule";
    case 210:
      return "  _AddI_rRegI__LoadI_memory__rule";
    case 211:
      return "  _AddI__LoadI_memory__immI_rule";
    case 212:
      return "  _AddI__LoadI_memory__immI1_rule";
    case 213:
      return "  _AddI__LoadI_memory__immI_M1_rule";
    case 214:
      return "  _AddL__LoadL_memory__rRegL_rule";
    case 215:
      return "  _AddL_rRegL__LoadL_memory__rule";
    case 216:
      return "  _AddL__LoadL_memory__immL32_rule";
    case 217:
      return "  _AddL__LoadL_memory__immL1_rule";
    case 218:
      return "  _AddL__LoadL_memory__immL_M1_rule";
    case 219:
      return "  _Binary_rax_RegP_rRegP_rule";
    case 220:
      return "  _Binary_rax_RegI_rRegI_rule";
    case 221:
      return "  _Binary_rax_RegL_rRegL_rule";
    case 222:
      return "  _Binary_rax_RegN_rRegN_rule";
    case 223:
      return "  _SubI__LoadI_memory__rRegI_rule";
    case 224:
      return "  _SubI__LoadI_memory__immI_rule";
    case 225:
      return "  _SubL__LoadL_memory__rRegL_rule";
    case 226:
      return "  _SubL__LoadL_memory__immL32_rule";
    case 227:
      return "  _SubI_immI0_rRegI_rule";
    case 228:
      return "  _SubI_immI0__LoadI_memory__rule";
    case 229:
      return "  _SubL_immL0__LoadL_memory__rule";
    case 230:
      return "  _LShiftI__LoadI_memory__immI1_rule";
    case 231:
      return "  _LShiftI__LoadI_memory__immI8_rule";
    case 232:
      return "  _LShiftI__LoadI_memory__rcx_RegI_rule";
    case 233:
      return "  _RShiftI__LoadI_memory__immI1_rule";
    case 234:
      return "  _RShiftI__LoadI_memory__immI8_rule";
    case 235:
      return "  _RShiftI__LoadI_memory__rcx_RegI_rule";
    case 236:
      return "  _URShiftI__LoadI_memory__immI1_rule";
    case 237:
      return "  _URShiftI__LoadI_memory__immI8_rule";
    case 238:
      return "  _URShiftI__LoadI_memory__rcx_RegI_rule";
    case 239:
      return "  _LShiftL__LoadL_memory__immI1_rule";
    case 240:
      return "  _LShiftL__LoadL_memory__immI8_rule";
    case 241:
      return "  _LShiftL__LoadL_memory__rcx_RegI_rule";
    case 242:
      return "  _RShiftL__LoadL_memory__immI1_rule";
    case 243:
      return "  _RShiftL__LoadL_memory__immI8_rule";
    case 244:
      return "  _RShiftL__LoadL_memory__rcx_RegI_rule";
    case 245:
      return "  _URShiftL__LoadL_memory__immI1_rule";
    case 246:
      return "  _URShiftL__LoadL_memory__immI8_rule";
    case 247:
      return "  _URShiftL__LoadL_memory__rcx_RegI_rule";
    case 248:
      return "  _LShiftI_rRegI_immI_24_rule";
    case 249:
      return "  _LShiftI_rRegI_immI_16_rule";
    case 250:
      return "  _LShiftI_rRegI_immI1_rule";
    case 251:
      return "  _URShiftI_rRegI_immI_M1_rule";
    case 252:
      return "  _LShiftI_rRegI_immI8_rule";
    case 253:
      return "  _URShiftI_rRegI_immI8_rule";
    case 254:
      return "  _LShiftI_no_rcx_RegI_rcx_RegI_rule";
    case 255:
      return "  _SubI_immI0_rcx_RegI_rule";
    case 256:
      return "  _URShiftI_no_rcx_RegI__SubI_immI0_rcx_RegI_rule";
    case 257:
      return "  _SubI_immI_32_rcx_RegI_rule";
    case 258:
      return "  _URShiftI_no_rcx_RegI__SubI_immI_32_rcx_RegI_rule";
    case 259:
      return "  _URShiftI_rRegI_immI1_rule";
    case 260:
      return "  _LShiftI_rRegI_immI_M1_rule";
    case 261:
      return "  _URShiftI_no_rcx_RegI_rcx_RegI_rule";
    case 262:
      return "  _LShiftI_no_rcx_RegI__SubI_immI0_rcx_RegI_rule";
    case 263:
      return "  _LShiftI_no_rcx_RegI__SubI_immI_32_rcx_RegI_rule";
    case 264:
      return "  _LShiftL_rRegL_immI1_rule";
    case 265:
      return "  _URShiftL_rRegL_immI_M1_rule";
    case 266:
      return "  _LShiftL_rRegL_immI8_rule";
    case 267:
      return "  _URShiftL_rRegL_immI8_rule";
    case 268:
      return "  _LShiftL_no_rcx_RegL_rcx_RegI_rule";
    case 269:
      return "  _URShiftL_no_rcx_RegL__SubI_immI0_rcx_RegI_rule";
    case 270:
      return "  _SubI_immI_64_rcx_RegI_rule";
    case 271:
      return "  _URShiftL_no_rcx_RegL__SubI_immI_64_rcx_RegI_rule";
    case 272:
      return "  _URShiftL_rRegL_immI1_rule";
    case 273:
      return "  _LShiftL_rRegL_immI_M1_rule";
    case 274:
      return "  _URShiftL_no_rcx_RegL_rcx_RegI_rule";
    case 275:
      return "  _LShiftL_no_rcx_RegL__SubI_immI0_rcx_RegI_rule";
    case 276:
      return "  _LShiftL_no_rcx_RegL__SubI_immI_64_rcx_RegI_rule";
    case 277:
      return "  _AndI_rRegI_immI_255_rule";
    case 278:
      return "  _AndI_rRegI_immI_65535_rule";
    case 279:
      return "  _AndI__LoadB_memory__rRegI_rule";
    case 280:
      return "  _AndI_rRegI__LoadB_memory__rule";
    case 281:
      return "  _AndI__LoadI_memory__rRegI_rule";
    case 282:
      return "  _AndI_rRegI__LoadI_memory__rule";
    case 283:
      return "  _AndI__LoadI_memory__immI_rule";
    case 284:
      return "  _XorI_rRegI_immI_M1_rule";
    case 285:
      return "  _AddI_rRegI_immI_M1_rule";
    case 286:
      return "  _OrI__LoadB_memory__rRegI_rule";
    case 287:
      return "  _OrI_rRegI__LoadB_memory__rule";
    case 288:
      return "  _OrI__LoadI_memory__rRegI_rule";
    case 289:
      return "  _OrI_rRegI__LoadI_memory__rule";
    case 290:
      return "  _OrI__LoadI_memory__immI_rule";
    case 291:
      return "  _XorI__LoadB_memory__rRegI_rule";
    case 292:
      return "  _XorI_rRegI__LoadB_memory__rule";
    case 293:
      return "  _XorI__LoadI_memory__rRegI_rule";
    case 294:
      return "  _XorI_rRegI__LoadI_memory__rule";
    case 295:
      return "  _XorI__LoadI_memory__immI_rule";
    case 296:
      return "  _AndL__LoadL_memory__rRegL_rule";
    case 297:
      return "  _AndL_rRegL__LoadL_memory__rule";
    case 298:
      return "  _AndL__LoadL_memory__immL32_rule";
    case 299:
      return "  _XorL_rRegL_immL_M1_rule";
    case 300:
      return "  _SubL_immL0_rRegL_rule";
    case 301:
      return "  _AddL_rRegL_immL_M1_rule";
    case 302:
      return "  _CastP2X_any_RegP__rule";
    case 303:
      return "  _OrL__LoadL_memory__rRegL_rule";
    case 304:
      return "  _OrL_rRegL__LoadL_memory__rule";
    case 305:
      return "  _OrL__LoadL_memory__immL32_rule";
    case 306:
      return "  _XorL__LoadL_memory__rRegL_rule";
    case 307:
      return "  _XorL_rRegL__LoadL_memory__rule";
    case 308:
      return "  _XorL__LoadL_memory__immL32_rule";
    case 309:
      return "  _CmpLTMask_rRegI_rRegI_rule";
    case 310:
      return "  _AndI__CmpLTMask_rRegI_rRegI_rRegI_rule";
    case 311:
      return "  _SubI_rRegI_rRegI_rule";
    case 312:
      return "  _AndI_rRegI__CmpLTMask_rRegI_rRegI_rule";
    case 313:
      return "  _LoadF_memory__rule";
    case 314:
      return "  _LoadD_memory__rule";
    case 315:
      return "  _Binary_rdi_RegP_rcx_RegI_rule";
    case 316:
      return "  _Binary_rsi_RegP_rdx_RegI_rule";
    case 317:
      return "  _Binary_rdi_RegP_rdx_RegI_rule";
    case 318:
      return "  _Binary_rsi_RegP_immI_rule";
    case 319:
      return "  _Binary_rsi_RegP_rax_RegI_rule";
    case 320:
      return "  _Binary_rdi_RegP_rsi_RegP_rule";
    case 321:
      return "  _AndI_rRegI_immI_rule";
    case 322:
      return "  _LoadP_memory__rule";
    case 323:
      return "  _LoadN_memory__rule";
    case 324:
      return "  _LoadNKlass_memory__rule";
    case 325:
      return "  _AndL_rRegL_immL32_rule";
    case 326:
      return "  _AndL__CastP2X_rRegP___LoadL_memory__rule";
    case 327:
      return "  _AndL__LoadL_memory___CastP2X_rRegP__rule";
    case 328:
      return "  _AndI__LoadUB_memory__immU8_rule";
    case 329:
      return "  _AndI__LoadB_memory__immI8_rule";
    case 330:
      return "  _PartialSubtypeCheck_rsi_RegP_rax_RegP_rule";
    case 331:
      return "  _Binary_vecD_rRegI_rule";
    case 332:
      return "  _Binary_vecX_rRegI_rule";
    case 333:
      return "  _Binary_vecY_rRegI_rule";
    case 334:
      return "  _Binary_vecZ_rRegI_rule";
    case 335:
      return "  _Binary_vecD_rRegL_rule";
    case 336:
      return "  _Binary_vecX_rRegL_rule";
    case 337:
      return "  _Binary_vecY_rRegL_rule";
    case 338:
      return "  _Binary_vecZ_rRegL_rule";
    case 339:
      return "  _Binary_vecD_regF_rule";
    case 340:
      return "  _Binary_vecX_regF_rule";
    case 341:
      return "  _Binary_vecY_regF_rule";
    case 342:
      return "  _Binary_vecZ_regF_rule";
    case 343:
      return "  _Binary_vecD_regD_rule";
    case 344:
      return "  _Binary_vecX_regD_rule";
    case 345:
      return "  _Binary_vecY_regD_rule";
    case 346:
      return "  _Binary_vecZ_regD_rule";
    case 347:
      return "  _LoadVector_memory__rule";
    case 348:
      return "  _Binary_cmpOp_vcmppd_immI8_rule";
    case 349:
      return "  _Binary_legVecY_legVecY_rule";
    case 350:
      return "  _LShiftCntV_immI8__rule";
    case 351:
      return "  _RShiftCntV_immI8__rule";
    case 352:
      return "  _Binary_vecD_vecD_rule";
    case 353:
      return "  _Binary_legVecD_legVecD_rule";
    case 354:
      return "  _Binary_legVecX_legVecX_rule";
    case 355:
      return "  _Binary_vecX__LoadVector_memory__rule";
    case 356:
      return "  _Binary_vecY__LoadVector_memory__rule";
    case 357:
      return "  _Binary_vecZ__LoadVector_memory__rule";
    case 358:
      return "  _Binary_vecD__LoadVector_memory__rule";
    case 359:
      return "  _MulAddVS2VI_vecD_vecD_rule";
    case 360:
      return "  _MulAddVS2VI_vecX_vecX_rule";
    case 361:
      return "  _MulAddVS2VI_vecY_vecY_rule";
    case 362:
      return "  _MulAddVS2VI_vecZ_vecZ_rule";
      // last internally defined operand
    case 363:
      return "  storeSSI_rule";
    case 364:
      return "  storeSSL_rule";
    case 365:
      return "  storeSSP_rule";
    case 366:
      return "  storeSSF_rule";
    case 367:
      return "  storeSSD_rule";
    case 368:
      return "  MoveF2VL_rule";
    case 369:
      return "  MoveF2LEG_rule";
    case 370:
      return "  MoveVL2F_rule";
    case 371:
      return "  MoveLEG2F_rule";
    case 372:
      return "  MoveD2VL_rule";
    case 373:
      return "  MoveD2LEG_rule";
    case 374:
      return "  MoveVL2D_rule";
    case 375:
      return "  MoveLEG2D_rule";
    case 376:
      return "  leaP8_rule";
    case 377:
      return "  leaP32_rule";
    case 378:
      return "  leaPIdxOff_rule";
    case 379:
      return "  leaPIdxScale_rule";
    case 380:
      return "  leaPPosIdxScale_rule";
    case 381:
      return "  leaPIdxScaleOff_rule";
    case 382:
      return "  leaPPosIdxOff_rule";
    case 383:
      return "  leaPPosIdxScaleOff_rule";
    case 384:
      return "  leaPCompressedOopOffset_rule";
    case 385:
      return "  leaP8Narrow_rule";
    case 386:
      return "  leaP32Narrow_rule";
    case 387:
      return "  leaPIdxOffNarrow_rule";
    case 388:
      return "  leaPIdxScaleNarrow_rule";
    case 389:
      return "  leaPIdxScaleOffNarrow_rule";
    case 390:
      return "  leaPPosIdxOffNarrow_rule";
    case 391:
      return "  leaPPosIdxScaleOffNarrow_rule";
    case 392:
      return "  loadConI_rule";
    case 393:
      return "  loadConI0_rule";
    case 394:
      return "  loadConL_rule";
    case 395:
      return "  loadConL0_rule";
    case 396:
      return "  loadConUL32_rule";
    case 397:
      return "  loadConL32_rule";
    case 398:
      return "  loadConP_rule";
    case 399:
      return "  loadConP0_rule";
    case 400:
      return "  loadConP31_rule";
    case 401:
      return "  loadConF_rule";
    case 402:
      return "  loadConN0_rule";
    case 403:
      return "  loadConN_rule";
    case 404:
      return "  loadConNKlass_rule";
    case 405:
      return "  loadConF0_rule";
    case 406:
      return "  loadConD_rule";
    case 407:
      return "  loadConD0_rule";
    case 408:
      return "  loadSSI_rule";
    case 409:
      return "  loadSSL_rule";
    case 410:
      return "  loadSSP_rule";
    case 411:
      return "  loadSSF_rule";
    case 412:
      return "  loadSSD_rule";
    case 413:
      return "  MoveVecS2Leg_rule";
    case 414:
      return "  MoveLeg2VecS_rule";
    case 415:
      return "  MoveVecD2Leg_rule";
    case 416:
      return "  MoveLeg2VecD_rule";
    case 417:
      return "  MoveVecX2Leg_rule";
    case 418:
      return "  MoveLeg2VecX_rule";
    case 419:
      return "  MoveVecY2Leg_rule";
    case 420:
      return "  MoveLeg2VecY_rule";
    case 421:
      return "  MoveVecZ2Leg_rule";
    case 422:
      return "  MoveLeg2VecZ_rule";
    case 423:
      return "  membar_volatile_rule";
    case 424:
      return "  castX2P_rule";
    case 425:
      return "  castP2X_rule";
    case 426:
      return "  checkCastPP_rule";
    case 427:
      return "  castPP_rule";
    case 428:
      return "  castII_rule";
    case 429:
      return "  storePConditional_rule";
    case 430:
      return "  storeIConditional_rule";
    case 431:
      return "  storeLConditional_rule";
    case 432:
      return "  cmpF_cc_reg_rule";
    case 433:
      return "  cmpF_cc_reg_CF_rule";
    case 434:
      return "  cmpF_cc_mem_rule";
    case 435:
      return "  cmpF_cc_memCF_rule";
    case 436:
      return "  cmpF_cc_imm_rule";
    case 437:
      return "  cmpF_cc_immCF_rule";
    case 438:
      return "  cmpD_cc_reg_rule";
    case 439:
      return "  cmpD_cc_reg_CF_rule";
    case 440:
      return "  cmpD_cc_mem_rule";
    case 441:
      return "  cmpD_cc_memCF_rule";
    case 442:
      return "  cmpD_cc_imm_rule";
    case 443:
      return "  cmpD_cc_immCF_rule";
    case 444:
      return "  roundFloat_nop_rule";
    case 445:
      return "  roundDouble_nop_rule";
    case 446:
      return "  MoveF2I_stack_reg_rule";
    case 447:
      return "  MoveI2F_stack_reg_rule";
    case 448:
      return "  MoveD2L_stack_reg_rule";
    case 449:
      return "  MoveL2D_stack_reg_partial_rule";
    case 450:
      return "  MoveL2D_stack_reg_rule";
    case 451:
      return "  MoveF2I_reg_reg_rule";
    case 452:
      return "  MoveD2L_reg_reg_rule";
    case 453:
      return "  MoveI2F_reg_reg_rule";
    case 454:
      return "  MoveL2D_reg_reg_rule";
    case 455:
      return "  overflowAddI_rReg_rule";
    case 456:
      return "  overflowAddI_rReg_imm_rule";
    case 457:
      return "  overflowAddL_rReg_rule";
    case 458:
      return "  overflowAddL_rReg_imm_rule";
    case 459:
      return "  overflowSubI_rReg_rule";
    case 460:
      return "  overflowSubI_rReg_imm_rule";
    case 461:
      return "  overflowSubL_rReg_rule";
    case 462:
      return "  overflowSubL_rReg_imm_rule";
    case 463:
      return "  overflowNegI_rReg_rule";
    case 464:
      return "  overflowNegL_rReg_rule";
    case 465:
      return "  overflowMulI_rReg_rule";
    case 466:
      return "  overflowMulI_rReg_imm_rule";
    case 467:
      return "  overflowMulL_rReg_rule";
    case 468:
      return "  overflowMulL_rReg_imm_rule";
    case 469:
      return "  compI_rReg_rule";
    case 470:
      return "  compI_rReg_imm_rule";
    case 471:
      return "  compI_rReg_mem_rule";
    case 472:
      return "  testI_reg_rule";
    case 473:
      return "  testI_reg_imm_rule";
    case 474:
      return "  testI_reg_mem_rule";
    case 475:
      return "  testI_reg_mem_0_rule";
    case 476:
      return "  compU_rReg_rule";
    case 477:
      return "  compU_rReg_imm_rule";
    case 478:
      return "  compU_rReg_mem_rule";
    case 479:
      return "  testU_reg_rule";
    case 480:
      return "  compP_rReg_rule";
    case 481:
      return "  compP_rReg_mem_rule";
    case 482:
      return "  compP_mem_rReg_rule";
    case 483:
      return "  testP_reg_rule";
    case 484:
      return "  testP_mem_rule";
    case 485:
      return "  testP_mem_reg0_rule";
    case 486:
      return "  compN_rReg_rule";
    case 487:
      return "  compN_rReg_mem_rule";
    case 488:
      return "  compN_rReg_imm_rule";
    case 489:
      return "  compN_mem_imm_rule";
    case 490:
      return "  compN_rReg_imm_klass_rule";
    case 491:
      return "  compN_mem_imm_klass_rule";
    case 492:
      return "  testN_reg_rule";
    case 493:
      return "  testN_mem_rule";
    case 494:
      return "  testN_mem_reg0_rule";
    case 495:
      return "  compL_rReg_rule";
    case 496:
      return "  compL_rReg_imm_rule";
    case 497:
      return "  compL_rReg_mem_rule";
    case 498:
      return "  testL_reg_rule";
    case 499:
      return "  testL_reg_imm_rule";
    case 500:
      return "  testL_reg_mem_rule";
    case 501:
      return "  testL_reg_mem_0_rule";
    case 502:
      return "  testL_reg_mem2_rule";
    case 503:
      return "  testL_reg_mem2_0_rule";
    case 504:
      return "  compUL_rReg_rule";
    case 505:
      return "  compUL_rReg_imm_rule";
    case 506:
      return "  compUL_rReg_mem_rule";
    case 507:
      return "  testUL_reg_rule";
    case 508:
      return "  compB_mem_imm_rule";
    case 509:
      return "  testUB_mem_imm_rule";
    case 510:
      return "  testB_mem_imm_rule";
    case 511:
      return "  partialSubtypeCheck_vs_Zero_rule";
    case 512:
      return "  cmpFastLockRTM_rule";
    case 513:
      return "  cmpFastLock_rule";
    case 514:
      return "  cmpFastUnlock_rule";
    case 515:
      return "  safePoint_poll_rule";
    case 516:
      return "  tlsLoadP_rule";
    case 517:
      return "  absF_reg_rule";
    case 518:
      return "  absF_reg_reg_rule";
    case 519:
      return "  absD_reg_rule";
    case 520:
      return "  absD_reg_reg_rule";
    case 521:
      return "  negF_reg_rule";
    case 522:
      return "  negF_reg_reg_rule";
    case 523:
      return "  negD_reg_rule";
    case 524:
      return "  negD_reg_reg_rule";
    case 525:
      return "  reinterpretS_rule";
    case 526:
      return "  reinterpretD2S_rule";
    case 527:
      return "  reinterpretD_rule";
    case 528:
      return "  reinterpretX2S_rule";
    case 529:
      return "  reinterpretX2D_rule";
    case 530:
      return "  reinterpretX_rule";
    case 531:
      return "  reinterpretY2S_rule";
    case 532:
      return "  reinterpretY2D_rule";
    case 533:
      return "  reinterpretY2X_rule";
    case 534:
      return "  reinterpretY_rule";
    case 535:
      return "  reinterpretZ2S_rule";
    case 536:
      return "  reinterpretZ2D_rule";
    case 537:
      return "  reinterpretZ2X_rule";
    case 538:
      return "  reinterpretZ2Y_rule";
    case 539:
      return "  reinterpretZ_rule";
    case 540:
      return "  vshiftcnt_rule";
    case 541:
      return "  vshiftcnt_0_rule";
    case 542:
      return "  vsqrt2D_reg_rule";
    case 543:
      return "  vsqrt2D_mem_rule";
    case 544:
      return "  vsqrt4D_reg_rule";
    case 545:
      return "  vsqrt4D_mem_rule";
    case 546:
      return "  vsqrt8D_reg_rule";
    case 547:
      return "  vsqrt8D_mem_rule";
    case 548:
      return "  vsqrt2F_reg_rule";
    case 549:
      return "  vsqrt2F_mem_rule";
    case 550:
      return "  vsqrt4F_reg_rule";
    case 551:
      return "  vsqrt4F_mem_rule";
    case 552:
      return "  vsqrt8F_reg_rule";
    case 553:
      return "  vsqrt8F_mem_rule";
    case 554:
      return "  vsqrt16F_reg_rule";
    case 555:
      return "  vsqrt16F_mem_rule";
    case 556:
      return "  vcvt4Bto4S_reg_rule";
    case 557:
      return "  vcvt8Bto8S_reg_rule";
    case 558:
      return "  vcvt16Bto16S_reg_rule";
    case 559:
      return "  vcvt32Bto32S_reg_rule";
    case 560:
      return "  vcvt4Bto4I_reg_rule";
    case 561:
      return "  vcvt8Bto8I_reg_rule";
    case 562:
      return "  vcvt16Bto16I_reg_rule";
    case 563:
      return "  vcvt4Bto4L_reg_rule";
    case 564:
      return "  vcvt8Bto8L_reg_rule";
    case 565:
      return "  vcvt4Bto4F_reg_rule";
    case 566:
      return "  vcvt8Bto8F_reg_rule";
    case 567:
      return "  vcvt16Bto16F_reg_rule";
    case 568:
      return "  vcvt4Bto4D_reg_rule";
    case 569:
      return "  vcvt8Bto8D_reg_rule";
    case 570:
      return "  vcvt32Sto32B_reg_rule";
    case 571:
      return "  vcvt2Sto2I_reg_rule";
    case 572:
      return "  vcvt4Sto4I_reg_rule";
    case 573:
      return "  vcvt8Sto8I_reg_rule";
    case 574:
      return "  vcvt16Sto16I_reg_rule";
    case 575:
      return "  vcvt2Sto2L_reg_rule";
    case 576:
      return "  vcvt4Sto4L_reg_rule";
    case 577:
      return "  vcvt8Sto8L_reg_rule";
    case 578:
      return "  vcvt2Sto2F_reg_rule";
    case 579:
      return "  vcvt4Sto4F_reg_rule";
    case 580:
      return "  vcvt8Sto8F_reg_rule";
    case 581:
      return "  vcvt16Sto16F_reg_rule";
    case 582:
      return "  vcvt2Sto2D_reg_rule";
    case 583:
      return "  vcvt4Sto4D_reg_rule";
    case 584:
      return "  vcvt8Sto8D_reg_rule";
    case 585:
      return "  vcvt16Ito16B_reg_rule";
    case 586:
      return "  vcvt16Ito16S_reg_rule";
    case 587:
      return "  vcvt2Ito2L_reg_rule";
    case 588:
      return "  vcvt4Ito4L_reg_rule";
    case 589:
      return "  vcvt8Ito8L_reg_rule";
    case 590:
      return "  vcvt2Ito2F_reg_rule";
    case 591:
      return "  vcvt4Ito4F_reg_rule";
    case 592:
      return "  vcvt8Ito8F_reg_rule";
    case 593:
      return "  vcvt16Ito16F_reg_rule";
    case 594:
      return "  vcvt2Ito2D_reg_rule";
    case 595:
      return "  vcvt4Ito4D_reg_rule";
    case 596:
      return "  vcvt8Ito8D_reg_rule";
    case 597:
      return "  vcvt8Lto8B_reg_rule";
    case 598:
      return "  vcvt8Lto8S_reg_rule";
    case 599:
      return "  vcvt1Lto1I_reg_rule";
    case 600:
      return "  vcvt2Lto2I_reg_rule";
    case 601:
      return "  vcvt2Lto2I_reg_avx_rule";
    case 602:
      return "  vcvt4Lto4I_reg_rule";
    case 603:
      return "  vcvt8Lto8I_reg_rule";
    case 604:
      return "  vcvt2Lto2F_reg_rule";
    case 605:
      return "  vcvt4Lto4F_reg_rule";
    case 606:
      return "  vcvt8Lto8F_reg_rule";
    case 607:
      return "  vcvt1Lto1D_reg_rule";
    case 608:
      return "  vcvt2Lto2D_reg_rule";
    case 609:
      return "  vcvt4Lto4D_reg_rule";
    case 610:
      return "  vcvt8Lto8D_reg_rule";
    case 611:
      return "  vcvt2Fto2D_reg_rule";
    case 612:
      return "  vcvt4Fto4D_reg_rule";
    case 613:
      return "  vcvt8Fto8D_reg_rule";
    case 614:
      return "  vcvt2Dto2F_reg_rule";
    case 615:
      return "  vcvt4Dto4F_reg_rule";
    case 616:
      return "  vcvt8Dto8F_reg_rule";
    case 617:
      return "  vneg1D_rule";
    case 618:
      return "  vneg1D_reg_rule";
    case 619:
      return "  vneg2D_reg_rule";
    case 620:
      return "  vneg4D_reg_rule";
    case 621:
      return "  vneg8D_reg_rule";
    case 622:
      return "  vneg2F_reg_rule";
    case 623:
      return "  vneg4F_reg_rule";
    case 624:
      return "  vneg8F_reg_rule";
    case 625:
      return "  vneg16F_reg_rule";
    case 626:
      return "  vabs8B_reg_rule";
    case 627:
      return "  vabs16B_reg_rule";
    case 628:
      return "  vabs32B_reg_rule";
    case 629:
      return "  vabs64B_reg_rule";
    case 630:
      return "  vabs4S_reg_rule";
    case 631:
      return "  vabs8S_reg_rule";
    case 632:
      return "  vabs16S_reg_rule";
    case 633:
      return "  vabs32S_reg_rule";
    case 634:
      return "  vabs2I_reg_rule";
    case 635:
      return "  vabs4I_reg_rule";
    case 636:
      return "  vabs8I_reg_rule";
    case 637:
      return "  vabs16I_reg_rule";
    case 638:
      return "  vabs2L_reg_rule";
    case 639:
      return "  vabs4L_reg_rule";
    case 640:
      return "  vabs8L_reg_rule";
    case 641:
      return "  vabs1D_reg_rule";
    case 642:
      return "  vabs2D_reg_rule";
    case 643:
      return "  vabs4D_reg_rule";
    case 644:
      return "  vabs8D_reg_rule";
    case 645:
      return "  vabs2F_reg_rule";
    case 646:
      return "  vabs4F_reg_rule";
    case 647:
      return "  vabs8F_reg_rule";
    case 648:
      return "  vabs16F_reg_rule";
    case 649:
      return "  storemask8b_rule";
    case 650:
      return "  storemask16b_rule";
    case 651:
      return "  storemask32b_rule";
    case 652:
      return "  storemask4s_rule";
    case 653:
      return "  storemask8s_rule";
    case 654:
      return "  storemask2i_rule";
    case 655:
      return "  storemask4i_rule";
    case 656:
      return "  storemask1l_rule";
    case 657:
      return "  storemask2l_rule";
    case 658:
      return "  loadshuffle8b_rule";
    case 659:
      return "  loadshuffle16b_rule";
    case 660:
      return "  loadshuffle32b_rule";
    case 661:
      return "  loadshuffle64b_rule";
    case 662:
      return "  loadshuffle16s_rule";
    case 663:
      return "  loadshuffle32s_rule";
    case 664:
      return "  loadshuffle8i_rule";
    case 665:
      return "  loadshuffle16i_rule";
    case 666:
      return "  vpopcount2I_rule";
    case 667:
      return "  vpopcount4I_rule";
    case 668:
      return "  vpopcount8I_rule";
    case 669:
      return "  vpopcount16I_rule";
    case 670:
      return "  shenandoahRBNarrow_rule";
    case 671:
      return "  shenandoahRBNarrowShift_rule";
    case 672:
      return "  loadB_rule";
    case 673:
      return "  loadB2L_rule";
    case 674:
      return "  loadUB_rule";
    case 675:
      return "  loadUB2L_rule";
    case 676:
      return "  loadUB2L_immI_rule";
    case 677:
      return "  loadS_rule";
    case 678:
      return "  loadS2B_rule";
    case 679:
      return "  loadS2L_rule";
    case 680:
      return "  loadUS_rule";
    case 681:
      return "  loadUS2B_rule";
    case 682:
      return "  loadUS2L_rule";
    case 683:
      return "  loadUS2L_immI_255_rule";
    case 684:
      return "  loadUS2L_immI_rule";
    case 685:
      return "  loadI_rule";
    case 686:
      return "  loadI2B_rule";
    case 687:
      return "  loadI2UB_rule";
    case 688:
      return "  loadI2S_rule";
    case 689:
      return "  loadI2US_rule";
    case 690:
      return "  loadI2L_rule";
    case 691:
      return "  loadI2L_immI_255_rule";
    case 692:
      return "  loadI2L_immI_65535_rule";
    case 693:
      return "  loadI2L_immU31_rule";
    case 694:
      return "  loadUI2L_rule";
    case 695:
      return "  loadL_rule";
    case 696:
      return "  loadRange_rule";
    case 697:
      return "  loadP_rule";
    case 698:
      return "  loadN_rule";
    case 699:
      return "  loadKlass_rule";
    case 700:
      return "  loadNKlass_rule";
    case 701:
      return "  loadF_rule";
    case 702:
      return "  loadD_partial_rule";
    case 703:
      return "  loadD_rule";
    case 704:
      return "  maxF_reg_rule";
    case 705:
      return "  maxF_reduction_reg_rule";
    case 706:
      return "  maxD_reg_rule";
    case 707:
      return "  maxD_reduction_reg_rule";
    case 708:
      return "  minF_reg_rule";
    case 709:
      return "  minF_reduction_reg_rule";
    case 710:
      return "  minD_reg_rule";
    case 711:
      return "  minD_reduction_reg_rule";
    case 712:
      return "  prefetchAlloc_rule";
    case 713:
      return "  prefetchAllocNTA_rule";
    case 714:
      return "  prefetchAllocT0_rule";
    case 715:
      return "  prefetchAllocT2_rule";
    case 716:
      return "  storeB_rule";
    case 717:
      return "  storeC_rule";
    case 718:
      return "  storeI_rule";
    case 719:
      return "  storeL_rule";
    case 720:
      return "  storeP_rule";
    case 721:
      return "  storeImmP0_rule";
    case 722:
      return "  storeImmP_rule";
    case 723:
      return "  storeN_rule";
    case 724:
      return "  storeNKlass_rule";
    case 725:
      return "  storeImmN0_rule";
    case 726:
      return "  storeImmN_rule";
    case 727:
      return "  storeImmNKlass_rule";
    case 728:
      return "  storeImmI0_rule";
    case 729:
      return "  storeImmI_rule";
    case 730:
      return "  storeImmL0_rule";
    case 731:
      return "  storeImmL_rule";
    case 732:
      return "  storeImmC0_rule";
    case 733:
      return "  storeImmI16_rule";
    case 734:
      return "  storeImmB0_rule";
    case 735:
      return "  storeImmB_rule";
    case 736:
      return "  storeImmCM0_reg_rule";
    case 737:
      return "  storeImmCM0_rule";
    case 738:
      return "  storeF_rule";
    case 739:
      return "  storeF0_rule";
    case 740:
      return "  storeF_imm_rule";
    case 741:
      return "  storeD_rule";
    case 742:
      return "  storeD0_imm_rule";
    case 743:
      return "  storeD0_rule";
    case 744:
      return "  gather2I_rule";
    case 745:
      return "  gather4I_rule";
    case 746:
      return "  gather8I_rule";
    case 747:
      return "  gather16I_rule";
    case 748:
      return "  gather2F_rule";
    case 749:
      return "  gather4F_rule";
    case 750:
      return "  gather8F_rule";
    case 751:
      return "  gather16F_rule";
    case 752:
      return "  gather2D_rule";
    case 753:
      return "  gather4D_rule";
    case 754:
      return "  gather8D_rule";
    case 755:
      return "  gather2L_rule";
    case 756:
      return "  gather4L_rule";
    case 757:
      return "  gather8L_rule";
    case 758:
      return "  scatter4I_rule";
    case 759:
      return "  scatter8I_rule";
    case 760:
      return "  scatter16I_rule";
    case 761:
      return "  scatter4F_rule";
    case 762:
      return "  scatter8F_rule";
    case 763:
      return "  scatter16F_rule";
    case 764:
      return "  scatter2D_rule";
    case 765:
      return "  scatter4D_rule";
    case 766:
      return "  scatter8D_rule";
    case 767:
      return "  scatter2L_rule";
    case 768:
      return "  scatter4L_rule";
    case 769:
      return "  scatter8L_rule";
    case 770:
      return "  bytes_reverse_int_rule";
    case 771:
      return "  bytes_reverse_long_rule";
    case 772:
      return "  bytes_reverse_unsigned_short_rule";
    case 773:
      return "  bytes_reverse_short_rule";
    case 774:
      return "  countLeadingZerosI_rule";
    case 775:
      return "  countLeadingZerosI_bsr_rule";
    case 776:
      return "  countLeadingZerosL_rule";
    case 777:
      return "  countLeadingZerosL_bsr_rule";
    case 778:
      return "  countTrailingZerosI_rule";
    case 779:
      return "  countTrailingZerosI_bsf_rule";
    case 780:
      return "  countTrailingZerosL_rule";
    case 781:
      return "  countTrailingZerosL_bsf_rule";
    case 782:
      return "  popCountI_rule";
    case 783:
      return "  popCountI_mem_rule";
    case 784:
      return "  popCountL_rule";
    case 785:
      return "  popCountL_mem_rule";
    case 786:
      return "  membar_acquire_rule";
    case 787:
      return "  membar_acquire_0_rule";
    case 788:
      return "  membar_acquire_lock_rule";
    case 789:
      return "  membar_release_rule";
    case 790:
      return "  membar_release_0_rule";
    case 791:
      return "  membar_release_lock_rule";
    case 792:
      return "  unnecessary_membar_volatile_rule";
    case 793:
      return "  membar_storestore_rule";
    case 794:
      return "  convP2I_rule";
    case 795:
      return "  convN2I_rule";
    case 796:
      return "  encodeHeapOop_rule";
    case 797:
      return "  encodeHeapOop_not_null_rule";
    case 798:
      return "  decodeHeapOop_rule";
    case 799:
      return "  decodeHeapOop_not_null_rule";
    case 800:
      return "  encodeKlass_not_null_rule";
    case 801:
      return "  decodeKlass_not_null_rule";
    case 802:
      return "  jumpXtnd_offset_rule";
    case 803:
      return "  jumpXtnd_addr_rule";
    case 804:
      return "  jumpXtnd_rule";
    case 805:
      return "  cmovI_reg_rule";
    case 806:
      return "  cmovI_regU_rule";
    case 807:
      return "  cmovI_regUCF_rule";
    case 808:
      return "  cmovI_mem_rule";
    case 809:
      return "  cmovI_memU_rule";
    case 810:
      return "  cmovI_memUCF_rule";
    case 811:
      return "  cmovN_reg_rule";
    case 812:
      return "  cmovN_regU_rule";
    case 813:
      return "  cmovN_regUCF_rule";
    case 814:
      return "  cmovP_reg_rule";
    case 815:
      return "  cmovP_regU_rule";
    case 816:
      return "  cmovP_regUCF_rule";
    case 817:
      return "  cmovL_reg_rule";
    case 818:
      return "  cmovL_mem_rule";
    case 819:
      return "  cmovL_regU_rule";
    case 820:
      return "  cmovL_regUCF_rule";
    case 821:
      return "  cmovL_memU_rule";
    case 822:
      return "  cmovL_memUCF_rule";
    case 823:
      return "  cmovF_reg_rule";
    case 824:
      return "  cmovF_regU_rule";
    case 825:
      return "  cmovF_regUCF_rule";
    case 826:
      return "  cmovD_reg_rule";
    case 827:
      return "  cmovD_regU_rule";
    case 828:
      return "  cmovD_regUCF_rule";
    case 829:
      return "  addI_rReg_rule";
    case 830:
      return "  addI_rReg_imm_rule";
    case 831:
      return "  addI_rReg_mem_rule";
    case 832:
      return "  addI_rReg_mem_0_rule";
    case 833:
      return "  addI_mem_rReg_rule";
    case 834:
      return "  addI_mem_rReg_0_rule";
    case 835:
      return "  addI_mem_imm_rule";
    case 836:
      return "  incI_rReg_rule";
    case 837:
      return "  incI_mem_rule";
    case 838:
      return "  decI_rReg_rule";
    case 839:
      return "  decI_mem_rule";
    case 840:
      return "  leaI_rReg_immI_rule";
    case 841:
      return "  addL_rReg_rule";
    case 842:
      return "  addL_rReg_imm_rule";
    case 843:
      return "  addL_rReg_mem_rule";
    case 844:
      return "  addL_rReg_mem_0_rule";
    case 845:
      return "  addL_mem_rReg_rule";
    case 846:
      return "  addL_mem_rReg_0_rule";
    case 847:
      return "  addL_mem_imm_rule";
    case 848:
      return "  incL_rReg_rule";
    case 849:
      return "  incL_mem_rule";
    case 850:
      return "  decL_rReg_rule";
    case 851:
      return "  decL_mem_rule";
    case 852:
      return "  leaL_rReg_immL_rule";
    case 853:
      return "  addP_rReg_rule";
    case 854:
      return "  addP_rReg_imm_rule";
    case 855:
      return "  leaP_rReg_imm_rule";
    case 856:
      return "  loadPLocked_rule";
    case 857:
      return "  compareAndSwapP_rule";
    case 858:
      return "  compareAndSwapP_0_rule";
    case 859:
      return "  compareAndSwapL_rule";
    case 860:
      return "  compareAndSwapL_0_rule";
    case 861:
      return "  compareAndSwapI_rule";
    case 862:
      return "  compareAndSwapI_0_rule";
    case 863:
      return "  compareAndSwapB_rule";
    case 864:
      return "  compareAndSwapB_0_rule";
    case 865:
      return "  compareAndSwapS_rule";
    case 866:
      return "  compareAndSwapS_0_rule";
    case 867:
      return "  compareAndSwapN_rule";
    case 868:
      return "  compareAndSwapN_0_rule";
    case 869:
      return "  compareAndExchangeB_rule";
    case 870:
      return "  compareAndExchangeS_rule";
    case 871:
      return "  compareAndExchangeI_rule";
    case 872:
      return "  compareAndExchangeL_rule";
    case 873:
      return "  compareAndExchangeN_rule";
    case 874:
      return "  compareAndExchangeP_rule";
    case 875:
      return "  xaddB_no_res_rule";
    case 876:
      return "  xaddB_rule";
    case 877:
      return "  xaddS_no_res_rule";
    case 878:
      return "  xaddS_rule";
    case 879:
      return "  xaddI_no_res_rule";
    case 880:
      return "  xaddI_rule";
    case 881:
      return "  xaddL_no_res_rule";
    case 882:
      return "  xaddL_rule";
    case 883:
      return "  xchgB_rule";
    case 884:
      return "  xchgS_rule";
    case 885:
      return "  xchgI_rule";
    case 886:
      return "  xchgL_rule";
    case 887:
      return "  xchgP_rule";
    case 888:
      return "  xchgN_rule";
    case 889:
      return "  subI_rReg_rule";
    case 890:
      return "  subI_rReg_imm_rule";
    case 891:
      return "  subI_rReg_mem_rule";
    case 892:
      return "  subI_mem_rReg_rule";
    case 893:
      return "  subI_mem_imm_rule";
    case 894:
      return "  subL_rReg_rule";
    case 895:
      return "  subL_rReg_imm_rule";
    case 896:
      return "  subL_rReg_mem_rule";
    case 897:
      return "  subL_mem_rReg_rule";
    case 898:
      return "  subL_mem_imm_rule";
    case 899:
      return "  subP_rReg_rule";
    case 900:
      return "  negI_rReg_rule";
    case 901:
      return "  negI_mem_rule";
    case 902:
      return "  negL_rReg_rule";
    case 903:
      return "  negL_mem_rule";
    case 904:
      return "  mulI_rReg_rule";
    case 905:
      return "  mulI_rReg_imm_rule";
    case 906:
      return "  mulI_mem_rule";
    case 907:
      return "  mulI_mem_0_rule";
    case 908:
      return "  mulI_mem_imm_rule";
    case 909:
      return "  mulAddS2I_rReg_rule";
    case 910:
      return "  mulL_rReg_rule";
    case 911:
      return "  mulL_rReg_imm_rule";
    case 912:
      return "  mulL_mem_rule";
    case 913:
      return "  mulL_mem_0_rule";
    case 914:
      return "  mulL_mem_imm_rule";
    case 915:
      return "  mulHiL_rReg_rule";
    case 916:
      return "  divI_rReg_rule";
    case 917:
      return "  divL_rReg_rule";
    case 918:
      return "  divModI_rReg_divmod_rule";
    case 919:
      return "  divModL_rReg_divmod_rule";
    case 920:
      return "  loadConL_0x6666666666666667_rule";
    case 921:
      return "  mul_hi_rule";
    case 922:
      return "  sarL_rReg_63_rule";
    case 923:
      return "  sarL_rReg_2_rule";
    case 924:
      return "  divL_10_rule";
    case 925:
      return "  modI_rReg_rule";
    case 926:
      return "  modL_rReg_rule";
    case 927:
      return "  salI_rReg_1_rule";
    case 928:
      return "  salI_mem_1_rule";
    case 929:
      return "  salI_rReg_imm_rule";
    case 930:
      return "  salI_mem_imm_rule";
    case 931:
      return "  salI_rReg_CL_rule";
    case 932:
      return "  salI_mem_CL_rule";
    case 933:
      return "  sarI_rReg_1_rule";
    case 934:
      return "  sarI_mem_1_rule";
    case 935:
      return "  sarI_rReg_imm_rule";
    case 936:
      return "  sarI_mem_imm_rule";
    case 937:
      return "  sarI_rReg_CL_rule";
    case 938:
      return "  sarI_mem_CL_rule";
    case 939:
      return "  shrI_rReg_1_rule";
    case 940:
      return "  shrI_mem_1_rule";
    case 941:
      return "  shrI_rReg_imm_rule";
    case 942:
      return "  shrI_mem_imm_rule";
    case 943:
      return "  shrI_rReg_CL_rule";
    case 944:
      return "  shrI_mem_CL_rule";
    case 945:
      return "  salL_rReg_1_rule";
    case 946:
      return "  salL_mem_1_rule";
    case 947:
      return "  salL_rReg_imm_rule";
    case 948:
      return "  salL_mem_imm_rule";
    case 949:
      return "  salL_rReg_CL_rule";
    case 950:
      return "  salL_mem_CL_rule";
    case 951:
      return "  sarL_rReg_1_rule";
    case 952:
      return "  sarL_mem_1_rule";
    case 953:
      return "  sarL_rReg_imm_rule";
    case 954:
      return "  sarL_mem_imm_rule";
    case 955:
      return "  sarL_rReg_CL_rule";
    case 956:
      return "  sarL_mem_CL_rule";
    case 957:
      return "  shrL_rReg_1_rule";
    case 958:
      return "  shrL_mem_1_rule";
    case 959:
      return "  shrL_rReg_imm_rule";
    case 960:
      return "  shrL_mem_imm_rule";
    case 961:
      return "  shrL_rReg_CL_rule";
    case 962:
      return "  shrL_mem_CL_rule";
    case 963:
      return "  i2b_rule";
    case 964:
      return "  i2s_rule";
    case 965:
      return "  rolI_rReg_imm1_rule";
    case 966:
      return "  rolI_rReg_imm8_rule";
    case 967:
      return "  rolI_rReg_CL_rule";
    case 968:
      return "  rolI_rReg_i1_rule";
    case 969:
      return "  rolI_rReg_i1_0_rule";
    case 970:
      return "  rolI_rReg_i8_rule";
    case 971:
      return "  rolI_rReg_i8_0_rule";
    case 972:
      return "  rolI_rReg_Var_C0_rule";
    case 973:
      return "  rolI_rReg_Var_C0_0_rule";
    case 974:
      return "  rolI_rReg_Var_C32_rule";
    case 975:
      return "  rolI_rReg_Var_C32_0_rule";
    case 976:
      return "  rorI_rReg_imm1_rule";
    case 977:
      return "  rorI_rReg_imm8_rule";
    case 978:
      return "  rorI_rReg_CL_rule";
    case 979:
      return "  rorI_rReg_i1_rule";
    case 980:
      return "  rorI_rReg_i1_0_rule";
    case 981:
      return "  rorI_rReg_i8_rule";
    case 982:
      return "  rorI_rReg_i8_0_rule";
    case 983:
      return "  rorI_rReg_Var_C0_rule";
    case 984:
      return "  rorI_rReg_Var_C0_0_rule";
    case 985:
      return "  rorI_rReg_Var_C32_rule";
    case 986:
      return "  rorI_rReg_Var_C32_0_rule";
    case 987:
      return "  rolL_rReg_imm1_rule";
    case 988:
      return "  rolL_rReg_imm8_rule";
    case 989:
      return "  rolL_rReg_CL_rule";
    case 990:
      return "  rolL_rReg_i1_rule";
    case 991:
      return "  rolL_rReg_i1_0_rule";
    case 992:
      return "  rolL_rReg_i8_rule";
    case 993:
      return "  rolL_rReg_i8_0_rule";
    case 994:
      return "  rolL_rReg_Var_C0_rule";
    case 995:
      return "  rolL_rReg_Var_C0_0_rule";
    case 996:
      return "  rolL_rReg_Var_C64_rule";
    case 997:
      return "  rolL_rReg_Var_C64_0_rule";
    case 998:
      return "  rorL_rReg_imm1_rule";
    case 999:
      return "  rorL_rReg_imm8_rule";
    case 1000:
      return "  rorL_rReg_CL_rule";
    case 1001:
      return "  rorL_rReg_i1_rule";
    case 1002:
      return "  rorL_rReg_i1_0_rule";
    case 1003:
      return "  rorL_rReg_i8_rule";
    case 1004:
      return "  rorL_rReg_i8_0_rule";
    case 1005:
      return "  rorL_rReg_Var_C0_rule";
    case 1006:
      return "  rorL_rReg_Var_C0_0_rule";
    case 1007:
      return "  rorL_rReg_Var_C64_rule";
    case 1008:
      return "  rorL_rReg_Var_C64_0_rule";
    case 1009:
      return "  andI_rReg_rule";
    case 1010:
      return "  andI_rReg_imm255_rule";
    case 1011:
      return "  andI2L_rReg_imm255_rule";
    case 1012:
      return "  andI_rReg_imm65535_rule";
    case 1013:
      return "  andI2L_rReg_imm65535_rule";
    case 1014:
      return "  andI_rReg_imm_rule";
    case 1015:
      return "  andI_rReg_mem_rule";
    case 1016:
      return "  andI_rReg_mem_0_rule";
    case 1017:
      return "  andB_mem_rReg_rule";
    case 1018:
      return "  andB_mem_rReg_0_rule";
    case 1019:
      return "  andI_mem_rReg_rule";
    case 1020:
      return "  andI_mem_rReg_0_rule";
    case 1021:
      return "  andI_mem_imm_rule";
    case 1022:
      return "  andnI_rReg_rReg_mem_rule";
    case 1023:
      return "  andnI_rReg_rReg_mem_0_rule";
    case 1024:
      return "  andnI_rReg_rReg_rReg_rule";
    case 1025:
      return "  andnI_rReg_rReg_rReg_0_rule";
    case 1026:
      return "  blsiI_rReg_rReg_rule";
    case 1027:
      return "  blsiI_rReg_rReg_0_rule";
    case 1028:
      return "  blsiI_rReg_mem_rule";
    case 1029:
      return "  blsiI_rReg_mem_0_rule";
    case 1030:
      return "  blsmskI_rReg_mem_rule";
    case 1031:
      return "  blsmskI_rReg_mem_0_rule";
    case 1032:
      return "  blsmskI_rReg_rReg_rule";
    case 1033:
      return "  blsmskI_rReg_rReg_0_rule";
    case 1034:
      return "  blsrI_rReg_rReg_rule";
    case 1035:
      return "  blsrI_rReg_rReg_0_rule";
    case 1036:
      return "  blsrI_rReg_mem_rule";
    case 1037:
      return "  blsrI_rReg_mem_0_rule";
    case 1038:
      return "  orI_rReg_rule";
    case 1039:
      return "  orI_rReg_imm_rule";
    case 1040:
      return "  orI_rReg_mem_rule";
    case 1041:
      return "  orI_rReg_mem_0_rule";
    case 1042:
      return "  orB_mem_rReg_rule";
    case 1043:
      return "  orB_mem_rReg_0_rule";
    case 1044:
      return "  orI_mem_rReg_rule";
    case 1045:
      return "  orI_mem_rReg_0_rule";
    case 1046:
      return "  orI_mem_imm_rule";
    case 1047:
      return "  xorI_rReg_rule";
    case 1048:
      return "  xorI_rReg_im1_rule";
    case 1049:
      return "  xorI_rReg_imm_rule";
    case 1050:
      return "  xorI_rReg_mem_rule";
    case 1051:
      return "  xorI_rReg_mem_0_rule";
    case 1052:
      return "  xorB_mem_rReg_rule";
    case 1053:
      return "  xorB_mem_rReg_0_rule";
    case 1054:
      return "  xorI_mem_rReg_rule";
    case 1055:
      return "  xorI_mem_rReg_0_rule";
    case 1056:
      return "  xorI_mem_imm_rule";
    case 1057:
      return "  andL_rReg_rule";
    case 1058:
      return "  andL_rReg_imm255_rule";
    case 1059:
      return "  andL_rReg_imm65535_rule";
    case 1060:
      return "  andL_rReg_imm_rule";
    case 1061:
      return "  andL_rReg_mem_rule";
    case 1062:
      return "  andL_rReg_mem_0_rule";
    case 1063:
      return "  andL_mem_rReg_rule";
    case 1064:
      return "  andL_mem_rReg_0_rule";
    case 1065:
      return "  andL_mem_imm_rule";
    case 1066:
      return "  andnL_rReg_rReg_mem_rule";
    case 1067:
      return "  andnL_rReg_rReg_mem_0_rule";
    case 1068:
      return "  andnL_rReg_rReg_rReg_rule";
    case 1069:
      return "  andnL_rReg_rReg_rReg_0_rule";
    case 1070:
      return "  blsiL_rReg_rReg_rule";
    case 1071:
      return "  blsiL_rReg_rReg_0_rule";
    case 1072:
      return "  blsiL_rReg_mem_rule";
    case 1073:
      return "  blsiL_rReg_mem_0_rule";
    case 1074:
      return "  blsmskL_rReg_mem_rule";
    case 1075:
      return "  blsmskL_rReg_mem_0_rule";
    case 1076:
      return "  blsmskL_rReg_rReg_rule";
    case 1077:
      return "  blsmskL_rReg_rReg_0_rule";
    case 1078:
      return "  blsrL_rReg_rReg_rule";
    case 1079:
      return "  blsrL_rReg_rReg_0_rule";
    case 1080:
      return "  blsrL_rReg_mem_rule";
    case 1081:
      return "  blsrL_rReg_mem_0_rule";
    case 1082:
      return "  orL_rReg_rule";
    case 1083:
      return "  orL_rReg_castP2X_rule";
    case 1084:
      return "  orL_rReg_castP2X_0_rule";
    case 1085:
      return "  orL_rReg_imm_rule";
    case 1086:
      return "  orL_rReg_mem_rule";
    case 1087:
      return "  orL_rReg_mem_0_rule";
    case 1088:
      return "  orL_mem_rReg_rule";
    case 1089:
      return "  orL_mem_rReg_0_rule";
    case 1090:
      return "  orL_mem_imm_rule";
    case 1091:
      return "  xorL_rReg_rule";
    case 1092:
      return "  xorL_rReg_im1_rule";
    case 1093:
      return "  xorL_rReg_imm_rule";
    case 1094:
      return "  xorL_rReg_mem_rule";
    case 1095:
      return "  xorL_rReg_mem_0_rule";
    case 1096:
      return "  xorL_mem_rReg_rule";
    case 1097:
      return "  xorL_mem_rReg_0_rule";
    case 1098:
      return "  xorL_mem_imm_rule";
    case 1099:
      return "  convI2B_rule";
    case 1100:
      return "  convP2B_rule";
    case 1101:
      return "  cmpLTMask_rule";
    case 1102:
      return "  cmpLTMask0_rule";
    case 1103:
      return "  cadd_cmpLTMask_rule";
    case 1104:
      return "  cadd_cmpLTMask_1_rule";
    case 1105:
      return "  cadd_cmpLTMask_0_rule";
    case 1106:
      return "  cadd_cmpLTMask_2_rule";
    case 1107:
      return "  and_cmpLTMask_rule";
    case 1108:
      return "  and_cmpLTMask_0_rule";
    case 1109:
      return "  cmpF_reg_rule";
    case 1110:
      return "  cmpF_mem_rule";
    case 1111:
      return "  cmpF_imm_rule";
    case 1112:
      return "  cmpD_reg_rule";
    case 1113:
      return "  cmpD_mem_rule";
    case 1114:
      return "  cmpD_imm_rule";
    case 1115:
      return "  convF2D_reg_reg_rule";
    case 1116:
      return "  convF2D_reg_mem_rule";
    case 1117:
      return "  convD2F_reg_reg_rule";
    case 1118:
      return "  convD2F_reg_mem_rule";
    case 1119:
      return "  convF2I_reg_reg_rule";
    case 1120:
      return "  convF2L_reg_reg_rule";
    case 1121:
      return "  convD2I_reg_reg_rule";
    case 1122:
      return "  convD2L_reg_reg_rule";
    case 1123:
      return "  convI2F_reg_reg_rule";
    case 1124:
      return "  convI2F_reg_mem_rule";
    case 1125:
      return "  convI2D_reg_reg_rule";
    case 1126:
      return "  convI2D_reg_mem_rule";
    case 1127:
      return "  convXI2F_reg_rule";
    case 1128:
      return "  convXI2D_reg_rule";
    case 1129:
      return "  convL2F_reg_reg_rule";
    case 1130:
      return "  convL2F_reg_mem_rule";
    case 1131:
      return "  convL2D_reg_reg_rule";
    case 1132:
      return "  convL2D_reg_mem_rule";
    case 1133:
      return "  convI2L_reg_reg_rule";
    case 1134:
      return "  convI2L_reg_reg_zex_rule";
    case 1135:
      return "  convI2L_reg_mem_zex_rule";
    case 1136:
      return "  zerox_long_reg_reg_rule";
    case 1137:
      return "  convL2I_reg_reg_rule";
    case 1138:
      return "  MoveF2I_reg_stack_rule";
    case 1139:
      return "  MoveI2F_reg_stack_rule";
    case 1140:
      return "  MoveD2L_reg_stack_rule";
    case 1141:
      return "  MoveL2D_reg_stack_rule";
    case 1142:
      return "  rep_stos_rule";
    case 1143:
      return "  rep_stos_large_rule";
    case 1144:
      return "  string_compareL_rule";
    case 1145:
      return "  string_compareU_rule";
    case 1146:
      return "  string_compareLU_rule";
    case 1147:
      return "  string_compareUL_rule";
    case 1148:
      return "  string_indexof_conL_rule";
    case 1149:
      return "  string_indexof_conU_rule";
    case 1150:
      return "  string_indexof_conUL_rule";
    case 1151:
      return "  string_indexofL_rule";
    case 1152:
      return "  string_indexofU_rule";
    case 1153:
      return "  string_indexofUL_rule";
    case 1154:
      return "  string_indexofU_char_rule";
    case 1155:
      return "  string_equals_rule";
    case 1156:
      return "  array_equalsB_rule";
    case 1157:
      return "  array_equalsC_rule";
    case 1158:
      return "  has_negatives_rule";
    case 1159:
      return "  string_compress_rule";
    case 1160:
      return "  string_inflate_rule";
    case 1161:
      return "  encode_iso_array_rule";
    case 1162:
      return "  cmpL3_reg_reg_rule";
    case 1163:
      return "  cmovI_reg_g_rule";
    case 1164:
      return "  minI_rReg_rule";
    case 1165:
      return "  cmovI_reg_l_rule";
    case 1166:
      return "  maxI_rReg_rule";
    case 1167:
      return "  jmpDir_rule";
    case 1168:
      return "  jmpCon_rule";
    case 1169:
      return "  jmpLoopEnd_rule";
    case 1170:
      return "  jmpLoopEndU_rule";
    case 1171:
      return "  jmpLoopEndUCF_rule";
    case 1172:
      return "  jmpLoopEnd_and_restoreMask_rule";
    case 1173:
      return "  jmpLoopEndU_and_restoreMask_rule";
    case 1174:
      return "  jmpLoopEndUCF_and_restoreMask_rule";
    case 1175:
      return "  jmpConU_rule";
    case 1176:
      return "  jmpConUCF_rule";
    case 1177:
      return "  jmpConUCF2_rule";
    case 1178:
      return "  partialSubtypeCheck_rule";
    case 1179:
      return "  jmpDir_short_rule";
    case 1180:
      return "  jmpCon_short_rule";
    case 1181:
      return "  jmpLoopEnd_short_rule";
    case 1182:
      return "  jmpLoopEndU_short_rule";
    case 1183:
      return "  jmpLoopEndUCF_short_rule";
    case 1184:
      return "  jmpConU_short_rule";
    case 1185:
      return "  jmpConUCF_short_rule";
    case 1186:
      return "  jmpConUCF2_short_rule";
    case 1187:
      return "  safePoint_poll_far_rule";
    case 1188:
      return "  safePoint_poll_tls_rule";
    case 1189:
      return "  CallStaticJavaDirect_rule";
    case 1190:
      return "  CallDynamicJavaDirect_rule";
    case 1191:
      return "  CallRuntimeDirect_rule";
    case 1192:
      return "  CallLeafDirect_rule";
    case 1193:
      return "  CallLeafDirectVector_rule";
    case 1194:
      return "  CallLeafNoFPDirect_rule";
    case 1195:
      return "  Ret_rule";
    case 1196:
      return "  TailCalljmpInd_rule";
    case 1197:
      return "  tailjmpInd_rule";
    case 1198:
      return "  CreateException_rule";
    case 1199:
      return "  RethrowException_rule";
    case 1200:
      return "  ShouldNotReachHere_rule";
    case 1201:
      return "  setMask_rule";
    case 1202:
      return "  addF_reg_rule";
    case 1203:
      return "  addF_mem_rule";
    case 1204:
      return "  addF_mem_0_rule";
    case 1205:
      return "  addF_imm_rule";
    case 1206:
      return "  addF_reg_reg_rule";
    case 1207:
      return "  addF_reg_mem_rule";
    case 1208:
      return "  addF_reg_mem_0_rule";
    case 1209:
      return "  addF_reg_imm_rule";
    case 1210:
      return "  addD_reg_rule";
    case 1211:
      return "  addD_mem_rule";
    case 1212:
      return "  addD_mem_0_rule";
    case 1213:
      return "  addD_imm_rule";
    case 1214:
      return "  addD_reg_reg_rule";
    case 1215:
      return "  addD_reg_mem_rule";
    case 1216:
      return "  addD_reg_mem_0_rule";
    case 1217:
      return "  addD_reg_imm_rule";
    case 1218:
      return "  subF_reg_rule";
    case 1219:
      return "  subF_mem_rule";
    case 1220:
      return "  subF_imm_rule";
    case 1221:
      return "  subF_reg_reg_rule";
    case 1222:
      return "  subF_reg_mem_rule";
    case 1223:
      return "  subF_reg_imm_rule";
    case 1224:
      return "  subD_reg_rule";
    case 1225:
      return "  subD_mem_rule";
    case 1226:
      return "  subD_imm_rule";
    case 1227:
      return "  subD_reg_reg_rule";
    case 1228:
      return "  subD_reg_mem_rule";
    case 1229:
      return "  subD_reg_imm_rule";
    case 1230:
      return "  mulF_reg_rule";
    case 1231:
      return "  mulF_mem_rule";
    case 1232:
      return "  mulF_mem_0_rule";
    case 1233:
      return "  mulF_imm_rule";
    case 1234:
      return "  mulF_reg_reg_rule";
    case 1235:
      return "  mulF_reg_mem_rule";
    case 1236:
      return "  mulF_reg_mem_0_rule";
    case 1237:
      return "  mulF_reg_imm_rule";
    case 1238:
      return "  mulD_reg_rule";
    case 1239:
      return "  mulD_mem_rule";
    case 1240:
      return "  mulD_mem_0_rule";
    case 1241:
      return "  mulD_imm_rule";
    case 1242:
      return "  mulD_reg_reg_rule";
    case 1243:
      return "  mulD_reg_mem_rule";
    case 1244:
      return "  mulD_reg_mem_0_rule";
    case 1245:
      return "  mulD_reg_imm_rule";
    case 1246:
      return "  divF_reg_rule";
    case 1247:
      return "  divF_mem_rule";
    case 1248:
      return "  divF_imm_rule";
    case 1249:
      return "  divF_reg_reg_rule";
    case 1250:
      return "  divF_reg_mem_rule";
    case 1251:
      return "  divF_reg_imm_rule";
    case 1252:
      return "  divD_reg_rule";
    case 1253:
      return "  divD_mem_rule";
    case 1254:
      return "  divD_imm_rule";
    case 1255:
      return "  divD_reg_reg_rule";
    case 1256:
      return "  divD_reg_mem_rule";
    case 1257:
      return "  divD_reg_imm_rule";
    case 1258:
      return "  negI_rReg_2_rule";
    case 1259:
      return "  negL_rReg_2_rule";
    case 1260:
      return "  sqrtF_reg_rule";
    case 1261:
      return "  sqrtF_mem_rule";
    case 1262:
      return "  sqrtF_imm_rule";
    case 1263:
      return "  sqrtD_reg_rule";
    case 1264:
      return "  sqrtD_mem_rule";
    case 1265:
      return "  sqrtD_imm_rule";
    case 1266:
      return "  onspinwait_rule";
    case 1267:
      return "  fmaD_reg_rule";
    case 1268:
      return "  fmaF_reg_rule";
    case 1269:
      return "  reinterpretS2D_rule";
    case 1270:
      return "  reinterpretS2D_avx_rule";
    case 1271:
      return "  reinterpretS2X_rule";
    case 1272:
      return "  reinterpretS2X_avx_rule";
    case 1273:
      return "  reinterpretS2Y_rule";
    case 1274:
      return "  reinterpretS2Z_rule";
    case 1275:
      return "  reinterpretD2X_rule";
    case 1276:
      return "  reinterpretD2X_avx_rule";
    case 1277:
      return "  reinterpretD2Y_rule";
    case 1278:
      return "  reinterpretD2Z_rule";
    case 1279:
      return "  reinterpretX2Y_rule";
    case 1280:
      return "  reinterpretX2Z_rule";
    case 1281:
      return "  reinterpretY2Z_rule";
    case 1282:
      return "  loadV1_rule";
    case 1283:
      return "  loadV2_rule";
    case 1284:
      return "  loadV4_rule";
    case 1285:
      return "  loadV8_rule";
    case 1286:
      return "  loadV16_rule";
    case 1287:
      return "  loadV32_rule";
    case 1288:
      return "  loadV64_dword_rule";
    case 1289:
      return "  loadV64_qword_rule";
    case 1290:
      return "  storeV1_rule";
    case 1291:
      return "  storeV2_rule";
    case 1292:
      return "  storeV4_rule";
    case 1293:
      return "  storeV8_rule";
    case 1294:
      return "  storeV16_rule";
    case 1295:
      return "  storeV32_rule";
    case 1296:
      return "  storeV64_dword_rule";
    case 1297:
      return "  storeV64_qword_rule";
    case 1298:
      return "  Repl4B_mem_rule";
    case 1299:
      return "  Repl8B_mem_rule";
    case 1300:
      return "  Repl16B_rule";
    case 1301:
      return "  Repl16B_mem_rule";
    case 1302:
      return "  Repl32B_rule";
    case 1303:
      return "  Repl32B_mem_rule";
    case 1304:
      return "  Repl64B_rule";
    case 1305:
      return "  Repl64B_mem_rule";
    case 1306:
      return "  Repl16B_imm_rule";
    case 1307:
      return "  Repl32B_imm_rule";
    case 1308:
      return "  Repl64B_imm_rule";
    case 1309:
      return "  Repl4S_rule";
    case 1310:
      return "  Repl4S_mem_rule";
    case 1311:
      return "  Repl8S_rule";
    case 1312:
      return "  Repl8S_mem_rule";
    case 1313:
      return "  Repl8S_imm_rule";
    case 1314:
      return "  Repl16S_rule";
    case 1315:
      return "  Repl16S_mem_rule";
    case 1316:
      return "  Repl16S_imm_rule";
    case 1317:
      return "  Repl32S_rule";
    case 1318:
      return "  Repl32S_mem_rule";
    case 1319:
      return "  Repl32S_imm_rule";
    case 1320:
      return "  Repl4I_rule";
    case 1321:
      return "  Repl4I_mem_rule";
    case 1322:
      return "  Repl8I_rule";
    case 1323:
      return "  Repl8I_mem_rule";
    case 1324:
      return "  Repl16I_rule";
    case 1325:
      return "  Repl16I_mem_rule";
    case 1326:
      return "  Repl4I_imm_rule";
    case 1327:
      return "  Repl8I_imm_rule";
    case 1328:
      return "  Repl16I_imm_rule";
    case 1329:
      return "  Repl2L_mem_rule";
    case 1330:
      return "  Repl4L_rule";
    case 1331:
      return "  Repl8L_rule";
    case 1332:
      return "  Repl4L_imm_rule";
    case 1333:
      return "  Repl8L_imm_rule";
    case 1334:
      return "  Repl4L_mem_rule";
    case 1335:
      return "  Repl8L_mem_rule";
    case 1336:
      return "  Repl2F_mem_rule";
    case 1337:
      return "  Repl4F_mem_rule";
    case 1338:
      return "  Repl8F_rule";
    case 1339:
      return "  Repl8F_mem_rule";
    case 1340:
      return "  Repl16F_rule";
    case 1341:
      return "  Repl16F_mem_rule";
    case 1342:
      return "  Repl2F_zero_rule";
    case 1343:
      return "  Repl4F_zero_rule";
    case 1344:
      return "  Repl8F_zero_rule";
    case 1345:
      return "  Repl2D_mem_rule";
    case 1346:
      return "  Repl4D_rule";
    case 1347:
      return "  Repl4D_mem_rule";
    case 1348:
      return "  Repl8D_rule";
    case 1349:
      return "  Repl8D_mem_rule";
    case 1350:
      return "  Repl2D_zero_rule";
    case 1351:
      return "  Repl4D_zero_rule";
    case 1352:
      return "  Repl4B_rule";
    case 1353:
      return "  Repl8B_rule";
    case 1354:
      return "  Repl4B_imm_rule";
    case 1355:
      return "  Repl8B_imm_rule";
    case 1356:
      return "  Repl4B_zero_rule";
    case 1357:
      return "  Repl8B_zero_rule";
    case 1358:
      return "  Repl16B_zero_rule";
    case 1359:
      return "  Repl32B_zero_rule";
    case 1360:
      return "  Repl2S_rule";
    case 1361:
      return "  Repl2S_imm_rule";
    case 1362:
      return "  Repl4S_imm_rule";
    case 1363:
      return "  Repl2S_zero_rule";
    case 1364:
      return "  Repl4S_zero_rule";
    case 1365:
      return "  Repl8S_zero_rule";
    case 1366:
      return "  Repl16S_zero_rule";
    case 1367:
      return "  Repl2I_rule";
    case 1368:
      return "  Repl2I_mem_rule";
    case 1369:
      return "  Repl2I_imm_rule";
    case 1370:
      return "  Repl2I_zero_rule";
    case 1371:
      return "  Repl4I_zero_rule";
    case 1372:
      return "  Repl8I_zero_rule";
    case 1373:
      return "  Repl2L_rule";
    case 1374:
      return "  Repl2L_imm_rule";
    case 1375:
      return "  Repl2L_zero_rule";
    case 1376:
      return "  Repl4L_zero_rule";
    case 1377:
      return "  Repl2F_rule";
    case 1378:
      return "  Repl4F_rule";
    case 1379:
      return "  Repl2D_rule";
    case 1380:
      return "  Repl4B_mem_evex_rule";
    case 1381:
      return "  Repl8B_mem_evex_rule";
    case 1382:
      return "  Repl16B_evex_rule";
    case 1383:
      return "  Repl16B_mem_evex_rule";
    case 1384:
      return "  Repl32B_evex_rule";
    case 1385:
      return "  Repl32B_mem_evex_rule";
    case 1386:
      return "  Repl64B_evex_rule";
    case 1387:
      return "  Repl64B_mem_evex_rule";
    case 1388:
      return "  Repl16B_imm_evex_rule";
    case 1389:
      return "  Repl32B_imm_evex_rule";
    case 1390:
      return "  Repl64B_imm_evex_rule";
    case 1391:
      return "  Repl64B_zero_evex_rule";
    case 1392:
      return "  Repl4S_evex_rule";
    case 1393:
      return "  Repl4S_mem_evex_rule";
    case 1394:
      return "  Repl8S_evex_rule";
    case 1395:
      return "  Repl8S_mem_evex_rule";
    case 1396:
      return "  Repl16S_evex_rule";
    case 1397:
      return "  Repl16S_mem_evex_rule";
    case 1398:
      return "  Repl32S_evex_rule";
    case 1399:
      return "  Repl32S_mem_evex_rule";
    case 1400:
      return "  Repl8S_imm_evex_rule";
    case 1401:
      return "  Repl16S_imm_evex_rule";
    case 1402:
      return "  Repl32S_imm_evex_rule";
    case 1403:
      return "  Repl32S_zero_evex_rule";
    case 1404:
      return "  Repl4I_evex_rule";
    case 1405:
      return "  Repl4I_mem_evex_rule";
    case 1406:
      return "  Repl8I_evex_rule";
    case 1407:
      return "  Repl8I_mem_evex_rule";
    case 1408:
      return "  Repl16I_evex_rule";
    case 1409:
      return "  Repl16I_mem_evex_rule";
    case 1410:
      return "  Repl4I_imm_evex_rule";
    case 1411:
      return "  Repl8I_imm_evex_rule";
    case 1412:
      return "  Repl16I_imm_evex_rule";
    case 1413:
      return "  Repl16I_zero_evex_rule";
    case 1414:
      return "  Repl4L_evex_rule";
    case 1415:
      return "  Repl8L_evex_rule";
    case 1416:
      return "  Repl4L_imm_evex_rule";
    case 1417:
      return "  Repl8L_imm_evex_rule";
    case 1418:
      return "  Repl2L_mem_evex_rule";
    case 1419:
      return "  Repl4L_mem_evex_rule";
    case 1420:
      return "  Repl8L_mem_evex_rule";
    case 1421:
      return "  Repl8L_zero_evex_rule";
    case 1422:
      return "  Repl8F_evex_rule";
    case 1423:
      return "  Repl8F_mem_evex_rule";
    case 1424:
      return "  Repl16F_evex_rule";
    case 1425:
      return "  Repl16F_mem_evex_rule";
    case 1426:
      return "  Repl2F_zero_evex_rule";
    case 1427:
      return "  Repl4F_zero_evex_rule";
    case 1428:
      return "  Repl8F_zero_evex_rule";
    case 1429:
      return "  Repl16F_zero_evex_rule";
    case 1430:
      return "  Repl4D_evex_rule";
    case 1431:
      return "  Repl4D_mem_evex_rule";
    case 1432:
      return "  Repl8D_evex_rule";
    case 1433:
      return "  Repl8D_mem_evex_rule";
    case 1434:
      return "  Repl2D_zero_evex_rule";
    case 1435:
      return "  Repl4D_zero_evex_rule";
    case 1436:
      return "  Repl8D_zero_evex_rule";
    case 1437:
      return "  rvinsert8B_rule";
    case 1438:
      return "  rvinsert16B_rule";
    case 1439:
      return "  rvinsert16B_avx_rule";
    case 1440:
      return "  rvinsert32B_rule";
    case 1441:
      return "  rvinsert64B_rule";
    case 1442:
      return "  rvinsert4S_rule";
    case 1443:
      return "  rvinsert8S_rule";
    case 1444:
      return "  rvinsert8S_avx_rule";
    case 1445:
      return "  rvinsert16S_rule";
    case 1446:
      return "  rvinsert32S_rule";
    case 1447:
      return "  rvinsert2I_rule";
    case 1448:
      return "  rvinsert4I_rule";
    case 1449:
      return "  rvinsert4I_avx_rule";
    case 1450:
      return "  rvinsert8I_rule";
    case 1451:
      return "  rvinsert16I_rule";
    case 1452:
      return "  rvinsert1L_rule";
    case 1453:
      return "  rvinsert2L_rule";
    case 1454:
      return "  rvinsert2L_avx_rule";
    case 1455:
      return "  rvinsert4L_rule";
    case 1456:
      return "  rvinsert8L_rule";
    case 1457:
      return "  rvinsert2F_rule";
    case 1458:
      return "  rvinsert2F_avx_rule";
    case 1459:
      return "  rvinsert4F_rule";
    case 1460:
      return "  rvinsert4F_avx_rule";
    case 1461:
      return "  rvinsert8F_rule";
    case 1462:
      return "  rvinsert16F_rule";
    case 1463:
      return "  rvinsert1D_rule";
    case 1464:
      return "  rvinsert2D_rule";
    case 1465:
      return "  rvinsert2D_avx_rule";
    case 1466:
      return "  rvinsert4D_rule";
    case 1467:
      return "  rvinsert8D_rule";
    case 1468:
      return "  rsadd8B_reduction_reg_rule";
    case 1469:
      return "  rsadd16B_reduction_reg_rule";
    case 1470:
      return "  rvadd32B_reduction_reg_rule";
    case 1471:
      return "  rvadd64B_reduction_reg_rule";
    case 1472:
      return "  rsadd4S_reduction_reg_rule";
    case 1473:
      return "  rvadd4S_reduction_reg_rule";
    case 1474:
      return "  rsadd8S_reduction_reg_rule";
    case 1475:
      return "  rvadd8S_reduction_reg_rule";
    case 1476:
      return "  rvadd16S_reduction_reg_rule";
    case 1477:
      return "  rvadd32S_reduction_reg_evex_rule";
    case 1478:
      return "  rsadd2I_reduction_reg_rule";
    case 1479:
      return "  rvadd2I_reduction_reg_rule";
    case 1480:
      return "  rvadd2I_reduction_reg_evex_rule";
    case 1481:
      return "  rsadd4I_reduction_reg_rule";
    case 1482:
      return "  rvadd4I_reduction_reg_rule";
    case 1483:
      return "  rvadd4I_reduction_reg_evex_rule";
    case 1484:
      return "  rvadd8I_reduction_reg_rule";
    case 1485:
      return "  rvadd8I_reduction_reg_evex_rule";
    case 1486:
      return "  rvadd16I_reduction_reg_evex_rule";
    case 1487:
      return "  rvadd2L_reduction_reg_rule";
    case 1488:
      return "  rvadd4L_reduction_reg_rule";
    case 1489:
      return "  rvadd8L_reduction_reg_rule";
    case 1490:
      return "  rsadd2F_reduction_reg_rule";
    case 1491:
      return "  rvadd2F_reduction_reg_rule";
    case 1492:
      return "  rsadd4F_reduction_reg_rule";
    case 1493:
      return "  rvadd4F_reduction_reg_rule";
    case 1494:
      return "  radd8F_reduction_reg_rule";
    case 1495:
      return "  radd16F_reduction_reg_rule";
    case 1496:
      return "  rsadd2D_reduction_reg_rule";
    case 1497:
      return "  rvadd2D_reduction_reg_rule";
    case 1498:
      return "  rvadd4D_reduction_reg_rule";
    case 1499:
      return "  rvadd8D_reduction_reg_rule";
    case 1500:
      return "  rssub2F_reduction_reg_rule";
    case 1501:
      return "  rvsub2F_reduction_reg_rule";
    case 1502:
      return "  rssub4F_reduction_reg_rule";
    case 1503:
      return "  rvsub4F_reduction_reg_rule";
    case 1504:
      return "  rsub8F_reduction_reg_rule";
    case 1505:
      return "  rsub16F_reduction_reg_rule";
    case 1506:
      return "  rssub2D_reduction_reg_rule";
    case 1507:
      return "  rvsub2D_reduction_reg_rule";
    case 1508:
      return "  rvsub4D_reduction_reg_rule";
    case 1509:
      return "  rvsub8D_reduction_reg_rule";
    case 1510:
      return "  rsmul8B_reduction_reg_rule";
    case 1511:
      return "  rsmul16B_reduction_reg_rule";
    case 1512:
      return "  rvmul32B_reduction_reg_rule";
    case 1513:
      return "  rvmul64B_reduction_reg_rule";
    case 1514:
      return "  rsmul4S_reduction_reg_rule";
    case 1515:
      return "  rsmul8S_reduction_reg_rule";
    case 1516:
      return "  rvmul16S_reduction_reg_rule";
    case 1517:
      return "  rvmul32S_reduction_reg_rule";
    case 1518:
      return "  rsmul2I_reduction_reg_rule";
    case 1519:
      return "  rvmul2I_reduction_reg_rule";
    case 1520:
      return "  rsmul4I_reduction_reg_rule";
    case 1521:
      return "  rvmul4I_reduction_reg_rule";
    case 1522:
      return "  rvmul8I_reduction_reg_rule";
    case 1523:
      return "  rvmul16I_reduction_reg_rule";
    case 1524:
      return "  rvmul2L_reduction_reg_rule";
    case 1525:
      return "  rvmul4L_reduction_reg_rule";
    case 1526:
      return "  rvmul8L_reduction_reg_rule";
    case 1527:
      return "  rsmul2F_reduction_rule";
    case 1528:
      return "  rvmul2F_reduction_reg_rule";
    case 1529:
      return "  rsmul4F_reduction_reg_rule";
    case 1530:
      return "  rvmul4F_reduction_reg_rule";
    case 1531:
      return "  rvmul8F_reduction_reg_rule";
    case 1532:
      return "  rvmul16F_reduction_reg_rule";
    case 1533:
      return "  rsmul2D_reduction_reg_rule";
    case 1534:
      return "  rvmul2D_reduction_reg_rule";
    case 1535:
      return "  rvmul4D_reduction_reg_rule";
    case 1536:
      return "  rvmul8D_reduction_reg_rule";
    case 1537:
      return "  rsmin8B_reduction_reg_rule";
    case 1538:
      return "  rsmin16B_reduction_reg_rule";
    case 1539:
      return "  rvmin16B_reduction_reg_rule";
    case 1540:
      return "  rvmin32B_reduction_reg_rule";
    case 1541:
      return "  rvmin64B_reduction_reg_rule";
    case 1542:
      return "  rsmin4S_reduction_reg_rule";
    case 1543:
      return "  rsmin8S_reduction_reg_rule";
    case 1544:
      return "  rvmin8S_reduction_reg_rule";
    case 1545:
      return "  rvmin16S_reduction_reg_rule";
    case 1546:
      return "  rvmin32S_reduction_reg_rule";
    case 1547:
      return "  rsmin2I_reduction_reg_rule";
    case 1548:
      return "  rvmin2I_reduction_reg_rule";
    case 1549:
      return "  rsmin4I_reduction_reg_rule";
    case 1550:
      return "  rvmin4I_reduction_reg_rule";
    case 1551:
      return "  rvmin4I_reduction_evex_rule";
    case 1552:
      return "  rvmin8I_reduction_reg_rule";
    case 1553:
      return "  rvmin8I_reduction_evex_rule";
    case 1554:
      return "  rvmin16I_reduction_evex_rule";
    case 1555:
      return "  rsmin1L_reduction_reg_rule";
    case 1556:
      return "  rsmin2L_reduction_reg_rule";
    case 1557:
      return "  rvmin2L_reduction_reg_rule";
    case 1558:
      return "  rvmin4L_reduction_reg_rule";
    case 1559:
      return "  rvmin8L_reduction_reg_rule";
    case 1560:
      return "  rvmin2F_reduction_reg_av_rule";
    case 1561:
      return "  rvmin2F_reduction_reg_rule";
    case 1562:
      return "  rvmin4F_reduction_reg_av_rule";
    case 1563:
      return "  rvmin4F_reduction_reg_rule";
    case 1564:
      return "  rvmin8F_reduction_reg_av_rule";
    case 1565:
      return "  rvmin8F_reduction_reg_rule";
    case 1566:
      return "  rvmin16F_reduction_reg_av_rule";
    case 1567:
      return "  rvmin16F_reduction_reg_rule";
    case 1568:
      return "  rvmin2D_reduction_reg_av_rule";
    case 1569:
      return "  rvmin2D_reduction_reg_rule";
    case 1570:
      return "  rvmin4D_reduction_reg_av_rule";
    case 1571:
      return "  rvmin4D_reduction_reg_rule";
    case 1572:
      return "  rvmin8D_reduction_reg_av_rule";
    case 1573:
      return "  rvmin8D_reduction_reg_rule";
    case 1574:
      return "  rsmax8B_reduction_reg_rule";
    case 1575:
      return "  rsmax16B_reduction_reg_rule";
    case 1576:
      return "  rvmax16B_reduction_reg_rule";
    case 1577:
      return "  rvmax32B_reduction_reg_rule";
    case 1578:
      return "  rvmax64B_reduction_reg_rule";
    case 1579:
      return "  rsmax4S_reduction_reg_rule";
    case 1580:
      return "  rvmax4S_reduction_reg_rule";
    case 1581:
      return "  rsmax8S_reduction_reg_rule";
    case 1582:
      return "  rvmax8S_reduction_reg_rule";
    case 1583:
      return "  rvmax16S_reduction_reg_rule";
    case 1584:
      return "  rvmax32S_reduction_reg_rule";
    case 1585:
      return "  rsmax2I_reduction_reg_rule";
    case 1586:
      return "  rvmax2I_reduction_reg_rule";
    case 1587:
      return "  rsmax4I_reduction_reg_rule";
    case 1588:
      return "  rvmax4I_reduction_reg_rule";
    case 1589:
      return "  rvmax4I_reduction_evex_rule";
    case 1590:
      return "  rvmax8I_reduction_reg_rule";
    case 1591:
      return "  rvmax8I_reduction_evex_rule";
    case 1592:
      return "  rvmax16I_reduction_evex_rule";
    case 1593:
      return "  rsmax1L_reduction_reg_rule";
    case 1594:
      return "  rsmax2L_reduction_reg_rule";
    case 1595:
      return "  rvmax2L_reduction_reg_rule";
    case 1596:
      return "  rvmax4L_reduction_reg_rule";
    case 1597:
      return "  rvmax8L_reduction_reg_rule";
    case 1598:
      return "  rvmax2F_reduction_reg_av_rule";
    case 1599:
      return "  rvmax2F_reduction_reg_rule";
    case 1600:
      return "  rvmax4F_reduction_reg_av_rule";
    case 1601:
      return "  rvmax4F_reduction_reg_rule";
    case 1602:
      return "  rvmax8F_reduction_reg_av_rule";
    case 1603:
      return "  rvmax8F_reduction_reg_rule";
    case 1604:
      return "  rvmax16F_reduction_reg_av_rule";
    case 1605:
      return "  rvmax16F_reduction_reg_rule";
    case 1606:
      return "  rvmax2D_reduction_reg_av_rule";
    case 1607:
      return "  rvmax2D_reduction_reg_rule";
    case 1608:
      return "  rvmax4D_reduction_reg_av_rule";
    case 1609:
      return "  rvmax4D_reduction_reg_rule";
    case 1610:
      return "  rvmax8D_reduction_reg_av_rule";
    case 1611:
      return "  rvmax8D_reduction_reg_rule";
    case 1612:
      return "  rsand8B_reduction_reg_rule";
    case 1613:
      return "  rsand16B_reduction_reg_rule";
    case 1614:
      return "  rvand32B_reduction_reg_rule";
    case 1615:
      return "  rvand64B_reduction_reg_rule";
    case 1616:
      return "  rsand4S_reduction_reg_rule";
    case 1617:
      return "  rsand8S_reduction_reg_rule";
    case 1618:
      return "  rvand16S_reduction_reg_rule";
    case 1619:
      return "  rvand32S_reduction_reg_rule";
    case 1620:
      return "  rsand2I_reduction_reg_rule";
    case 1621:
      return "  rsand4I_reduction_reg_rule";
    case 1622:
      return "  rvand8I_reduction_reg_rule";
    case 1623:
      return "  rvand16I_reduction_reg_rule";
    case 1624:
      return "  rsand2L_reduction_reg_rule";
    case 1625:
      return "  rvand4L_reduction_reg_avx_rule";
    case 1626:
      return "  rvand8L_reduction_reg_rule";
    case 1627:
      return "  rsor8B_reduction_reg_rule";
    case 1628:
      return "  rsor16B_reduction_reg_rule";
    case 1629:
      return "  rvor32B_reduction_reg_rule";
    case 1630:
      return "  rvor64B_reduction_reg_rule";
    case 1631:
      return "  rsor4S_reduction_reg_rule";
    case 1632:
      return "  rsor8S_reduction_reg_rule";
    case 1633:
      return "  rvor16S_reduction_reg_rule";
    case 1634:
      return "  rvor32S_reduction_reg_rule";
    case 1635:
      return "  rsor2I_reduction_reg_rule";
    case 1636:
      return "  rsor4I_reduction_reg_rule";
    case 1637:
      return "  rvor8I_reduction_reg_rule";
    case 1638:
      return "  rvor16I_reduction_reg_rule";
    case 1639:
      return "  rsor2L_reduction_reg_rule";
    case 1640:
      return "  rvor4L_reduction_reg_avx_rule";
    case 1641:
      return "  rvor8L_reduction_reg_rule";
    case 1642:
      return "  rsxor8B_reduction_reg_rule";
    case 1643:
      return "  rsxor16B_reduction_reg_rule";
    case 1644:
      return "  rvxor32B_reduction_reg_rule";
    case 1645:
      return "  rvxor64B_reduction_reg_rule";
    case 1646:
      return "  rsxor4S_reduction_reg_rule";
    case 1647:
      return "  rsxor8S_reduction_reg_rule";
    case 1648:
      return "  rvxor16S_reduction_reg_rule";
    case 1649:
      return "  rvxor32S_reduction_reg_rule";
    case 1650:
      return "  rsxor2I_reduction_reg_rule";
    case 1651:
      return "  rsxor4I_reduction_reg_rule";
    case 1652:
      return "  rvxor8I_reduction_reg_rule";
    case 1653:
      return "  rvxor16I_reduction_reg_rule";
    case 1654:
      return "  rsxor2L_reduction_reg_rule";
    case 1655:
      return "  rvxor4L_reduction_reg_avx_rule";
    case 1656:
      return "  rvxor8L_reduction_reg_rule";
    case 1657:
      return "  vadd4B_rule";
    case 1658:
      return "  vadd4B_reg_rule";
    case 1659:
      return "  vadd4B_mem_rule";
    case 1660:
      return "  vadd4B_mem_0_rule";
    case 1661:
      return "  vadd8B_rule";
    case 1662:
      return "  vadd8B_reg_rule";
    case 1663:
      return "  vadd8B_mem_rule";
    case 1664:
      return "  vadd8B_mem_0_rule";
    case 1665:
      return "  vadd16B_rule";
    case 1666:
      return "  vadd16B_reg_rule";
    case 1667:
      return "  vadd16B_mem_rule";
    case 1668:
      return "  vadd16B_mem_0_rule";
    case 1669:
      return "  vadd32B_reg_rule";
    case 1670:
      return "  vadd32B_mem_rule";
    case 1671:
      return "  vadd32B_mem_0_rule";
    case 1672:
      return "  vadd64B_reg_rule";
    case 1673:
      return "  vadd64B_mem_rule";
    case 1674:
      return "  vadd64B_mem_0_rule";
    case 1675:
      return "  vadd2S_rule";
    case 1676:
      return "  vadd2S_reg_rule";
    case 1677:
      return "  vadd2S_mem_rule";
    case 1678:
      return "  vadd2S_mem_0_rule";
    case 1679:
      return "  vadd4S_rule";
    case 1680:
      return "  vadd4S_reg_rule";
    case 1681:
      return "  vadd4S_mem_rule";
    case 1682:
      return "  vadd4S_mem_0_rule";
    case 1683:
      return "  vadd8S_rule";
    case 1684:
      return "  vadd8S_reg_rule";
    case 1685:
      return "  vadd8S_mem_rule";
    case 1686:
      return "  vadd8S_mem_0_rule";
    case 1687:
      return "  vadd16S_reg_rule";
    case 1688:
      return "  vadd16S_mem_rule";
    case 1689:
      return "  vadd16S_mem_0_rule";
    case 1690:
      return "  vadd32S_reg_rule";
    case 1691:
      return "  vadd32S_mem_rule";
    case 1692:
      return "  vadd32S_mem_0_rule";
    case 1693:
      return "  vadd2I_rule";
    case 1694:
      return "  vadd2I_reg_rule";
    case 1695:
      return "  vadd2I_mem_rule";
    case 1696:
      return "  vadd2I_mem_0_rule";
    case 1697:
      return "  vadd4I_rule";
    case 1698:
      return "  vadd4I_reg_rule";
    case 1699:
      return "  vadd4I_mem_rule";
    case 1700:
      return "  vadd4I_mem_0_rule";
    case 1701:
      return "  vadd8I_reg_rule";
    case 1702:
      return "  vadd8I_mem_rule";
    case 1703:
      return "  vadd8I_mem_0_rule";
    case 1704:
      return "  vadd16I_reg_rule";
    case 1705:
      return "  vadd16I_mem_rule";
    case 1706:
      return "  vadd16I_mem_0_rule";
    case 1707:
      return "  vadd2L_rule";
    case 1708:
      return "  vadd2L_reg_rule";
    case 1709:
      return "  vadd2L_mem_rule";
    case 1710:
      return "  vadd2L_mem_0_rule";
    case 1711:
      return "  vadd4L_reg_rule";
    case 1712:
      return "  vadd4L_mem_rule";
    case 1713:
      return "  vadd4L_mem_0_rule";
    case 1714:
      return "  vadd8L_reg_rule";
    case 1715:
      return "  vadd8L_mem_rule";
    case 1716:
      return "  vadd8L_mem_0_rule";
    case 1717:
      return "  vadd2F_rule";
    case 1718:
      return "  vadd2F_reg_rule";
    case 1719:
      return "  vadd2F_mem_rule";
    case 1720:
      return "  vadd2F_mem_0_rule";
    case 1721:
      return "  vadd4F_rule";
    case 1722:
      return "  vadd4F_reg_rule";
    case 1723:
      return "  vadd4F_mem_rule";
    case 1724:
      return "  vadd4F_mem_0_rule";
    case 1725:
      return "  vadd8F_reg_rule";
    case 1726:
      return "  vadd8F_mem_rule";
    case 1727:
      return "  vadd8F_mem_0_rule";
    case 1728:
      return "  vadd16F_reg_rule";
    case 1729:
      return "  vadd16F_mem_rule";
    case 1730:
      return "  vadd16F_mem_0_rule";
    case 1731:
      return "  vadd2D_rule";
    case 1732:
      return "  vadd2D_reg_rule";
    case 1733:
      return "  vadd2D_mem_rule";
    case 1734:
      return "  vadd2D_mem_0_rule";
    case 1735:
      return "  vadd4D_reg_rule";
    case 1736:
      return "  vadd4D_mem_rule";
    case 1737:
      return "  vadd4D_mem_0_rule";
    case 1738:
      return "  vadd8D_reg_rule";
    case 1739:
      return "  vadd8D_mem_rule";
    case 1740:
      return "  vadd8D_mem_0_rule";
    case 1741:
      return "  vsub4B_rule";
    case 1742:
      return "  vsub4B_reg_rule";
    case 1743:
      return "  vsub4B_mem_rule";
    case 1744:
      return "  vsub8B_rule";
    case 1745:
      return "  vsub8B_reg_rule";
    case 1746:
      return "  vsub8B_mem_rule";
    case 1747:
      return "  vsub16B_rule";
    case 1748:
      return "  vsub16B_reg_rule";
    case 1749:
      return "  vsub16B_mem_rule";
    case 1750:
      return "  vsub32B_reg_rule";
    case 1751:
      return "  vsub32B_mem_rule";
    case 1752:
      return "  vsub64B_reg_rule";
    case 1753:
      return "  vsub64B_mem_rule";
    case 1754:
      return "  vsub2S_rule";
    case 1755:
      return "  vsub2S_reg_rule";
    case 1756:
      return "  vsub2S_mem_rule";
    case 1757:
      return "  vsub4S_rule";
    case 1758:
      return "  vsub4S_reg_rule";
    case 1759:
      return "  vsub4S_mem_rule";
    case 1760:
      return "  vsub8S_rule";
    case 1761:
      return "  vsub8S_reg_rule";
    case 1762:
      return "  vsub8S_mem_rule";
    case 1763:
      return "  vsub16S_reg_rule";
    case 1764:
      return "  vsub16S_mem_rule";
    case 1765:
      return "  vsub32S_reg_rule";
    case 1766:
      return "  vsub32S_mem_rule";
    case 1767:
      return "  vsub2I_rule";
    case 1768:
      return "  vsub2I_reg_rule";
    case 1769:
      return "  vsub2I_mem_rule";
    case 1770:
      return "  vsub4I_rule";
    case 1771:
      return "  vsub4I_reg_rule";
    case 1772:
      return "  vsub4I_mem_rule";
    case 1773:
      return "  vsub8I_reg_rule";
    case 1774:
      return "  vsub8I_mem_rule";
    case 1775:
      return "  vsub16I_reg_rule";
    case 1776:
      return "  vsub16I_mem_rule";
    case 1777:
      return "  vsub2L_rule";
    case 1778:
      return "  vsub2L_reg_rule";
    case 1779:
      return "  vsub2L_mem_rule";
    case 1780:
      return "  vsub4L_reg_rule";
    case 1781:
      return "  vsub4L_mem_rule";
    case 1782:
      return "  vsub8L_reg_rule";
    case 1783:
      return "  vsub8L_mem_rule";
    case 1784:
      return "  vsub2F_rule";
    case 1785:
      return "  vsub2F_reg_rule";
    case 1786:
      return "  vsub2F_mem_rule";
    case 1787:
      return "  vsub4F_rule";
    case 1788:
      return "  vsub4F_reg_rule";
    case 1789:
      return "  vsub4F_mem_rule";
    case 1790:
      return "  vsub8F_reg_rule";
    case 1791:
      return "  vsub8F_mem_rule";
    case 1792:
      return "  vsub16F_reg_rule";
    case 1793:
      return "  vsub16F_mem_rule";
    case 1794:
      return "  vsub2D_rule";
    case 1795:
      return "  vsub2D_reg_rule";
    case 1796:
      return "  vsub2D_mem_rule";
    case 1797:
      return "  vsub4D_reg_rule";
    case 1798:
      return "  vsub4D_mem_rule";
    case 1799:
      return "  vsub8D_reg_rule";
    case 1800:
      return "  vsub8D_mem_rule";
    case 1801:
      return "  mul4B_reg_rule";
    case 1802:
      return "  mul8B_reg_rule";
    case 1803:
      return "  mul16B_reg_rule";
    case 1804:
      return "  vmul16B_reg_avx_rule";
    case 1805:
      return "  vmul32B_reg_avx_rule";
    case 1806:
      return "  vmul64B_reg_avx_rule";
    case 1807:
      return "  vmul2S_rule";
    case 1808:
      return "  vmul2S_reg_rule";
    case 1809:
      return "  vmul2S_mem_rule";
    case 1810:
      return "  vmul2S_mem_0_rule";
    case 1811:
      return "  vmul4S_rule";
    case 1812:
      return "  vmul4S_reg_rule";
    case 1813:
      return "  vmul4S_mem_rule";
    case 1814:
      return "  vmul4S_mem_0_rule";
    case 1815:
      return "  vmul8S_rule";
    case 1816:
      return "  vmul8S_reg_rule";
    case 1817:
      return "  vmul8S_mem_rule";
    case 1818:
      return "  vmul8S_mem_0_rule";
    case 1819:
      return "  vmul16S_reg_rule";
    case 1820:
      return "  vmul16S_mem_rule";
    case 1821:
      return "  vmul16S_mem_0_rule";
    case 1822:
      return "  vmul32S_reg_rule";
    case 1823:
      return "  vmul32S_mem_rule";
    case 1824:
      return "  vmul32S_mem_0_rule";
    case 1825:
      return "  vmul2I_rule";
    case 1826:
      return "  vmul2I_reg_rule";
    case 1827:
      return "  vmul2I_mem_rule";
    case 1828:
      return "  vmul2I_mem_0_rule";
    case 1829:
      return "  vmul4I_rule";
    case 1830:
      return "  vmul4I_reg_rule";
    case 1831:
      return "  vmul4I_mem_rule";
    case 1832:
      return "  vmul4I_mem_0_rule";
    case 1833:
      return "  mul2L_reg_rule";
    case 1834:
      return "  vmul2L_reg_avx_rule";
    case 1835:
      return "  vmul2L_reg_rule";
    case 1836:
      return "  vmul2L_mem_rule";
    case 1837:
      return "  vmul2L_mem_0_rule";
    case 1838:
      return "  vmul4L_reg_avx_rule";
    case 1839:
      return "  vmul4L_reg_rule";
    case 1840:
      return "  vmul4L_mem_rule";
    case 1841:
      return "  vmul4L_mem_0_rule";
    case 1842:
      return "  vmul8L_reg_rule";
    case 1843:
      return "  vmul8L_mem_rule";
    case 1844:
      return "  vmul8L_mem_0_rule";
    case 1845:
      return "  vmul8I_reg_rule";
    case 1846:
      return "  vmul8I_mem_rule";
    case 1847:
      return "  vmul8I_mem_0_rule";
    case 1848:
      return "  vmul16I_reg_rule";
    case 1849:
      return "  vmul16I_mem_rule";
    case 1850:
      return "  vmul16I_mem_0_rule";
    case 1851:
      return "  vmul2F_rule";
    case 1852:
      return "  vmul2F_reg_rule";
    case 1853:
      return "  vmul2F_mem_rule";
    case 1854:
      return "  vmul2F_mem_0_rule";
    case 1855:
      return "  vmul4F_rule";
    case 1856:
      return "  vmul4F_reg_rule";
    case 1857:
      return "  vmul4F_mem_rule";
    case 1858:
      return "  vmul4F_mem_0_rule";
    case 1859:
      return "  vmul8F_reg_rule";
    case 1860:
      return "  vmul8F_mem_rule";
    case 1861:
      return "  vmul8F_mem_0_rule";
    case 1862:
      return "  vmul16F_reg_rule";
    case 1863:
      return "  vmul16F_mem_rule";
    case 1864:
      return "  vmul16F_mem_0_rule";
    case 1865:
      return "  vmul2D_rule";
    case 1866:
      return "  vmul2D_reg_rule";
    case 1867:
      return "  vmul2D_mem_rule";
    case 1868:
      return "  vmul2D_mem_0_rule";
    case 1869:
      return "  vmul4D_reg_rule";
    case 1870:
      return "  vmul4D_mem_rule";
    case 1871:
      return "  vmul4D_mem_0_rule";
    case 1872:
      return "  vmul8D_reg_rule";
    case 1873:
      return "  vmul8D_mem_rule";
    case 1874:
      return "  vmul8D_mem_0_rule";
    case 1875:
      return "  vcmov8F_reg_rule";
    case 1876:
      return "  vcmov4D_reg_rule";
    case 1877:
      return "  vdiv2F_rule";
    case 1878:
      return "  vdiv2F_reg_rule";
    case 1879:
      return "  vdiv2F_mem_rule";
    case 1880:
      return "  vdiv4F_rule";
    case 1881:
      return "  vdiv4F_reg_rule";
    case 1882:
      return "  vdiv4F_mem_rule";
    case 1883:
      return "  vdiv8F_reg_rule";
    case 1884:
      return "  vdiv8F_mem_rule";
    case 1885:
      return "  vdiv16F_reg_rule";
    case 1886:
      return "  vdiv16F_mem_rule";
    case 1887:
      return "  vdiv2D_rule";
    case 1888:
      return "  vdiv2D_reg_rule";
    case 1889:
      return "  vdiv2D_mem_rule";
    case 1890:
      return "  vdiv4D_reg_rule";
    case 1891:
      return "  vdiv4D_mem_rule";
    case 1892:
      return "  vdiv8D_reg_rule";
    case 1893:
      return "  vdiv8D_mem_rule";
    case 1894:
      return "  min8B_reg_rule";
    case 1895:
      return "  min8B_reg_avx_rule";
    case 1896:
      return "  min16B_reg_rule";
    case 1897:
      return "  min16B_reg_avx_rule";
    case 1898:
      return "  min32B_reg_rule";
    case 1899:
      return "  min64B_reg_evex_rule";
    case 1900:
      return "  min4S_reg_rule";
    case 1901:
      return "  min4S_reg_avx_rule";
    case 1902:
      return "  min8S_reg_rule";
    case 1903:
      return "  min8S_reg_avx_rule";
    case 1904:
      return "  min16S_reg_rule";
    case 1905:
      return "  min32S_reg_evex_rule";
    case 1906:
      return "  min2I_reg_rule";
    case 1907:
      return "  min2I_reg_avx_rule";
    case 1908:
      return "  min4I_reg_rule";
    case 1909:
      return "  min4I_reg_avx_rule";
    case 1910:
      return "  min4I_reg_evex_rule";
    case 1911:
      return "  min8I_reg_avx_rule";
    case 1912:
      return "  min8I_reg_evex_rule";
    case 1913:
      return "  min16I_reg_evex_rule";
    case 1914:
      return "  minL_reg_rule";
    case 1915:
      return "  min1L_reg_avx_rule";
    case 1916:
      return "  min2L_reg_rule";
    case 1917:
      return "  min2L_reg_avx_rule";
    case 1918:
      return "  min2L_reg_evex_rule";
    case 1919:
      return "  min4L_reg_avx_rule";
    case 1920:
      return "  min4L_reg_evex_rule";
    case 1921:
      return "  min8L_reg_evex_rule";
    case 1922:
      return "  min2F_reg_avx_rule";
    case 1923:
      return "  min4F_reg_avx_rule";
    case 1924:
      return "  min8F_reg_avx_rule";
    case 1925:
      return "  min16F_reg_evex_rule";
    case 1926:
      return "  min1D_reg_avx_rule";
    case 1927:
      return "  min2D_reg_avx_rule";
    case 1928:
      return "  min4D_reg_avx_rule";
    case 1929:
      return "  min8D_reg_evex_rule";
    case 1930:
      return "  max8B_reg_rule";
    case 1931:
      return "  max8B_reg_avx_rule";
    case 1932:
      return "  max16B_reg_rule";
    case 1933:
      return "  max16B_reg_avx_rule";
    case 1934:
      return "  max32B_reg_rule";
    case 1935:
      return "  max64B_reg_evex_rule";
    case 1936:
      return "  max4S_reg_rule";
    case 1937:
      return "  max4S_reg_avx_rule";
    case 1938:
      return "  max8S_reg_rule";
    case 1939:
      return "  max8S_reg_avx_rule";
    case 1940:
      return "  max16S_reg_rule";
    case 1941:
      return "  max32S_reg_evex_rule";
    case 1942:
      return "  max2I_reg_rule";
    case 1943:
      return "  max2I_reg_avx_rule";
    case 1944:
      return "  max4I_reg_rule";
    case 1945:
      return "  max4I_reg_avx_rule";
    case 1946:
      return "  max4I_reg_evex_rule";
    case 1947:
      return "  max8I_reg_avx_rule";
    case 1948:
      return "  max8I_reg_evex_rule";
    case 1949:
      return "  max16I_reg_evex_rule";
    case 1950:
      return "  maxL_reg_rule";
    case 1951:
      return "  max1L_reg_avx_rule";
    case 1952:
      return "  max2L_reg_rule";
    case 1953:
      return "  max2L_reg_avx_rule";
    case 1954:
      return "  max2L_reg_evex_rule";
    case 1955:
      return "  max4L_reg_avx_rule";
    case 1956:
      return "  max4L_reg_evex_rule";
    case 1957:
      return "  max8L_reg_evex_rule";
    case 1958:
      return "  max2F_reg_avx_rule";
    case 1959:
      return "  max4F_reg_avx_rule";
    case 1960:
      return "  max8F_reg_avx_rule";
    case 1961:
      return "  max16F_reg_evex_rule";
    case 1962:
      return "  max1D_reg_avx_rule";
    case 1963:
      return "  max2D_reg_avx_rule";
    case 1964:
      return "  max4D_reg_avx_rule";
    case 1965:
      return "  max8D_reg_evex_rule";
    case 1966:
      return "  vsll4B_reg_rule";
    case 1967:
      return "  vsll8B_reg_rule";
    case 1968:
      return "  vsll16B_reg_rule";
    case 1969:
      return "  vsll16B_avx_rule";
    case 1970:
      return "  vsll32B_avx_rule";
    case 1971:
      return "  vsll64B_avx_rule";
    case 1972:
      return "  vsll2S_rule";
    case 1973:
      return "  vsll2S_imm_rule";
    case 1974:
      return "  vsll2S_reg_rule";
    case 1975:
      return "  vsll2S_reg_imm_rule";
    case 1976:
      return "  vsll4S_rule";
    case 1977:
      return "  vsll4S_imm_rule";
    case 1978:
      return "  vsll4S_reg_rule";
    case 1979:
      return "  vsll4S_reg_imm_rule";
    case 1980:
      return "  vsll8S_rule";
    case 1981:
      return "  vsll8S_imm_rule";
    case 1982:
      return "  vsll8S_reg_rule";
    case 1983:
      return "  vsll8S_reg_imm_rule";
    case 1984:
      return "  vsll16S_reg_rule";
    case 1985:
      return "  vsll16S_reg_imm_rule";
    case 1986:
      return "  vsll32S_reg_rule";
    case 1987:
      return "  vsll32S_reg_imm_rule";
    case 1988:
      return "  vsll2I_rule";
    case 1989:
      return "  vsll2I_imm_rule";
    case 1990:
      return "  vsll2I_reg_rule";
    case 1991:
      return "  vsll2I_reg_imm_rule";
    case 1992:
      return "  vsll4I_rule";
    case 1993:
      return "  vsll4I_imm_rule";
    case 1994:
      return "  vsll4I_reg_rule";
    case 1995:
      return "  vsll4I_reg_imm_rule";
    case 1996:
      return "  vsll8I_reg_rule";
    case 1997:
      return "  vsll8I_reg_imm_rule";
    case 1998:
      return "  vsll16I_reg_rule";
    case 1999:
      return "  vsll16I_reg_imm_rule";
    case 2000:
      return "  vsll2L_rule";
    case 2001:
      return "  vsll2L_imm_rule";
    case 2002:
      return "  vsll2L_reg_rule";
    case 2003:
      return "  vsll2L_reg_imm_rule";
    case 2004:
      return "  vsll4L_reg_rule";
    case 2005:
      return "  vsll4L_reg_imm_rule";
    case 2006:
      return "  vsll8L_reg_rule";
    case 2007:
      return "  vsll8L_reg_imm_rule";
    case 2008:
      return "  vsrl4B_reg_rule";
    case 2009:
      return "  vsrl8B_reg_rule";
    case 2010:
      return "  vsrl16B_reg_rule";
    case 2011:
      return "  vsrl16B_avx_rule";
    case 2012:
      return "  vsrl32B_avx_rule";
    case 2013:
      return "  vsrl64B_rule";
    case 2014:
      return "  vsrl2S_rule";
    case 2015:
      return "  vsrl2S_imm_rule";
    case 2016:
      return "  vsrl2S_reg_rule";
    case 2017:
      return "  vsrl2S_reg_imm_rule";
    case 2018:
      return "  vsrl4S_rule";
    case 2019:
      return "  vsrl4S_imm_rule";
    case 2020:
      return "  vsrl4S_reg_rule";
    case 2021:
      return "  vsrl4S_reg_imm_rule";
    case 2022:
      return "  vsrl8S_rule";
    case 2023:
      return "  vsrl8S_imm_rule";
    case 2024:
      return "  vsrl8S_reg_rule";
    case 2025:
      return "  vsrl8S_reg_imm_rule";
    case 2026:
      return "  vsrl16S_reg_rule";
    case 2027:
      return "  vsrl16S_reg_imm_rule";
    case 2028:
      return "  vsrl32S_reg_rule";
    case 2029:
      return "  vsrl32S_reg_imm_rule";
    case 2030:
      return "  vsrl2I_rule";
    case 2031:
      return "  vsrl2I_imm_rule";
    case 2032:
      return "  vsrl2I_reg_rule";
    case 2033:
      return "  vsrl2I_reg_imm_rule";
    case 2034:
      return "  vsrl4I_rule";
    case 2035:
      return "  vsrl4I_imm_rule";
    case 2036:
      return "  vsrl4I_reg_rule";
    case 2037:
      return "  vsrl4I_reg_imm_rule";
    case 2038:
      return "  vsrl8I_reg_rule";
    case 2039:
      return "  vsrl8I_reg_imm_rule";
    case 2040:
      return "  vsrl16I_reg_rule";
    case 2041:
      return "  vsrl16I_reg_imm_rule";
    case 2042:
      return "  vsrl2L_rule";
    case 2043:
      return "  vsrl2L_imm_rule";
    case 2044:
      return "  vsrl2L_reg_rule";
    case 2045:
      return "  vsrl2L_reg_imm_rule";
    case 2046:
      return "  vsrl4L_reg_rule";
    case 2047:
      return "  vsrl4L_reg_imm_rule";
    case 2048:
      return "  vsrl8L_reg_rule";
    case 2049:
      return "  vsrl8L_reg_imm_rule";
    case 2050:
      return "  vsra4B_reg_rule";
    case 2051:
      return "  vsra8B_reg_rule";
    case 2052:
      return "  vsra16B_reg_rule";
    case 2053:
      return "  vsra16B_avx_rule";
    case 2054:
      return "  vsra32B_avx_rule";
    case 2055:
      return "  vsra64B_rule";
    case 2056:
      return "  vsra2S_rule";
    case 2057:
      return "  vsra2S_imm_rule";
    case 2058:
      return "  vsra2S_reg_rule";
    case 2059:
      return "  vsra2S_reg_imm_rule";
    case 2060:
      return "  vsra4S_rule";
    case 2061:
      return "  vsra4S_imm_rule";
    case 2062:
      return "  vsra4S_reg_rule";
    case 2063:
      return "  vsra4S_reg_imm_rule";
    case 2064:
      return "  vsra8S_rule";
    case 2065:
      return "  vsra8S_imm_rule";
    case 2066:
      return "  vsra8S_reg_rule";
    case 2067:
      return "  vsra8S_reg_imm_rule";
    case 2068:
      return "  vsra16S_reg_rule";
    case 2069:
      return "  vsra16S_reg_imm_rule";
    case 2070:
      return "  vsra32S_reg_rule";
    case 2071:
      return "  vsra32S_reg_imm_rule";
    case 2072:
      return "  vsra2I_rule";
    case 2073:
      return "  vsra2I_imm_rule";
    case 2074:
      return "  vsra2I_reg_rule";
    case 2075:
      return "  vsra2I_reg_imm_rule";
    case 2076:
      return "  vsra4I_rule";
    case 2077:
      return "  vsra4I_imm_rule";
    case 2078:
      return "  vsra4I_reg_rule";
    case 2079:
      return "  vsra4I_reg_imm_rule";
    case 2080:
      return "  vsra8I_reg_rule";
    case 2081:
      return "  vsra8I_reg_imm_rule";
    case 2082:
      return "  vsra16I_reg_rule";
    case 2083:
      return "  vsra16I_reg_imm_rule";
    case 2084:
      return "  vsra1L_rule";
    case 2085:
      return "  vsra1L_imm_rule";
    case 2086:
      return "  vsra1L_reg_rule";
    case 2087:
      return "  vsra1L_reg_imm_rule";
    case 2088:
      return "  vsra1L_reg_evex_rule";
    case 2089:
      return "  vsra2L_reg_imm_rule";
    case 2090:
      return "  vsra2L_reg_rule";
    case 2091:
      return "  vsra2L_reg_evex_imm_rule";
    case 2092:
      return "  vsra2L_reg_evex_rule";
    case 2093:
      return "  vsra4L_reg_imm_rule";
    case 2094:
      return "  vsra4L_reg_rule";
    case 2095:
      return "  vsra4L_reg_evex_imm_rule";
    case 2096:
      return "  vsra4L_reg_evex_rule";
    case 2097:
      return "  vsra8L_reg_evex_imm_rule";
    case 2098:
      return "  vsra8L_reg_evex_rule";
    case 2099:
      return "  vsllv2I_rule";
    case 2100:
      return "  vsllv4I_reg_rule";
    case 2101:
      return "  vsllv4I_reg_evex_rule";
    case 2102:
      return "  vsllv8I_reg_rule";
    case 2103:
      return "  vsllv8I_reg_evex_rule";
    case 2104:
      return "  vsllv16I_reg_evex_rule";
    case 2105:
      return "  vsllv1L_reg_rule";
    case 2106:
      return "  vsllv2L_reg_rule";
    case 2107:
      return "  vsllv2L_reg_evex_rule";
    case 2108:
      return "  vsllv4L_reg_rule";
    case 2109:
      return "  vsllv4L_reg_evex_rule";
    case 2110:
      return "  vsllv8L_reg_evex_rule";
    case 2111:
      return "  vsrlv2I_reg_rule";
    case 2112:
      return "  vsrlv4I_reg_rule";
    case 2113:
      return "  vsrlv4I_reg_evex_rule";
    case 2114:
      return "  vsrlv8I_reg_rule";
    case 2115:
      return "  vsrlv8I_reg_evex_rule";
    case 2116:
      return "  vsrlv16I_reg_evex_rule";
    case 2117:
      return "  vsrlv1L_reg_rule";
    case 2118:
      return "  vsrlv2L_reg_rule";
    case 2119:
      return "  vsrlv2L_reg_evex_rule";
    case 2120:
      return "  vsrlv4L_reg_rule";
    case 2121:
      return "  vsrlv4L_reg_evex_rule";
    case 2122:
      return "  vsrlv8L_reg_rule";
    case 2123:
      return "  vsrav2I_reg_rule";
    case 2124:
      return "  vsrav4I_reg_rule";
    case 2125:
      return "  vsrav4I_reg_evex_rule";
    case 2126:
      return "  vsrav8I_reg_rule";
    case 2127:
      return "  vsrav8I_reg_evex_rule";
    case 2128:
      return "  vsrav16I_reg_evex_rule";
    case 2129:
      return "  vsrav1L_reg_rule";
    case 2130:
      return "  vsrav1L_reg_evex_rule";
    case 2131:
      return "  vsrav2L_reg_rule";
    case 2132:
      return "  vsrav2L_reg_evex_rule";
    case 2133:
      return "  vsrav4L_reg_rule";
    case 2134:
      return "  vsrav4L_reg_evex_rule";
    case 2135:
      return "  vsrav8L_reg_evex_rule";
    case 2136:
      return "  vand4B_rule";
    case 2137:
      return "  vand4B_reg_rule";
    case 2138:
      return "  vand4B_mem_rule";
    case 2139:
      return "  vand4B_mem_0_rule";
    case 2140:
      return "  vand8B_rule";
    case 2141:
      return "  vand8B_reg_rule";
    case 2142:
      return "  vand8B_mem_rule";
    case 2143:
      return "  vand8B_mem_0_rule";
    case 2144:
      return "  vand16B_rule";
    case 2145:
      return "  vand16B_reg_rule";
    case 2146:
      return "  vand16B_mem_rule";
    case 2147:
      return "  vand16B_mem_0_rule";
    case 2148:
      return "  vand32B_reg_rule";
    case 2149:
      return "  vand32B_mem_rule";
    case 2150:
      return "  vand32B_mem_0_rule";
    case 2151:
      return "  vand64B_reg_rule";
    case 2152:
      return "  vand64B_mem_rule";
    case 2153:
      return "  vand64B_mem_0_rule";
    case 2154:
      return "  vor4B_rule";
    case 2155:
      return "  vor4B_reg_rule";
    case 2156:
      return "  vor4B_mem_rule";
    case 2157:
      return "  vor4B_mem_0_rule";
    case 2158:
      return "  vor8B_rule";
    case 2159:
      return "  vor8B_reg_rule";
    case 2160:
      return "  vor8B_mem_rule";
    case 2161:
      return "  vor8B_mem_0_rule";
    case 2162:
      return "  vor16B_rule";
    case 2163:
      return "  vor16B_reg_rule";
    case 2164:
      return "  vor16B_mem_rule";
    case 2165:
      return "  vor16B_mem_0_rule";
    case 2166:
      return "  vor32B_reg_rule";
    case 2167:
      return "  vor32B_mem_rule";
    case 2168:
      return "  vor32B_mem_0_rule";
    case 2169:
      return "  vor64B_reg_rule";
    case 2170:
      return "  vor64B_mem_rule";
    case 2171:
      return "  vor64B_mem_0_rule";
    case 2172:
      return "  vxor4B_rule";
    case 2173:
      return "  vxor4B_reg_rule";
    case 2174:
      return "  vxor4B_mem_rule";
    case 2175:
      return "  vxor4B_mem_0_rule";
    case 2176:
      return "  vxor8B_rule";
    case 2177:
      return "  vxor8B_reg_rule";
    case 2178:
      return "  vxor8B_mem_rule";
    case 2179:
      return "  vxor8B_mem_0_rule";
    case 2180:
      return "  vxor16B_rule";
    case 2181:
      return "  vxor16B_reg_rule";
    case 2182:
      return "  vxor16B_mem_rule";
    case 2183:
      return "  vxor16B_mem_0_rule";
    case 2184:
      return "  vxor32B_reg_rule";
    case 2185:
      return "  vxor32B_mem_rule";
    case 2186:
      return "  vxor32B_mem_0_rule";
    case 2187:
      return "  vxor64B_reg_rule";
    case 2188:
      return "  vxor64B_mem_rule";
    case 2189:
      return "  vxor64B_mem_0_rule";
    case 2190:
      return "  vcvt4Sto4B_reg_rule";
    case 2191:
      return "  vcvt8Sto8B_reg_rule";
    case 2192:
      return "  vcvt16Sto16B_reg_rule";
    case 2193:
      return "  vcvt4Ito4B_reg_rule";
    case 2194:
      return "  vcvt8Ito8B_reg_rule";
    case 2195:
      return "  vcvt2Ito2S_reg_rule";
    case 2196:
      return "  vcvt4Ito4S_reg_rule";
    case 2197:
      return "  vcvt8Ito8S_reg_rule";
    case 2198:
      return "  vcvt4Lto4B_reg_rule";
    case 2199:
      return "  vcvt2Lto2S_reg_rule";
    case 2200:
      return "  vcvt4Lto4S_reg_rule";
    case 2201:
      return "  vcmpeq2F_rule";
    case 2202:
      return "  vcmpeq4F_rule";
    case 2203:
      return "  vcmpeq8F_rule";
    case 2204:
      return "  vcmpeq16F_rule";
    case 2205:
      return "  vcmplt2F_rule";
    case 2206:
      return "  vcmplt4F_rule";
    case 2207:
      return "  vcmplt8F_rule";
    case 2208:
      return "  vcmplt16F_rule";
    case 2209:
      return "  vcmpgt2F_rule";
    case 2210:
      return "  vcmpgt4F_rule";
    case 2211:
      return "  vcmpgt8F_rule";
    case 2212:
      return "  vcmpgt16F_rule";
    case 2213:
      return "  vcmpge2F_rule";
    case 2214:
      return "  vcmpge4F_rule";
    case 2215:
      return "  vcmpge8F_rule";
    case 2216:
      return "  vcmpge16F_rule";
    case 2217:
      return "  vcmple2F_rule";
    case 2218:
      return "  vcmple4F_rule";
    case 2219:
      return "  vcmple8F_rule";
    case 2220:
      return "  vcmple16F_rule";
    case 2221:
      return "  vcmpne2F_rule";
    case 2222:
      return "  vcmpne4F_rule";
    case 2223:
      return "  vcmpne8F_rule";
    case 2224:
      return "  vcmpne16F_rule";
    case 2225:
      return "  vcmpeq1D_rule";
    case 2226:
      return "  vcmpeq2D_rule";
    case 2227:
      return "  vcmpeq4D_rule";
    case 2228:
      return "  vcmpeq8D_rule";
    case 2229:
      return "  vcmplt1D_rule";
    case 2230:
      return "  vcmplt2D_rule";
    case 2231:
      return "  vcmplt4D_rule";
    case 2232:
      return "  vcmplt8D_rule";
    case 2233:
      return "  vcmpgt1D_rule";
    case 2234:
      return "  vcmpgt2D_rule";
    case 2235:
      return "  vcmpgt4D_rule";
    case 2236:
      return "  vcmpgt8D_rule";
    case 2237:
      return "  vcmpge1D_rule";
    case 2238:
      return "  vcmpge2D_rule";
    case 2239:
      return "  vcmpge4D_rule";
    case 2240:
      return "  vcmpge8D_rule";
    case 2241:
      return "  vcmple1D_rule";
    case 2242:
      return "  vcmple2D_rule";
    case 2243:
      return "  vcmple4D_rule";
    case 2244:
      return "  vcmple8D_rule";
    case 2245:
      return "  vcmpne1D_rule";
    case 2246:
      return "  vcmpne2D_rule";
    case 2247:
      return "  vcmpne4D_rule";
    case 2248:
      return "  vcmpne8D_rule";
    case 2249:
      return "  vcmpeq2I_rule";
    case 2250:
      return "  vcmpeq4I_rule";
    case 2251:
      return "  vcmpeq8I_rule";
    case 2252:
      return "  vcmpeq16I_rule";
    case 2253:
      return "  vcmplt2I_rule";
    case 2254:
      return "  vcmplt4I_rule";
    case 2255:
      return "  vcmplt8I_rule";
    case 2256:
      return "  vcmplt16I_rule";
    case 2257:
      return "  vcmpgt2I_rule";
    case 2258:
      return "  vcmpgt4I_rule";
    case 2259:
      return "  vcmpgt8I_rule";
    case 2260:
      return "  vcmpgt16I_rule";
    case 2261:
      return "  vcmpge2I_rule";
    case 2262:
      return "  vcmpge4I_rule";
    case 2263:
      return "  vcmpge8I_rule";
    case 2264:
      return "  vcmpge16I_rule";
    case 2265:
      return "  vcmple2I_rule";
    case 2266:
      return "  vcmple4I_rule";
    case 2267:
      return "  vcmple8I_rule";
    case 2268:
      return "  vcmple16I_rule";
    case 2269:
      return "  vcmpne2I_rule";
    case 2270:
      return "  vcmpne4I_rule";
    case 2271:
      return "  vcmpne8I_rule";
    case 2272:
      return "  vcmpne16I_rule";
    case 2273:
      return "  vcmpeq8B_rule";
    case 2274:
      return "  vcmpeq16B_rule";
    case 2275:
      return "  vcmpeq32B_rule";
    case 2276:
      return "  vcmpeq64B_rule";
    case 2277:
      return "  vcmplt8B_rule";
    case 2278:
      return "  vcmplt16B_rule";
    case 2279:
      return "  vcmplt32B_rule";
    case 2280:
      return "  vcmplt64B_rule";
    case 2281:
      return "  vcmpgt8B_rule";
    case 2282:
      return "  vcmpgt16B_rule";
    case 2283:
      return "  vcmpgt32B_rule";
    case 2284:
      return "  vcmpgt64B_rule";
    case 2285:
      return "  vcmpge8B_rule";
    case 2286:
      return "  vcmpge16B_rule";
    case 2287:
      return "  extract8d_rule";
    case 2288:
      return "  extract4d_rule";
    case 2289:
      return "  extract2d_rule";
    case 2290:
      return "  extract1d_rule";
    case 2291:
      return "  extract16f_rule";
    case 2292:
      return "  extract8f_rule";
    case 2293:
      return "  extract4f_rule";
    case 2294:
      return "  extract2f_rule";
    case 2295:
      return "  extract1l_rule";
    case 2296:
      return "  extract2l_rule";
    case 2297:
      return "  extract4l_rule";
    case 2298:
      return "  extract8l_rule";
    case 2299:
      return "  extract2i_rule";
    case 2300:
      return "  extract4i_rule";
    case 2301:
      return "  extract8i_rule";
    case 2302:
      return "  extract16i_rule";
    case 2303:
      return "  extract4s_rule";
    case 2304:
      return "  extract8s_rule";
    case 2305:
      return "  extract16s_rule";
    case 2306:
      return "  extract32s_rule";
    case 2307:
      return "  extract8b_rule";
    case 2308:
      return "  extract16b_rule";
    case 2309:
      return "  extract32b_rule";
    case 2310:
      return "  extract64b_rule";
    case 2311:
      return "  vcmpge32B_rule";
    case 2312:
      return "  vcmpge64B_rule";
    case 2313:
      return "  vcmple8B_rule";
    case 2314:
      return "  vcmple16B_rule";
    case 2315:
      return "  vcmple32B_rule";
    case 2316:
      return "  vcmple64B_rule";
    case 2317:
      return "  vcmpne8B_rule";
    case 2318:
      return "  vcmpne16B_rule";
    case 2319:
      return "  vcmpne32B_rule";
    case 2320:
      return "  vcmpne64B_rule";
    case 2321:
      return "  vcmpeq4S_rule";
    case 2322:
      return "  vcmpeq8S_rule";
    case 2323:
      return "  vcmpeq16S_rule";
    case 2324:
      return "  vcmpeq32S_rule";
    case 2325:
      return "  vcmplt4S_rule";
    case 2326:
      return "  vcmplt8S_rule";
    case 2327:
      return "  vcmplt16S_rule";
    case 2328:
      return "  vcmplt32S_rule";
    case 2329:
      return "  vcmpgt4S_rule";
    case 2330:
      return "  vcmpgt8S_rule";
    case 2331:
      return "  vcmpgt16S_rule";
    case 2332:
      return "  vcmpgt32S_rule";
    case 2333:
      return "  vcmpge4S_rule";
    case 2334:
      return "  vcmpge8S_rule";
    case 2335:
      return "  vcmpge16S_rule";
    case 2336:
      return "  vcmpge32S_rule";
    case 2337:
      return "  vcmple4S_rule";
    case 2338:
      return "  vcmple8S_rule";
    case 2339:
      return "  vcmple16S_rule";
    case 2340:
      return "  vcmple32S_rule";
    case 2341:
      return "  vcmpne4S_rule";
    case 2342:
      return "  vcmpne8S_rule";
    case 2343:
      return "  vcmpne16S_rule";
    case 2344:
      return "  vcmpne32S_rule";
    case 2345:
      return "  vcmpeq1L_rule";
    case 2346:
      return "  vcmpeq2L_rule";
    case 2347:
      return "  vcmpeq4L_rule";
    case 2348:
      return "  vcmpeq8L_rule";
    case 2349:
      return "  vcmplt1L_rule";
    case 2350:
      return "  vcmplt2L_rule";
    case 2351:
      return "  vcmplt4L_rule";
    case 2352:
      return "  vcmplt8L_rule";
    case 2353:
      return "  vcmpgt1L_rule";
    case 2354:
      return "  vcmpgt2L_rule";
    case 2355:
      return "  vcmpgt4L_rule";
    case 2356:
      return "  vcmpgt8L_rule";
    case 2357:
      return "  vcmpge1L_rule";
    case 2358:
      return "  vcmpge2L_rule";
    case 2359:
      return "  vcmpge4L_rule";
    case 2360:
      return "  vcmpge8L_rule";
    case 2361:
      return "  vcmple1L_rule";
    case 2362:
      return "  vcmple2L_rule";
    case 2363:
      return "  vcmple4L_rule";
    case 2364:
      return "  vcmple8L_rule";
    case 2365:
      return "  vcmpne1L_rule";
    case 2366:
      return "  vcmpne2L_rule";
    case 2367:
      return "  vcmpne4L_rule";
    case 2368:
      return "  vcmpne8L_rule";
    case 2369:
      return "  blendvps2F_rule";
    case 2370:
      return "  vblendvps2F_rule";
    case 2371:
      return "  blendvps4F_rule";
    case 2372:
      return "  vblendvps4F_rule";
    case 2373:
      return "  vblendvps8F_rule";
    case 2374:
      return "  vblendvps16F_rule";
    case 2375:
      return "  pblendvb2I_rule";
    case 2376:
      return "  vpblendvb2I_rule";
    case 2377:
      return "  pblendvb4I_rule";
    case 2378:
      return "  vpblendvb4I_rule";
    case 2379:
      return "  vpblendvb8I_rule";
    case 2380:
      return "  vpblendmd16I_rule";
    case 2381:
      return "  pblendvb8B_rule";
    case 2382:
      return "  vpblendvb8B_rule";
    case 2383:
      return "  pblendvb16B_rule";
    case 2384:
      return "  vpblendvb16B_rule";
    case 2385:
      return "  vpblendvb32B_rule";
    case 2386:
      return "  vpblendmb64B_rule";
    case 2387:
      return "  pblendvb4S_rule";
    case 2388:
      return "  vpblendvb4S_rule";
    case 2389:
      return "  pblendvb8S_rule";
    case 2390:
      return "  vpblendvb8S_rule";
    case 2391:
      return "  vpblendvb16S_rule";
    case 2392:
      return "  vpblendmw32S_rule";
    case 2393:
      return "  pblendvb1L_rule";
    case 2394:
      return "  vpblendvb1L_rule";
    case 2395:
      return "  pblendvb2L_rule";
    case 2396:
      return "  vpblendvb2L_rule";
    case 2397:
      return "  vpblendvb4L_rule";
    case 2398:
      return "  vpblendmq8L_rule";
    case 2399:
      return "  blendvpd1D_rule";
    case 2400:
      return "  vblendvpd1D_rule";
    case 2401:
      return "  blendvpd2D_rule";
    case 2402:
      return "  vblendvpd2D_rule";
    case 2403:
      return "  vblendvpd4D_rule";
    case 2404:
      return "  vblendvpd8D_rule";
    case 2405:
      return "  vneg2I_reg_rule";
    case 2406:
      return "  vneg4I_reg_rule";
    case 2407:
      return "  vneg8I_reg_rule";
    case 2408:
      return "  vneg16I_reg_rule";
    case 2409:
      return "  vnot4B_rule";
    case 2410:
      return "  vnot4B_reg_rule";
    case 2411:
      return "  vnot8B_rule";
    case 2412:
      return "  vnot8B_reg_rule";
    case 2413:
      return "  vnot16B_rule";
    case 2414:
      return "  vnot16B_reg_rule";
    case 2415:
      return "  vnot32B_reg_rule";
    case 2416:
      return "  vnot64B_reg_rule";
    case 2417:
      return "  vptest4inae_rule";
    case 2418:
      return "  vptest4ieq_rule";
    case 2419:
      return "  vptest8inae_rule";
    case 2420:
      return "  vptest8ieq_rule";
    case 2421:
      return "  loadmask8b_rule";
    case 2422:
      return "  loadmask16b_rule";
    case 2423:
      return "  loadmask32b_rule";
    case 2424:
      return "  loadmask64b_rule";
    case 2425:
      return "  loadmask4s_rule";
    case 2426:
      return "  loadmask8s_rule";
    case 2427:
      return "  loadmask16s_rule";
    case 2428:
      return "  loadmask32s_rule";
    case 2429:
      return "  loadmask2i_rule";
    case 2430:
      return "  loadmask4i_rule";
    case 2431:
      return "  loadmask8i_rule";
    case 2432:
      return "  loadmask16i_rule";
    case 2433:
      return "  loadmask1l_rule";
    case 2434:
      return "  loadmask2l_rule";
    case 2435:
      return "  loadmask4l_rule";
    case 2436:
      return "  loadmask8l_rule";
    case 2437:
      return "  storemask64b_rule";
    case 2438:
      return "  storemask16s_rule";
    case 2439:
      return "  storemask32s_rule";
    case 2440:
      return "  storemask8i_rule";
    case 2441:
      return "  storemask16i_rule";
    case 2442:
      return "  storemask4l_rule";
    case 2443:
      return "  storemask8l_rule";
    case 2444:
      return "  loadshuffle4s_rule";
    case 2445:
      return "  loadshuffle8s_rule";
    case 2446:
      return "  loadshuffle4i_rule";
    case 2447:
      return "  loadshuffle4l_rule";
    case 2448:
      return "  loadshuffle8l_rule";
    case 2449:
      return "  rearrange8b_rule";
    case 2450:
      return "  rearrange16b_rule";
    case 2451:
      return "  rearrange32b_rule";
    case 2452:
      return "  rearrange64b_rule";
    case 2453:
      return "  rearrange4s_rule";
    case 2454:
      return "  rearrange8s_rule";
    case 2455:
      return "  rearrange16s_rule";
    case 2456:
      return "  rearrange32s_rule";
    case 2457:
      return "  rearrange4i_rule";
    case 2458:
      return "  rearrange8i_rule";
    case 2459:
      return "  rearrange16i_rule";
    case 2460:
      return "  rearrange4l_rule";
    case 2461:
      return "  rearrange8l_rule";
    case 2462:
      return "  vfma2D_reg_rule";
    case 2463:
      return "  vfma2D_mem_rule";
    case 2464:
      return "  vfma4D_reg_rule";
    case 2465:
      return "  vfma4D_mem_rule";
    case 2466:
      return "  vfma8D_reg_rule";
    case 2467:
      return "  vfma8D_mem_rule";
    case 2468:
      return "  vfma2F_reg_rule";
    case 2469:
      return "  vfma2F_mem_rule";
    case 2470:
      return "  vfma4F_reg_rule";
    case 2471:
      return "  vfma4F_mem_rule";
    case 2472:
      return "  vfma8F_reg_rule";
    case 2473:
      return "  vfma8F_mem_rule";
    case 2474:
      return "  vfma16F_reg_rule";
    case 2475:
      return "  vfma16F_mem_rule";
    case 2476:
      return "  smuladd4S2I_reg_rule";
    case 2477:
      return "  vmuladd4S2I_reg_rule";
    case 2478:
      return "  smuladd8S4I_reg_rule";
    case 2479:
      return "  vmuladd8S4I_reg_rule";
    case 2480:
      return "  vmuladd16S8I_reg_rule";
    case 2481:
      return "  vmuladd32S16I_reg_rule";
    case 2482:
      return "  vmuladdadd4S2I_reg_rule";
    case 2483:
      return "  vmuladdadd4S2I_reg_0_rule";
    case 2484:
      return "  vmuladdadd8S4I_reg_rule";
    case 2485:
      return "  vmuladdadd8S4I_reg_0_rule";
    case 2486:
      return "  vmuladdadd16S8I_reg_rule";
    case 2487:
      return "  vmuladdadd16S8I_reg_0_rule";
    case 2488:
      return "  vmuladdadd32S16I_reg_rule";
    case 2489:
      return "  vmuladdadd32S16I_reg_0_rule";
    case 2490:
      return "  shenandoahRB_rule";
    case 2491:
      return "  compareAndSwapP_shenandoah_rule";
    case 2492:
      return "  compareAndSwapP_shenandoah_0_rule";
    case 2493:
      return "  compareAndSwapN_shenandoah_rule";
    case 2494:
      return "  compareAndSwapN_shenandoah_0_rule";
    case 2495:
      return "  compareAndExchangeN_shenandoah_rule";
    case 2496:
      return "  compareAndExchangeP_shenandoah_rule";
    case 2497:
      return "  zLoadBarrierSlowRegXmmAndYmm_rule";
    case 2498:
      return "  zLoadBarrierSlowRegZmm_rule";
    case 2499:
      return "  zLoadBarrierWeakSlowRegXmmAndYmm_rule";
    case 2500:
      return "  zLoadBarrierWeakSlowRegZmm_rule";
    }
  }
};
#endif
