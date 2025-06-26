
import java.nio.file.*;

class test {

  public static void workload(Path path, boolean print) {
    path = path.normalize();
  }

  public static void main(String [] args) {
     Path path = FileSystems.getDefault().getPath("..", "array_copy","array_copy.java");

     // Warmup
     for (int i = 0 ; i < 9000000 ; i++) {
        workload(path, false);
     }

     // Measured iterations.
     long t1 = System.nanoTime();
     for (int i = 0 ; i < 1000000 ; i++) {
        workload(path, true);
     }
     long t2 = System.nanoTime();
     
     System.out.println("[Time] : " + (t2-t1)); 
  }
}
