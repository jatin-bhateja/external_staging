
  int * arr;

  int func(int ctr) {
     int x = 0;
     int i = 10;
     while (i < 1024) {
        x = i;
        if ( x < 1 ) {        // CCP:EdgeTaken: F
           i = arr[ctr];      // DC
           //x  = i + 10;     // DC
           arr[ctr] = i + 10; // DC
        }                     //
        i++;                  // SCEV: {10,+1,1}
     }
     return i;
  }

