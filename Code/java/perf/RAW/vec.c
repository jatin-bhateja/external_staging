

#define SIZE 1024

  void war(float * a) {
    for (int i = 0 ; i < SIZE-1 ; i++)
      a[i] = a[i+1];
  }
  void raw(float * a) {
    for (int i = 0 ; i < SIZE-1 ; i++)
      a[i+1] = a[i];
  }
