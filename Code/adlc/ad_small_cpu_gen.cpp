//
// Copyright

// Machine Generated File.  Do Not Edit!

#include "precompiled.hpp"
#include "adfiles/ad_small_cpu.hpp"
#include "opto/cfgnode.hpp"
#include "opto/locknode.hpp"
#include "opto/rootnode.hpp"


//------------------------- MachOper Generator ---------------
// A switch statement on the dense-packed user-defined type system
// that invokes 'new' on the corresponding class constructor.

MachOper *State::MachOperGenerator(int opcode){

  switch(opcode) {
  case UNIVERSE:
    return new UniverseOper( );
  case LABEL:
    return new labelOper( );
  case SREGI:
    return new sRegIOper( );
  case SREGP:
    return new sRegPOper( );
  case SREGF:
    return new sRegFOper( );
  case SREGD:
    return new sRegDOper( );
  case SREGL:
    return new sRegLOper( );
  case METHOD:
    return new methodOper( );
  case LEGXMM0:
    return new legXmm0Oper( );
  case LEGXMM1:
    return new legXmm1Oper( );
  case RREGI:
    return new rRegIOper( );
  
  default:
    fprintf(stderr, "Default MachOper Generator invoked for: \n");
    fprintf(stderr, "   opcode = %d\n", opcode);
    break;
  }
  return nullptr;
};


//------------------------- MachNode Generator ---------------
// A switch statement on the dense-packed user-defined type system
// that invokes 'new' on the corresponding class constructor.

MachNode *State::MachNodeGenerator(int opcode){
  switch(opcode) {
  case addF_reg_rule: {
      addF_regNode *node = new addF_regNode();
      node->set_opnd_array(3, MachOperGenerator(LEGXMM0));
      return node;
    }
  case addI_reg_rule: {
      addI_regNode *node = new addI_regNode();
      return node;
    }
  
  default:
    fprintf(stderr, "Default MachNode Generator invoked for: \n");
    fprintf(stderr, "   opcode = %d\n", opcode);
    break;
  };
  return nullptr;
}
