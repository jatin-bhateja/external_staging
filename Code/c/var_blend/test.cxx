
#include <chrono>
#include <iostream>

void micro(float* dst, float* src1, float* src2, int* mask) {
   asm volatile( 
      "vmovdqu %1, %%ymm0 \n\t"
      "vmovdqu %2, %%ymm1 \n\t"
      "vmovdqu %3, %%ymm2 \n\t"
      "vblendvps %%ymm2, %%ymm1, %%ymm0, %%ymm3 \n\t"
      "vmovdqu %%ymm3, %0 \n\t" 
     : "=m"(*dst)
     : "m"(*src1), "m"(*src2), "m"(*mask)
     : "%ymm0", "%ymm1", "%ymm2", "%ymm3"
   );
}

int main() {
    float src1[] = {10.0f, 20.0f, 30.0f, 40.0f, 50.0f, 60.0f, 70.0f, 80.0f};
    float src2[] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f};
    int   mask[] = {-1, 0, -1, 0, -1, 0, -1, 0};
    float dst[8]; 
    
    for (int i = 0; i < 1000000000; i++) {
        micro(dst, src1, src2, mask);        
    }
    auto start = std::chrono::system_clock::now();
    for (int i = 0; i < 1000000000; i++) {
        micro(dst, src1, src2, mask);        
    }
    auto end = std::chrono::system_clock::now();
    auto duration = std::chrono::duration<double>(end - start);
    std::cout << "[time] " << duration.count() << std::endl;
    for (int i = 0; i < 8; i++) {
        std::cout << dst[i] << " , ";
    }
    std::cout << std::endl;
    return 0;
}
