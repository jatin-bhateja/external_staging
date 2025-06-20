//
// Copyright

// Machine Generated File.  Do Not Edit!


#ifndef GENERATED_ADFILES_ADGLOBALS_HPP
#define GENERATED_ADFILES_ADGLOBALS_HPP


// the number of reserved registers + machine registers.
#define REG_COUNT    6

// the number of save_on_entry + always_saved registers.
#define MAX_SAVED_ON_ENTRY_REG_COUNT    0
#define     SAVED_ON_ENTRY_REG_COUNT    0
#define   C_SAVED_ON_ENTRY_REG_COUNT    0

// Enumerate machine register numbers starting after reserved regs.
// in the order of occurrence in the register block.
enum MachRegisterNumbers {
  XMM0_num,                 // enum   0, regnum   0, reg encode   1
  XMM1_num,                 // enum   1, regnum   1, reg encode   1
  XMM2_num,                 // enum   2, regnum   2, reg encode   1
  rax_num,                  // enum   3, regnum   3, reg encode   1
  rbx_num,                  // enum   4, regnum   4, reg encode   1
  rcx_num,                  // enum   5, regnum   5, reg encode   1
  _last_Mach_Reg            // 6
};

// Size of register-mask in ints
#define RM_SIZE 4
// Unroll factor for loops over the data in a RegMask
#define FORALL_BODY BODY(0) BODY(1) BODY(2) BODY(3) 

class RegMask;

#endif // GENERATED_ADFILES_ADGLOBALS_HPP
