
import java.util.Arrays;

public class caller_callee {
    public int callee(int [] arr) {
       return Arrays.hashCode(arr);
    }
    public static void main(String [] args) {
       int [] arr = {1,2,3,4};
       caller_callee obj  = new caller_callee();
       System.out.println(obj.callee(arr));
    }
}
