

int vec(int * a , int * b,  int * c,  int * out) {
  for(int i =0 ; i < 4096; i++) {
     out[i] = a[i] & b[i] & c[i];
     //out[i] = a[i] & b[i] & ~c[i] | (~a[i] | ~b[i]);
   }
}
