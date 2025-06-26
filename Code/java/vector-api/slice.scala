import jdk.incubator.vector.IntVector
import java.util.Arrays

object slice {
  val SPECIES = IntVector.SPECIES_256

  def micro(origin: Int, src1 : Array[Int] , src2 : Array[Int] , res : Array[Int]) {
     var vec1 = IntVector.fromArray(SPECIES, src1, 0)
     var vec2 = IntVector.fromArray(SPECIES, src1, 0)
     vec1.slice(origin, vec2)
         .intoArray(res, 0)
  }

  def main(args : Array[String]) {
     var i : Int = 0
     var elem : Int = 0
     var origin =  Integer.parseInt(args(0))
     var src1 = new Array[Int](16)
     var src2 = new Array[Int](16)
     var res  = new Array[Int](16)
     Arrays.fill(src1, 10)
     Arrays.fill(src2, 20)
     for (i <- 0 to 10000) {
        micro(origin, src1, src2, res) 
     }
     for (elem <- res) {
       println(elem)
     }
  }
}
