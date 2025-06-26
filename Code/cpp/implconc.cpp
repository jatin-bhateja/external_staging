#include <type_traits>

class Dummy {
  public:
   Dummy() = default;
   constexpr static int trivial_ops(int cond, int i, int j) {
      if (cond > 10) {
        return i * j + 100;
      } else {
        int res = 0;
        for(int k = i ; k < j ; k++) { res += k; } 
        return res * 10;
      }
   }
};

int main() {
  int val = Dummy::trivial_ops(2, 10, 20);
  static_assert(std::is_trivially_default_constructible<Dummy>::value, "required");
  return val;
}
