
#include <iostream>
#include <exception>

class Exception {
    const char* _msg;
  public:
    Exception(const char* msg) : _msg(msg) {}
    void print() { std::cerr << msg << std::endl; }
};

class AVX512VerboseDecoder  {
    bool evex: 1;
    bool  
    int _bpos = 0;
  public:
    AVX512VerboseDecoder() = default;

    void process_operands(int bits) {

    }

    void process_encoding(int bits) {
       switch(_bpos) {
          case 0: 
            process_mandatory_prefix(bits);
            break;
          case 1:
            process
          case 2:
          case 3:
          default:
            process_operands(bits);
       }
    }
};

int main (int argc, char * argv[]) {
   if (argc == 0) {
     std::cerr << "No encoding provided!" << std::endl;      
     return -1;
   }

   try {
      AVX512VerboseDecoder obj =  new AVX512VerboseDecode(argc, argv);
   } catch (Exception e) {
     e.print();
   }
}
