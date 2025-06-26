


class ABC {
public:
  ABC() = default;
  int sum(int a, int b) { return a + b; }
};

using func_ptr = int (*) (int, int);

class XYZ {
public:
  func_ptr func;
  XYZ() {
     func = reinterpret_cast<func_ptr>(&ABC::sum);
  }
};

int main() {
  XYZ obj;
  return obj.func(10, 20);
}


