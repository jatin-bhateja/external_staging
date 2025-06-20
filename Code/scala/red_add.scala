
import java.util.Arrays

object red_add {
   def micro(arr : Array[Int]) : Int = {
      var i : Int = 0
      var res : Int = 0
      var elem : Int = 0
      for (elem <- arr) {
         res += arr(i) 
      }
      return res
   }
   
   def main(args : Array[String]) {
      var res : Int = 0
      var arr : Array[Int] = new Array[Int](1024)
      Arrays.fill(arr, 10)
      var i : Int = 0
      for (i <- 0 to 10000) {
         res += micro(arr)
      } 
      println("[res]  " + res)
   }
}
