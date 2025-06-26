//
// Copyright

// Machine Generated File.  Do Not Edit!

#include "precompiled.hpp"
#include "adfiles/ad_small_cpu.hpp"

//------------------Pipeline Methods-----------------------------------------
#ifndef PRODUCT
const char * Pipeline::stageName(uint s) {
  static const char * const _stage_names[] = {
    "undefined", "S0", "S1", "S2", "S3", "S4", "S5"
  };

  return (s <= 6 ? _stage_names[s] : "???");
}
#endif

uint Pipeline::functional_unit_latency(uint start, const Pipeline *pred) const {
  // See if the functional units overlap
  uint mask = resourcesUsedExclusively() & pred->resourcesUsedExclusively();
  if (mask == 0)
    return (start);

  for (uint i = 0; i < pred->resourceUseCount(); i++) {
    const Pipeline_Use_Element *predUse = pred->resourceUseElement(i);
    if (predUse->multiple())
      continue;

    for (uint j = 0; j < resourceUseCount(); j++) {
      const Pipeline_Use_Element *currUse = resourceUseElement(j);
      if (currUse->multiple())
        continue;

      if (predUse->used() & currUse->used()) {
        Pipeline_Use_Cycle_Mask x = predUse->mask();
        Pipeline_Use_Cycle_Mask y = currUse->mask();

        for ( y <<= start; x.overlaps(y); start++ )
          y <<= 1;
      }
    }
  }

  // There is the potential for overlap
  return (start);
}

// The following two routines assume that the root Pipeline_Use entity
// consists of exactly 1 element for each functional unit
// start is relative to the current cycle; used for latency-based info
uint Pipeline_Use::full_latency(uint delay, const Pipeline_Use &pred) const {
  for (uint i = 0; i < pred._count; i++) {
    const Pipeline_Use_Element *predUse = pred.element(i);
    if (predUse->_multiple) {
      uint min_delay = 5;
      // Multiple possible functional units, choose first unused one
      for (uint j = predUse->_lb; j <= predUse->_ub; j++) {
        const Pipeline_Use_Element *currUse = element(j);
        uint curr_delay = delay;
        if (predUse->_used & currUse->_used) {
          Pipeline_Use_Cycle_Mask x = predUse->_mask;
          Pipeline_Use_Cycle_Mask y = currUse->_mask;

          for ( y <<= curr_delay; x.overlaps(y); curr_delay++ )
            y <<= 1;
        }
        if (min_delay > curr_delay)
          min_delay = curr_delay;
      }
      if (delay < min_delay)
      delay = min_delay;
    }
    else {
      for (uint j = predUse->_lb; j <= predUse->_ub; j++) {
        const Pipeline_Use_Element *currUse = element(j);
        if (predUse->_used & currUse->_used) {
          Pipeline_Use_Cycle_Mask x = predUse->_mask;
          Pipeline_Use_Cycle_Mask y = currUse->_mask;

          for ( y <<= delay; x.overlaps(y); delay++ )
            y <<= 1;
        }
      }
    }
  }

  return (delay);
}

void Pipeline_Use::add_usage(const Pipeline_Use &pred) {
  for (uint i = 0; i < pred._count; i++) {
    const Pipeline_Use_Element *predUse = pred.element(i);
    if (predUse->_multiple) {
      // Multiple possible functional units, choose first unused one
      for (uint j = predUse->_lb; j <= predUse->_ub; j++) {
        Pipeline_Use_Element *currUse = element(j);
        if ( !predUse->_mask.overlaps(currUse->_mask) ) {
          currUse->_used |= (1 << j);
          _resources_used |= (1 << j);
          currUse->_mask.Or(predUse->_mask);
          break;
        }
      }
    }
    else {
      for (uint j = predUse->_lb; j <= predUse->_ub; j++) {
        Pipeline_Use_Element *currUse = element(j);
        currUse->_used |= (1 << j);
        _resources_used |= (1 << j);
        currUse->_mask.Or(predUse->_mask);
      }
    }
  }
}

uint Pipeline::operand_latency(uint opnd, const Pipeline *pred) const {
  int const default_latency = 1;

  assert(pred, "null predecessor pipline info");

  if (pred->hasFixedLatency())
    return (pred->fixedLatency());

  // If this is not an operand, then assume a dependence with 0 latency
  if (opnd > _read_stage_count)
    return (0);

  uint writeStage = pred->_write_stage;
  uint readStage  = _read_stages[opnd-1];

  if (writeStage == stage_undefined || readStage == stage_undefined)
    return (default_latency);

  int delta = writeStage - readStage;
  if (delta < 0) delta = 0;

  return (delta);
}

Pipeline_Use_Cycle_Mask operator&(const Pipeline_Use_Cycle_Mask &in1, const Pipeline_Use_Cycle_Mask &in2) {
  return Pipeline_Use_Cycle_Mask(in1._mask & in2._mask);
}

Pipeline_Use_Cycle_Mask operator|(const Pipeline_Use_Cycle_Mask &in1, const Pipeline_Use_Cycle_Mask &in2) {
  return Pipeline_Use_Cycle_Mask(in1._mask | in2._mask);
}

static const Pipeline pipeline_class_Zero_Instructions(0, 0, true, 0, 0, false, false, false, false, nullptr, nullptr, nullptr, Pipeline_Use(0, 0, 0, nullptr));

static const Pipeline pipeline_class_Unknown_Instructions(0, 0, true, 0, 0, false, true, true, false, nullptr, nullptr, nullptr, Pipeline_Use(0, 0, 0, nullptr));

const Pipeline_Use_Element Pipeline_Use::elaborated_elements[11] = {
  Pipeline_Use_Element(0, 0, 0, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 1, 1, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 2, 2, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 3, 3, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 4, 4, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 5, 5, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 6, 6, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 7, 7, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 8, 8, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 9, 9, false, Pipeline_Use_Cycle_Mask(0)),
  Pipeline_Use_Element(0, 10, 10, false, Pipeline_Use_Cycle_Mask(0))
};

const Pipeline_Use Pipeline_Use::elaborated_use(0, 0, 11, (Pipeline_Use_Element *)&elaborated_elements[0]);


// Pipeline Class "alu_2op"
static const enum machPipelineStages pipeline_reads_001[1] = {
  stage_S3 
};

static const enum machPipelineStages pipeline_res_stages_001[11] = {
  stage_S0,        // D0
  stage_S0,        // D1
  stage_S0,        // D2
  stage_undefined, // MS0
  stage_undefined, // MS1
  stage_undefined, // MS2
  stage_undefined, // BR
  stage_undefined, // FPU
  stage_S3,        // ALU0
  stage_S3,        // ALU1
  stage_S3         // ALU2
};

static const uint pipeline_res_cycles_001[11] = {
  1, // D0
  1, // D1
  1, // D2
  0, // MS0
  0, // MS1
  0, // MS2
  0, // BR
  0, // FPU
  1, // ALU0
  1, // ALU1
  1  // ALU2
};

static const Pipeline_Use_Element pipeline_res_mask_001[2] = {
  Pipeline_Use_Element(0x007, 0, 2, true,  Pipeline_Use_Cycle_Mask(0x80000001)),
  Pipeline_Use_Element(0x700, 8, 10, true,  Pipeline_Use_Cycle_Mask(0x00000004)) 
};

static const Pipeline pipeline_class_001((uint)stage_S4, 1, false, 0, 1, false, false, false, false,

  (enum machPipelineStages *) pipeline_reads_001,
   (enum machPipelineStages *) pipeline_res_stages_001,
  (uint *) pipeline_res_cycles_001,
  Pipeline_Use(0x707, 0x0, 2, (Pipeline_Use_Element *)&pipeline_res_mask_001[0]));

//------------------Inter-Instruction Latency--------------------------------
uint Node::latency(uint i) {
  uint j;
  // verify in legal range for inputs
  assert(i < len(), "index not in range");

  // verify input is not null
  Node *pred = in(i);
  if (!pred)
    return 0;

  if (pred->is_Proj())
    pred = pred->in(0);

  // if either node does not have pipeline info, use default
  const Pipeline *predpipe = pred->pipeline();
  assert(predpipe, "no predecessor pipeline info");

  if (predpipe->hasFixedLatency())
    return predpipe->fixedLatency();

  const Pipeline *currpipe = pipeline();
  assert(currpipe, "no pipeline info");

  if (!is_Mach())
    return 0;

  const MachNode *m = as_Mach();
  j = m->oper_input_base();
  if (i < j)
    return currpipe->functional_unit_latency(0, predpipe);

  // determine which operand this is in
  uint n = m->num_opnds();
  int delta = 0;

  uint k;
  for (k = 1; k < n; k++) {
    j += m->_opnds[k]->num_edges();
    if (i < j)
      break;
  }
  if (k < n)
    delta = currpipe->operand_latency(k,predpipe);

  return currpipe->functional_unit_latency(delta, predpipe);
}

// Descriptions for emitting different functional unit nops
void Bundle::initialize_nops(MachNode * nop_list[0]) {
};

#ifndef PRODUCT
void Bundle::dump(outputStream *st) const {
  static const char * bundle_flags[] = {
    "",
    "use nop delay",
    "use unconditional delay",
    "use conditional delay",
    "used in conditional delay",
    "used in unconditional delay",
    "used in all conditional delays",
  };

  static const char *resource_names[11] = { "D0", "D1", "D2", "MS0", "MS1", "MS2", "BR", "FPU", "ALU0", "ALU1", "ALU2" };

  bool needs_comma = false;

  if (_flags) {
    st->print("%s", bundle_flags[_flags]);
    needs_comma = true;
  };
  if (instr_count()) {
    st->print("%s%d instr%s", needs_comma ? ", " : "", instr_count(), instr_count() != 1 ? "s" : "");
    needs_comma = true;
  };
  uint r = resources_used();
  if (r) {
    st->print("%sresource%s:", needs_comma ? ", " : "", (r & (r-1)) != 0 ? "s" : "");
    for (uint i = 0; i < 11; i++)
      if ((r & (1 << i)) != 0)
        st->print(" %s", resource_names[i]);
    needs_comma = true;
  };
  st->print("\n");
}
#endif
const Pipeline *     Node::pipeline_class() { return (&pipeline_class_Zero_Instructions); }
const Pipeline *     Node::pipeline() const { return (&pipeline_class_Zero_Instructions); }

const Pipeline * MachNode::pipeline_class() { return (&pipeline_class_Unknown_Instructions); }
const Pipeline * MachNode::pipeline() const { return pipeline_class(); }



const Pipeline * addF_regNode::pipeline_class() { return (&pipeline_class_001); }
const Pipeline * addF_regNode::pipeline() const { return (&pipeline_class_001); }

const Pipeline * addI_regNode::pipeline_class() { return (&pipeline_class_001); }
const Pipeline * addI_regNode::pipeline() const { return (&pipeline_class_001); }
