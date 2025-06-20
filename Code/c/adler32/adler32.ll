; ModuleID = 'adler32.c'
source_filename = "adler32.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@MOD_ADLER = dso_local constant i32 65521, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @adler32(i8* %data, i64 %len) #0 {
entry:
  %data.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %index = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  store i64 %len, i64* %len.addr, align 8
  store i32 1, i32* %a, align 4
  store i32 0, i32* %b, align 4
  store i64 0, i64* %index, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %index, align 8
  %1 = load i64, i64* %len.addr, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %a, align 4
  %3 = load i8*, i8** %data.addr, align 8
  %4 = load i64, i64* %index, align 8
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %5 to i32
  %add = add i32 %2, %conv
  %rem = urem i32 %add, 65521
  store i32 %rem, i32* %a, align 4
  %6 = load i32, i32* %b, align 4
  %7 = load i32, i32* %a, align 4
  %add1 = add i32 %6, %7
  %rem2 = urem i32 %add1, 65521
  store i32 %rem2, i32* %b, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %index, align 8
  %inc = add i64 %8, 1
  store i64 %inc, i64* %index, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %b, align 4
  %shl = shl i32 %9, 16
  %10 = load i32, i32* %a, align 4
  %or = or i32 %shl, %10
  ret i32 %or
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"}
