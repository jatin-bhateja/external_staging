
#define PAYLOAD_16B(CNT) \
  float fld##CNT = 10;

void function(int arg) {}

class ValueType {
  public:
    
};


void function(T arg1, Ts... arg2) {
  PAYLOAD_16B(arg1);
  function(arg2...);
}

int main() {
  function(1,2,3,4,5);
  return 0;
}
