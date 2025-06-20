; ModuleID = 'loop_unroll.c'
source_filename = "loop_unroll.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind uwtable
define dso_local void @doSum(float* nocapture %res, float* nocapture readonly %a, float* nocapture readonly %b) local_unnamed_addr #0 {
entry:
  %0 = load float, float* %a, align 4, !tbaa !2
  %1 = load float, float* %b, align 4, !tbaa !2
  %add = fadd float %0, %1
  store float %add, float* %res, align 4, !tbaa !2
  %arrayidx.1 = getelementptr inbounds float, float* %a, i64 1
  %2 = load float, float* %arrayidx.1, align 4, !tbaa !2
  %arrayidx2.1 = getelementptr inbounds float, float* %b, i64 1
  %3 = load float, float* %arrayidx2.1, align 4, !tbaa !2
  %add.1 = fadd float %2, %3
  %arrayidx4.1 = getelementptr inbounds float, float* %res, i64 1
  store float %add.1, float* %arrayidx4.1, align 4, !tbaa !2
  %arrayidx.2 = getelementptr inbounds float, float* %a, i64 2
  %4 = load float, float* %arrayidx.2, align 4, !tbaa !2
  %arrayidx2.2 = getelementptr inbounds float, float* %b, i64 2
  %5 = load float, float* %arrayidx2.2, align 4, !tbaa !2
  %add.2 = fadd float %4, %5
  %arrayidx4.2 = getelementptr inbounds float, float* %res, i64 2
  store float %add.2, float* %arrayidx4.2, align 4, !tbaa !2
  %arrayidx.3 = getelementptr inbounds float, float* %a, i64 3
  %6 = load float, float* %arrayidx.3, align 4, !tbaa !2
  %arrayidx2.3 = getelementptr inbounds float, float* %b, i64 3
  %7 = load float, float* %arrayidx2.3, align 4, !tbaa !2
  %add.3 = fadd float %6, %7
  %arrayidx4.3 = getelementptr inbounds float, float* %res, i64 3
  store float %add.3, float* %arrayidx4.3, align 4, !tbaa !2
  %arrayidx.4 = getelementptr inbounds float, float* %a, i64 4
  %8 = load float, float* %arrayidx.4, align 4, !tbaa !2
  %arrayidx2.4 = getelementptr inbounds float, float* %b, i64 4
  %9 = load float, float* %arrayidx2.4, align 4, !tbaa !2
  %add.4 = fadd float %8, %9
  %arrayidx4.4 = getelementptr inbounds float, float* %res, i64 4
  store float %add.4, float* %arrayidx4.4, align 4, !tbaa !2
  %arrayidx.5 = getelementptr inbounds float, float* %a, i64 5
  %10 = load float, float* %arrayidx.5, align 4, !tbaa !2
  %arrayidx2.5 = getelementptr inbounds float, float* %b, i64 5
  %11 = load float, float* %arrayidx2.5, align 4, !tbaa !2
  %add.5 = fadd float %10, %11
  %arrayidx4.5 = getelementptr inbounds float, float* %res, i64 5
  store float %add.5, float* %arrayidx4.5, align 4, !tbaa !2
  %arrayidx.6 = getelementptr inbounds float, float* %a, i64 6
  %12 = load float, float* %arrayidx.6, align 4, !tbaa !2
  %arrayidx2.6 = getelementptr inbounds float, float* %b, i64 6
  %13 = load float, float* %arrayidx2.6, align 4, !tbaa !2
  %add.6 = fadd float %12, %13
  %arrayidx4.6 = getelementptr inbounds float, float* %res, i64 6
  store float %add.6, float* %arrayidx4.6, align 4, !tbaa !2
  %arrayidx.7 = getelementptr inbounds float, float* %a, i64 7
  %14 = load float, float* %arrayidx.7, align 4, !tbaa !2
  %arrayidx2.7 = getelementptr inbounds float, float* %b, i64 7
  %15 = load float, float* %arrayidx2.7, align 4, !tbaa !2
  %add.7 = fadd float %14, %15
  %arrayidx4.7 = getelementptr inbounds float, float* %res, i64 7
  store float %add.7, float* %arrayidx4.7, align 4, !tbaa !2
  %arrayidx.8 = getelementptr inbounds float, float* %a, i64 8
  %16 = load float, float* %arrayidx.8, align 4, !tbaa !2
  %arrayidx2.8 = getelementptr inbounds float, float* %b, i64 8
  %17 = load float, float* %arrayidx2.8, align 4, !tbaa !2
  %add.8 = fadd float %16, %17
  %arrayidx4.8 = getelementptr inbounds float, float* %res, i64 8
  store float %add.8, float* %arrayidx4.8, align 4, !tbaa !2
  %arrayidx.9 = getelementptr inbounds float, float* %a, i64 9
  %18 = load float, float* %arrayidx.9, align 4, !tbaa !2
  %arrayidx2.9 = getelementptr inbounds float, float* %b, i64 9
  %19 = load float, float* %arrayidx2.9, align 4, !tbaa !2
  %add.9 = fadd float %18, %19
  %arrayidx4.9 = getelementptr inbounds float, float* %res, i64 9
  store float %add.9, float* %arrayidx4.9, align 4, !tbaa !2
  %arrayidx.10 = getelementptr inbounds float, float* %a, i64 10
  %20 = load float, float* %arrayidx.10, align 4, !tbaa !2
  %arrayidx2.10 = getelementptr inbounds float, float* %b, i64 10
  %21 = load float, float* %arrayidx2.10, align 4, !tbaa !2
  %add.10 = fadd float %20, %21
  %arrayidx4.10 = getelementptr inbounds float, float* %res, i64 10
  store float %add.10, float* %arrayidx4.10, align 4, !tbaa !2
  %arrayidx.11 = getelementptr inbounds float, float* %a, i64 11
  %22 = load float, float* %arrayidx.11, align 4, !tbaa !2
  %arrayidx2.11 = getelementptr inbounds float, float* %b, i64 11
  %23 = load float, float* %arrayidx2.11, align 4, !tbaa !2
  %add.11 = fadd float %22, %23
  %arrayidx4.11 = getelementptr inbounds float, float* %res, i64 11
  store float %add.11, float* %arrayidx4.11, align 4, !tbaa !2
  %arrayidx.12 = getelementptr inbounds float, float* %a, i64 12
  %24 = load float, float* %arrayidx.12, align 4, !tbaa !2
  %arrayidx2.12 = getelementptr inbounds float, float* %b, i64 12
  %25 = load float, float* %arrayidx2.12, align 4, !tbaa !2
  %add.12 = fadd float %24, %25
  %arrayidx4.12 = getelementptr inbounds float, float* %res, i64 12
  store float %add.12, float* %arrayidx4.12, align 4, !tbaa !2
  %arrayidx.13 = getelementptr inbounds float, float* %a, i64 13
  %26 = load float, float* %arrayidx.13, align 4, !tbaa !2
  %arrayidx2.13 = getelementptr inbounds float, float* %b, i64 13
  %27 = load float, float* %arrayidx2.13, align 4, !tbaa !2
  %add.13 = fadd float %26, %27
  %arrayidx4.13 = getelementptr inbounds float, float* %res, i64 13
  store float %add.13, float* %arrayidx4.13, align 4, !tbaa !2
  %arrayidx.14 = getelementptr inbounds float, float* %a, i64 14
  %28 = load float, float* %arrayidx.14, align 4, !tbaa !2
  %arrayidx2.14 = getelementptr inbounds float, float* %b, i64 14
  %29 = load float, float* %arrayidx2.14, align 4, !tbaa !2
  %add.14 = fadd float %28, %29
  %arrayidx4.14 = getelementptr inbounds float, float* %res, i64 14
  store float %add.14, float* %arrayidx4.14, align 4, !tbaa !2
  %arrayidx.15 = getelementptr inbounds float, float* %a, i64 15
  %30 = load float, float* %arrayidx.15, align 4, !tbaa !2
  %arrayidx2.15 = getelementptr inbounds float, float* %b, i64 15
  %31 = load float, float* %arrayidx2.15, align 4, !tbaa !2
  %add.15 = fadd float %30, %31
  %arrayidx4.15 = getelementptr inbounds float, float* %res, i64 15
  store float %add.15, float* %arrayidx4.15, align 4, !tbaa !2
  ret void
}

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"float", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
