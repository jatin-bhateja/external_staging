
class ABC {
  public:
  using VecI4 = int[4];
  ABC() = default;

  static VecI4 obj;
};

ABC::VecI4 ABC::obj;  
