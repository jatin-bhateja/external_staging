#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

struct MyClass {
  uint8_t field1;
  uint8_t field2 :1;
  uint8_t field3 :3;
  uint64_t field4;
};

#define OFFSET_OF(X, Y) \
  ((reinterpret_cast<long>(&(((X*)(0))->Y))))

//long val = OFFSET_OF(struct MyClass, field4);
//long val = offsetof(struct MyClass, field2);

#define GET_FIELD(obj, FLD_CNT) \
  obj.field##FLD_CNT
  
int main() {
  MyClass obj;
  obj.field1 = 10;
  obj.field2 = 1;
  obj.field3 = 0x7;
  obj.field4 = 0x20L;
  printf("Field Value : %x \n", GET_FIELD(obj, 3));
  printf("%d\n", obj.field3);
}
