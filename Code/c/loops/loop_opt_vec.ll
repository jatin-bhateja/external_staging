; ModuleID = 'loop_opt.ll'
source_filename = "loop.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: noinline nounwind
define dso_local void @doSum(float* %res, float* %a, float* %b) #0 {
entry:
  %res1 = bitcast float* %res to i8*
  %a3 = bitcast float* %a to i8*
  %b6 = bitcast float* %b to i8*
  %cmp1 = icmp slt i32 0, 23
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br i1 false, label %scalar.ph, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph
  %scevgep = getelementptr float, float* %res, i32 23
  %scevgep2 = bitcast float* %scevgep to i8*
  %scevgep4 = getelementptr float, float* %a, i32 23
  %scevgep45 = bitcast float* %scevgep4 to i8*
  %scevgep7 = getelementptr float, float* %b, i32 23
  %scevgep78 = bitcast float* %scevgep7 to i8*
  %bound0 = icmp ult i8* %res1, %scevgep45
  %bound1 = icmp ult i8* %a3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult i8* %res1, %scevgep78
  %bound110 = icmp ult i8* %b6, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  %memcheck.conflict = and i1 %conflict.rdx, true
  br i1 %memcheck.conflict, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = add i32 %index, 0
  %1 = getelementptr inbounds float, float* %a, i32 %0
  %2 = getelementptr inbounds float, float* %1, i32 0
  %3 = bitcast float* %2 to <16 x float>*
  %wide.load = load <16 x float>, <16 x float>* %3, align 4, !alias.scope !3
  %4 = getelementptr inbounds float, float* %b, i32 %0
  %5 = getelementptr inbounds float, float* %4, i32 0
  %6 = bitcast float* %5 to <16 x float>*
  %wide.load12 = load <16 x float>, <16 x float>* %6, align 4, !alias.scope !6
  %7 = fadd <16 x float> %wide.load, %wide.load12
  %8 = getelementptr inbounds float, float* %res, i32 %0
  %9 = getelementptr inbounds float, float* %8, i32 0
  %10 = bitcast float* %9 to <16 x float>*
  store <16 x float> %7, <16 x float>* %10, align 4, !alias.scope !8, !noalias !10
  %index.next = add i32 %index, 16
  %11 = icmp eq i32 %index.next, 16
  br i1 %11, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 23, 16
  br i1 %cmp.n, label %for.cond.for.end_crit_edge, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %vector.memcheck, %for.body.lr.ph
  %bc.resume.val = phi i32 [ 16, %middle.block ], [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck ]
  br label %for.body

for.body:                                         ; preds = %for.body, %scalar.ph
  %i.0 = phi i32 [ %bc.resume.val, %scalar.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float, float* %a, i32 %i.0
  %12 = load float, float* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds float, float* %b, i32 %i.0
  %13 = load float, float* %arrayidx1, align 4
  %add = fadd float %12, %13
  %arrayidx2 = getelementptr inbounds float, float* %res, i32 %i.0
  store float %add, float* %arrayidx2, align 4
  %inc = add nsw i32 %i.0, 1
  %cmp = icmp slt i32 %inc, 23
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !13

for.cond.for.end_crit_edge:                       ; preds = %middle.block, %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="skx" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!4, !7}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = distinct !{!13, !12}
