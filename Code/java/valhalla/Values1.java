
value class ArrayCursor<T> {
    T[] array;
    int offset;

    public ArrayCursor(T[] array, int offset) { 
        this.array = array;
        this.offset = offset;
    }

    public boolean hasNext() { 
        return offset < array.length;
    }

    public T next() { 
        return array[offset];
    }

    public ArrayCursor<T> advance() { 
        return new ArrayCursor<>(array, offset+1);
    }
}


// 1) Handling for primitive arrays embedded in value types.
// 2) Nullable reference handling in value objects.
// 3) Primitive class scalarization 
//    - Scalar field 
//    - primitive array field.
// 4) Primitive to value reference conversion scenarios.
// 5) Passing scalarized fields method accepting instances.
//    - Unpacking and packing.
// 6) VectorAPI:
//    - Unboxing already loads values in to vectors.
//    - Boxing-unboxing optimization removes the boxes and works dirtly over vectors.
//    - Passing Vector to method, currnetly boxes he values, this can be optimized
//      by directly passing vectors from caller to callee.
//    - Check vector calling convention.
public class Values1 {
 public static void main(String [] args) {
   int res = 0;
   Integer [] arr = new Integer[1024];
   for(int i = 0 ; i  < arr.length ; i++ ) {
      arr[i] = i;
   }
   var cur = new ArrayCursor<>(arr, 0);
   for(int i = 0; i < 1000000; i++ ) {
      while(cur.hasNext()) {
         res += cur.next();
         cur = cur.advance();
      }
      cur = new ArrayCursor<>(arr, 0);
   }
   System.out.println("[RES] = " + res);
 }
}
