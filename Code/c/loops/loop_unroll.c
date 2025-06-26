

#define LEN 16

void doSum(float * res, float * a , float * b) {
  for(int i = 0; i < LEN ; i++) {
    res[i] = a[i] + b[i];
  }
}
