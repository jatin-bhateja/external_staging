; ModuleID = 'dep_opt.ll'
source_filename = "dep.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@arr = dso_local global <{ i32, [134097 x i32] }> <{ i32 1, [134097 x i32] zeroinitializer }>, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @workload(i32 %init) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %idxprom = sext i32 %i.01 to i64
  %arrayidx = getelementptr inbounds [134098 x i32], [134098 x i32]* bitcast (<{ i32, [134097 x i32] }>* @arr to [134098 x i32]*), i64 0, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %add = add nsw i32 %0, %init
  %add1 = add nsw i32 %i.01, 1
  %idxprom2 = sext i32 %add1 to i64
  %arrayidx3 = getelementptr inbounds [134098 x i32], [134098 x i32]* bitcast (<{ i32, [134097 x i32] }>* @arr to [134098 x i32]*), i64 0, i64 %idxprom2
  store i32 %add, i32* %arrayidx3, align 4
  %inc = add nsw i32 %i.01, 1
  %cmp = icmp slt i32 %inc, 134098
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %1 = load i32, i32* getelementptr inbounds ([134098 x i32], [134098 x i32]* bitcast (<{ i32, [134097 x i32] }>* @arr to [134098 x i32]*), i64 0, i64 7), align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.02 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %index.01 = phi i32 [ 0, %entry ], [ %add, %for.body ]
  %call = call i32 @workload(i32 %i.02)
  %add = add nsw i32 %index.01, %call
  %inc = add nsw i32 %i.02, 1
  %cmp = icmp slt i32 %inc, 100000
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %index.0.lcssa = phi i32 [ %add, %for.body ]
  %and = and i32 %index.0.lcssa, 4097
  %idxprom = sext i32 %and to i64
  %arrayidx = getelementptr inbounds [134098 x i32], [134098 x i32]* bitcast (<{ i32, [134097 x i32] }>* @arr to [134098 x i32]*), i64 0, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  ret i32 %0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="skylake" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"}
