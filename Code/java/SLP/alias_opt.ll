; ModuleID = 'alias.ll'
source_filename = "alias.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @micro(i32* %0, i32* %1, i32* %2, i32* %3, i32 %4) #0 {
  br label %6

6:                                                ; preds = %5, %6
  %.013 = phi i32 [ 0, %5 ], [ %16, %6 ]
  %7 = sext i32 %.013 to i64
  %8 = getelementptr inbounds i32, i32* %2, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = sext i32 %.013 to i64
  %11 = getelementptr inbounds i32, i32* %3, i64 %10
  %12 = load i32, i32* %11, align 4
  %13 = add nsw i32 %9, %12
  %14 = sext i32 %.013 to i64
  %15 = getelementptr inbounds i32, i32* %1, i64 %14
  store i32 %13, i32* %15, align 4
  %16 = add nsw i32 %.013, 1
  %17 = icmp slt i32 %16, 1024
  br i1 %17, label %6, label %18

18:                                               ; preds = %6, %18
  %.02 = phi i32 [ %28, %18 ], [ 0, %6 ]
  %19 = sext i32 %.02 to i64
  %20 = getelementptr inbounds i32, i32* %2, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = sext i32 %.02 to i64
  %23 = getelementptr inbounds i32, i32* %3, i64 %22
  %24 = load i32, i32* %23, align 4
  %25 = mul nsw i32 %21, %24
  %26 = sext i32 %.02 to i64
  %27 = getelementptr inbounds i32, i32* %0, i64 %26
  store i32 %25, i32* %27, align 4
  %28 = add nsw i32 %.02, 1
  %29 = icmp slt i32 %28, 1024
  br i1 %29, label %18, label %30

30:                                               ; preds = %18
  %31 = getelementptr inbounds i32, i32* %0, i64 3
  %32 = load i32, i32* %31, align 4
  ret i32 %32
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
