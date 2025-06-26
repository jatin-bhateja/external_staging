; ModuleID = 'test_intrin.ll'
source_filename = "test_intrin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"Res = %f..\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @JNI_MinReduction_512(<8 x double> %vec) #0 {
entry:
  %extract.i = shufflevector <8 x double> %vec, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %extract2.i = shufflevector <8 x double> %vec, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %0 = call <4 x double> @llvm.x86.avx.min.pd.256(<4 x double> %extract.i, <4 x double> %extract2.i) #4
  %extract4.i = shufflevector <4 x double> %0, <4 x double> undef, <2 x i32> <i32 0, i32 1>
  %extract5.i = shufflevector <4 x double> %0, <4 x double> undef, <2 x i32> <i32 2, i32 3>
  %1 = call <2 x double> @llvm.x86.sse2.min.pd(<2 x double> %extract4.i, <2 x double> %extract5.i) #4
  %shuffle.i = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %2 = call <2 x double> @llvm.x86.sse2.min.pd(<2 x double> %1, <2 x double> %shuffle.i) #4
  %vecext.i = extractelement <2 x double> %2, i32 0
  ret double %vecext.i
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %__mallocedMemory.i = alloca i8*, align 8
  br i1 false, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %entry
  br label %_mm_malloc.exit

if.end.i:                                         ; preds = %entry
  %call4.i = call i32 @posix_memalign(i8** nonnull %__mallocedMemory.i, i64 64, i64 64) #4
  %tobool5.i = icmp eq i32 %call4.i, 0
  %0 = bitcast i8** %__mallocedMemory.i to double**
  %1 = load double*, double** %0, align 8
  %phitmp = select i1 %tobool5.i, double* %1, double* null
  br label %_mm_malloc.exit

_mm_malloc.exit:                                  ; preds = %if.end.i, %if.then.i
  %retval.i.0 = phi double* [ undef, %if.then.i ], [ %phitmp, %if.end.i ]
  br label %for.cond

for.cond:                                         ; preds = %for.body, %_mm_malloc.exit
  %i.0 = phi i32 [ 0, %_mm_malloc.exit ], [ %inc, %for.body ]
  %cmp = icmp ult i32 %i.0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %conv = sitofp i32 %i.0 to double
  %add = fadd double %conv, 1.000000e+00
  %2 = zext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds double, double* %retval.i.0, i64 %2
  store double %add, double* %arrayidx, align 8
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %3 = bitcast double* %retval.i.0 to <8 x double>*
  %4 = load <8 x double>, <8 x double>* %3, align 64
  %call2 = call double @JNI_MinReduction_512(<8 x double> %4)
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), double %call2) #4
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
