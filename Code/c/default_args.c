

int callee(int a, int b, int c = 10, int d = 40) {
  return a + b + c + d;
}

int caller(int a, int b) {
  return callee(a, b);
}
