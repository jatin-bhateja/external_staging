; ModuleID = 'loop.ll'
source_filename = "loop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doSum(i32 %val) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.02 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %res.01 = phi i32 [ undef, %entry ], [ %add, %for.body ]
  %add = add nsw i32 %res.01, %val
  %inc = add nsw i32 %i.02, 1
  %cmp = icmp slt i32 %inc, 16
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %res.0.lcssa = phi i32 [ %add, %for.body ]
  ret i32 %res.0.lcssa
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 60fda03659048b6ea10625d090572a840e09f6a2) (http://github.com/llvm-mirror/llvm.git d3d04773fe8e213c076fa7ee1ba372ab0dff834f)"}
