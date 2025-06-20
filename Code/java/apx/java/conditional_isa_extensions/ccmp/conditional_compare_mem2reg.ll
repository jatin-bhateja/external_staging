; ModuleID = 'conditional_compare.ll'
source_filename = "conditional_compare.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @micro(i32 %0, i32 %1, i32 %2, i32 %3) #0 {
  %5 = icmp ne i32 %0, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %4
  %7 = icmp ne i32 %1, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %6
  %9 = add nsw i32 %2, %3
  br label %10

10:                                               ; preds = %8, %6, %4
  %.0 = phi i32 [ %9, %8 ], [ 0, %6 ], [ 0, %4 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
