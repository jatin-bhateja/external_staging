

typedef float __attribute__((ext_vector_type(16))) float16;

float16 a;
float16 b;

void swap() {
   float16 tmp;
   tmp = a;
   a = b;
   b = tmp;
}
