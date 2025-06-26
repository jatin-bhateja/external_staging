

constexpr int arr [] = {1, 2, 3};

int const_arr_access() {
  return arr[0] + arr[1] + arr[2];
}

int arr1 [] = {1, 2, 3};

int non_const_arr_access() {
  return arr1[0] + arr1[1] + arr1[2];
}
