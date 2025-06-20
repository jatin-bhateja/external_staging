
#include <iostream>

class Top {
  public:
    virtual void print() {  std::cout << "TOP " << __PRETTY_FUNCTION__ << std::endl; }
};


class Bottom : public Top {
   public:
    void print() { std::cout << "BOTTOM " << __PRETTY_FUNCTION__ << std::endl; } 
};

int main() {
    using ptr = void (*);
    Bottom* obj = new Bottom();
    obj->Top::print();
    obj->print();
    return 0;
}
