
// GATHER - VSIB encoding, BASE (GPR) + INDEX (VECTOR) * SCALE + OFFSET 

void micro() {
   asm volatile (
      "vpgatherqq %%ymm1, 0x20(%%r21, %%ymm2, 0x8) , %%ymm3  \n\t"
     :  :  : "%r21" , "%ymm1" , "%ymm2", "%ymm3"
   );
}
