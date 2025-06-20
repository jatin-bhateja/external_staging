; ModuleID = 'vec_opt.ll'
source_filename = "vec.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @war(float* %a) #0 {
entry:
  br i1 false, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %entry
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %induction1 = add <4 x i32> %broadcast.splat, <i32 4, i32 5, i32 6, i32 7>
  %0 = add i32 %index, 0
  %1 = add i32 %index, 4
  %2 = add nsw i32 %0, 1
  %3 = add nsw i32 %1, 1
  %4 = sext i32 %2 to i64
  %5 = sext i32 %3 to i64
  %6 = getelementptr inbounds float, float* %a, i64 %4
  %7 = getelementptr inbounds float, float* %a, i64 %5
  %8 = getelementptr inbounds float, float* %6, i32 0
  %9 = bitcast float* %8 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %9, align 4
  %10 = getelementptr inbounds float, float* %6, i32 4
  %11 = bitcast float* %10 to <4 x float>*
  %wide.load2 = load <4 x float>, <4 x float>* %11, align 4
  %12 = sext i32 %0 to i64
  %13 = sext i32 %1 to i64
  %14 = getelementptr inbounds float, float* %a, i64 %12
  %15 = getelementptr inbounds float, float* %a, i64 %13
  %16 = getelementptr inbounds float, float* %14, i32 0
  %17 = bitcast float* %16 to <4 x float>*
  store <4 x float> %wide.load, <4 x float>* %17, align 4
  %18 = getelementptr inbounds float, float* %14, i32 4
  %19 = bitcast float* %18 to <4 x float>*
  store <4 x float> %wide.load2, <4 x float>* %19, align 4
  %index.next = add i32 %index, 8
  %20 = icmp eq i32 %index.next, 1016
  br i1 %20, label %middle.block, label %vector.body, !llvm.loop !2

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 1023, 1016
  br i1 %cmp.n, label %for.end, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %entry
  %bc.resume.val = phi i32 [ 1016, %middle.block ], [ 0, %entry ]
  br label %for.body

for.body:                                         ; preds = %for.body, %scalar.ph
  %i.01 = phi i32 [ %bc.resume.val, %scalar.ph ], [ %inc, %for.body ]
  %add = add nsw i32 %i.01, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %a, i64 %idxprom
  %21 = load float, float* %arrayidx, align 4
  %idxprom1 = sext i32 %i.01 to i64
  %arrayidx2 = getelementptr inbounds float, float* %a, i64 %idxprom1
  store float %21, float* %arrayidx2, align 4
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 1023
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !4

for.end:                                          ; preds = %middle.block, %for.body
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @raw(float* %a) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %idxprom = sext i32 %i.01 to i64
  %arrayidx = getelementptr inbounds float, float* %a, i64 %idxprom
  %0 = load float, float* %arrayidx, align 4
  %add = add nsw i32 %i.01, 1
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds float, float* %a, i64 %idxprom1
  store float %0, float* %arrayidx2, align 4
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 1023
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.isvectorized", i32 1}
!4 = distinct !{!4, !5, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
