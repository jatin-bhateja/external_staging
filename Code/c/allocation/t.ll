; ModuleID = 't.c'
source_filename = "t.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local <2 x i64> @doSum(<2 x i64> %a, <2 x i64> %b) #0 {
entry:
  %a.addr = alloca <2 x i64>, align 16
  %b.addr = alloca <2 x i64>, align 16
  store <2 x i64> %a, <2 x i64>* %a.addr, align 16
  store <2 x i64> %b, <2 x i64>* %b.addr, align 16
  %0 = load <2 x i64>, <2 x i64>* %a.addr, align 16
  %1 = load <2 x i64>, <2 x i64>* %b.addr, align 16
  %add = add <2 x i64> %0, %1
  ret <2 x i64> %add
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 0b3908b51cbf65f3bcf18f2503532ae49f80a91b) (http://github.com/llvm-mirror/llvm.git 52536b57c44723d1aae559e04a427181778099ff)"}
