; ModuleID = 'switch.c'
source_filename = "switch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @func(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  switch i32 %4, label %26 [
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
    i32 4, label %14
    i32 5, label %17
    i32 6, label %20
    i32 7, label %23
  ]

5:                                                ; preds = %1
  %6 = load i32, i32* %3, align 4
  %7 = add nsw i32 %6, 100
  store i32 %7, i32* %2, align 4
  br label %29

8:                                                ; preds = %1
  %9 = load i32, i32* %3, align 4
  %10 = add nsw i32 %9, 200
  store i32 %10, i32* %2, align 4
  br label %29

11:                                               ; preds = %1
  %12 = load i32, i32* %3, align 4
  %13 = add nsw i32 %12, 300
  store i32 %13, i32* %2, align 4
  br label %29

14:                                               ; preds = %1
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 400
  store i32 %16, i32* %2, align 4
  br label %29

17:                                               ; preds = %1
  %18 = load i32, i32* %3, align 4
  %19 = add nsw i32 %18, 500
  store i32 %19, i32* %2, align 4
  br label %29

20:                                               ; preds = %1
  %21 = load i32, i32* %3, align 4
  %22 = add nsw i32 %21, 600
  store i32 %22, i32* %2, align 4
  br label %29

23:                                               ; preds = %1
  %24 = load i32, i32* %3, align 4
  %25 = add nsw i32 %24, 700
  store i32 %25, i32* %2, align 4
  br label %29

26:                                               ; preds = %1
  %27 = load i32, i32* %3, align 4
  %28 = add nsw i32 %27, 10000
  store i32 %28, i32* %2, align 4
  br label %29

29:                                               ; preds = %26, %23, %20, %17, %14, %11, %8, %5
  %30 = load i32, i32* %2, align 4
  ret i32 %30
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1~18.04.2 "}
