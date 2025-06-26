
#define MAX(x,a,b)      \
 do {                   \
   if (a > b) {         \
     x = 20 * a + b;    \
   } else {             \
     x = 20 * a + b;    \
   }                    \
 } while(0)


int a = 10;
int b = 20;
int x = 0;

int main() {
  MAX(x, a, b);
  return x;
}
