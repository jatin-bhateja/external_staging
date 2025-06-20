; ModuleID = 'loop_opt.ll'
source_filename = "loop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @doSum(float* %res, float* %a, float* %b) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %idxprom = sext i32 %i.01 to i64
  %arrayidx = getelementptr inbounds float, float* %a, i64 %idxprom
  %0 = load float, float* %arrayidx, align 4
  %idxprom1 = sext i32 %i.01 to i64
  %arrayidx2 = getelementptr inbounds float, float* %b, i64 %idxprom1
  %1 = load float, float* %arrayidx2, align 4
  %add = fadd float %0, %1
  %idxprom3 = sext i32 %i.01 to i64
  %arrayidx4 = getelementptr inbounds float, float* %res, i64 %idxprom3
  store float %add, float* %arrayidx4, align 4
  %idxprom5 = sext i32 %i.01 to i64
  %arrayidx6 = getelementptr inbounds float, float* %res, i64 %idxprom5
  %2 = load float, float* %arrayidx6, align 4
  %add7 = add nsw i32 %i.01, 4
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds float, float* %res, i64 %idxprom8
  store float %2, float* %arrayidx9, align 4
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 16
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 60fda03659048b6ea10625d090572a840e09f6a2) (http://github.com/llvm-mirror/llvm.git d3d04773fe8e213c076fa7ee1ba372ab0dff834f)"}
