int main() {
   int out = 0;
   float val1  = 2.0f;
   float val2  = 1.0f;
   asm volatile (
      "ucomiss %2 , %1 \n\t"
      "jb below        \n\t"
      "movl $1 , %0    \n\t"
      "jmp exit        \n\t"
      "below:          \n\t"
      "movl $2 , %0    \n\t"
      "exit:           \n\t"
     : "=r"(out)
     : "x"(val1), "x"(val2)
     : "cc"
   );
   return 0;
}
