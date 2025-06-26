; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @rotate(i32* %vec, i32* %ret, i32 %vlen, i32 %N) #0 {
entry:
  %vec.addr = alloca i32*, align 8
  %ret.addr = alloca i32*, align 8
  %vlen.addr = alloca i32, align 4
  %N.addr = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %titr = alloca i32, align 4
  %vitr = alloca i32, align 4
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %i22 = alloca i32, align 4
  store i32* %vec, i32** %vec.addr, align 8
  store i32* %ret, i32** %ret.addr, align 8
  store i32 %vlen, i32* %vlen.addr, align 4
  store i32 %N, i32* %N.addr, align 4
  %0 = load i32, i32* %N.addr, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %N.addr, align 4
  %2 = zext i32 %1 to i64
  %3 = call i8* @llvm.stacksave()
  store i8* %3, i8** %saved_stack, align 8
  %vla = alloca i32, i64 %2, align 16
  store i64 %2, i64* %__vla_expr0, align 8
  %4 = load i32, i32* %N.addr, align 4
  %sub = sub nsw i32 %4, 1
  store i32 %sub, i32* %titr, align 4
  %5 = load i32, i32* %vlen.addr, align 4
  %sub1 = sub nsw i32 %5, 1
  store i32 %sub1, i32* %vitr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %N.addr, align 4
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %vec.addr, align 8
  %9 = load i32, i32* %vitr, align 4
  %10 = load i32, i32* %i, align 4
  %sub3 = sub nsw i32 %9, %10
  %idxprom = sext i32 %sub3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %idxprom
  %11 = load i32, i32* %arrayidx, align 4
  %12 = load i32, i32* %titr, align 4
  %13 = load i32, i32* %i, align 4
  %sub4 = sub nsw i32 %12, %13
  %idxprom5 = sext i32 %sub4 to i64
  %arrayidx6 = getelementptr inbounds i32, i32* %vla, i64 %idxprom5
  store i32 %11, i32* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc19, %for.end
  %15 = load i32, i32* %i7, align 4
  %16 = load i32, i32* %vitr, align 4
  %17 = load i32, i32* %N.addr, align 4
  %sub9 = sub nsw i32 %16, %17
  %cmp10 = icmp sle i32 %15, %sub9
  br i1 %cmp10, label %for.body11, label %for.end21

for.body11:                                       ; preds = %for.cond8
  %18 = load i32*, i32** %vec.addr, align 8
  %19 = load i32, i32* %vitr, align 4
  %20 = load i32, i32* %N.addr, align 4
  %sub12 = sub nsw i32 %19, %20
  %21 = load i32, i32* %i7, align 4
  %sub13 = sub nsw i32 %sub12, %21
  %idxprom14 = sext i32 %sub13 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %18, i64 %idxprom14
  %22 = load i32, i32* %arrayidx15, align 4
  %23 = load i32*, i32** %ret.addr, align 8
  %24 = load i32, i32* %vitr, align 4
  %25 = load i32, i32* %i7, align 4
  %sub16 = sub nsw i32 %24, %25
  %idxprom17 = sext i32 %sub16 to i64
  %arrayidx18 = getelementptr inbounds i32, i32* %23, i64 %idxprom17
  store i32 %22, i32* %arrayidx18, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body11
  %26 = load i32, i32* %i7, align 4
  %inc20 = add nsw i32 %26, 1
  store i32 %inc20, i32* %i7, align 4
  br label %for.cond8

for.end21:                                        ; preds = %for.cond8
  store i32 0, i32* %i22, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc30, %for.end21
  %27 = load i32, i32* %i22, align 4
  %28 = load i32, i32* %N.addr, align 4
  %cmp24 = icmp slt i32 %27, %28
  br i1 %cmp24, label %for.body25, label %for.end32

for.body25:                                       ; preds = %for.cond23
  %29 = load i32, i32* %i22, align 4
  %idxprom26 = sext i32 %29 to i64
  %arrayidx27 = getelementptr inbounds i32, i32* %vla, i64 %idxprom26
  %30 = load i32, i32* %arrayidx27, align 4
  %31 = load i32*, i32** %ret.addr, align 8
  %32 = load i32, i32* %i22, align 4
  %idxprom28 = sext i32 %32 to i64
  %arrayidx29 = getelementptr inbounds i32, i32* %31, i64 %idxprom28
  store i32 %30, i32* %arrayidx29, align 4
  br label %for.inc30

for.inc30:                                        ; preds = %for.body25
  %33 = load i32, i32* %i22, align 4
  %inc31 = add nsw i32 %33, 1
  store i32 %inc31, i32* %i22, align 4
  br label %for.cond23

for.end32:                                        ; preds = %for.cond23
  %34 = load i8*, i8** %saved_stack, align 8
  call void @llvm.stackrestore(i8* %34)
  br label %return

return:                                           ; preds = %for.end32, %if.then
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"}
