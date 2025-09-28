
public class irreducible_loop {

    public static boolean flag = true;

    public static int micro (int a, int b, int c, int d, int e, int size, int cond) {
        int res = 0;
        // In simplest terms, raching a block in the loop without going through header
        // Header increments the induction variable and begins a new iteration, thus
        // the moment we increment the trip counter, we begin a new loop iteration.
        int i = 0;
        if (flag) {
           res = 1000;
        } 
        // Header - 2 successors : loop body, exit, before eaching to if(flag) both the successors are
        // visited and block is marked as visited. 
        while (i < size) {
            int t1 = a + b;
            int t2 = t1 * c;
            t1 = t2 / d;
            res = t1 & t2;
            i++;
        }
        //exit:
        if (res == 200) {
           res = 0;
        }

        return res; 
    }

    public static void main(String [] args) {
        int res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro(i + 10, i + 20, i + 30, i + 40, i + 50, 20000, i);
        }
        System.out.println("[res] " + res);
    }
}

/*
                  |------------------|
                  |                  |
                  |                  V
    Header --->  B1 ----> B2  ---->  B3 -> Header
     A             A       |                 |
     |             |       |                 |
     |             |       |                 |
     |             |       |                 |
     |             ---------                 |
     |                                       |
     -----------------------------------------

*/
