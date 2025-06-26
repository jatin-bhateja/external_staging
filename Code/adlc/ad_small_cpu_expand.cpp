//
// Copyright

// Machine Generated File.  Do Not Edit!

#include "precompiled.hpp"
#include "adfiles/ad_small_cpu.hpp"
#include "oops/compressedOops.hpp"

// Register masks, one for each register class.
const RegMask _RC1_mask( 0x7, 0x0, 0x0, 0x0 );
const RegMask _RC2_mask( 0x38, 0x0, 0x0, 0x0 );
const RegMask _STACK_SLOTS_mask( 0x0, 0x0, 0x0, 0x0 );
const RegMask _STACK_OR_STACK_SLOTS_mask( 0xffffff00, 0xffffffff, 0xffffffff, 0xffffffff );
const RegMask _DYNAMIC_mask( 0x0, 0x0, 0x0, 0x0 );
MachNode* addF_regNode::Expand(State* state, Node_List& proj_list, Node* mem) {
  Compile* C = Compile::current();
  // Remove duplicated operands and inputs which use the same name.
  if (num_opnds() == 4) {
    unsigned num0 = 0;
    unsigned num1 = opnd_array(1)->num_edges(); 	// dst
    unsigned num2 = opnd_array(2)->num_edges(); 	// src
    unsigned num3 = opnd_array(3)->num_edges(); 	// dst
    unsigned idx0 = oper_input_base();
    unsigned idx1 = idx0 + num0;
    unsigned idx2 = idx1 + num1;
    unsigned idx3 = idx2 + num2;
    unsigned idx4 = idx3 + num3;
    for (int i = idx4 - 1; i >= (int)idx3; i--) {
      del_req(i);
    }
    _num_opnds = 3;
  } else {
    assert(_num_opnds == 3, "There should be either 3 or 4 operands.");
  }

  return this;
}

