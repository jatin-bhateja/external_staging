
 void test1(int * iArr, float * fArr) {
     for (int i = 4; i < 100; i++) {
         int v = iArr[i];          // A.  
         iArr[i + 2] = v;          // B. Forward writing at least 2 -> cyclic dependency 
         fArr[i] = (float)iArr[i]; // C. Seems required. 
     }
 }

