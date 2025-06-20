

#include "stdbool.h"

bool isSignedZero(float f) {
 return f == (0.0F/0.0F);
}

int main() {
 return isSignedZero(0.0);
}
