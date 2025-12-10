#include "SoftmaxNative.h"
#include <stdio.h>

int main() {
  float input [] = {1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f, 9.0f, 10.0f, 11.0f, 12.0f, 13.0f, 14.0f, 15.0f};
  float pred[16];
  compute_softmax(pred, input, 16);
  printf("pred[0] = %f\n", pred[0]);
  printf("pred[1] = %f\n", pred[1]);
  printf("pred[2] = %f\n", pred[2]);
  printf("pred[3] = %f\n", pred[3]);
  return 0; 
}
