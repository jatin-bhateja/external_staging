
import jdk.incubator.vector.*;

interface FBinOp {
    int apply(int i, int [] a, int [] b);
}

class test {
  public static void binOp(FBinOp func, int [] res, int [] arr1, int [] arr2) {
      for(int i = 0 ; i < res.length ; i++) {
        res[i] = func.apply(i, arr1, arr2);
      }
  }
  public static void workload(int [] arr1, int [] arr2, int [] res) {
    binOp((idx, a ,b) -> (a[idx] + b[idx]) , res, arr1, arr2);
  }

  public static void main(String [] args) {
     int [] arr1 = new int[1024];
     int [] arr2 = new int[1024];
     int [] res = new int[1024];
     for (int i = 0 ; i < arr1.length ; i++) {
       arr1[i] = (int)(i - 5);
       arr2[i] = (int)(i + 5);
     }

     // Warmup
     for (int i = 0 ; i < 700000 ; i++)
       workload(arr1, arr2, res);

     // Perf
     long start = System.currentTimeMillis();
     for (int i = 0 ; i < 100000 ; i++)
       workload(arr1, arr2, res);

     long time = System.currentTimeMillis() - start;
     System.out.println("Time = " + time);

     for (var elem : res) {
       System.out.println(elem + " ");
     }
  }
}
