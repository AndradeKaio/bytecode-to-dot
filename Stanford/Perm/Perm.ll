; ModuleID = 'Perm.c'
source_filename = "Perm.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = global i64 0, align 8
@permarray = global [11 x i32] zeroinitializer, align 4
@pctr = global i32 0, align 4
@.str = private unnamed_addr constant [17 x i8] c" Error in Perm.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = global float 0.000000e+00, align 4
@fixed = global float 0.000000e+00, align 4
@floated = global float 0.000000e+00, align 4
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
define void @Swap(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !9
  store ptr %1, ptr %4, align 8, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  %6 = load ptr, ptr %3, align 8, !tbaa !9
  %7 = load i32, ptr %6, align 4, !tbaa !11
  store i32 %7, ptr %5, align 4, !tbaa !11
  %8 = load ptr, ptr %4, align 8, !tbaa !9
  %9 = load i32, ptr %8, align 4, !tbaa !11
  %10 = load ptr, ptr %3, align 8, !tbaa !9
  store i32 %9, ptr %10, align 4, !tbaa !11
  %11 = load i32, ptr %5, align 4, !tbaa !11
  %12 = load ptr, ptr %4, align 8, !tbaa !9
  store i32 %11, ptr %12, align 4, !tbaa !11
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @Initialize() #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  store i32 1, ptr %1, align 4, !tbaa !11
  br label %2

2:                                                ; preds = %11, %0
  %3 = load i32, ptr %1, align 4, !tbaa !11
  %4 = icmp sle i32 %3, 7
  br i1 %4, label %5, label %14

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !tbaa !11
  %7 = sub nsw i32 %6, 1
  %8 = load i32, ptr %1, align 4, !tbaa !11
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [11 x i32], ptr @permarray, i64 0, i64 %9
  store i32 %7, ptr %10, align 4, !tbaa !11
  br label %11

11:                                               ; preds = %5
  %12 = load i32, ptr %1, align 4, !tbaa !11
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %1, align 4, !tbaa !11
  br label %2, !llvm.loop !13

14:                                               ; preds = %2
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Permute(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #3
  %4 = load i32, ptr @pctr, align 4, !tbaa !11
  %5 = add i32 %4, 1
  store i32 %5, ptr @pctr, align 4, !tbaa !11
  %6 = load i32, ptr %2, align 4, !tbaa !11
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %35

8:                                                ; preds = %1
  %9 = load i32, ptr %2, align 4, !tbaa !11
  %10 = sub nsw i32 %9, 1
  call void @Permute(i32 noundef %10)
  %11 = load i32, ptr %2, align 4, !tbaa !11
  %12 = sub nsw i32 %11, 1
  store i32 %12, ptr %3, align 4, !tbaa !11
  br label %13

13:                                               ; preds = %31, %8
  %14 = load i32, ptr %3, align 4, !tbaa !11
  %15 = icmp sge i32 %14, 1
  br i1 %15, label %16, label %34

16:                                               ; preds = %13
  %17 = load i32, ptr %2, align 4, !tbaa !11
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [11 x i32], ptr @permarray, i64 0, i64 %18
  %20 = load i32, ptr %3, align 4, !tbaa !11
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [11 x i32], ptr @permarray, i64 0, i64 %21
  call void @Swap(ptr noundef %19, ptr noundef %22)
  %23 = load i32, ptr %2, align 4, !tbaa !11
  %24 = sub nsw i32 %23, 1
  call void @Permute(i32 noundef %24)
  %25 = load i32, ptr %2, align 4, !tbaa !11
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [11 x i32], ptr @permarray, i64 0, i64 %26
  %28 = load i32, ptr %3, align 4, !tbaa !11
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [11 x i32], ptr @permarray, i64 0, i64 %29
  call void @Swap(ptr noundef %27, ptr noundef %30)
  br label %31

31:                                               ; preds = %16
  %32 = load i32, ptr %3, align 4, !tbaa !11
  %33 = add nsw i32 %32, -1
  store i32 %33, ptr %3, align 4, !tbaa !11
  br label %13, !llvm.loop !16

34:                                               ; preds = %13
  br label %35

35:                                               ; preds = %34, %1
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Perm() #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  store i32 0, ptr @pctr, align 4, !tbaa !11
  store i32 1, ptr %1, align 4, !tbaa !11
  br label %2

2:                                                ; preds = %6, %0
  %3 = load i32, ptr %1, align 4, !tbaa !11
  %4 = icmp sle i32 %3, 5
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  call void @Initialize()
  call void @Permute(i32 noundef 7)
  br label %6

6:                                                ; preds = %5
  %7 = load i32, ptr %1, align 4, !tbaa !11
  %8 = add nsw i32 %7, 1
  store i32 %8, ptr %1, align 4, !tbaa !11
  br label %2, !llvm.loop !17

9:                                                ; preds = %2
  %10 = load i32, ptr @pctr, align 4, !tbaa !11
  %11 = icmp ne i32 %10, 43300
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %14

14:                                               ; preds = %12, %9
  %15 = load i32, ptr @pctr, align 4, !tbaa !11
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %15)
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #3
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

3:                                                ; preds = %7, %0
  %4 = load i32, ptr %2, align 4, !tbaa !11
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  call void @Perm()
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %2, align 4, !tbaa !11
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %2, align 4, !tbaa !11
  br label %3, !llvm.loop !18

10:                                               ; preds = %3
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
