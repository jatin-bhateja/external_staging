

void rotateEL(int * arr, int L, int N) {
  N = N % L;
  for(int i = 0; i  < N ; i++) {
    int idx = (L - N + i) % L;
    arr[i] = arr[idx]; 
  }
}
