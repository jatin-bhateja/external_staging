
#include <stdio.h>
#include <assert.h>

int main() {
  int test_num = 4;
  for (int i = 1; i <= 2; i++ ) {
    for (int j = 1; j <= 2; j++ ) {
       for (int k = 1; k <= 2; k++ ) {
          for (int l = 1; l <= 2; l++ ) {
             int index = i + j + k + l;
             int node_count = 0;
             switch (index) {
                case 4 : node_count = 2 ; break;
                case 8 : node_count = 2 ; break;
                default: node_count =  i == j || k == l ? 3 : 2; break;
             }
             printf(
               "\n"
               "    @Test\n"
               "    @IR(counts = {IRNode.ADD_VI, \" %d \"})\n"
               "    public void testVectorIRSharing%d(int index) {\n"
               "        IntVector vec1 = IntVector.fromArray(I_SPECIES, ia, index);\n"
               "        IntVector vec2 = IntVector.fromArray(I_SPECIES, ib, index);\n"
               "        // (vec%d + vec%d) + (vec%d + vec%d)\n"
               "        vec%d.lanewise(VectorOperators.ADD, vec%d)\n"
               "            .lanewise(VectorOperators.ADD, vec%d.lanewise(VectorOperators.ADD, vec%d))\n"
               "            .intoArray(ir1, index);\n"
               "    }\n"
               "\n"
               "    @Run(test = \"testVectorIRSharing%d\")\n"
               "    public void testVectorIRSharingDriver%d() {\n"
               "        for (int i = 0; i < I_SPECIES.loopBound(LENGTH); i += I_SPECIES.length()) {\n"
               "            testVectorIRSharing%d(i);\n"
               "        }\n"
               "        checkVectorIRSharing%d();\n"
               "    }\n"
               "\n"
               "    public void checkVectorIRSharing%d() {\n"
               "        for (int i = 0; i < I_SPECIES.loopBound(LENGTH); i++) {\n"
               "            Verify.checkEQ(ir1[i], (i%c[i] + i%c[i]) + (i%c[i] + i%c[i]));\n"
               "        }\n"
               "    }\n", node_count, test_num, i, j, k, l, i, j, k, l, test_num, test_num, test_num, test_num, test_num, i == 1 ? 'a' : 'b', j == 1 ? 'a' : 'b', k == 1 ? 'a' : 'b', l == 1 ? 'a' : 'b');
              test_num++;
          }
       }
    }
  }
}
