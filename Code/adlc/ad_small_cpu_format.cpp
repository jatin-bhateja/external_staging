//
// Copyright

// Machine Generated File.  Do Not Edit!

#include "precompiled.hpp"
#include "adfiles/ad_small_cpu.hpp"
#include "compiler/oopMap.hpp"

#ifndef PRODUCT
void UniverseOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
  st->print("$$univ");
}
void UniverseOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
  st->print("$$univ");
}
#endif

#ifndef PRODUCT
void sRegIOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
}
void sRegIOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
}
#endif

#ifndef PRODUCT
void sRegPOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
}
void sRegPOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
}
#endif

#ifndef PRODUCT
void sRegFOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
}
void sRegFOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
}
#endif

#ifndef PRODUCT
void sRegDOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
}
void sRegDOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
}
#endif

#ifndef PRODUCT
void sRegLOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
}
void sRegLOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
}
#endif

#ifndef PRODUCT
void legXmm0Oper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
  { char reg_str[128];
    ra->dump_register(node,reg_str, sizeof(reg_str));
    st->print("%s",reg_str);
  }
}
void legXmm0Oper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
  { char reg_str[128];
    ra->dump_register(node->in(idx),reg_str,sizeof(reg_str));
    st->print("%s",reg_str);
  }
}
#endif

#ifndef PRODUCT
void legXmm1Oper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
  { char reg_str[128];
    ra->dump_register(node,reg_str, sizeof(reg_str));
    st->print("%s",reg_str);
  }
}
void legXmm1Oper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
  { char reg_str[128];
    ra->dump_register(node->in(idx),reg_str,sizeof(reg_str));
    st->print("%s",reg_str);
  }
}
#endif

#ifndef PRODUCT
void rRegIOper::int_format(PhaseRegAlloc *ra, const MachNode *node, outputStream *st) const {
  { char reg_str[128];
    ra->dump_register(node,reg_str, sizeof(reg_str));
    st->print("%s",reg_str);
  }
}
void rRegIOper::ext_format(PhaseRegAlloc *ra, const MachNode *node, int idx, outputStream *st) const {
  { char reg_str[128];
    ra->dump_register(node->in(idx),reg_str,sizeof(reg_str));
    st->print("%s",reg_str);
  }
}
#endif
#ifndef PRODUCT
void addF_regNode::format(PhaseRegAlloc *ra, outputStream *st) const {
  // Start at oper_input_base() and count operands
  unsigned idx0 = 1;
  unsigned idx1 = 1; 	// dst
  unsigned idx2 = idx1 + opnd_array(1)->num_edges(); 	// src
  st->print_raw("addss   ");
  opnd_array(1)->ext_format(ra, this,idx1, st); // dst
  st->print_raw(", ");
  opnd_array(2)->ext_format(ra, this,idx2, st); // src
}
#endif
#ifndef PRODUCT
void addI_regNode::format(PhaseRegAlloc *ra, outputStream *st) const {
  // Start at oper_input_base() and count operands
  unsigned idx0 = 1;
  unsigned idx1 = 1; 	// dst
  unsigned idx2 = idx1 + opnd_array(1)->num_edges(); 	// src2
  st->print_raw("addl   ");
  opnd_array(1)->ext_format(ra, this,idx1, st); // dst
  st->print_raw(", ");
  opnd_array(2)->ext_format(ra, this,idx2, st); // src2
}
#endif
