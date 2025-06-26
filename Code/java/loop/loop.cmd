javad -XX:CompileOnly='loop::doSum' -XX:LoopMaxUnroll=4 -XX:LoopUnrollLimit=4  -XX:CompileCommand='print,loop::doSum' -XX:+PrintIdeal -XX:+LogCompilation -cp . loop
