
import jdk.incubator.vector.*;

public class nullcast {
   public static void main(String [] args) {
       Vector<Integer> vec = null;
       System.out.println(vec);       
       System.out.println((IntVector)null);
   } 
} 
