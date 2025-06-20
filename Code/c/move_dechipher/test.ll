; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local <16 x i32> @func(<16 x i32>* byval(<16 x i32>) align 64, <16 x i32>* byval(<16 x i32>) align 64) #0 {
entry:
  %dst.addr = alloca <16 x i32>, align 64
  %src.addr = alloca <16 x i32>, align 64
  %dst = load <16 x i32>, <16 x i32>* %0, align 64
  %src = load <16 x i32>, <16 x i32>* %1, align 64
  store <16 x i32> %dst, <16 x i32>* %dst.addr, align 64
  store <16 x i32> %src, <16 x i32>* %src.addr, align 64
  %2 = load <16 x i32>, <16 x i32>* %src.addr, align 64
  %add = add <16 x i32> %2, <i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10>
  store <16 x i32> %add, <16 x i32>* %dst.addr, align 64
  %3 = load <16 x i32>, <16 x i32>* %dst.addr, align 64
  ret <16 x i32> %3
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="512" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git f35770b93323fd56b5f8e83116492ff4dc1e5126) (http://github.com/llvm-mirror/llvm.git 8322207d92e408fca8fa195f7573149792a1c719)"}
