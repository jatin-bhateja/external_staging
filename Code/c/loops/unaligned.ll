; ModuleID = 'unaligned.c'
source_filename = "unaligned.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [16 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16], align 64
@__const.main.b = private unnamed_addr constant [16 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16], align 64
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @loadVec(i32* %a, i32* %b, i32* %res) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %res.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  store i32* %res, i32** %res.addr, align 8
  call void asm sideeffect "vmovdqa $1 , %zmm0          \0A\09vmovdqa $2 ,  %zmm1          \0A\09vpaddd  %zmm1, %zmm0, %zmm0 \0A\09vmovdqa $1 , $0              \0A\09", "=*m,*m,*m,~{zmm0},~{zmm1},~{dirflag},~{fpsr},~{flags}"(i32** %res.addr, i32** %a.addr, i32** %b.addr) #3, !srcloc !2
  %0 = load i32*, i32** %res.addr, align 8
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 7
  %1 = load i32, i32* %arrayidx, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [16 x i32], align 64
  %b = alloca [16 x i32], align 64
  %res = alloca [16 x i32], align 64
  store i32 0, i32* %retval, align 4
  %0 = bitcast [16 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 64 %0, i8* align 64 bitcast ([16 x i32]* @__const.main.a to i8*), i64 64, i1 false)
  %1 = bitcast [16 x i32]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 64 %1, i8* align 64 bitcast ([16 x i32]* @__const.main.b to i8*), i64 64, i1 false)
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %a, i64 0, i64 0
  %arraydecay1 = getelementptr inbounds [16 x i32], [16 x i32]* %b, i64 0, i64 0
  %arraydecay2 = getelementptr inbounds [16 x i32], [16 x i32]* %res, i64 0, i64 0
  %call = call i32 @loadVec(i32* %arraydecay, i32* %arraydecay1, i32* %arraydecay2)
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %call)
  ret i32 %call3
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="skx" "target-features"="+adx,+aes,+avx,+avx2,+avx512bw,+avx512cd,+avx512dq,+avx512f,+avx512vl,+bmi,+bmi2,+clflushopt,+clwb,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+invpcid,+lzcnt,+mmx,+movbe,+mpx,+pclmul,+pku,+popcnt,+prfchw,+rdrnd,+rdseed,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsavec,+xsaveopt,+xsaves" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="skx" "target-features"="+adx,+aes,+avx,+avx2,+avx512bw,+avx512cd,+avx512dq,+avx512f,+avx512vl,+bmi,+bmi2,+clflushopt,+clwb,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+invpcid,+lzcnt,+mmx,+movbe,+mpx,+pclmul,+pku,+popcnt,+prfchw,+rdrnd,+rdseed,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsavec,+xsaveopt,+xsaves" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"}
!2 = !{i32 93, i32 125, i32 168, i32 212, i32 254}
