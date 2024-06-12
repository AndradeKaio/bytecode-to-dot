; ModuleID = 'IntMM.c'
source_filename = "IntMM.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = global i64 0, align 8
@ima = global [41 x [41 x i32]] zeroinitializer, align 4
@imb = global [41 x [41 x i32]] zeroinitializer, align 4
@imr = global [41 x [41 x i32]] zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = global float 0.000000e+00, align 4
@fixed = global float 0.000000e+00, align 4
@floated = global float 0.000000e+00, align 4
@permarray = global [11 x i32] zeroinitializer, align 4
@pctr = global i32 0, align 4
@tree = global ptr null, align 8
@stack = global [4 x i32] zeroinitializer, align 4
@cellspace = global [19 x %struct.element] zeroinitializer, align 4
@freelist = global i32 0, align 4
@movesdone = global i32 0, align 4
@rma = global [41 x [41 x float]] zeroinitializer, align 4
@rmb = global [41 x [41 x float]] zeroinitializer, align 4
@rmr = global [41 x [41 x float]] zeroinitializer, align 4
@piececount = global [4 x i32] zeroinitializer, align 4
@class = global [13 x i32] zeroinitializer, align 4
@piecemax = global [13 x i32] zeroinitializer, align 4
@puzzl = global [512 x i32] zeroinitializer, align 4
@p = global [13 x [512 x i32]] zeroinitializer, align 4
@n = global i32 0, align 4
@kount = global i32 0, align 4
@sortlist = global [5001 x i32] zeroinitializer, align 4
@biggest = global i32 0, align 4
@littlest = global i32 0, align 4
@top = global i32 0, align 4
@z = global [257 x %struct.complex] zeroinitializer, align 4
@w = global [257 x %struct.complex] zeroinitializer, align 4
@e = global [130 x %struct.complex] zeroinitializer, align 4
@zr = global float 0.000000e+00, align 4
@zi = global float 0.000000e+00, align 4

; Function Attrs: nounwind ssp uwtable(sync)
define void @Initrand() #0 {
  store i64 74755, ptr @seed, align 8, !tbaa !5
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Rand() #0 {
  %1 = load i64, ptr @seed, align 8, !tbaa !5
  %2 = mul nsw i64 %1, 1309
  %3 = add nsw i64 %2, 13849
  %4 = and i64 %3, 65535
  store i64 %4, ptr @seed, align 8, !tbaa !5
  %5 = load i64, ptr @seed, align 8, !tbaa !5
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Initmatrix(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  store i32 1, ptr %4, align 4, !tbaa !11
  br label %6

6:                                                ; preds = %32, %1
  %7 = load i32, ptr %4, align 4, !tbaa !11
  %8 = icmp sle i32 %7, 40
  br i1 %8, label %9, label %35

9:                                                ; preds = %6
  store i32 1, ptr %5, align 4, !tbaa !11
  br label %10

10:                                               ; preds = %28, %9
  %11 = load i32, ptr %5, align 4, !tbaa !11
  %12 = icmp sle i32 %11, 40
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  %14 = call i32 @Rand()
  store i32 %14, ptr %3, align 4, !tbaa !11
  %15 = load i32, ptr %3, align 4, !tbaa !11
  %16 = load i32, ptr %3, align 4, !tbaa !11
  %17 = sdiv i32 %16, 120
  %18 = mul nsw i32 %17, 120
  %19 = sub nsw i32 %15, %18
  %20 = sub nsw i32 %19, 60
  %21 = load ptr, ptr %2, align 8, !tbaa !9
  %22 = load i32, ptr %4, align 4, !tbaa !11
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [41 x i32], ptr %21, i64 %23
  %25 = load i32, ptr %5, align 4, !tbaa !11
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [41 x i32], ptr %24, i64 0, i64 %26
  store i32 %20, ptr %27, align 4, !tbaa !11
  br label %28

28:                                               ; preds = %13
  %29 = load i32, ptr %5, align 4, !tbaa !11
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4, !tbaa !11
  br label %10, !llvm.loop !13

31:                                               ; preds = %10
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %4, align 4, !tbaa !11
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4, !tbaa !11
  br label %6, !llvm.loop !16

35:                                               ; preds = %6
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @Innerproduct(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %6, align 8, !tbaa !9
  store ptr %1, ptr %7, align 8, !tbaa !9
  store ptr %2, ptr %8, align 8, !tbaa !9
  store i32 %3, ptr %9, align 4, !tbaa !11
  store i32 %4, ptr %10, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #3
  %12 = load ptr, ptr %6, align 8, !tbaa !9
  store i32 0, ptr %12, align 4, !tbaa !11
  store i32 1, ptr %11, align 4, !tbaa !11
  br label %13

13:                                               ; preds = %38, %5
  %14 = load i32, ptr %11, align 4, !tbaa !11
  %15 = icmp sle i32 %14, 40
  br i1 %15, label %16, label %41

16:                                               ; preds = %13
  %17 = load ptr, ptr %6, align 8, !tbaa !9
  %18 = load i32, ptr %17, align 4, !tbaa !11
  %19 = load ptr, ptr %7, align 8, !tbaa !9
  %20 = load i32, ptr %9, align 4, !tbaa !11
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [41 x i32], ptr %19, i64 %21
  %23 = load i32, ptr %11, align 4, !tbaa !11
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [41 x i32], ptr %22, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4, !tbaa !11
  %27 = load ptr, ptr %8, align 8, !tbaa !9
  %28 = load i32, ptr %11, align 4, !tbaa !11
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [41 x i32], ptr %27, i64 %29
  %31 = load i32, ptr %10, align 4, !tbaa !11
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [41 x i32], ptr %30, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4, !tbaa !11
  %35 = mul nsw i32 %26, %34
  %36 = add nsw i32 %18, %35
  %37 = load ptr, ptr %6, align 8, !tbaa !9
  store i32 %36, ptr %37, align 4, !tbaa !11
  br label %38

38:                                               ; preds = %16
  %39 = load i32, ptr %11, align 4, !tbaa !11
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %11, align 4, !tbaa !11
  br label %13, !llvm.loop !17

41:                                               ; preds = %13
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Intmm(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #3
  call void @Initrand()
  call void @Initmatrix(ptr noundef @ima)
  call void @Initmatrix(ptr noundef @imb)
  store i32 1, ptr %3, align 4, !tbaa !11
  br label %5

5:                                                ; preds = %25, %1
  %6 = load i32, ptr %3, align 4, !tbaa !11
  %7 = icmp sle i32 %6, 40
  br i1 %7, label %8, label %28

8:                                                ; preds = %5
  store i32 1, ptr %4, align 4, !tbaa !11
  br label %9

9:                                                ; preds = %21, %8
  %10 = load i32, ptr %4, align 4, !tbaa !11
  %11 = icmp sle i32 %10, 40
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4, !tbaa !11
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [41 x [41 x i32]], ptr @imr, i64 0, i64 %14
  %16 = load i32, ptr %4, align 4, !tbaa !11
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [41 x i32], ptr %15, i64 0, i64 %17
  %19 = load i32, ptr %3, align 4, !tbaa !11
  %20 = load i32, ptr %4, align 4, !tbaa !11
  call void @Innerproduct(ptr noundef %18, ptr noundef @ima, ptr noundef @imb, i32 noundef %19, i32 noundef %20)
  br label %21

21:                                               ; preds = %12
  %22 = load i32, ptr %4, align 4, !tbaa !11
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %4, align 4, !tbaa !11
  br label %9, !llvm.loop !18

24:                                               ; preds = %9
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %3, align 4, !tbaa !11
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %3, align 4, !tbaa !11
  br label %5, !llvm.loop !19

28:                                               ; preds = %5
  %29 = load i32, ptr %2, align 4, !tbaa !11
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [41 x [41 x i32]], ptr @imr, i64 0, i64 %31
  %33 = load i32, ptr %2, align 4, !tbaa !11
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [41 x i32], ptr %32, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4, !tbaa !11
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %37)
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #3
  store i32 0, ptr %2, align 4, !tbaa !11
  br label %3

3:                                                ; preds = %8, %0
  %4 = load i32, ptr %2, align 4, !tbaa !11
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !tbaa !11
  call void @Intmm(i32 noundef %7)
  br label %8

8:                                                ; preds = %6
  %9 = load i32, ptr %2, align 4, !tbaa !11
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4, !tbaa !11
  br label %3, !llvm.loop !20

11:                                               ; preds = %3
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #3
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 17.0.6"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !7, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !7, i64 0}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !14, !15}
!18 = distinct !{!18, !14, !15}
!19 = distinct !{!19, !14, !15}
!20 = distinct !{!20, !14, !15}
