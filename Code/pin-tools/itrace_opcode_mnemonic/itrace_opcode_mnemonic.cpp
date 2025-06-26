/*
 * Copyright (C) 2004-2021 Intel Corporation.
 * SPDX-License-Identifier: MIT
 */

#include <stdio.h>
#include "pin.H"
#include <iostream>

FILE* trace;

VOID Instrument_Trace(TRACE trace, VOID* v) {
    std::cout << "Trace Num Of BBLs: " <<  TRACE_NumBbl(trace) << std::endl;
    std::cout << "Trace Num Of INSs: " <<  TRACE_NumIns(trace) << std::endl;
    for( BBL bbl = TRACE_BblHead(trace); BBL_Valid(bbl); bbl = BBL_Next(bbl) ) {
      std::cout << "Block: " << BBL_Address(bbl) << std::endl;
      for (INS ins = BBL_InsHead(bbl); INS_Valid(ins); ins = INS_Next(ins)) {
         std::cout << "INS Opcode: " << INS_Opcode(ins) << " Mnemonic: " << INS_Mnemonic(ins) << std::endl;
      } 
    }
}

// This function is called when the application exits
VOID Fini(INT32 code, VOID* v)
{
    fprintf(stdout, "Trace analyis completed.\n");
    fclose(trace);
}

/* ===================================================================== */
/* Print Help Message                                                    */
/* ===================================================================== */

INT32 Usage()
{
    PIN_ERROR("This Pintool prints the count of MEMORY instruction executed\n" + KNOB_BASE::StringKnobSummary() + "\n");
    return -1;
}

/* ===================================================================== */
/* Main                                                                  */
/* ===================================================================== */

int main(int argc, char* argv[])
{
    trace = fopen("itrace.out", "w");

    // Initialize pin
    if (PIN_Init(argc, argv)) return Usage();

    // Register Instruction to be called to instrument instructions
    TRACE_AddInstrumentFunction(Instrument_Trace, 0);

    // Register Fini to be called when the application exits
    PIN_AddFiniFunction(Fini, 0);

    // Start the program, never returns
    PIN_StartProgram();

    return 0;
}
