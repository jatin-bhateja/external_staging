

public class test {
   public static int micro(int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12) {
      int temp1 = i1 + i2;
      int temp2 = i3 + i4;
      int temp3 = i5 + i6;
      int temp4 = i7 + i8;
      int temp5 = i9 + i10;
      int temp6 = i11 + i12;
      int temp7 = temp1 + i12;
      int temp8 = temp2 + i11;
      int temp9 = temp3 + i10;
      int temp10 = temp4 + i9;
      int temp11 = temp5 + i8 * i8;
      int temp12 = temp6 + i7 * i10 / temp1;
      int temp13 = temp7 + i6 * i11 * temp2;
      int temp14 = temp13 * temp1 * i1;
      int temp15 = temp14 * temp2 * i2;
      int temp16 = temp15 * temp3 * i3 * temp8;
      // temp1 - temp16 : Def

      int temp17 = temp16 * temp4 * i4 * temp9 / temp6;   // t17 will interfere with 16 live LRGs
      int temp18 = temp17 * temp5 * i5 * temp10 / temp7;  // t18 will interfere with 16 live LRGs
      int temp19 = temp18 * temp6 * i6 * temp11 / temp8;

      // temp1 - temp16 : Use
      int temp20 = temp7 * temp19 * i12 * temp1 * temp2 * temp3 * temp4 * temp5 * temp6 * temp7 * temp8 * temp9 * temp10 * temp11 * temp12 * temp13 * temp14 * temp15 * temp16;
      return temp20;
   } 
 
   public static void main(String [] args) {
      int res = 0;
      for (int i = 1; i < 1000000; i++) {
          res += micro(i, i + 1, i + 2, i + 3, i + 4, i + 5, i + 6, i + 7 , i + 8 ,i + 9, i + 10, i + 11);
      }
      System.out.println("[res] " + res);
   }
}
