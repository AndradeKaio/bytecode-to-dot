; ModuleID = 'Towers.c'
source_filename = "Towers.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = global i64 0, align 8
@.str = private unnamed_addr constant [22 x i8] c" Error in Towers: %s\0A\00", align 1
@stack = global [4 x i32] zeroinitializer, align 4
@freelist = global i32 0, align 4
@cellspace = global [19 x %struct.element] zeroinitializer, align 4
@.str.1 = private unnamed_addr constant [16 x i8] c"out of space   \00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"disc size error\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"nothing to pop \00", align 1
@movesdone = global i32 0, align 4
@.str.4 = private unnamed_addr constant [19 x i8] c" Error in Towers.\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@value = global float 0.000000e+00, align 4
@fixed = global float 0.000000e+00, align 4
@floated = global float 0.000000e+00, align 4
@permarray = global [11 x i32] zeroinitializer, align 4
@pctr = global i32 0, align 4
@tree = global ptr null, align 8
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
define void @Error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !9
  %3 = load ptr, ptr %2, align 8, !tbaa !9
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @Makenull(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !11
  %3 = load i32, ptr %2, align 4, !tbaa !11
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %4
  store i32 0, ptr %5, align 4, !tbaa !11
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Getelement() #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  store i32 0, ptr %1, align 4, !tbaa !11
  %2 = load i32, ptr @freelist, align 4, !tbaa !11
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %0
  %5 = load i32, ptr @freelist, align 4, !tbaa !11
  store i32 %5, ptr %1, align 4, !tbaa !11
  %6 = load i32, ptr @freelist, align 4, !tbaa !11
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.element, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4, !tbaa !13
  store i32 %10, ptr @freelist, align 4, !tbaa !11
  br label %12

11:                                               ; preds = %0
  call void @Error(ptr noundef @.str.1)
  br label %12

12:                                               ; preds = %11, %4
  %13 = load i32, ptr %1, align 4, !tbaa !11
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #3
  ret i32 %13
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind ssp uwtable(sync)
define void @Push(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !11
  store i32 %1, ptr %4, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #3
  store i32 0, ptr %5, align 4, !tbaa !11
  %7 = load i32, ptr %4, align 4, !tbaa !11
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !11
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %25

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4, !tbaa !11
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4, !tbaa !11
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.element, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 4, !tbaa !15
  %21 = load i32, ptr %3, align 4, !tbaa !11
  %22 = icmp sle i32 %20, %21
  br i1 %22, label %23, label %24

23:                                               ; preds = %12
  store i32 1, ptr %5, align 4, !tbaa !11
  call void @Error(ptr noundef @.str.2)
  br label %24

24:                                               ; preds = %23, %12
  br label %25

25:                                               ; preds = %24, %2
  %26 = load i32, ptr %5, align 4, !tbaa !11
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %47, label %28

28:                                               ; preds = %25
  %29 = call i32 @Getelement()
  store i32 %29, ptr %6, align 4, !tbaa !11
  %30 = load i32, ptr %4, align 4, !tbaa !11
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4, !tbaa !11
  %34 = load i32, ptr %6, align 4, !tbaa !11
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.element, ptr %36, i32 0, i32 1
  store i32 %33, ptr %37, align 4, !tbaa !13
  %38 = load i32, ptr %6, align 4, !tbaa !11
  %39 = load i32, ptr %4, align 4, !tbaa !11
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %40
  store i32 %38, ptr %41, align 4, !tbaa !11
  %42 = load i32, ptr %3, align 4, !tbaa !11
  %43 = load i32, ptr %6, align 4, !tbaa !11
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.element, ptr %45, i32 0, i32 0
  store i32 %42, ptr %46, align 4, !tbaa !15
  br label %47

47:                                               ; preds = %28, %25
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Init(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !11
  store i32 %1, ptr %4, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  %6 = load i32, ptr %3, align 4, !tbaa !11
  call void @Makenull(i32 noundef %6)
  %7 = load i32, ptr %4, align 4, !tbaa !11
  store i32 %7, ptr %5, align 4, !tbaa !11
  br label %8

8:                                                ; preds = %14, %2
  %9 = load i32, ptr %5, align 4, !tbaa !11
  %10 = icmp sge i32 %9, 1
  br i1 %10, label %11, label %17

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4, !tbaa !11
  %13 = load i32, ptr %3, align 4, !tbaa !11
  call void @Push(i32 noundef %12, i32 noundef %13)
  br label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4, !tbaa !11
  %16 = add nsw i32 %15, -1
  store i32 %16, ptr %5, align 4, !tbaa !11
  br label %8, !llvm.loop !16

17:                                               ; preds = %8
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Pop(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  %7 = load i32, ptr %3, align 4, !tbaa !11
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !11
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %46

12:                                               ; preds = %1
  %13 = load i32, ptr %3, align 4, !tbaa !11
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4, !tbaa !11
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.element, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 4, !tbaa !15
  store i32 %20, ptr %5, align 4, !tbaa !11
  %21 = load i32, ptr %3, align 4, !tbaa !11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %22
  %24 = load i32, ptr %23, align 4, !tbaa !11
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.element, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %27, align 4, !tbaa !13
  store i32 %28, ptr %4, align 4, !tbaa !11
  %29 = load i32, ptr @freelist, align 4, !tbaa !11
  %30 = load i32, ptr %3, align 4, !tbaa !11
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4, !tbaa !11
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.element, ptr %35, i32 0, i32 1
  store i32 %29, ptr %36, align 4, !tbaa !13
  %37 = load i32, ptr %3, align 4, !tbaa !11
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4, !tbaa !11
  store i32 %40, ptr @freelist, align 4, !tbaa !11
  %41 = load i32, ptr %4, align 4, !tbaa !11
  %42 = load i32, ptr %3, align 4, !tbaa !11
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x i32], ptr @stack, i64 0, i64 %43
  store i32 %41, ptr %44, align 4, !tbaa !11
  %45 = load i32, ptr %5, align 4, !tbaa !11
  store i32 %45, ptr %2, align 4
  store i32 1, ptr %6, align 4
  br label %48

46:                                               ; preds = %1
  call void @Error(ptr noundef @.str.3)
  br label %47

47:                                               ; preds = %46
  store i32 0, ptr %2, align 4
  store i32 1, ptr %6, align 4
  br label %48

48:                                               ; preds = %47, %12
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #3
  %49 = load i32, ptr %2, align 4
  ret i32 %49
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !11
  store i32 %1, ptr %4, align 4, !tbaa !11
  %5 = load i32, ptr %3, align 4, !tbaa !11
  %6 = call i32 @Pop(i32 noundef %5)
  %7 = load i32, ptr %4, align 4, !tbaa !11
  call void @Push(i32 noundef %6, i32 noundef %7)
  %8 = load i32, ptr @movesdone, align 4, !tbaa !11
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr @movesdone, align 4, !tbaa !11
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @tower(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4, !tbaa !11
  store i32 %1, ptr %5, align 4, !tbaa !11
  store i32 %2, ptr %6, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #3
  %8 = load i32, ptr %6, align 4, !tbaa !11
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %3
  %11 = load i32, ptr %4, align 4, !tbaa !11
  %12 = load i32, ptr %5, align 4, !tbaa !11
  call void @Move(i32 noundef %11, i32 noundef %12)
  br label %28

13:                                               ; preds = %3
  %14 = load i32, ptr %4, align 4, !tbaa !11
  %15 = sub nsw i32 6, %14
  %16 = load i32, ptr %5, align 4, !tbaa !11
  %17 = sub nsw i32 %15, %16
  store i32 %17, ptr %7, align 4, !tbaa !11
  %18 = load i32, ptr %4, align 4, !tbaa !11
  %19 = load i32, ptr %7, align 4, !tbaa !11
  %20 = load i32, ptr %6, align 4, !tbaa !11
  %21 = sub nsw i32 %20, 1
  call void @tower(i32 noundef %18, i32 noundef %19, i32 noundef %21)
  %22 = load i32, ptr %4, align 4, !tbaa !11
  %23 = load i32, ptr %5, align 4, !tbaa !11
  call void @Move(i32 noundef %22, i32 noundef %23)
  %24 = load i32, ptr %7, align 4, !tbaa !11
  %25 = load i32, ptr %5, align 4, !tbaa !11
  %26 = load i32, ptr %6, align 4, !tbaa !11
  %27 = sub nsw i32 %26, 1
  call void @tower(i32 noundef %24, i32 noundef %25, i32 noundef %27)
  br label %28

28:                                               ; preds = %13, %10
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Towers() #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  store i32 1, ptr %1, align 4, !tbaa !11
  br label %2

2:                                                ; preds = %12, %0
  %3 = load i32, ptr %1, align 4, !tbaa !11
  %4 = icmp sle i32 %3, 18
  br i1 %4, label %5, label %15

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4, !tbaa !11
  %7 = sub nsw i32 %6, 1
  %8 = load i32, ptr %1, align 4, !tbaa !11
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [19 x %struct.element], ptr @cellspace, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.element, ptr %10, i32 0, i32 1
  store i32 %7, ptr %11, align 4, !tbaa !13
  br label %12

12:                                               ; preds = %5
  %13 = load i32, ptr %1, align 4, !tbaa !11
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %1, align 4, !tbaa !11
  br label %2, !llvm.loop !19

15:                                               ; preds = %2
  store i32 18, ptr @freelist, align 4, !tbaa !11
  call void @Init(i32 noundef 1, i32 noundef 14)
  call void @Makenull(i32 noundef 2)
  call void @Makenull(i32 noundef 3)
  store i32 0, ptr @movesdone, align 4, !tbaa !11
  call void @tower(i32 noundef 1, i32 noundef 2, i32 noundef 14)
  %16 = load i32, ptr @movesdone, align 4, !tbaa !11
  %17 = icmp ne i32 %16, 16383
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %20

20:                                               ; preds = %18, %15
  %21 = load i32, ptr @movesdone, align 4, !tbaa !11
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %21)
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #3
  ret void
}

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
  call void @Towers()
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %2, align 4, !tbaa !11
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %2, align 4, !tbaa !11
  br label %3, !llvm.loop !20

10:                                               ; preds = %3
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #3
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
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
!13 = !{!14, !12, i64 4}
!14 = !{!"element", !12, i64 0, !12, i64 4}
!15 = !{!14, !12, i64 0}
!16 = distinct !{!16, !17, !18}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !17, !18}
!20 = distinct !{!20, !17, !18}
