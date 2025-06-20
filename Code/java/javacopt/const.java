

class test {
 boolean cond;
 static final int VAL = 20;
 public int getVal() {
   return VAL;
 }
 public test () {
   //if (true == cond) 
      //VAL = 10;
   //else if (false == cond)
   //else 
      //VAL = 20;
 }
 public static void main(String [] args) {
   test obj = new test();
   int local =  obj.getVal();
   System.out.println("Res = " + local);
 }
}
