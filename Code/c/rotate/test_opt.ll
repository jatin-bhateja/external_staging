; ModuleID = 'test.ll'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @rotate(i32* nocapture readonly %vec, i32* nocapture %ret, i32 %vlen, i32 %N) local_unnamed_addr #0 {
entry:
  %ret27 = bitcast i32* %ret to i8*
  %cmp = icmp slt i32 %N, 1
  br i1 %cmp, label %return, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = zext i32 %N to i64
  %1 = tail call i8* @llvm.stacksave()
  %vla = alloca i32, i64 %0, align 16
  %vla28 = bitcast i32* %vla to i8*
  %sub1 = add nsw i32 %vlen, -1
  %2 = sext i32 %sub1 to i64
  %min.iters.check = icmp ult i32 %N, 8
  br i1 %min.iters.check, label %for.body.preheader81, label %vector.scevcheck

for.body.preheader81:                             ; preds = %middle.block, %vector.scevcheck, %for.body.preheader
  %indvars.iv32.ph = phi i64 [ 0, %vector.scevcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  %3 = xor i64 %indvars.iv32.ph, -1
  %xtraiter84 = and i64 %0, 1
  %lcmp.mod85 = icmp eq i64 %xtraiter84, 0
  br i1 %lcmp.mod85, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader81
  %4 = sub nsw i64 %2, %indvars.iv32.ph
  %arrayidx.prol = getelementptr inbounds i32, i32* %vec, i64 %4
  %5 = load i32, i32* %arrayidx.prol, align 4
  %6 = trunc i64 %indvars.iv32.ph to i32
  %7 = xor i32 %6, -1
  %sub4.prol = add i32 %7, %N
  %idxprom5.prol = sext i32 %sub4.prol to i64
  %arrayidx6.prol = getelementptr inbounds i32, i32* %vla, i64 %idxprom5.prol
  store i32 %5, i32* %arrayidx6.prol, align 4
  %indvars.iv.next33.prol = or i64 %indvars.iv32.ph, 1
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader81, %for.body.prol
  %indvars.iv32.unr = phi i64 [ %indvars.iv32.ph, %for.body.preheader81 ], [ %indvars.iv.next33.prol, %for.body.prol ]
  %8 = sub nsw i64 0, %0
  %9 = icmp eq i64 %3, %8
  br i1 %9, label %for.cond8.preheader, label %for.body

vector.scevcheck:                                 ; preds = %for.body.preheader
  %10 = add nsw i64 %0, -1
  %11 = add i32 %N, -1
  %12 = trunc i64 %10 to i32
  %13 = sub i32 %11, %12
  %14 = icmp sgt i32 %13, %11
  %15 = icmp ugt i64 %10, 4294967295
  %16 = or i1 %14, %15
  br i1 %16, label %for.body.preheader81, label %vector.ph

vector.ph:                                        ; preds = %vector.scevcheck
  %n.vec = and i64 %0, 4294967288
  %17 = add nsw i64 %n.vec, -8
  %18 = lshr exact i64 %17, 3
  %19 = add nuw nsw i64 %18, 1
  %xtraiter86 = and i64 %19, 1
  %20 = icmp eq i64 %17, 0
  br i1 %20, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter88 = sub nsw i64 %19, %xtraiter86
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %niter89 = phi i64 [ %unroll_iter88, %vector.ph.new ], [ %niter89.nsub.1, %vector.body ]
  %21 = sub nsw i64 %2, %index
  %22 = getelementptr inbounds i32, i32* %vec, i64 %21
  %23 = getelementptr inbounds i32, i32* %22, i64 -3
  %24 = bitcast i32* %23 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %24, align 4
  %25 = getelementptr inbounds i32, i32* %22, i64 -4
  %26 = getelementptr inbounds i32, i32* %25, i64 -3
  %27 = bitcast i32* %26 to <4 x i32>*
  %wide.load38 = load <4 x i32>, <4 x i32>* %27, align 4
  %28 = trunc i64 %index to i32
  %29 = xor i32 %28, -1
  %30 = add i32 %29, %N
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %vla, i64 %31
  %33 = getelementptr inbounds i32, i32* %32, i64 -3
  %34 = bitcast i32* %33 to <4 x i32>*
  store <4 x i32> %wide.load, <4 x i32>* %34, align 4
  %35 = getelementptr inbounds i32, i32* %32, i64 -4
  %36 = getelementptr inbounds i32, i32* %35, i64 -3
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> %wide.load38, <4 x i32>* %37, align 4
  %index.next = or i64 %index, 8
  %38 = sub nsw i64 %2, %index.next
  %39 = getelementptr inbounds i32, i32* %vec, i64 %38
  %40 = getelementptr inbounds i32, i32* %39, i64 -3
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %41, align 4
  %42 = getelementptr inbounds i32, i32* %39, i64 -4
  %43 = getelementptr inbounds i32, i32* %42, i64 -3
  %44 = bitcast i32* %43 to <4 x i32>*
  %wide.load38.1 = load <4 x i32>, <4 x i32>* %44, align 4
  %45 = trunc i64 %index.next to i32
  %46 = xor i32 %45, -1
  %47 = add i32 %46, %N
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32* %vla, i64 %48
  %50 = getelementptr inbounds i32, i32* %49, i64 -3
  %51 = bitcast i32* %50 to <4 x i32>*
  store <4 x i32> %wide.load.1, <4 x i32>* %51, align 4
  %52 = getelementptr inbounds i32, i32* %49, i64 -4
  %53 = getelementptr inbounds i32, i32* %52, i64 -3
  %54 = bitcast i32* %53 to <4 x i32>*
  store <4 x i32> %wide.load38.1, <4 x i32>* %54, align 4
  %index.next.1 = add i64 %index, 16
  %niter89.nsub.1 = add i64 %niter89, -2
  %niter89.ncmp.1 = icmp eq i64 %niter89.nsub.1, 0
  br i1 %niter89.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !2

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %lcmp.mod87 = icmp eq i64 %xtraiter86, 0
  br i1 %lcmp.mod87, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %55 = sub nsw i64 %2, %index.unr
  %56 = getelementptr inbounds i32, i32* %vec, i64 %55
  %57 = getelementptr inbounds i32, i32* %56, i64 -3
  %58 = bitcast i32* %57 to <4 x i32>*
  %wide.load.epil = load <4 x i32>, <4 x i32>* %58, align 4
  %59 = getelementptr inbounds i32, i32* %56, i64 -4
  %60 = getelementptr inbounds i32, i32* %59, i64 -3
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load38.epil = load <4 x i32>, <4 x i32>* %61, align 4
  %62 = trunc i64 %index.unr to i32
  %63 = xor i32 %62, -1
  %64 = add i32 %63, %N
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32* %vla, i64 %65
  %67 = getelementptr inbounds i32, i32* %66, i64 -3
  %68 = bitcast i32* %67 to <4 x i32>*
  store <4 x i32> %wide.load.epil, <4 x i32>* %68, align 4
  %69 = getelementptr inbounds i32, i32* %66, i64 -4
  %70 = getelementptr inbounds i32, i32* %69, i64 -3
  %71 = bitcast i32* %70 to <4 x i32>*
  store <4 x i32> %wide.load38.epil, <4 x i32>* %71, align 4
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %cmp.n = icmp eq i64 %n.vec, %0
  br i1 %cmp.n, label %for.cond8.preheader, label %for.body.preheader81

for.cond8.preheader:                              ; preds = %for.body.prol.loopexit, %for.body, %middle.block
  %sub9 = sub nsw i32 %sub1, %N
  %cmp1023 = icmp slt i32 %sub9, 0
  br i1 %cmp1023, label %for.cond23.preheader, label %for.body11.preheader

for.body11.preheader:                             ; preds = %for.cond8.preheader
  %72 = sext i32 %sub1 to i64
  %73 = sub i32 %vlen, %N
  %wide.trip.count = zext i32 %73 to i64
  %min.iters.check49 = icmp ult i32 %73, 8
  br i1 %min.iters.check49, label %for.body11.preheader80, label %vector.memcheck

for.body11.preheader80:                           ; preds = %middle.block47, %vector.memcheck, %for.body11.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body11.preheader ], [ %n.vec60, %middle.block47 ]
  %i7.024.ph = phi i32 [ 0, %vector.memcheck ], [ 0, %for.body11.preheader ], [ %ind.end, %middle.block47 ]
  %74 = xor i64 %indvars.iv.ph, -1
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body11.prol.loopexit, label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.preheader80
  %sub13.prol = sub nsw i32 %sub9, %i7.024.ph
  %idxprom14.prol = sext i32 %sub13.prol to i64
  %arrayidx15.prol = getelementptr inbounds i32, i32* %vec, i64 %idxprom14.prol
  %75 = load i32, i32* %arrayidx15.prol, align 4
  %76 = sub nsw i64 %72, %indvars.iv.ph
  %arrayidx18.prol = getelementptr inbounds i32, i32* %ret, i64 %76
  store i32 %75, i32* %arrayidx18.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  %inc20.prol = add nuw nsw i32 %i7.024.ph, 1
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.preheader80, %for.body11.prol
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body11.preheader80 ], [ %indvars.iv.next.prol, %for.body11.prol ]
  %i7.024.unr = phi i32 [ %i7.024.ph, %for.body11.preheader80 ], [ %inc20.prol, %for.body11.prol ]
  %77 = sub nsw i64 0, %wide.trip.count
  %78 = icmp eq i64 %74, %77
  br i1 %78, label %for.cond23.preheader, label %for.body11

vector.memcheck:                                  ; preds = %for.body11.preheader
  %79 = add nsw i64 %2, 1
  %80 = sub nsw i64 %79, %wide.trip.count
  %scevgep = getelementptr i32, i32* %ret, i64 %80
  %scevgep52 = getelementptr i32, i32* %ret, i64 %79
  %81 = xor i32 %N, -1
  %82 = add i32 %81, %vlen
  %83 = sext i32 %82 to i64
  %84 = add nsw i64 %83, 1
  %85 = sub nsw i64 %84, %wide.trip.count
  %scevgep54 = getelementptr i32, i32* %vec, i64 %85
  %scevgep56 = getelementptr i32, i32* %vec, i64 %84
  %bound0 = icmp ult i32* %scevgep, %scevgep56
  %bound1 = icmp ult i32* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body11.preheader80, label %vector.ph58

vector.ph58:                                      ; preds = %vector.memcheck
  %n.vec60 = and i64 %wide.trip.count, 4294967288
  %ind.end = trunc i64 %n.vec60 to i32
  %86 = add nsw i64 %n.vec60, -8
  %87 = lshr exact i64 %86, 3
  %88 = add nuw nsw i64 %87, 1
  %xtraiter82 = and i64 %88, 1
  %89 = icmp eq i64 %86, 0
  br i1 %89, label %middle.block47.unr-lcssa, label %vector.ph58.new

vector.ph58.new:                                  ; preds = %vector.ph58
  %unroll_iter = sub nsw i64 %88, %xtraiter82
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46, %vector.ph58.new
  %index61 = phi i64 [ 0, %vector.ph58.new ], [ %index.next62.1, %vector.body46 ]
  %niter = phi i64 [ %unroll_iter, %vector.ph58.new ], [ %niter.nsub.1, %vector.body46 ]
  %offset.idx = trunc i64 %index61 to i32
  %90 = sub nsw i32 %sub9, %offset.idx
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32* %vec, i64 %91
  %93 = getelementptr inbounds i32, i32* %92, i64 -3
  %94 = bitcast i32* %93 to <4 x i32>*
  %wide.load74 = load <4 x i32>, <4 x i32>* %94, align 4, !alias.scope !4
  %95 = getelementptr inbounds i32, i32* %92, i64 -4
  %96 = getelementptr inbounds i32, i32* %95, i64 -3
  %97 = bitcast i32* %96 to <4 x i32>*
  %wide.load76 = load <4 x i32>, <4 x i32>* %97, align 4, !alias.scope !4
  %98 = sub nsw i64 %72, %index61
  %99 = getelementptr inbounds i32, i32* %ret, i64 %98
  %100 = getelementptr inbounds i32, i32* %99, i64 -3
  %101 = bitcast i32* %100 to <4 x i32>*
  store <4 x i32> %wide.load74, <4 x i32>* %101, align 4, !alias.scope !7, !noalias !4
  %102 = getelementptr inbounds i32, i32* %99, i64 -4
  %103 = getelementptr inbounds i32, i32* %102, i64 -3
  %104 = bitcast i32* %103 to <4 x i32>*
  store <4 x i32> %wide.load76, <4 x i32>* %104, align 4, !alias.scope !7, !noalias !4
  %index.next62 = or i64 %index61, 8
  %offset.idx.1 = trunc i64 %index.next62 to i32
  %105 = sub nsw i32 %sub9, %offset.idx.1
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32* %vec, i64 %106
  %108 = getelementptr inbounds i32, i32* %107, i64 -3
  %109 = bitcast i32* %108 to <4 x i32>*
  %wide.load74.1 = load <4 x i32>, <4 x i32>* %109, align 4, !alias.scope !4
  %110 = getelementptr inbounds i32, i32* %107, i64 -4
  %111 = getelementptr inbounds i32, i32* %110, i64 -3
  %112 = bitcast i32* %111 to <4 x i32>*
  %wide.load76.1 = load <4 x i32>, <4 x i32>* %112, align 4, !alias.scope !4
  %113 = sub nsw i64 %72, %index.next62
  %114 = getelementptr inbounds i32, i32* %ret, i64 %113
  %115 = getelementptr inbounds i32, i32* %114, i64 -3
  %116 = bitcast i32* %115 to <4 x i32>*
  store <4 x i32> %wide.load74.1, <4 x i32>* %116, align 4, !alias.scope !7, !noalias !4
  %117 = getelementptr inbounds i32, i32* %114, i64 -4
  %118 = getelementptr inbounds i32, i32* %117, i64 -3
  %119 = bitcast i32* %118 to <4 x i32>*
  store <4 x i32> %wide.load76.1, <4 x i32>* %119, align 4, !alias.scope !7, !noalias !4
  %index.next62.1 = add i64 %index61, 16
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %middle.block47.unr-lcssa, label %vector.body46, !llvm.loop !9

middle.block47.unr-lcssa:                         ; preds = %vector.body46, %vector.ph58
  %index61.unr = phi i64 [ 0, %vector.ph58 ], [ %index.next62.1, %vector.body46 ]
  %lcmp.mod83 = icmp eq i64 %xtraiter82, 0
  br i1 %lcmp.mod83, label %middle.block47, label %vector.body46.epil

vector.body46.epil:                               ; preds = %middle.block47.unr-lcssa
  %offset.idx.epil = trunc i64 %index61.unr to i32
  %120 = sub nsw i32 %sub9, %offset.idx.epil
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32* %vec, i64 %121
  %123 = getelementptr inbounds i32, i32* %122, i64 -3
  %124 = bitcast i32* %123 to <4 x i32>*
  %wide.load74.epil = load <4 x i32>, <4 x i32>* %124, align 4, !alias.scope !4
  %125 = getelementptr inbounds i32, i32* %122, i64 -4
  %126 = getelementptr inbounds i32, i32* %125, i64 -3
  %127 = bitcast i32* %126 to <4 x i32>*
  %wide.load76.epil = load <4 x i32>, <4 x i32>* %127, align 4, !alias.scope !4
  %128 = sub nsw i64 %72, %index61.unr
  %129 = getelementptr inbounds i32, i32* %ret, i64 %128
  %130 = getelementptr inbounds i32, i32* %129, i64 -3
  %131 = bitcast i32* %130 to <4 x i32>*
  store <4 x i32> %wide.load74.epil, <4 x i32>* %131, align 4, !alias.scope !7, !noalias !4
  %132 = getelementptr inbounds i32, i32* %129, i64 -4
  %133 = getelementptr inbounds i32, i32* %132, i64 -3
  %134 = bitcast i32* %133 to <4 x i32>*
  store <4 x i32> %wide.load76.epil, <4 x i32>* %134, align 4, !alias.scope !7, !noalias !4
  br label %middle.block47

middle.block47:                                   ; preds = %middle.block47.unr-lcssa, %vector.body46.epil
  %cmp.n65 = icmp eq i64 %n.vec60, %wide.trip.count
  br i1 %cmp.n65, label %for.cond23.preheader, label %for.body11.preheader80

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %for.body ], [ %indvars.iv32.unr, %for.body.prol.loopexit ]
  %135 = sub nsw i64 %2, %indvars.iv32
  %arrayidx = getelementptr inbounds i32, i32* %vec, i64 %135
  %136 = load i32, i32* %arrayidx, align 4
  %137 = trunc i64 %indvars.iv32 to i32
  %138 = xor i32 %137, -1
  %sub4 = add i32 %138, %N
  %idxprom5 = sext i32 %sub4 to i64
  %arrayidx6 = getelementptr inbounds i32, i32* %vla, i64 %idxprom5
  store i32 %136, i32* %arrayidx6, align 4
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %139 = sub nsw i64 %2, %indvars.iv.next33
  %arrayidx.1 = getelementptr inbounds i32, i32* %vec, i64 %139
  %140 = load i32, i32* %arrayidx.1, align 4
  %141 = trunc i64 %indvars.iv.next33 to i32
  %142 = xor i32 %141, -1
  %sub4.1 = add i32 %142, %N
  %idxprom5.1 = sext i32 %sub4.1 to i64
  %arrayidx6.1 = getelementptr inbounds i32, i32* %vla, i64 %idxprom5.1
  store i32 %140, i32* %arrayidx6.1, align 4
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next33.1, %0
  br i1 %exitcond36.1, label %for.cond8.preheader, label %for.body, !llvm.loop !10

for.cond23.preheader:                             ; preds = %for.body11.prol.loopexit, %for.body11, %middle.block47, %for.cond8.preheader
  %cmp2421 = icmp sgt i32 %N, 0
  br i1 %cmp2421, label %for.body25.preheader, label %for.end32

for.body25.preheader:                             ; preds = %for.cond23.preheader
  %143 = shl nuw nsw i64 %0, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %ret27, i8* nonnull align 16 %vla28, i64 %143, i1 false)
  br label %for.end32

for.body11:                                       ; preds = %for.body11.prol.loopexit, %for.body11
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body11 ], [ %indvars.iv.unr, %for.body11.prol.loopexit ]
  %i7.024 = phi i32 [ %inc20.1, %for.body11 ], [ %i7.024.unr, %for.body11.prol.loopexit ]
  %sub13 = sub nsw i32 %sub9, %i7.024
  %idxprom14 = sext i32 %sub13 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %vec, i64 %idxprom14
  %144 = load i32, i32* %arrayidx15, align 4
  %145 = sub nsw i64 %72, %indvars.iv
  %arrayidx18 = getelementptr inbounds i32, i32* %ret, i64 %145
  store i32 %144, i32* %arrayidx18, align 4
  %146 = xor i32 %i7.024, -1
  %sub13.1 = add i32 %sub9, %146
  %idxprom14.1 = sext i32 %sub13.1 to i64
  %arrayidx15.1 = getelementptr inbounds i32, i32* %vec, i64 %idxprom14.1
  %147 = load i32, i32* %arrayidx15.1, align 4
  %148 = xor i64 %indvars.iv, -1
  %149 = add i64 %148, %72
  %arrayidx18.1 = getelementptr inbounds i32, i32* %ret, i64 %149
  store i32 %147, i32* %arrayidx18.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %inc20.1 = add nsw i32 %i7.024, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond23.preheader, label %for.body11, !llvm.loop !11

for.end32:                                        ; preds = %for.body25.preheader, %for.cond23.preheader
  tail call void @llvm.stackrestore(i8* %1)
  br label %return

return:                                           ; preds = %entry, %for.end32
  ret void
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (http://github.com/llvm-mirror/clang.git 5a290db4b49c7f391b3038372cb69fdfc9f07725) (http://github.com/llvm-mirror/llvm.git 9b0581974207d38a5ef880bed858a33e6cbf12db)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.isvectorized", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = distinct !{!11, !3}
