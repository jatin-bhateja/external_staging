

class test {
  public static int LEN = 0;

  public static int micro(int [] arr1, int [] arr2) {
    int Res = 0;
    int [] temp = new int[arr1.length];
    for(int i = 0 ; i < arr1.length;  i++)
       temp[i] = arr1[i] + arr2[i];
    for(int i = 0 ; i < temp.length; i++)
       Res += temp[i]; 
    return Res;
  }

  public static void main(String [] args) {
     LEN = Integer.parseInt(args[0]);
     int Res = 0;
     int [] arr1 = new int[LEN];
     int [] arr2 = new int[LEN];

     for(int i = 0 ; i < LEN ; i++) {
       arr1[i] = i;
       arr2[i] = i;
     } 

     for(int i = 0 ; i < 10000000 ; i++) {
        Res+= micro(arr1, arr2);
     }
        
     System.out.println("Res = " + Res);
   }
}

