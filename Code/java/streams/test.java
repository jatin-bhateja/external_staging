
import java.util.List;
import java.util.ArrayList;

class test {
  public static void main() {
     List<Integer> lint = new ArrayList<Integer>();
     lint.add(10);
     lint.add(12);
     lint.add(15);
     lint.add(14);
     lint.add(16);

     var res = lint.stream().filter( m -> m > 12).toArray();
     System.out.println(res);
  }


}
