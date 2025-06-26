; ModuleID = 'vec.c'
source_filename = "vec.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @war(float* %a) #0 {
entry:
  %a.addr = alloca float*, align 8
  %i = alloca i32, align 4
  store float* %a, float** %a.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1023
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load float*, float** %a.addr, align 8
  %2 = load i32, i32* %i, align 4
  %add = add nsw i32 %2, 1
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds float, float* %1, i64 %idxprom
  %3 = load float, float* %arrayidx, align 4
  %4 = load float*, float** %a.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds float, float* %4, i64 %idxprom1
  store float %3, float* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @raw(float* %a) #0 {
entry:
  %a.addr = alloca float*, align 8
  %i = alloca i32, align 4
  store float* %a, float** %a.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1023
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load float*, float** %a.addr, align 8
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds float, float* %1, i64 %idxprom
  %3 = load float, float* %arrayidx, align 4
  %4 = load float*, float** %a.addr, align 8
  %5 = load i32, i32* %i, align 4
  %add = add nsw i32 %5, 1
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds float, float* %4, i64 %idxprom1
  store float %3, float* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"}
