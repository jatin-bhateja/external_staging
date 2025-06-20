
#define LEN 134098
int arr[LEN] = {1};

__attribute__((noinline))
int workload(int init) {
  int i = 0;
  for (i = 0 ; i < LEN ; i++) {
     arr[i+1] = arr[i] + init;
  }
  return arr[7];
}

int main() {
  int index = 0;
  for(int i = 0 ; i < 100000 ;i++)
    index += workload(i);
  return arr[index&4097];  
}
