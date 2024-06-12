; ModuleID = 'Queens.c'
source_filename = "Queens.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c" Error in Queens.\0A\00", align 1
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
define void @Try(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store i32 %0, ptr %7, align 4, !tbaa !9
  store ptr %1, ptr %8, align 8, !tbaa !11
  store ptr %2, ptr %9, align 8, !tbaa !11
  store ptr %3, ptr %10, align 8, !tbaa !11
  store ptr %4, ptr %11, align 8, !tbaa !11
  store ptr %5, ptr %12, align 8, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %13) #3
  store i32 0, ptr %13, align 4, !tbaa !9
  %14 = load ptr, ptr %8, align 8, !tbaa !11
  store i32 0, ptr %14, align 4, !tbaa !9
  br label %15

15:                                               ; preds = %111, %6
  %16 = load ptr, ptr %8, align 8, !tbaa !11
  %17 = load i32, ptr %16, align 4, !tbaa !9
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %15
  %20 = load i32, ptr %13, align 4, !tbaa !9
  %21 = icmp ne i32 %20, 8
  br label %22

22:                                               ; preds = %19, %15
  %23 = phi i1 [ false, %15 ], [ %21, %19 ]
  br i1 %23, label %24, label %112

24:                                               ; preds = %22
  %25 = load i32, ptr %13, align 4, !tbaa !9
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %13, align 4, !tbaa !9
  %27 = load ptr, ptr %8, align 8, !tbaa !11
  store i32 0, ptr %27, align 4, !tbaa !9
  %28 = load ptr, ptr %10, align 8, !tbaa !11
  %29 = load i32, ptr %13, align 4, !tbaa !9
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %28, i64 %30
  %32 = load i32, ptr %31, align 4, !tbaa !9
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %111

34:                                               ; preds = %24
  %35 = load ptr, ptr %9, align 8, !tbaa !11
  %36 = load i32, ptr %7, align 4, !tbaa !9
  %37 = load i32, ptr %13, align 4, !tbaa !9
  %38 = add nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %35, i64 %39
  %41 = load i32, ptr %40, align 4, !tbaa !9
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %111

43:                                               ; preds = %34
  %44 = load ptr, ptr %11, align 8, !tbaa !11
  %45 = load i32, ptr %7, align 4, !tbaa !9
  %46 = load i32, ptr %13, align 4, !tbaa !9
  %47 = sub nsw i32 %45, %46
  %48 = add nsw i32 %47, 7
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, ptr %44, i64 %49
  %51 = load i32, ptr %50, align 4, !tbaa !9
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %111

53:                                               ; preds = %43
  %54 = load i32, ptr %13, align 4, !tbaa !9
  %55 = load ptr, ptr %12, align 8, !tbaa !11
  %56 = load i32, ptr %7, align 4, !tbaa !9
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %55, i64 %57
  store i32 %54, ptr %58, align 4, !tbaa !9
  %59 = load ptr, ptr %10, align 8, !tbaa !11
  %60 = load i32, ptr %13, align 4, !tbaa !9
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  store i32 0, ptr %62, align 4, !tbaa !9
  %63 = load ptr, ptr %9, align 8, !tbaa !11
  %64 = load i32, ptr %7, align 4, !tbaa !9
  %65 = load i32, ptr %13, align 4, !tbaa !9
  %66 = add nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %63, i64 %67
  store i32 0, ptr %68, align 4, !tbaa !9
  %69 = load ptr, ptr %11, align 8, !tbaa !11
  %70 = load i32, ptr %7, align 4, !tbaa !9
  %71 = load i32, ptr %13, align 4, !tbaa !9
  %72 = sub nsw i32 %70, %71
  %73 = add nsw i32 %72, 7
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, ptr %69, i64 %74
  store i32 0, ptr %75, align 4, !tbaa !9
  %76 = load i32, ptr %7, align 4, !tbaa !9
  %77 = icmp slt i32 %76, 8
  br i1 %77, label %78, label %108

78:                                               ; preds = %53
  %79 = load i32, ptr %7, align 4, !tbaa !9
  %80 = add nsw i32 %79, 1
  %81 = load ptr, ptr %8, align 8, !tbaa !11
  %82 = load ptr, ptr %9, align 8, !tbaa !11
  %83 = load ptr, ptr %10, align 8, !tbaa !11
  %84 = load ptr, ptr %11, align 8, !tbaa !11
  %85 = load ptr, ptr %12, align 8, !tbaa !11
  call void @Try(i32 noundef %80, ptr noundef %81, ptr noundef %82, ptr noundef %83, ptr noundef %84, ptr noundef %85)
  %86 = load ptr, ptr %8, align 8, !tbaa !11
  %87 = load i32, ptr %86, align 4, !tbaa !9
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %107, label %89

89:                                               ; preds = %78
  %90 = load ptr, ptr %10, align 8, !tbaa !11
  %91 = load i32, ptr %13, align 4, !tbaa !9
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, ptr %90, i64 %92
  store i32 1, ptr %93, align 4, !tbaa !9
  %94 = load ptr, ptr %9, align 8, !tbaa !11
  %95 = load i32, ptr %7, align 4, !tbaa !9
  %96 = load i32, ptr %13, align 4, !tbaa !9
  %97 = add nsw i32 %95, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, ptr %94, i64 %98
  store i32 1, ptr %99, align 4, !tbaa !9
  %100 = load ptr, ptr %11, align 8, !tbaa !11
  %101 = load i32, ptr %7, align 4, !tbaa !9
  %102 = load i32, ptr %13, align 4, !tbaa !9
  %103 = sub nsw i32 %101, %102
  %104 = add nsw i32 %103, 7
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr %100, i64 %105
  store i32 1, ptr %106, align 4, !tbaa !9
  br label %107

107:                                              ; preds = %89, %78
  br label %110

108:                                              ; preds = %53
  %109 = load ptr, ptr %8, align 8, !tbaa !11
  store i32 1, ptr %109, align 4, !tbaa !9
  br label %110

110:                                              ; preds = %108, %107
  br label %111

111:                                              ; preds = %110, %43, %34, %24
  br label %15, !llvm.loop !13

112:                                              ; preds = %22
  call void @llvm.lifetime.end.p0(i64 4, ptr %13) #3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @Doit() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [9 x i32], align 4
  %4 = alloca [17 x i32], align 4
  %5 = alloca [15 x i32], align 4
  %6 = alloca [9 x i32], align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #3
  call void @llvm.lifetime.start.p0(i64 36, ptr %3) #3
  call void @llvm.lifetime.start.p0(i64 68, ptr %4) #3
  call void @llvm.lifetime.start.p0(i64 60, ptr %5) #3
  call void @llvm.lifetime.start.p0(i64 36, ptr %6) #3
  store i32 -7, ptr %1, align 4, !tbaa !9
  br label %7

7:                                                ; preds = %35, %0
  %8 = load i32, ptr %1, align 4, !tbaa !9
  %9 = icmp sle i32 %8, 16
  br i1 %9, label %10, label %38

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4, !tbaa !9
  %12 = icmp sge i32 %11, 1
  br i1 %12, label %13, label %20

13:                                               ; preds = %10
  %14 = load i32, ptr %1, align 4, !tbaa !9
  %15 = icmp sle i32 %14, 8
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = load i32, ptr %1, align 4, !tbaa !9
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [9 x i32], ptr %3, i64 0, i64 %18
  store i32 1, ptr %19, align 4, !tbaa !9
  br label %20

20:                                               ; preds = %16, %13, %10
  %21 = load i32, ptr %1, align 4, !tbaa !9
  %22 = icmp sge i32 %21, 2
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = load i32, ptr %1, align 4, !tbaa !9
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [17 x i32], ptr %4, i64 0, i64 %25
  store i32 1, ptr %26, align 4, !tbaa !9
  br label %27

27:                                               ; preds = %23, %20
  %28 = load i32, ptr %1, align 4, !tbaa !9
  %29 = icmp sle i32 %28, 7
  br i1 %29, label %30, label %35

30:                                               ; preds = %27
  %31 = load i32, ptr %1, align 4, !tbaa !9
  %32 = add nsw i32 %31, 7
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [15 x i32], ptr %5, i64 0, i64 %33
  store i32 1, ptr %34, align 4, !tbaa !9
  br label %35

35:                                               ; preds = %30, %27
  %36 = load i32, ptr %1, align 4, !tbaa !9
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %1, align 4, !tbaa !9
  br label %7, !llvm.loop !16

38:                                               ; preds = %7
  %39 = getelementptr inbounds [17 x i32], ptr %4, i64 0, i64 0
  %40 = getelementptr inbounds [9 x i32], ptr %3, i64 0, i64 0
  %41 = getelementptr inbounds [15 x i32], ptr %5, i64 0, i64 0
  %42 = getelementptr inbounds [9 x i32], ptr %6, i64 0, i64 0
  call void @Try(i32 noundef 1, ptr noundef %2, ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %42)
  %43 = load i32, ptr %2, align 4, !tbaa !9
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %47, label %45

45:                                               ; preds = %38
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %47

47:                                               ; preds = %45, %38
  call void @llvm.lifetime.end.p0(i64 36, ptr %6) #3
  call void @llvm.lifetime.end.p0(i64 60, ptr %5) #3
  call void @llvm.lifetime.end.p0(i64 68, ptr %4) #3
  call void @llvm.lifetime.end.p0(i64 36, ptr %3) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind ssp uwtable(sync)
define void @Queens(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #3
  store i32 1, ptr %3, align 4, !tbaa !9
  br label %4

4:                                                ; preds = %8, %1
  %5 = load i32, ptr %3, align 4, !tbaa !9
  %6 = icmp sle i32 %5, 50
  br i1 %6, label %7, label %11

7:                                                ; preds = %4
  call void @Doit()
  br label %8

8:                                                ; preds = %7
  %9 = load i32, ptr %3, align 4, !tbaa !9
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4, !tbaa !9
  br label %4, !llvm.loop !17

11:                                               ; preds = %4
  %12 = load i32, ptr %2, align 4, !tbaa !9
  %13 = add nsw i32 %12, 1
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %13)
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #3
  ret void
}

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
  call void @Queens(i32 noundef %7)
  br label %8

8:                                                ; preds = %6
  %9 = load i32, ptr %2, align 4, !tbaa !9
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4, !tbaa !9
  br label %3, !llvm.loop !18

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
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !7, i64 0}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !14, !15}
!18 = distinct !{!18, !14, !15}
