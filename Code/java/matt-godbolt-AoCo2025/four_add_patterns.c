    unsigned add_v1(unsigned x, unsigned y) {
      return x + y;
    }
    
    unsigned add_v2(unsigned x, unsigned y) {
      x += y;
      return x;
    }
    
    unsigned add_v3(unsigned x, unsigned y) {
      while (x--) ++y;
      return y;
    }
    
    unsigned add_v4(unsigned x, unsigned y) {
      if (y == 0) return x;  // x + 0 = x
      // x + y == (x + 1) + (y - 1)
      return add_v4(x + 1, y - 1);
    }
