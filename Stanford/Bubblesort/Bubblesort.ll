; ModuleID = 'Bubblesort.c'
source_filename = "Bubblesort.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = global i64 0, align 8
@biggest = global i32 0, align 4
@littlest = global i32 0, align 4
@sortlist = global [5001 x i32] zeroinitializer, align 4
@top = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"Error3 in Bubble.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
@ima = global [41 x [41 x i32]] zeroinitializer, align 4
@imb = global [41 x [41 x i32]] zeroinitializer, align 4
@imr = global [41 x [41 x i32]] zeroinitializer, align 4
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
define void @bInitarr() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #3
  call void @Initrand()
  store i32 0, ptr @biggest, align 4, !tbaa !9
  store i32 0, ptr @littlest, align 4, !tbaa !9
  store i32 1, ptr %1, align 4, !tbaa !9
  br label %3

3:                                                ; preds = %44, %0
  %4 = load i32, ptr %1, align 4, !tbaa !9
  %5 = icmp sle i32 %4, 500
  br i1 %5, label %6, label %47

6:                                                ; preds = %3
  %7 = call i32 @Rand()
  %8 = sext i32 %7 to i64
  store i64 %8, ptr %2, align 8, !tbaa !5
  %9 = load i64, ptr %2, align 8, !tbaa !5
  %10 = load i64, ptr %2, align 8, !tbaa !5
  %11 = sdiv i64 %10, 100000
  %12 = mul nsw i64 %11, 100000
  %13 = sub nsw i64 %9, %12
  %14 = sub nsw i64 %13, 50000
  %15 = trunc i64 %14 to i32
  %16 = load i32, ptr %1, align 4, !tbaa !9
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %17
  store i32 %15, ptr %18, align 4, !tbaa !9
  %19 = load i32, ptr %1, align 4, !tbaa !9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4, !tbaa !9
  %23 = load i32, ptr @biggest, align 4, !tbaa !9
  %24 = icmp sgt i32 %22, %23
  br i1 %24, label %25, label %30

25:                                               ; preds = %6
  %26 = load i32, ptr %1, align 4, !tbaa !9
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4, !tbaa !9
  store i32 %29, ptr @biggest, align 4, !tbaa !9
  br label %43

30:                                               ; preds = %6
  %31 = load i32, ptr %1, align 4, !tbaa !9
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4, !tbaa !9
  %35 = load i32, ptr @littlest, align 4, !tbaa !9
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %42

37:                                               ; preds = %30
  %38 = load i32, ptr %1, align 4, !tbaa !9
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4, !tbaa !9
  store i32 %41, ptr @littlest, align 4, !tbaa !9
  br label %42

42:                                               ; preds = %37, %30
  br label %43

43:                                               ; preds = %42, %25
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %1, align 4, !tbaa !9
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %1, align 4, !tbaa !9
  br label %3, !llvm.loop !11

47:                                               ; preds = %3
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @Bubble(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #3
  call void @bInitarr()
  store i32 500, ptr @top, align 4, !tbaa !9
  br label %5

5:                                                ; preds = %45, %1
  %6 = load i32, ptr @top, align 4, !tbaa !9
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %8, label %48

8:                                                ; preds = %5
  store i32 1, ptr %3, align 4, !tbaa !9
  br label %9

9:                                                ; preds = %42, %8
  %10 = load i32, ptr %3, align 4, !tbaa !9
  %11 = load i32, ptr @top, align 4, !tbaa !9
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %45

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4, !tbaa !9
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4, !tbaa !9
  %18 = load i32, ptr %3, align 4, !tbaa !9
  %19 = add nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4, !tbaa !9
  %23 = icmp sgt i32 %17, %22
  br i1 %23, label %24, label %42

24:                                               ; preds = %13
  %25 = load i32, ptr %3, align 4, !tbaa !9
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4, !tbaa !9
  store i32 %28, ptr %4, align 4, !tbaa !9
  %29 = load i32, ptr %3, align 4, !tbaa !9
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4, !tbaa !9
  %34 = load i32, ptr %3, align 4, !tbaa !9
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %35
  store i32 %33, ptr %36, align 4, !tbaa !9
  %37 = load i32, ptr %4, align 4, !tbaa !9
  %38 = load i32, ptr %3, align 4, !tbaa !9
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %40
  store i32 %37, ptr %41, align 4, !tbaa !9
  br label %42

42:                                               ; preds = %24, %13
  %43 = load i32, ptr %3, align 4, !tbaa !9
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %3, align 4, !tbaa !9
  br label %9, !llvm.loop !14

45:                                               ; preds = %9
  %46 = load i32, ptr @top, align 4, !tbaa !9
  %47 = sub nsw i32 %46, 1
  store i32 %47, ptr @top, align 4, !tbaa !9
  br label %5, !llvm.loop !15

48:                                               ; preds = %5
  %49 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4, !tbaa !9
  %50 = load i32, ptr @littlest, align 4, !tbaa !9
  %51 = icmp ne i32 %49, %50
  br i1 %51, label %56, label %52

52:                                               ; preds = %48
  %53 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 500), align 4, !tbaa !9
  %54 = load i32, ptr @biggest, align 4, !tbaa !9
  %55 = icmp ne i32 %53, %54
  br i1 %55, label %56, label %58

56:                                               ; preds = %52, %48
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %58

58:                                               ; preds = %56, %52
  %59 = load i32, ptr %2, align 4, !tbaa !9
  %60 = add nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4, !tbaa !9
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %63)
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
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %3

3:                                                ; preds = %8, %0
  %4 = load i32, ptr %2, align 4, !tbaa !9
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !tbaa !9
  call void @Bubble(i32 noundef %7)
  br label %8

8:                                                ; preds = %6
  %9 = load i32, ptr %2, align 4, !tbaa !9
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4, !tbaa !9
  br label %3, !llvm.loop !16

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
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
!16 = distinct !{!16, !12, !13}
