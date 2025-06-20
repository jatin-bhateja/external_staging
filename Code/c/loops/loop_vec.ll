; ModuleID = 'loop_opt.ll'
source_filename = "loop.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @doSum(float* %res, float* %a, float* %b) #0 {
entry:
  %res1 = bitcast float* %res to i8*
  %a3 = bitcast float* %a to i8*
  %b6 = bitcast float* %b to i8*
  %scevgep = getelementptr float, float* %res, i64 20
  %scevgep2 = bitcast float* %scevgep to i8*
  %scevgep4 = getelementptr float, float* %a, i64 16
  %scevgep45 = bitcast float* %scevgep4 to i8*
  %scevgep7 = getelementptr float, float* %b, i64 16
  %scevgep78 = bitcast float* %scevgep7 to i8*
  %bound0 = icmp ult i8* %res1, %scevgep45
  %bound1 = icmp ult i8* %a3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult i8* %res1, %scevgep78
  %bound110 = icmp ult i8* %b6, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  %memcheck.conflict = and i1 %conflict.rdx, true
  br i1 %memcheck.conflict, label %scalar.ph, label %vector.body

vector.body:                                      ; preds = %entry, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %entry ]
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %0 = add i32 %index, 0
  %1 = sext i32 %0 to i64
  %2 = getelementptr inbounds float, float* %a, i64 %1
  %3 = getelementptr inbounds float, float* %2, i32 0
  %4 = bitcast float* %3 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %4, align 4, !alias.scope !2
  %5 = sext i32 %0 to i64
  %6 = getelementptr inbounds float, float* %b, i64 %5
  %7 = getelementptr inbounds float, float* %6, i32 0
  %8 = bitcast float* %7 to <4 x float>*
  %wide.load12 = load <4 x float>, <4 x float>* %8, align 4, !alias.scope !5
  %9 = fadd <4 x float> %wide.load, %wide.load12
  %10 = sext i32 %0 to i64
  %11 = getelementptr inbounds float, float* %res, i64 %10
  %12 = getelementptr inbounds float, float* %11, i32 0
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %9, <4 x float>* %13, align 4, !alias.scope !7, !noalias !9
  %14 = sext i32 %0 to i64
  %15 = getelementptr inbounds float, float* %res, i64 %14
  %16 = getelementptr inbounds float, float* %15, i32 0
  %17 = bitcast float* %16 to <4 x float>*
  %wide.load13 = load <4 x float>, <4 x float>* %17, align 4, !alias.scope !7, !noalias !9
  %18 = add nsw i32 %0, 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %res, i64 %19
  %21 = getelementptr inbounds float, float* %20, i32 0
  %22 = bitcast float* %21 to <4 x float>*
  store <4 x float> %wide.load13, <4 x float>* %22, align 4, !alias.scope !7, !noalias !9
  %index.next = add i32 %index, 4
  %23 = icmp eq i32 %index.next, 16
  br i1 %23, label %middle.block, label %vector.body, !llvm.loop !10

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 16, 16
  br i1 %cmp.n, label %for.end, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %entry
  %bc.resume.val = phi i32 [ 16, %middle.block ], [ 0, %entry ]
  br label %for.body

for.body:                                         ; preds = %for.body, %scalar.ph
  %i.01 = phi i32 [ %bc.resume.val, %scalar.ph ], [ %inc, %for.body ]
  %idxprom = sext i32 %i.01 to i64
  %arrayidx = getelementptr inbounds float, float* %a, i64 %idxprom
  %24 = load float, float* %arrayidx, align 4
  %idxprom1 = sext i32 %i.01 to i64
  %arrayidx2 = getelementptr inbounds float, float* %b, i64 %idxprom1
  %25 = load float, float* %arrayidx2, align 4
  %add = fadd float %24, %25
  %idxprom3 = sext i32 %i.01 to i64
  %arrayidx4 = getelementptr inbounds float, float* %res, i64 %idxprom3
  store float %add, float* %arrayidx4, align 4
  %idxprom5 = sext i32 %i.01 to i64
  %arrayidx6 = getelementptr inbounds float, float* %res, i64 %idxprom5
  %26 = load float, float* %arrayidx6, align 4
  %add7 = add nsw i32 %i.01, 4
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds float, float* %res, i64 %idxprom8
  store float %26, float* %arrayidx9, align 4
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 16
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !12

for.end:                                          ; preds = %middle.block, %for.body
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 60fda03659048b6ea10625d090572a840e09f6a2) (http://github.com/llvm-mirror/llvm.git d3d04773fe8e213c076fa7ee1ba372ab0dff834f)"}
!2 = !{!3}
!3 = distinct !{!3, !4}
!4 = distinct !{!4, !"LVerDomain"}
!5 = !{!6}
!6 = distinct !{!6, !4}
!7 = !{!8}
!8 = distinct !{!8, !4}
!9 = !{!3, !6}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !11}
