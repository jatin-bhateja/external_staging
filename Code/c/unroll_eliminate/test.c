#include <stdio.h>
#include <string.h>

typedef struct _Label { 
  char* name;
} Label;

const Label l1 = {"LV1"};
const Label l2 = {"LV2"};
const Label l3 = {"LV3"};

int  micro () {
  int sum = 0; 
  const Label* arr[] = {&l1, &l2, &l3};
  for (int i = 0; i < sizeof(arr)/sizeof(Label); i++) {
      sum += strlen(arr[i]->name);
  }
  return sum; 
}
