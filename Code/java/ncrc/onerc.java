

class ncrc {
  public static void func(int [] arr, int index) {
     arr[index] =  10;
  }

  public static void main(String [] args) {
    int sum = 0;
    int [] arr = new int[1024];
    for(int i = 0 ; i < 1024; i++)
       arr[i] = i; 

    for(int i = 0 ; i < 1000000 ; i++)
       func(arr, i % 1024);  

    System.out.println("Res = " + sum);
  }
}
