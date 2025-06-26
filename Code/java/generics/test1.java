
class MyClass<T> {
  T[] arr;
  int len;
  MyClass(T [] arr, int len) {
    System.out.println(arr.getClass());
    this.arr = arr;
    this.len = len;
  }
  T getVal(int idx) {
    return arr[idx];
  }
}

public class test1 {
 public static void main(String [] args) {
    Integer [] arr = new Integer[1024];
    for(int i = 0 ; i < 1024; i++) {
       arr[i] = Integer.valueOf(i);
    } 
    var obj = new MyClass<>(arr,10);
    System.out.println(obj.getVal(2)); 
 }
}
