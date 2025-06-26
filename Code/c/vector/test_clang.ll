; ModuleID = 'test_clang.c'
source_filename = "test_clang.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"res[%d] = %lf\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define <8 x double> @vectorAdd(i16 signext, <8 x double>, <8 x double>) #0 {
  %4 = alloca i16, align 2
  %5 = alloca <8 x double>, align 64
  %6 = alloca <8 x double>, align 64
  %7 = alloca <8 x double>, align 64
  store i16 %0, i16* %4, align 2
  store <8 x double> %1, <8 x double>* %5, align 64
  store <8 x double> %2, <8 x double>* %6, align 64
  %8 = load i16, i16* %4, align 2
  %9 = load <8 x double>, <8 x double>* %5, align 64
  %10 = load <8 x double>, <8 x double>* %6, align 64
  %11 = call <8 x double> asm sideeffect "kmovw $1 , %k1                        \0A\09vmovapd $2  ,  %zmm1                  \0A\09vaddpd  $3  , %zmm1  , %zmm0$($(%k1$)$) \0A\09vmovapd %zmm0 ,  $0$($(%k1$)$)           \0A\09", "=v,k,v,v,~{zmm0},~{zmm1},~{k1},~{dirflag},~{fpsr},~{flags}"(i16 %8, <8 x double> %9, <8 x double> %10) #2, !srcloc !2
  store <8 x double> %11, <8 x double>* %7, align 64
  %12 = load <8 x double>, <8 x double>* %7, align 64
  ret <8 x double> %12
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca <8 x double>, align 64
  %3 = alloca <8 x double>, align 64
  %4 = alloca <8 x double>, align 64
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store <8 x double> zeroinitializer, <8 x double>* %2, align 64
  store <8 x double> <double 1.100000e+00, double 2.200000e+00, double 3.300000e+00, double 4.400000e+00, double 5.500000e+00, double 6.600000e+00, double 7.700000e+00, double 8.800000e+00>, <8 x double>* %3, align 64
  store <8 x double> <double 1.100000e+00, double 2.200000e+00, double 3.300000e+00, double 4.400000e+00, double 5.500000e+00, double 6.600000e+00, double 7.700000e+00, double 8.800000e+00>, <8 x double>* %4, align 64
  store i16 0, i16* %5, align 2
  %7 = load i16, i16* %5, align 2
  %8 = load <8 x double>, <8 x double>* %3, align 64
  %9 = load <8 x double>, <8 x double>* %4, align 64
  %10 = call <8 x double> @vectorAdd(i16 signext %7, <8 x double> %8, <8 x double> %9)
  store <8 x double> %10, <8 x double>* %2, align 64
  store i32 0, i32* %6, align 4
  br label %11

; <label>:11:                                     ; preds = %20, %0
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %12, 8
  br i1 %13, label %14, label %23

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %6, align 4
  %16 = load <8 x double>, <8 x double>* %2, align 64
  %17 = load i32, i32* %6, align 4
  %18 = extractelement <8 x double> %16, i32 %17
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %15, double %18)
  br label %20

; <label>:20:                                     ; preds = %14
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %11

; <label>:23:                                     ; preds = %11
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+avx512f,+f16c,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+avx512f,+f16c,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!2 = !{i32 210, i32 252, i32 304, i32 354, i32 404}
