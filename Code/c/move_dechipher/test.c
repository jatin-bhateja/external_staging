

typedef int int16 __attribute__((ext_vector_type(16)));

int16 func(int16 dst, int16 src) {
    dst = src + 10;
    return dst;
}

