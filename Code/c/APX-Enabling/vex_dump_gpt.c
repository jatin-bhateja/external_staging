#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

// Define the structure to hold the decoded instruction
typedef struct {
    uint8_t vex_vvvv;
    uint8_t vex_l;
    uint8_t vex_pp;
    uint8_t vex_rr;
    uint8_t vex_x;
    uint8_t vex_b;
    uint8_t vex_w;
    uint8_t vex_map_select;
    uint8_t mod;
    uint8_t modrm_reg;
    uint8_t modrm_rm;
    uint16_t opcode;
    int is_three_byte_prefix;
} X86Instruction;

// Decode the VEX prefix
void decode_vex_prefix(uint8_t vex_byte, X86Instruction* instruction) {
    instruction->vex_vvvv = (vex_byte >> 3) & 0x0F;
    instruction->vex_l = (vex_byte >> 2) & 0x01;
    instruction->vex_pp = vex_byte & 0x03;
}

// Decode a VEX-encoded instruction
void decode_vex_instruction(uint8_t* encoding, X86Instruction* instruction) {
    // Decode the VEX prefix bytes
    instruction->vex_rr = (encoding[1] >> 7) & 0x01;
    instruction->vex_x = (encoding[1] >> 3) & 0x01;
    instruction->vex_b = (encoding[1] >> 2) & 0x01;
    instruction->vex_vvvv = ((encoding[1] >> 3) & 0x08) | ((encoding[2] >> 4) & 0x07); // Correctly decode VEX.VVVV
    instruction->vex_l = (encoding[2] >> 2) & 0x01;
    instruction->vex_pp = encoding[2] & 0x03;

    // Decode the ModRM byte
    instruction->mod = (encoding[3] >> 6) & 0x03;
    instruction->modrm_reg = (encoding[3] >> 3) & 0x07;
    instruction->modrm_rm = encoding[3] & 0x07;

    // Decode the opcode
    instruction->opcode = (encoding[4] << 8) | encoding[0];

    // Determine prefix length
    if (encoding[0] == 0xC4) {
        instruction->is_three_byte_prefix = 0;
    } else {
        instruction->is_three_byte_prefix = 1;
    }
}

// Get the register mnemonic based on the VEX.VVVV, ModRM.REG, and ModRM.RM fields (XMM registers)
const char* get_xmm_mnemonic(uint8_t reg) {
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
const char* get_gpr_mnemonic(uint8_t reg) {
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
const char* get_legacy_escape_sequence(uint8_t map_select) {
    switch (map_select) {
        case 0:
            return "0F";
        case 1:
            return "0F_38";
        case 2:
            return "0F_3A";
        default:
            return "Unknown";
    }
}

int main(int argc, char* argv[]) {
    if (argc != 6) {
        printf("Usage: %s <byte1> <byte2> <byte3> <byte4> <byte5>\n", argv[0]);
        return 1;
    }

    uint8_t input_bytes[5]; // Buffer to hold input bytes
    X86Instruction instruction;

    // Convert input bytes from command-line arguments to integers
    for (int i = 1; i < argc; i++) {
        input_bytes[i - 1] = strtol(argv[i], NULL, 16);
    }

    // Decode input bytes into instruction structure
    decode_vex_instruction(input_bytes, &instruction);

    // Print granular output
    printf("VEX.VVVV: %04x\n", instruction.vex_vvvv);
    printf("VEX.L: %d\n", instruction.vex_l);
    printf("VEX.PP: %d\n", instruction.vex_pp);
    printf("VEX.R: %d\n", instruction.vex_rr);
    printf("VEX.X: %d\n", instruction.vex_x);
    printf("VEX.B: %d\n", instruction.vex_b);
    printf("VEX.W: %d\n", instruction.vex_w);
    printf("VEX.MAP_SELECT: %d (%s)\n", instruction.vex_map_select, get_legacy_escape_sequence(instruction.vex_map_select));
    printf("Mod: %d\n", instruction.mod);
    printf("ModRM.REG: %d (XMM: %s, GPR: %s)\n", instruction.modrm_reg, get_xmm_mnemonic(instruction.modrm_reg), get_gpr_mnemonic(instruction.modrm_reg | instruction.vex_rr << 3));
    printf("ModRM.R/M: %d (XMM: %s, GPR: %s)\n", instruction.modrm_rm, get_xmm_mnemonic(instruction.modrm_rm | instruction.vex_b << 3), get_gpr_mnemonic(instruction.modrm_rm));
    printf("Opcode: %04X\n", instruction.opcode);
    printf("Prefix length: %s\n", instruction.is_three_byte_prefix ? "3-byte" : "2-byte");

    return 0;
}

