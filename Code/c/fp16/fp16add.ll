; ModuleID = 'fp16add.c'
source_filename = "fp16add.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local half @add_constantfp16() #0 {
entry:
  %temp1 = alloca half, align 2
  %temp2 = alloca half, align 2
  store half 0xH7380, ptr %temp1, align 2
  store half 0xH7380, ptr %temp2, align 2
  %0 = load half, ptr %temp1, align 2
  %ext = fpext half %0 to float
  %1 = load half, ptr %temp2, align 2
  %ext1 = fpext half %1 to float
  %add = fadd float %ext, %ext1
  %unpromotion = fptrunc float %add to half
  ret half %unpromotion
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+avx512f,+cmov,+crc32,+cx8,+f16c,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git df38792efbdf8947bbf733ef81f183c0a11ffc97)"}
