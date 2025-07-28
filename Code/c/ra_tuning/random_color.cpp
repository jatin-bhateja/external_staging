
#include <stdio.h>
#include <iostream>
#include <vector>
#include <assert.h>
#include <stdlib.h>

const char* _reg_name[] = {
   "RAX_L",   // RAX_L
   "RAX_H",   // RAX_H
   "RBX_L",   // RBP_L
   "RBX_H",   // RBP_H
   "RCX_L",   // RCX_L
   "RCX_H",   // RCX_H
   "RDX_L",   // RDX_L
   "RDX_H",   // RDX_H
   "R8_L",    // R8_L
   "R8_H",    // R8_H
   "R9_L",    // R9_L
   "R9_H",    // R9_H
   "R10_L",   // R10_L
   "R10_H",   // R10_H
   "R11_L",   // R11_L
   "R11_H",   // R11_H
   "R12_L",   // R12_L
   "R12_H",   // R12_H
   "R13_L",   // R13_L
   "R13_H",   // R13_H
   "R14_L",   // R14_L
   "R14_H",   // R14_H
   "R15_L",   // R15_L
   "R15_H",   // R15_H
   "R16_L",   // R16_L
   "R16_H",   // R16_H
   "R17_L",   // R17_L
   "R17_H",   // R17_H
   "R18_L",   // R18_L
   "R18_H",   // R18_H
   "R19_L",   // R19_L
   "R19_H",   // R19_H
   "R20_L",   // R20_L
   "R20_H",   // R20_H
};

enum reg {
   RAX_L,   // RAX_L
   RAX_H,   // RAX_H
   RBX_L,   // RBP_L
   RBX_H,   // RBP_H
   RCX_L,   // RCX_L
   RCX_H,   // RCX_H
   RDX_L,   // RDX_L
   RDX_H,   // RDX_H
   R8_L,    // R8_L
   R8_H,    // R8_H
   R9_L,    // R9_L
   R9_H,    // R9_H
   R10_L,   // R10_L
   R10_H,   // R10_H
   R11_L,   // R11_L
   R11_H,   // R11_H
   R12_L,   // R12_L
   R12_H,   // R12_H
   R13_L,   // R13_L
   R13_H,   // R13_H
   R14_L,   // R14_L
   R14_H,   // R14_H
   R15_L,   // R15_L
   R15_H,   // R15_H
   R16_L,   // R16_L
   R16_H,   // R16_H
   R17_L,   // R17_L
   R17_H,   // R17_H
   R18_L,   // R18_L
   R18_H,   // R18_H
   R19_L,   // R19_L
   R19_H,   // R19_H
   R20_L,   // R20_L
   R20_H,   // R20_H
   MAX_REG  // MAX_REG
};

enum BasicType {
  T_BYTE,
  T_SHORT,
  T_INT,
  T_LONG
};

class RegMask {
  private:
    uint64_t _mask;

  public:
    RegMask(uint64_t mask) : _mask(mask) {}

    RegMask(const RegMask& mask) : _mask(mask._mask) {}

    RegMask& operator & (const RegMask& mask) {
      _mask &= mask._mask;
      return *this;
    }

    RegMask& operator | (const RegMask& mask) {
      _mask |= mask._mask;
      return *this;
    }

    uint32_t popcount() {
      return __builtin_popcount(_mask);
    }

    uint32_t firstset() {
      return  __builtin_ctz(_mask);
    }

    uint32_t lastset() {
      return  64 - __builtin_clz(_mask);
    }
    
    void dump() {
      std::cout << "[ ";
      for (int i = 0; i < 64; i++) {
        if (_mask & (1ULL << i)) {
          std::cout << _reg_name[i] << " , "; 
        }
      }
      std::cout << " ]" << std::endl;
    }

    uint64_t getMask() {
      return _mask;
    }
};

class LRG {
  private:
    RegMask   _mask;
    uint32_t  _reg;
    uint32_t  _num_registers;
    uint32_t  _reg_pressure;

  public:
    LRG(uint64_t mask) : _mask(mask), _reg(-1), _num_registers(0), _reg_pressure(0) {}      

    void set_reg_pressure(uint32_t num) {
      _reg_pressure = num;
    }

    void set_num_registers(uint32_t num) {
      _num_registers = num;
    }

    void set_regmask(RegMask mask) {
      _mask = mask;
    }

    void set_reg(uint32_t reg) {
      _reg = reg;
    }

    LRG& operator | (const LRG& lrg) {
      _mask = _mask | lrg._mask;
      return  *this;
    }

    LRG& operator & (const LRG& lrg) {
      _mask = _mask & lrg._mask;
      return  *this;
    }

    LRG& operator = (const LRG& arg) {
      _mask = arg._mask; 
      _reg = arg._reg;
      _num_registers = arg._num_registers;
      _reg_pressure = arg._reg_pressure;
      return *this;
    }
  
    uint32_t choose_first_color() {
      uint32_t index = firstset();
      assert(((_mask.getMask() & (((1ULL << _num_registers) - 1) << index)) >> index) == ((1ULL << _num_registers) - 1)); 
      return index;
    } 

    uint32_t choose_random_color() {
      uint32_t counter = 0;
      uint32_t index = firstset();
      uint32_t all_set_count = popcount();
      uint32_t cumulative_set_index_array[64] = {0};

      // Pre-compute cumulative set index array by a single
      // traversal over bitmask.
      if (_num_registers == 2) {
        for (int i = 0; i < 64; i+=2) {
          if ((((0x3ULL << i) & _mask.getMask()) >> i) ==  0x3ULL) {
            cumulative_set_index_array[counter] = i;
          } else {
            cumulative_set_index_array[counter + 1] = cumulative_set_index_array[counter];
          } 
          counter++;
        }
        uint32_t random_index = rand() % (all_set_count >> 1);
        return cumulative_set_index_array[random_index];
      } else {
        assert(_num_registers == 1);
        for (int i = 0; i < 64; i++) {
          if ((((0x1ULL << i) & _mask.getMask()) >> i) ==  0x1ULL) {
            cumulative_set_index_array[counter] = i;
          } else {
            cumulative_set_index_array[counter + 1] = cumulative_set_index_array[counter];
          }
          counter++;
        }
        uint32_t random_index = rand() % (all_set_count);
        return cumulative_set_index_array[random_index];
      }
    } 

    uint32_t popcount() { return _mask.popcount(); }
    uint32_t firstset() { return _mask.firstset(); }
    uint32_t lastset() { return _mask.lastset(); }
    uint32_t num_registers() { return _num_registers; }

    void dump() {
      std::cout << " RM { reg = " << _reg;
      std::cout << " , num_registers = " << _num_registers;
      std::cout << " , reg_pressure = " << _reg_pressure; 
      std::cout << " , mask = "; 
      _mask.dump();
    }
};


// Predefined register masks
RegMask rRegI(0x155555555L);
RegMask rRegL(0x3FFFFFFFFL);
RegMask rRAX (0x3L);
RegMask rRBX (0x3L << 2);
RegMask rRCX (0x3L << 4);
RegMask rRDX (0x3L << 6);

LRG gen_lrg_masks(BasicType type) {
  LRG lrg(-1);
  switch(type) {
    case T_BYTE:
    case T_SHORT:
    case T_INT:
      lrg.set_regmask(rRegI);
      lrg.set_reg_pressure(1); 
      lrg.set_num_registers(1);
      break;
    case T_LONG:
      lrg.set_regmask(rRegL);
      lrg.set_reg_pressure(1); 
      lrg.set_num_registers(2);
      break;
  } 
  return lrg;
}


/*
class Node {
  private:
    std::vector<Node*> _in;
    std::vector<Node*> _out;
    LRG lrg;

  public:
    Node() {
                  
    }
};
*/

int main() {
  srand(time(0));
  LRG lrg1 = gen_lrg_masks(T_INT);
  LRG lrg2 = gen_lrg_masks(T_LONG);
  lrg1.dump();
  lrg2.dump();
  //lrg2 = lrg1 & lrg2;
  lrg2.dump();
  std::cout << "lrg2.popcount = " << lrg2.popcount() << std::endl;
  std::cout << "lrg2.firstset = " << lrg2.firstset() << std::endl;
  std::cout << "lrg2.lastset = " << lrg2.lastset() << std::endl;

  //lrg2 = lrg1 | lrg2;
  //lrg2.dump();
  std::cout << "Allocate Register to LRG lrg1" << std::endl;
  uint32_t color = lrg1.choose_first_color();
  std::cout << " REG1 = " << _reg_name[color] << std::endl;
  if (lrg1.num_registers() > 1) {
    std::cout << " REG2 = " << _reg_name[color + 1] << std::endl;
  }

  std::cout << "Allocate Register to LRG lrg2" << std::endl;
  color = lrg2.choose_first_color();
  std::cout << " REG1 = " << _reg_name[color] << std::endl;
  if (lrg2.num_registers() > 1) {
    std::cout << " REG2 = " << _reg_name[color + 1] << std::endl;
  }

  std::cout << "Allocate Random Register to LRG lrg1" << std::endl;
  color = lrg1.choose_random_color();
  std::cout << " REG1 = " << _reg_name[color] << std::endl;
  if (lrg1.num_registers() > 1) {
    std::cout << " REG2 = " << _reg_name[color + 1] << std::endl;
  }

  std::cout << "Allocate Random Register to LRG lrg2" << std::endl;
  color = lrg2.choose_random_color();
  std::cout << " REG1 = " << _reg_name[color] << std::endl;
  if (lrg2.num_registers() > 1) {
    std::cout << " REG2 = " << _reg_name[color + 1] << std::endl;
  }
  return 0;
}
