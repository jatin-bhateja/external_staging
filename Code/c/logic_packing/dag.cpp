

#include "stdlib.h"
#include <assert.h>
#include <iostream>
#include <string>
#include <vector>
#include <set>

static int nodes = 0;

class Node {
public:
  enum OPTYPE { NOP = 1, AND, OR, NOT, XOR, CONST, ARITH };
  int _opcode;
  int _num_ins;
  int _num_outs;

  int _allocated_ins;
  int _allocated_outs;

  Node **_in;
  Node **_out;

  int _idx;

  Node(int opc)
      : _opcode(opc), _num_ins(0), _num_outs(0), _in(NULL), _out(NULL),
        _idx(nodes++) {}

  int req() { return _num_ins;}

  void addin(Node *in) {
    if (_num_ins < _allocated_ins) {
      _in[_num_ins++] = in;
    } else {
      _allocated_ins += 4;
      int alloc_sz = sizeof(Node **) * _allocated_ins;
      _in = _in == NULL ? (Node **)malloc(alloc_sz)
                        : (Node **)realloc(_in, alloc_sz);
      _in[_num_ins++] = in;
    }
    in->addout(this);
  }

  std::string getName() {
    char nums[1024] = {'\0'};
    std::string name("N");
    sprintf(nums, "%d", _idx);
    name += nums;
    return name;
  }

  bool islogicalOp() {
    switch(_opcode) {
      default: 
        return false;
      case OR: case AND:
      case NOT: case XOR:
        return true;
    }
  }

  virtual void dump() {
    std::cout << "[N" << _idx << "] OPCODE = " << getopcodestr() << " INS = [";
    for (int i = 0; i < _num_ins; i++)
      std::cout << _in[i]->getName() << " ";
    std::cout << "]  OUTS = [ ";
    for (int i = 0; i < _num_outs; i++)
      std::cout << _out[i]->getName() << " ";
    std::cout << " ] " << std::endl;
  }

  void dumpr() {
    dump();
    for (int i = 0; i < _num_ins; i++)
      _in[i]->dumpr();
  }

  const char *getopcodestr() {
    switch (_opcode) {
    default:
      assert(false);
    case OR:
      return "OR";
    case AND:
      return "AND";
    case NOT:
      return "NOT";
    case XOR:
      return "XOR";
    case CONST:
      return "CONST";
    case ARITH:
      return "ARITH";
    }
    return "";
  }

  void addout(Node *out) {
    if (_num_outs < _allocated_outs) {
      _out[_num_outs++] = out;
    } else {
      _allocated_outs += 4;
      int alloc_sz = sizeof(Node **) * _allocated_ins;
      _out = _out == NULL ? (Node **)malloc(alloc_sz)
                          : (Node **)realloc(_out, alloc_sz);
      _out[_num_outs++] = out;
    }
  }
};

class ConstNode : public Node {
public:
  ConstNode(int imm) : Node(Node::CONST), _imm(imm) {}
  int getimm() { return _imm; }

private:
  int _imm;
};

Node *createDAG() {
  Node *or1 = new Node(Node::OR);
  Node *and1 = new Node(Node::AND);
  Node *and2 = new Node(Node::AND);
  Node *arith1 = new Node(Node::ARITH);
  Node *arith2 = new Node(Node::ARITH);
  Node *const1 = new ConstNode(1);

  or1->addin(and1);
  or1->addin(and2);
  and1->addin(arith1);
  and1->addin(const1);
  and2->addin(arith2);
  and2->addin(const1);

  return or1;
}

void visitBFS(Node *n, std::vector<Node*> &list) {
   std::set<Node*> visited;
   list.push_back(n);
   for(int i = 0 ; i <  list.size() ; i++) { 
      n = list[i];
      if (visited.find(n) == visited.end()) {
        visited.insert(n);
        for(int j = 0 ; j < n->_num_ins; j++)
          if (visited.find(n->_in[j]) == visited.end())
            list.push_back(n->_in[j]);
      }
   }
}

void visitDFS_core(Node * n , std::vector<Node*> & list, std::set<Node*> &visited) {
  if (visited.find(n) == visited.end()) {
    visited.insert(n);
    list.push_back(n);
    for(int j = 0 ; j < n->_num_ins; j++)
      visitDFS_core(n->_in[j], list, visited);
  }
}

void visitDFS(Node *n, std::vector<Node*> &list) {
   std::set<Node*> visited;
   visitDFS_core(n, list, visited); 
}

#if 0
bool extractLogicCone(int num_inputs, Node * n) {
  std::set<Node*> inputs;
  std::vector<Node*> nodes;
  if (n->islogicalOp())
     return false;
  int inp_cnt = n->req();    
  nodes.push_back(n);
  while(nodes.empty 

}
#endif

void printNodes(const char * msg, std::vector<Node*> list) {
  std::cout << "\n" << msg << std::endl;
  for(int i = 0; i < list.size() ; i++)
     list[i]->dump();
}

int main() {
  Node *dag = createDAG();
  dag->dumpr();

  std::vector<Node*> order;
  visitBFS(dag, order);
  printNodes("BFS Traversal Order", order); 

  order.clear();
  visitDFS(dag, order);
  printNodes("DFS Traversal Order", order); 
  return 0;
}
