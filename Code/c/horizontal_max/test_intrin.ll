; ModuleID = 'test_intrin.c'
source_filename = "test_intrin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"Res = %f..\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @JNI_MinReduction_512(<8 x double> %vec) #0 {
entry:
  %__a.addr.i10.i = alloca <4 x double>, align 32
  %__b.addr.i11.i = alloca <4 x double>, align 32
  %__a.addr.i8.i = alloca <2 x double>, align 16
  %__b.addr.i9.i = alloca <2 x double>, align 16
  %__a.addr.i.i = alloca <2 x double>, align 16
  %__b.addr.i.i = alloca <2 x double>, align 16
  %__V.addr.i = alloca <8 x double>, align 64
  %__t1.i = alloca <4 x double>, align 32
  %__t2.i = alloca <4 x double>, align 32
  %__t3.i = alloca <4 x double>, align 32
  %__t4.i = alloca <2 x double>, align 16
  %__t5.i = alloca <2 x double>, align 16
  %__t6.i = alloca <2 x double>, align 16
  %__t7.i = alloca <2 x double>, align 16
  %__t8.i = alloca <2 x double>, align 16
  %vec.addr = alloca <8 x double>, align 64
  store <8 x double> %vec, <8 x double>* %vec.addr, align 64
  %0 = load <8 x double>, <8 x double>* %vec.addr, align 64
  store <8 x double> %0, <8 x double>* %__V.addr.i, align 64
  %1 = load <8 x double>, <8 x double>* %__V.addr.i, align 64
  %extract.i = shufflevector <8 x double> %1, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  store <4 x double> %extract.i, <4 x double>* %__t1.i, align 32
  %2 = load <8 x double>, <8 x double>* %__V.addr.i, align 64
  %extract2.i = shufflevector <8 x double> %2, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  store <4 x double> %extract2.i, <4 x double>* %__t2.i, align 32
  %3 = load <4 x double>, <4 x double>* %__t1.i, align 32
  %4 = load <4 x double>, <4 x double>* %__t2.i, align 32
  store <4 x double> %3, <4 x double>* %__a.addr.i10.i, align 32
  store <4 x double> %4, <4 x double>* %__b.addr.i11.i, align 32
  %5 = load <4 x double>, <4 x double>* %__a.addr.i10.i, align 32
  %6 = load <4 x double>, <4 x double>* %__b.addr.i11.i, align 32
  %7 = call <4 x double> @llvm.x86.avx.min.pd.256(<4 x double> %5, <4 x double> %6) #4
  store <4 x double> %7, <4 x double>* %__t3.i, align 32
  %8 = load <4 x double>, <4 x double>* %__t3.i, align 32
  %extract4.i = shufflevector <4 x double> %8, <4 x double> undef, <2 x i32> <i32 0, i32 1>
  store <2 x double> %extract4.i, <2 x double>* %__t4.i, align 16
  %9 = load <4 x double>, <4 x double>* %__t3.i, align 32
  %extract5.i = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 2, i32 3>
  store <2 x double> %extract5.i, <2 x double>* %__t5.i, align 16
  %10 = load <2 x double>, <2 x double>* %__t4.i, align 16
  %11 = load <2 x double>, <2 x double>* %__t5.i, align 16
  store <2 x double> %10, <2 x double>* %__a.addr.i8.i, align 16
  store <2 x double> %11, <2 x double>* %__b.addr.i9.i, align 16
  %12 = load <2 x double>, <2 x double>* %__a.addr.i8.i, align 16
  %13 = load <2 x double>, <2 x double>* %__b.addr.i9.i, align 16
  %14 = call <2 x double> @llvm.x86.sse2.min.pd(<2 x double> %12, <2 x double> %13) #4
  store <2 x double> %14, <2 x double>* %__t6.i, align 16
  %15 = load <2 x double>, <2 x double>* %__t6.i, align 16
  %16 = load <2 x double>, <2 x double>* %__t6.i, align 16
  %shuffle.i = shufflevector <2 x double> %15, <2 x double> %16, <2 x i32> <i32 1, i32 0>
  store <2 x double> %shuffle.i, <2 x double>* %__t7.i, align 16
  %17 = load <2 x double>, <2 x double>* %__t6.i, align 16
  %18 = load <2 x double>, <2 x double>* %__t7.i, align 16
  store <2 x double> %17, <2 x double>* %__a.addr.i.i, align 16
  store <2 x double> %18, <2 x double>* %__b.addr.i.i, align 16
  %19 = load <2 x double>, <2 x double>* %__a.addr.i.i, align 16
  %20 = load <2 x double>, <2 x double>* %__b.addr.i.i, align 16
  %21 = call <2 x double> @llvm.x86.sse2.min.pd(<2 x double> %19, <2 x double> %20) #4
  store <2 x double> %21, <2 x double>* %__t8.i, align 16
  %22 = load <2 x double>, <2 x double>* %__t8.i, align 16
  %vecext.i = extractelement <2 x double> %22, i32 0
  ret double %vecext.i
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %__p.addr.i = alloca i8*, align 8
  %retval.i = alloca i8*, align 8
  %__size.addr.i = alloca i64, align 8
  %__align.addr.i = alloca i64, align 8
  %__mallocedMemory.i = alloca i8*, align 8
  %retval = alloca i32, align 4
  %mem = alloca double*, align 8
  %i = alloca i32, align 4
  %arg = alloca <8 x double>, align 64
  %res = alloca double, align 8
  store i32 0, i32* %retval, align 4
  store i64 64, i64* %__size.addr.i, align 8
  store i64 64, i64* %__align.addr.i, align 8
  %0 = load i64, i64* %__align.addr.i, align 8
  %cmp.i = icmp eq i64 %0, 1
  br i1 %cmp.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  %1 = load i64, i64* %__size.addr.i, align 8
  %call.i = call noalias i8* @malloc(i64 %1) #4
  store i8* %call.i, i8** %retval.i, align 8
  br label %_mm_malloc.exit

if.end.i:                                         ; preds = %entry
  %2 = load i64, i64* %__align.addr.i, align 8
  %3 = load i64, i64* %__align.addr.i, align 8
  %sub.i = sub i64 %3, 1
  %and.i = and i64 %2, %sub.i
  %tobool.i = icmp ne i64 %and.i, 0
  br i1 %tobool.i, label %if.end3.i, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %if.end.i
  %4 = load i64, i64* %__align.addr.i, align 8
  %cmp1.i = icmp ult i64 %4, 8
  br i1 %cmp1.i, label %if.then2.i, label %if.end3.i

if.then2.i:                                       ; preds = %land.lhs.true.i
  store i64 8, i64* %__align.addr.i, align 8
  br label %if.end3.i

if.end3.i:                                        ; preds = %if.then2.i, %land.lhs.true.i, %if.end.i
  %5 = load i64, i64* %__align.addr.i, align 8
  %6 = load i64, i64* %__size.addr.i, align 8
  %call4.i = call i32 @posix_memalign(i8** %__mallocedMemory.i, i64 %5, i64 %6) #4
  %tobool5.i = icmp ne i32 %call4.i, 0
  br i1 %tobool5.i, label %if.then6.i, label %if.end7.i

if.then6.i:                                       ; preds = %if.end3.i
  store i8* null, i8** %retval.i, align 8
  br label %_mm_malloc.exit

if.end7.i:                                        ; preds = %if.end3.i
  %7 = load i8*, i8** %__mallocedMemory.i, align 8
  store i8* %7, i8** %retval.i, align 8
  br label %_mm_malloc.exit

_mm_malloc.exit:                                  ; preds = %if.then.i, %if.then6.i, %if.end7.i
  %8 = load i8*, i8** %retval.i, align 8
  %9 = bitcast i8* %8 to double*
  store double* %9, double** %mem, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %_mm_malloc.exit
  %10 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %10, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32, i32* %i, align 4
  %conv = sitofp i32 %11 to double
  %add = fadd double 1.000000e+00, %conv
  %12 = load double*, double** %mem, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds double, double* %12, i64 %idxprom
  store double %add, double* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load double*, double** %mem, align 8
  %16 = bitcast double* %15 to i8*
  store i8* %16, i8** %__p.addr.i, align 8
  %17 = load i8*, i8** %__p.addr.i, align 8
  %18 = bitcast i8* %17 to <8 x double>*
  %19 = load <8 x double>, <8 x double>* %18, align 64
  store <8 x double> %19, <8 x double>* %arg, align 64
  %20 = load <8 x double>, <8 x double>* %arg, align 64
  %call2 = call double @JNI_MinReduction_512(<8 x double> %20)
  store double %call2, double* %res, align 8
  %21 = load double, double* %res, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), double %21)
  ret i32 %call3
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readnone
declare <4 x double> @llvm.x86.avx.min.pd.256(<4 x double>, <4 x double>) #2

; Function Attrs: nounwind readnone
declare <2 x double> @llvm.x86.sse2.min.pd(<2 x double>, <2 x double>) #2

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local i32 @posix_memalign(i8**, i64, i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="512" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+avx512f,+f16c,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+avx512f,+f16c,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+avx,+avx2,+avx512f,+f16c,+fma,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"}
