; ModuleID = 'Treesort.c'
source_filename = "Treesort.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }
%struct.node = type { ptr, ptr, i32 }

@seed = global i64 0, align 8
@biggest = global i32 0, align 4
@littlest = global i32 0, align 4
@sortlist = global [5001 x i32] zeroinitializer, align 4
@tree = global ptr null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c" Error in Tree.\0A\00", align 1
@value = global float 0.000000e+00, align 4
@fixed = global float 0.000000e+00, align 4
@floated = global float 0.000000e+00, align 4
@permarray = global [11 x i32] zeroinitializer, align 4
@pctr = global i32 0, align 4
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
define void @tInitarr() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #4
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #4
  call void @Initrand()
  store i32 0, ptr @biggest, align 4, !tbaa !9
  store i32 0, ptr @littlest, align 4, !tbaa !9
  store i32 1, ptr %1, align 4, !tbaa !9
  br label %3

3:                                                ; preds = %44, %0
  %4 = load i32, ptr %1, align 4, !tbaa !9
  %5 = icmp sle i32 %4, 5000
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
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #4
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @CreateNode(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !14
  store i32 %1, ptr %4, align 4, !tbaa !9
  %5 = call ptr @malloc(i64 noundef 24) #5
  %6 = load ptr, ptr %3, align 8, !tbaa !14
  store ptr %5, ptr %6, align 8, !tbaa !14
  %7 = load ptr, ptr %3, align 8, !tbaa !14
  %8 = load ptr, ptr %7, align 8, !tbaa !14
  %9 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 0
  store ptr null, ptr %9, align 8, !tbaa !16
  %10 = load ptr, ptr %3, align 8, !tbaa !14
  %11 = load ptr, ptr %10, align 8, !tbaa !14
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1
  store ptr null, ptr %12, align 8, !tbaa !18
  %13 = load i32, ptr %4, align 4, !tbaa !9
  %14 = load ptr, ptr %3, align 8, !tbaa !14
  %15 = load ptr, ptr %14, align 8, !tbaa !14
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 2
  store i32 %13, ptr %16, align 8, !tbaa !19
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind ssp uwtable(sync)
define void @Insert(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4, !tbaa !9
  store ptr %1, ptr %4, align 8, !tbaa !14
  %5 = load i32, ptr %3, align 4, !tbaa !9
  %6 = load ptr, ptr %4, align 8, !tbaa !14
  %7 = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 8, !tbaa !19
  %9 = icmp sgt i32 %5, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8, !tbaa !14
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8, !tbaa !16
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = load ptr, ptr %4, align 8, !tbaa !14
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %3, align 4, !tbaa !9
  call void @CreateNode(ptr noundef %17, i32 noundef %18)
  br label %24

19:                                               ; preds = %10
  %20 = load i32, ptr %3, align 4, !tbaa !9
  %21 = load ptr, ptr %4, align 8, !tbaa !14
  %22 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8, !tbaa !16
  call void @Insert(i32 noundef %20, ptr noundef %23)
  br label %24

24:                                               ; preds = %19, %15
  br label %47

25:                                               ; preds = %2
  %26 = load i32, ptr %3, align 4, !tbaa !9
  %27 = load ptr, ptr %4, align 8, !tbaa !14
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8, !tbaa !19
  %30 = icmp slt i32 %26, %29
  br i1 %30, label %31, label %46

31:                                               ; preds = %25
  %32 = load ptr, ptr %4, align 8, !tbaa !14
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8, !tbaa !18
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %40

36:                                               ; preds = %31
  %37 = load ptr, ptr %4, align 8, !tbaa !14
  %38 = getelementptr inbounds %struct.node, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %3, align 4, !tbaa !9
  call void @CreateNode(ptr noundef %38, i32 noundef %39)
  br label %45

40:                                               ; preds = %31
  %41 = load i32, ptr %3, align 4, !tbaa !9
  %42 = load ptr, ptr %4, align 8, !tbaa !14
  %43 = getelementptr inbounds %struct.node, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8, !tbaa !18
  call void @Insert(i32 noundef %41, ptr noundef %44)
  br label %45

45:                                               ; preds = %40, %36
  br label %46

46:                                               ; preds = %45, %25
  br label %47

47:                                               ; preds = %46, %24
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Checktree(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #4
  store i32 1, ptr %3, align 4, !tbaa !9
  %4 = load ptr, ptr %2, align 8, !tbaa !14
  %5 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8, !tbaa !16
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %32

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8, !tbaa !14
  %10 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8, !tbaa !16
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 8, !tbaa !19
  %14 = load ptr, ptr %2, align 8, !tbaa !14
  %15 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 2
  %16 = load i32, ptr %15, align 8, !tbaa !19
  %17 = icmp sle i32 %13, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %8
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %31

19:                                               ; preds = %8
  %20 = load ptr, ptr %2, align 8, !tbaa !14
  %21 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8, !tbaa !16
  %23 = call i32 @Checktree(ptr noundef %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %19
  %26 = load i32, ptr %3, align 4, !tbaa !9
  %27 = icmp ne i32 %26, 0
  br label %28

28:                                               ; preds = %25, %19
  %29 = phi i1 [ false, %19 ], [ %27, %25 ]
  %30 = zext i1 %29 to i32
  store i32 %30, ptr %3, align 4, !tbaa !9
  br label %31

31:                                               ; preds = %28, %18
  br label %32

32:                                               ; preds = %31, %1
  %33 = load ptr, ptr %2, align 8, !tbaa !14
  %34 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 1
  %35 = load ptr, ptr %34, align 8, !tbaa !18
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %61

37:                                               ; preds = %32
  %38 = load ptr, ptr %2, align 8, !tbaa !14
  %39 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8, !tbaa !18
  %41 = getelementptr inbounds %struct.node, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8, !tbaa !19
  %43 = load ptr, ptr %2, align 8, !tbaa !14
  %44 = getelementptr inbounds %struct.node, ptr %43, i32 0, i32 2
  %45 = load i32, ptr %44, align 8, !tbaa !19
  %46 = icmp sge i32 %42, %45
  br i1 %46, label %47, label %48

47:                                               ; preds = %37
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %60

48:                                               ; preds = %37
  %49 = load ptr, ptr %2, align 8, !tbaa !14
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8, !tbaa !18
  %52 = call i32 @Checktree(ptr noundef %51)
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %57

54:                                               ; preds = %48
  %55 = load i32, ptr %3, align 4, !tbaa !9
  %56 = icmp ne i32 %55, 0
  br label %57

57:                                               ; preds = %54, %48
  %58 = phi i1 [ false, %48 ], [ %56, %54 ]
  %59 = zext i1 %58 to i32
  store i32 %59, ptr %3, align 4, !tbaa !9
  br label %60

60:                                               ; preds = %57, %47
  br label %61

61:                                               ; preds = %60, %32
  %62 = load i32, ptr %3, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #4
  ret i32 %62
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Trees(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #4
  call void @tInitarr()
  %4 = call ptr @malloc(i64 noundef 24) #5
  store ptr %4, ptr @tree, align 8, !tbaa !14
  %5 = load ptr, ptr @tree, align 8, !tbaa !14
  %6 = getelementptr inbounds %struct.node, ptr %5, i32 0, i32 0
  store ptr null, ptr %6, align 8, !tbaa !16
  %7 = load ptr, ptr @tree, align 8, !tbaa !14
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 1
  store ptr null, ptr %8, align 8, !tbaa !18
  %9 = load i32, ptr getelementptr inbounds ([5001 x i32], ptr @sortlist, i64 0, i64 1), align 4, !tbaa !9
  %10 = load ptr, ptr @tree, align 8, !tbaa !14
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 2
  store i32 %9, ptr %11, align 8, !tbaa !19
  store i32 2, ptr %3, align 4, !tbaa !9
  br label %12

12:                                               ; preds = %21, %1
  %13 = load i32, ptr %3, align 4, !tbaa !9
  %14 = icmp sle i32 %13, 5000
  br i1 %14, label %15, label %24

15:                                               ; preds = %12
  %16 = load i32, ptr %3, align 4, !tbaa !9
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !9
  %20 = load ptr, ptr @tree, align 8, !tbaa !14
  call void @Insert(i32 noundef %19, ptr noundef %20)
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %3, align 4, !tbaa !9
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4, !tbaa !9
  br label %12, !llvm.loop !20

24:                                               ; preds = %12
  %25 = load i32, ptr %2, align 4, !tbaa !9
  %26 = add nsw i32 2, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [5001 x i32], ptr @sortlist, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4, !tbaa !9
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %29)
  %31 = load ptr, ptr @tree, align 8, !tbaa !14
  %32 = call i32 @Checktree(ptr noundef %31)
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %36, label %34

34:                                               ; preds = %24
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %36

36:                                               ; preds = %34, %24
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #4
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #4
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %3

3:                                                ; preds = %8, %0
  %4 = load i32, ptr %2, align 4, !tbaa !9
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !tbaa !9
  call void @Trees(i32 noundef %7)
  br label %8

8:                                                ; preds = %6
  %9 = load i32, ptr %2, align 4, !tbaa !9
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %2, align 4, !tbaa !9
  br label %3, !llvm.loop !21

11:                                               ; preds = %3
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #4
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nounwind }
attributes #5 = { allocsize(0) }

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
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !7, i64 0}
!16 = !{!17, !15, i64 0}
!17 = !{!"node", !15, i64 0, !15, i64 8, !10, i64 16}
!18 = !{!17, !15, i64 8}
!19 = !{!17, !10, i64 16}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
