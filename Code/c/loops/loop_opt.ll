; ModuleID = 'loop.ll'
source_filename = "loop.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: noinline nounwind
define dso_local void @doSum(float* %res, float* %a, float* %b) #0 {
entry:
  %cmp1 = icmp slt i32 0, 23
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.0 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %a, i32 %i.0
  %0 = load float, float* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds float, float* %b, i32 %i.0
  %1 = load float, float* %arrayidx1, align 4
  %add = fadd float %0, %1
  %arrayidx2 = getelementptr inbounds float, float* %res, i32 %i.0
  store float %add, float* %arrayidx2, align 4
  %inc = add nsw i32 %i.0, 1
  %cmp = icmp slt i32 %inc, 23
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"}
