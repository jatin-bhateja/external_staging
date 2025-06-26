
import sun.nio.fs.*;

class test {
  public static StringBuilder sb;

  public static void workload(String first, boolean print) {
    sb.append(first);
    if (print)
       System.out.println(sb);
  }

  public static void main(String [] args) {
     StringBuilder sb = new StringBuilder();
     String fixed = new String("sun.hotspot.parser.DiagnosticCommand ");
     // Warmup
     for (int i = 0 ; i < 9000000 ; i++) {
        workload(fixed, false);
     }
     sb.delete(0, sb.length());
     // Measured iterations.
     long t1 = System.nanoTime();
     for (int i = 0 ; i < 100000 ; i++) {
        workload(fixed, true);
     }
     long t2 = System.nanoTime();
     
     System.out.println("[Time] : " + (t2-t1)); 
  }
}
