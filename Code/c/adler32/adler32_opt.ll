; ModuleID = 'adler32.ll'
source_filename = "adler32.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@MOD_ADLER = dso_local local_unnamed_addr constant i32 65521, align 4

; Function Attrs: noinline norecurse nounwind readonly uwtable
define dso_local i32 @adler32(i8* nocapture readonly %data, i64 %len) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp eq i64 %len, 0
  br i1 %cmp6, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = add i64 %len, -1
  %xtraiter = and i64 %len, 3
  %1 = icmp ult i64 %0, 3
  br i1 %1, label %for.end.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = sub i64 %len, %xtraiter
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %index.09 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %b.08 = phi i32 [ 0, %for.body.preheader.new ], [ %rem2.3, %for.body ]
  %a.07 = phi i32 [ 1, %for.body.preheader.new ], [ %rem.3, %for.body ]
  %niter = phi i64 [ %unroll_iter, %for.body.preheader.new ], [ %niter.nsub.3, %for.body ]
  %arrayidx = getelementptr inbounds i8, i8* %data, i64 %index.09
  %2 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %2 to i32
  %add = add nuw nsw i32 %a.07, %conv
  %rem = urem i32 %add, 65521
  %add1 = add nuw nsw i32 %rem, %b.08
  %rem2 = urem i32 %add1, 65521
  %inc = or i64 %index.09, 1
  %arrayidx.1 = getelementptr inbounds i8, i8* %data, i64 %inc
  %3 = load i8, i8* %arrayidx.1, align 1
  %conv.1 = zext i8 %3 to i32
  %add.1 = add nuw nsw i32 %rem, %conv.1
  %rem.1 = urem i32 %add.1, 65521
  %add1.1 = add nuw nsw i32 %rem.1, %rem2
  %rem2.1 = urem i32 %add1.1, 65521
  %inc.1 = or i64 %index.09, 2
  %arrayidx.2 = getelementptr inbounds i8, i8* %data, i64 %inc.1
  %4 = load i8, i8* %arrayidx.2, align 1
  %conv.2 = zext i8 %4 to i32
  %add.2 = add nuw nsw i32 %rem.1, %conv.2
  %rem.2 = urem i32 %add.2, 65521
  %add1.2 = add nuw nsw i32 %rem.2, %rem2.1
  %rem2.2 = urem i32 %add1.2, 65521
  %inc.2 = or i64 %index.09, 3
  %arrayidx.3 = getelementptr inbounds i8, i8* %data, i64 %inc.2
  %5 = load i8, i8* %arrayidx.3, align 1
  %conv.3 = zext i8 %5 to i32
  %add.3 = add nuw nsw i32 %rem.2, %conv.3
  %rem.3 = urem i32 %add.3, 65521
  %add1.3 = add nuw nsw i32 %rem.3, %rem2.2
  %rem2.3 = urem i32 %add1.3, 65521
  %inc.3 = add nuw i64 %index.09, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body

for.end.loopexit.unr-lcssa:                       ; preds = %for.body, %for.body.preheader
  %rem.lcssa.ph = phi i32 [ undef, %for.body.preheader ], [ %rem.3, %for.body ]
  %rem2.lcssa.ph = phi i32 [ undef, %for.body.preheader ], [ %rem2.3, %for.body ]
  %index.09.unr = phi i64 [ 0, %for.body.preheader ], [ %inc.3, %for.body ]
  %b.08.unr = phi i32 [ 0, %for.body.preheader ], [ %rem2.3, %for.body ]
  %a.07.unr = phi i32 [ 1, %for.body.preheader ], [ %rem.3, %for.body ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.end.loopexit, label %for.body.epil

for.body.epil:                                    ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil
  %index.09.epil = phi i64 [ %inc.epil, %for.body.epil ], [ %index.09.unr, %for.end.loopexit.unr-lcssa ]
  %b.08.epil = phi i32 [ %rem2.epil, %for.body.epil ], [ %b.08.unr, %for.end.loopexit.unr-lcssa ]
  %a.07.epil = phi i32 [ %rem.epil, %for.body.epil ], [ %a.07.unr, %for.end.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body.epil ], [ %xtraiter, %for.end.loopexit.unr-lcssa ]
  %arrayidx.epil = getelementptr inbounds i8, i8* %data, i64 %index.09.epil
  %6 = load i8, i8* %arrayidx.epil, align 1
  %conv.epil = zext i8 %6 to i32
  %add.epil = add nuw nsw i32 %a.07.epil, %conv.epil
  %rem.epil = urem i32 %add.epil, 65521
  %add1.epil = add nuw nsw i32 %rem.epil, %b.08.epil
  %rem2.epil = urem i32 %add1.epil, 65521
  %inc.epil = add nuw i64 %index.09.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %for.end.loopexit, label %for.body.epil, !llvm.loop !2

for.end.loopexit:                                 ; preds = %for.body.epil, %for.end.loopexit.unr-lcssa
  %rem.lcssa = phi i32 [ %rem.lcssa.ph, %for.end.loopexit.unr-lcssa ], [ %rem.epil, %for.body.epil ]
  %rem2.lcssa = phi i32 [ %rem2.lcssa.ph, %for.end.loopexit.unr-lcssa ], [ %rem2.epil, %for.body.epil ]
  %phitmp = shl nuw i32 %rem2.lcssa, 16
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %a.0.lcssa = phi i32 [ 1, %entry ], [ %rem.lcssa, %for.end.loopexit ]
  %b.0.lcssa = phi i32 [ 0, %entry ], [ %phitmp, %for.end.loopexit ]
  %or = or i32 %b.0.lcssa, %a.0.lcssa
  ret i32 %or
}

attributes #0 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cascadelake" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (http://github.com/llvm-mirror/clang.git 3441aaff8506ac0252f9bba9d1ce117cf35906ce) (http://github.com/llvm-mirror/llvm.git 2e6b938e4e31a2fdd8a5b3ec969bee9dcf9806a7)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.unroll.disable"}
