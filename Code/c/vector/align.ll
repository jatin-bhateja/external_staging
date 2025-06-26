; ModuleID = 'align.c'
source_filename = "align.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myint = global i32 1, align 4
@mychar = global [6 x i8] c"abcdef", align 64
@main.mychar_local = private unnamed_addr constant [6 x i8] c"abcdef", align 16
@main.mydouble_local2 = private unnamed_addr constant [3 x double] [double 1.200000e+00, double 1.200000e+00, double 1.200000e+00], align 64

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [6 x i8], align 16
  %3 = alloca [3 x double], align 64
  store i32 0, i32* %1, align 4
  %4 = bitcast [6 x i8]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @main.mychar_local, i32 0, i32 0), i64 6, i32 16, i1 false)
  %5 = bitcast [3 x double]* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* bitcast ([3 x double]* @main.mydouble_local2 to i8*), i64 24, i32 64, i1 false)
  %6 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 4
  %7 = load i8, i8* %6, align 4
  %8 = sext i8 %7 to i32
  ret i32 %8
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
