

define <8 x i32> @doOper(<16 x i32> %a , <16 x i32> %b) {
   %add = add <16 x i32> %a, %b
   %ret = shufflevector <16 x i32> %add , <16 x i32> undef , <8 x i32> < i32 0 , i32 1, i32 2, i32 3 ,i32 4 ,i32 5, i32 6, i32 7>
   %add1 =  add <8 x i32> %ret , <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1 , i32 1>
   ret <8 x i32> %add1
}

define <8 x i32> @doOper1(<8 x i32> %a , <8 x i32> %b) {
   %add = add <8 x i32> %a, %b
   ret <8 x i32> %add
}
