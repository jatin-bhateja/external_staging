

int main() {

 int arr[1000];
 for(int i = 0 ; i < 1000 ; i++)
   for(int j = 0 ; j < 1000 ; j++)
     for(int k = 0 ; k < 1000 ; k++) {
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         asm volatile("nop \n\t");
         arr[k] = 10;
     }

 return arr[45];
}
