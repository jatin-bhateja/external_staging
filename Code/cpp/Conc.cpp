
#include <iostream>

class Conc {
  private:
    int _val;

  public:
    Conc(int val) : _val(val) {}
    bool operator == (const Conc& arg) const {
       return _val == arg._val;
    } 
    bool operator != (const Conc& arg) const {
       return _val != arg._val;
    } 
    constexpr int getVal() const {
       return _val;
    }
};

bool operator == (int arg1, Conc arg2) {
   return arg1 == arg2.getVal();
}

constexpr int fold_values(const Conc& arg) {
   return arg.getVal();
}

const Conc c1(20);

int main() {
   Conc o1(10);
   Conc o2(10); 
   std::cout << (o1 == o2) << std::endl;
   std::cout << (o1 == 10) << std::endl;
   std::cout << (10 == o2) << std::endl;
   std::cout << (c1 == o2) << std::endl;
   std::cout << fold_values(c1) << std::endl;
   std::cout << fold_values(o1) << std::endl;
   return 0; 
}
