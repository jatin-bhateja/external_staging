; ModuleID = 'cpuid.c'
source_filename = "cpuid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Original OEM\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Intel Overdrive\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Dual Processor\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Intel Reserved\00", align 1
@__const.main.proct = private unnamed_addr constant [4 x i8*] [i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0)], align 16
@.str.4 = private unnamed_addr constant [10 x i8] c"EAX = %x\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"    Stepping ID : %x \0A \00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"    Model       : %x \0A \00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"    Family ID   : %x \0A \00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"    Proctype    : %s \0A \00", align 1
@.str.9 = private unnamed_addr constant [25 x i8] c"    Ext Model ID : %x \0A \00", align 1
@.str.10 = private unnamed_addr constant [25 x i8] c"    Ext Family ID : %x \0A\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"EBX = %x\0A\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"ECX = %x\0A\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"EDX = %x\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [4 x i8*], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %13 = bitcast [4 x i8*]* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %13, i8* align 16 bitcast ([4 x i8*]* @__const.main.proct to i8*), i64 32, i1 false)
  %14 = load i32, i32* %2, align 4
  %15 = call { i32, i32, i32, i32 } asm sideeffect "movl $0 , %eax \0A\09cpuid           \0A\09movl %eax , $0 \0A\09movl %ebx , $1 \0A\09movl %ecx , $2 \0A\09movl %edx , $3 \0A\09", "=r,=r,=r,=r,0,~{eax},~{ebx},~{ecx},~{edx},~{dirflag},~{fpsr},~{flags}"(i32 %14) #3, !srcloc !4
  %16 = extractvalue { i32, i32, i32, i32 } %15, 0
  %17 = extractvalue { i32, i32, i32, i32 } %15, 1
  %18 = extractvalue { i32, i32, i32, i32 } %15, 2
  %19 = extractvalue { i32, i32, i32, i32 } %15, 3
  store i32 %16, i32* %2, align 4
  store i32 %17, i32* %3, align 4
  store i32 %18, i32* %4, align 4
  store i32 %19, i32* %5, align 4
  %20 = load i32, i32* %2, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i32 %20)
  %22 = load i32, i32* %2, align 4
  %23 = and i32 %22, 15
  store i32 %23, i32* %7, align 4
  %24 = load i32, i32* %7, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i32 %24)
  %26 = load i32, i32* %2, align 4
  %27 = and i32 %26, 240
  %28 = ashr i32 %27, 4
  store i32 %28, i32* %8, align 4
  %29 = load i32, i32* %8, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0), i32 %29)
  %31 = load i32, i32* %2, align 4
  %32 = and i32 %31, 3840
  %33 = ashr i32 %32, 8
  store i32 %33, i32* %9, align 4
  %34 = load i32, i32* %9, align 4
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.7, i64 0, i64 0), i32 %34)
  %36 = load i32, i32* %2, align 4
  %37 = and i32 %36, 12288
  %38 = ashr i32 %37, 12
  store i32 %38, i32* %10, align 4
  %39 = load i32, i32* %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [4 x i8*], [4 x i8*]* %6, i64 0, i64 %40
  %42 = load i8*, i8** %41, align 8
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i64 0, i64 0), i8* %42)
  %44 = load i32, i32* %2, align 4
  %45 = and i32 %44, 983040
  %46 = ashr i32 %45, 16
  store i32 %46, i32* %11, align 4
  %47 = load i32, i32* %11, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.9, i64 0, i64 0), i32 %47)
  %49 = load i32, i32* %2, align 4
  %50 = and i32 %49, 267386880
  %51 = ashr i32 %50, 20
  store i32 %51, i32* %12, align 4
  %52 = load i32, i32* %12, align 4
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.10, i64 0, i64 0), i32 %52)
  %54 = load i32, i32* %3, align 4
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i64 0, i64 0), i32 %54)
  %56 = load i32, i32* %4, align 4
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12, i64 0, i64 0), i32 %56)
  %58 = load i32, i32* %5, align 4
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i64 0, i64 0), i32 %58)
  ret i32 %59
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="icelake-server" "target-features"="+adx,+aes,+avx,+avx2,+avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,+avx512ifma,+avx512vbmi,+avx512vbmi2,+avx512vl,+avx512vnni,+avx512vpopcntdq,+bmi,+bmi2,+clflushopt,+clwb,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+invpcid,+lzcnt,+mmx,+movbe,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+rdpid,+rdrnd,+rdseed,+sahf,+sgx,+sha,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+wbnoinvd,+x87,+xsave,+xsavec,+xsaveopt,+xsaves" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="icelake-server" "target-features"="+adx,+aes,+avx,+avx2,+avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,+avx512ifma,+avx512vbmi,+avx512vbmi2,+avx512vl,+avx512vnni,+avx512vpopcntdq,+bmi,+bmi2,+clflushopt,+clwb,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+gfni,+invpcid,+lzcnt,+mmx,+movbe,+pclmul,+pconfig,+pku,+popcnt,+prfchw,+rdpid,+rdrnd,+rdseed,+sahf,+sgx,+sha,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+vaes,+vpclmulqdq,+wbnoinvd,+x87,+xsave,+xsavec,+xsaveopt,+xsaves" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 4, !"cf-protection-return", i32 1}
!2 = !{i32 4, !"cf-protection-branch", i32 1}
!3 = !{!"clang version 10.0.0-4ubuntu1~18.04.2 "}
!4 = !{i32 198, i32 217, i32 256, i32 295, i32 334, i32 373, i32 412}
