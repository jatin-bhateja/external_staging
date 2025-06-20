void test1(int* iArr) {
  for (int i = 20; i < 100; i++) {
     iArr[i - 1] = iArr[i - 11];
  }
}

