; ModuleID = 'Puzzle.c'
source_filename = "Puzzle.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.element = type { i32, i32 }
%struct.complex = type { float, float }

@seed = global i64 0, align 8
@piecemax = global [13 x i32] zeroinitializer, align 4
@p = global [13 x [512 x i32]] zeroinitializer, align 4
@puzzl = global [512 x i32] zeroinitializer, align 4
@piececount = global [4 x i32] zeroinitializer, align 4
@class = global [13 x i32] zeroinitializer, align 4
@kount = global i32 0, align 4
@n = global i32 0, align 4
@.str = private unnamed_addr constant [18 x i8] c"Error1 in Puzzle\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Error2 in Puzzle.\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Error3 in Puzzle.\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
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
define i32 @Fit(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4, !tbaa !9
  store i32 %1, ptr %5, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #3
  store i32 0, ptr %6, align 4, !tbaa !9
  br label %8

8:                                                ; preds = %35, %2
  %9 = load i32, ptr %6, align 4, !tbaa !9
  %10 = load i32, ptr %4, align 4, !tbaa !9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [13 x i32], ptr @piecemax, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !9
  %14 = icmp sle i32 %9, %13
  br i1 %14, label %15, label %38

15:                                               ; preds = %8
  %16 = load i32, ptr %4, align 4, !tbaa !9
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [13 x [512 x i32]], ptr @p, i64 0, i64 %17
  %19 = load i32, ptr %6, align 4, !tbaa !9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [512 x i32], ptr %18, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4, !tbaa !9
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %34

24:                                               ; preds = %15
  %25 = load i32, ptr %5, align 4, !tbaa !9
  %26 = load i32, ptr %6, align 4, !tbaa !9
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [512 x i32], ptr @puzzl, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4, !tbaa !9
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %24
  store i32 0, ptr %3, align 4
  store i32 1, ptr %7, align 4
  br label %39

33:                                               ; preds = %24
  br label %34

34:                                               ; preds = %33, %15
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4, !tbaa !9
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %6, align 4, !tbaa !9
  br label %8, !llvm.loop !11

38:                                               ; preds = %8
  store i32 1, ptr %3, align 4
  store i32 1, ptr %7, align 4
  br label %39

39:                                               ; preds = %38, %32
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #3
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Place(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4, !tbaa !9
  store i32 %1, ptr %5, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #3
  store i32 0, ptr %6, align 4, !tbaa !9
  br label %8

8:                                                ; preds = %31, %2
  %9 = load i32, ptr %6, align 4, !tbaa !9
  %10 = load i32, ptr %4, align 4, !tbaa !9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [13 x i32], ptr @piecemax, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !9
  %14 = icmp sle i32 %9, %13
  br i1 %14, label %15, label %34

15:                                               ; preds = %8
  %16 = load i32, ptr %4, align 4, !tbaa !9
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [13 x [512 x i32]], ptr @p, i64 0, i64 %17
  %19 = load i32, ptr %6, align 4, !tbaa !9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [512 x i32], ptr %18, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4, !tbaa !9
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %15
  %25 = load i32, ptr %5, align 4, !tbaa !9
  %26 = load i32, ptr %6, align 4, !tbaa !9
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [512 x i32], ptr @puzzl, i64 0, i64 %28
  store i32 1, ptr %29, align 4, !tbaa !9
  br label %30

30:                                               ; preds = %24, %15
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %6, align 4, !tbaa !9
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %6, align 4, !tbaa !9
  br label %8, !llvm.loop !14

34:                                               ; preds = %8
  %35 = load i32, ptr %4, align 4, !tbaa !9
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [13 x i32], ptr @class, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4, !tbaa !9
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x i32], ptr @piececount, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4, !tbaa !9
  %42 = sub nsw i32 %41, 1
  %43 = load i32, ptr %4, align 4, !tbaa !9
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [13 x i32], ptr @class, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4, !tbaa !9
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [4 x i32], ptr @piececount, i64 0, i64 %47
  store i32 %42, ptr %48, align 4, !tbaa !9
  %49 = load i32, ptr %5, align 4, !tbaa !9
  store i32 %49, ptr %6, align 4, !tbaa !9
  br label %50

50:                                               ; preds = %62, %34
  %51 = load i32, ptr %6, align 4, !tbaa !9
  %52 = icmp sle i32 %51, 511
  br i1 %52, label %53, label %65

53:                                               ; preds = %50
  %54 = load i32, ptr %6, align 4, !tbaa !9
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [512 x i32], ptr @puzzl, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4, !tbaa !9
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %61, label %59

59:                                               ; preds = %53
  %60 = load i32, ptr %6, align 4, !tbaa !9
  store i32 %60, ptr %3, align 4
  store i32 1, ptr %7, align 4
  br label %66

61:                                               ; preds = %53
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %6, align 4, !tbaa !9
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %6, align 4, !tbaa !9
  br label %50, !llvm.loop !15

65:                                               ; preds = %50
  store i32 0, ptr %3, align 4
  store i32 1, ptr %7, align 4
  br label %66

66:                                               ; preds = %65, %59
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #3
  %67 = load i32, ptr %3, align 4
  ret i32 %67
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Remove(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !9
  store i32 %1, ptr %4, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  store i32 0, ptr %5, align 4, !tbaa !9
  br label %6

6:                                                ; preds = %29, %2
  %7 = load i32, ptr %5, align 4, !tbaa !9
  %8 = load i32, ptr %3, align 4, !tbaa !9
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [13 x i32], ptr @piecemax, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !9
  %12 = icmp sle i32 %7, %11
  br i1 %12, label %13, label %32

13:                                               ; preds = %6
  %14 = load i32, ptr %3, align 4, !tbaa !9
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [13 x [512 x i32]], ptr @p, i64 0, i64 %15
  %17 = load i32, ptr %5, align 4, !tbaa !9
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [512 x i32], ptr %16, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4, !tbaa !9
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %13
  %23 = load i32, ptr %4, align 4, !tbaa !9
  %24 = load i32, ptr %5, align 4, !tbaa !9
  %25 = add nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [512 x i32], ptr @puzzl, i64 0, i64 %26
  store i32 0, ptr %27, align 4, !tbaa !9
  br label %28

28:                                               ; preds = %22, %13
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %5, align 4, !tbaa !9
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4, !tbaa !9
  br label %6, !llvm.loop !16

32:                                               ; preds = %6
  %33 = load i32, ptr %3, align 4, !tbaa !9
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [13 x i32], ptr @class, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4, !tbaa !9
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [4 x i32], ptr @piececount, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4, !tbaa !9
  %40 = add nsw i32 %39, 1
  %41 = load i32, ptr %3, align 4, !tbaa !9
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [13 x i32], ptr @class, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4, !tbaa !9
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [4 x i32], ptr @piececount, i64 0, i64 %45
  store i32 %40, ptr %46, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Trial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #3
  %7 = load i32, ptr @kount, align 4, !tbaa !9
  %8 = add nsw i32 %7, 1
  store i32 %8, ptr @kount, align 4, !tbaa !9
  store i32 0, ptr %4, align 4, !tbaa !9
  br label %9

9:                                                ; preds = %43, %1
  %10 = load i32, ptr %4, align 4, !tbaa !9
  %11 = icmp sle i32 %10, 12
  br i1 %11, label %12, label %46

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4, !tbaa !9
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [13 x i32], ptr @class, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4, !tbaa !9
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x i32], ptr @piececount, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !9
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %42

21:                                               ; preds = %12
  %22 = load i32, ptr %4, align 4, !tbaa !9
  %23 = load i32, ptr %3, align 4, !tbaa !9
  %24 = call i32 @Fit(i32 noundef %22, i32 noundef %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %41

26:                                               ; preds = %21
  %27 = load i32, ptr %4, align 4, !tbaa !9
  %28 = load i32, ptr %3, align 4, !tbaa !9
  %29 = call i32 @Place(i32 noundef %27, i32 noundef %28)
  store i32 %29, ptr %5, align 4, !tbaa !9
  %30 = load i32, ptr %5, align 4, !tbaa !9
  %31 = call i32 @Trial(i32 noundef %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %36, label %33

33:                                               ; preds = %26
  %34 = load i32, ptr %5, align 4, !tbaa !9
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %33, %26
  store i32 1, ptr %2, align 4
  store i32 1, ptr %6, align 4
  br label %47

37:                                               ; preds = %33
  %38 = load i32, ptr %4, align 4, !tbaa !9
  %39 = load i32, ptr %3, align 4, !tbaa !9
  call void @Remove(i32 noundef %38, i32 noundef %39)
  br label %40

40:                                               ; preds = %37
  br label %41

41:                                               ; preds = %40, %21
  br label %42

42:                                               ; preds = %41, %12
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %4, align 4, !tbaa !9
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %4, align 4, !tbaa !9
  br label %9, !llvm.loop !17

46:                                               ; preds = %9
  store i32 0, ptr %2, align 4
  store i32 1, ptr %6, align 4
  br label %47

47:                                               ; preds = %46, %36
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #3
  %48 = load i32, ptr %2, align 4
  ret i32 %48
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Puzzle() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #3
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #3
  store i32 0, ptr %4, align 4, !tbaa !9
  br label %5

5:                                                ; preds = %12, %0
  %6 = load i32, ptr %4, align 4, !tbaa !9
  %7 = icmp sle i32 %6, 511
  br i1 %7, label %8, label %15

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4, !tbaa !9
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [512 x i32], ptr @puzzl, i64 0, i64 %10
  store i32 1, ptr %11, align 4, !tbaa !9
  br label %12

12:                                               ; preds = %8
  %13 = load i32, ptr %4, align 4, !tbaa !9
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %4, align 4, !tbaa !9
  br label %5, !llvm.loop !18

15:                                               ; preds = %5
  store i32 1, ptr %1, align 4, !tbaa !9
  br label %16

16:                                               ; preds = %45, %15
  %17 = load i32, ptr %1, align 4, !tbaa !9
  %18 = icmp sle i32 %17, 5
  br i1 %18, label %19, label %48

19:                                               ; preds = %16
  store i32 1, ptr %2, align 4, !tbaa !9
  br label %20

20:                                               ; preds = %41, %19
  %21 = load i32, ptr %2, align 4, !tbaa !9
  %22 = icmp sle i32 %21, 5
  br i1 %22, label %23, label %44

23:                                               ; preds = %20
  store i32 1, ptr %3, align 4, !tbaa !9
  br label %24

24:                                               ; preds = %37, %23
  %25 = load i32, ptr %3, align 4, !tbaa !9
  %26 = icmp sle i32 %25, 5
  br i1 %26, label %27, label %40

27:                                               ; preds = %24
  %28 = load i32, ptr %1, align 4, !tbaa !9
  %29 = load i32, ptr %2, align 4, !tbaa !9
  %30 = load i32, ptr %3, align 4, !tbaa !9
  %31 = mul nsw i32 8, %30
  %32 = add nsw i32 %29, %31
  %33 = mul nsw i32 8, %32
  %34 = add nsw i32 %28, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [512 x i32], ptr @puzzl, i64 0, i64 %35
  store i32 0, ptr %36, align 4, !tbaa !9
  br label %37

37:                                               ; preds = %27
  %38 = load i32, ptr %3, align 4, !tbaa !9
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4, !tbaa !9
  br label %24, !llvm.loop !19

40:                                               ; preds = %24
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %2, align 4, !tbaa !9
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %2, align 4, !tbaa !9
  br label %20, !llvm.loop !20

44:                                               ; preds = %20
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %1, align 4, !tbaa !9
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %1, align 4, !tbaa !9
  br label %16, !llvm.loop !21

48:                                               ; preds = %16
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %49

49:                                               ; preds = %67, %48
  %50 = load i32, ptr %1, align 4, !tbaa !9
  %51 = icmp sle i32 %50, 12
  br i1 %51, label %52, label %70

52:                                               ; preds = %49
  store i32 0, ptr %4, align 4, !tbaa !9
  br label %53

53:                                               ; preds = %63, %52
  %54 = load i32, ptr %4, align 4, !tbaa !9
  %55 = icmp sle i32 %54, 511
  br i1 %55, label %56, label %66

56:                                               ; preds = %53
  %57 = load i32, ptr %1, align 4, !tbaa !9
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [13 x [512 x i32]], ptr @p, i64 0, i64 %58
  %60 = load i32, ptr %4, align 4, !tbaa !9
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [512 x i32], ptr %59, i64 0, i64 %61
  store i32 0, ptr %62, align 4, !tbaa !9
  br label %63

63:                                               ; preds = %56
  %64 = load i32, ptr %4, align 4, !tbaa !9
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %4, align 4, !tbaa !9
  br label %53, !llvm.loop !22

66:                                               ; preds = %53
  br label %67

67:                                               ; preds = %66
  %68 = load i32, ptr %1, align 4, !tbaa !9
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %1, align 4, !tbaa !9
  br label %49, !llvm.loop !23

70:                                               ; preds = %49
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %71

71:                                               ; preds = %100, %70
  %72 = load i32, ptr %1, align 4, !tbaa !9
  %73 = icmp sle i32 %72, 3
  br i1 %73, label %74, label %103

74:                                               ; preds = %71
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %75

75:                                               ; preds = %96, %74
  %76 = load i32, ptr %2, align 4, !tbaa !9
  %77 = icmp sle i32 %76, 1
  br i1 %77, label %78, label %99

78:                                               ; preds = %75
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %79

79:                                               ; preds = %92, %78
  %80 = load i32, ptr %3, align 4, !tbaa !9
  %81 = icmp sle i32 %80, 0
  br i1 %81, label %82, label %95

82:                                               ; preds = %79
  %83 = load i32, ptr %1, align 4, !tbaa !9
  %84 = load i32, ptr %2, align 4, !tbaa !9
  %85 = load i32, ptr %3, align 4, !tbaa !9
  %86 = mul nsw i32 8, %85
  %87 = add nsw i32 %84, %86
  %88 = mul nsw i32 8, %87
  %89 = add nsw i32 %83, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [512 x i32], ptr @p, i64 0, i64 %90
  store i32 1, ptr %91, align 4, !tbaa !9
  br label %92

92:                                               ; preds = %82
  %93 = load i32, ptr %3, align 4, !tbaa !9
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %3, align 4, !tbaa !9
  br label %79, !llvm.loop !24

95:                                               ; preds = %79
  br label %96

96:                                               ; preds = %95
  %97 = load i32, ptr %2, align 4, !tbaa !9
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %2, align 4, !tbaa !9
  br label %75, !llvm.loop !25

99:                                               ; preds = %75
  br label %100

100:                                              ; preds = %99
  %101 = load i32, ptr %1, align 4, !tbaa !9
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %1, align 4, !tbaa !9
  br label %71, !llvm.loop !26

103:                                              ; preds = %71
  store i32 0, ptr @class, align 4, !tbaa !9
  store i32 11, ptr @piecemax, align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %104

104:                                              ; preds = %133, %103
  %105 = load i32, ptr %1, align 4, !tbaa !9
  %106 = icmp sle i32 %105, 1
  br i1 %106, label %107, label %136

107:                                              ; preds = %104
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %108

108:                                              ; preds = %129, %107
  %109 = load i32, ptr %2, align 4, !tbaa !9
  %110 = icmp sle i32 %109, 0
  br i1 %110, label %111, label %132

111:                                              ; preds = %108
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %112

112:                                              ; preds = %125, %111
  %113 = load i32, ptr %3, align 4, !tbaa !9
  %114 = icmp sle i32 %113, 3
  br i1 %114, label %115, label %128

115:                                              ; preds = %112
  %116 = load i32, ptr %1, align 4, !tbaa !9
  %117 = load i32, ptr %2, align 4, !tbaa !9
  %118 = load i32, ptr %3, align 4, !tbaa !9
  %119 = mul nsw i32 8, %118
  %120 = add nsw i32 %117, %119
  %121 = mul nsw i32 8, %120
  %122 = add nsw i32 %116, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 1), i64 0, i64 %123
  store i32 1, ptr %124, align 4, !tbaa !9
  br label %125

125:                                              ; preds = %115
  %126 = load i32, ptr %3, align 4, !tbaa !9
  %127 = add nsw i32 %126, 1
  store i32 %127, ptr %3, align 4, !tbaa !9
  br label %112, !llvm.loop !27

128:                                              ; preds = %112
  br label %129

129:                                              ; preds = %128
  %130 = load i32, ptr %2, align 4, !tbaa !9
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %2, align 4, !tbaa !9
  br label %108, !llvm.loop !28

132:                                              ; preds = %108
  br label %133

133:                                              ; preds = %132
  %134 = load i32, ptr %1, align 4, !tbaa !9
  %135 = add nsw i32 %134, 1
  store i32 %135, ptr %1, align 4, !tbaa !9
  br label %104, !llvm.loop !29

136:                                              ; preds = %104
  store i32 0, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 1), align 4, !tbaa !9
  store i32 193, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 1), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %137

137:                                              ; preds = %166, %136
  %138 = load i32, ptr %1, align 4, !tbaa !9
  %139 = icmp sle i32 %138, 0
  br i1 %139, label %140, label %169

140:                                              ; preds = %137
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %141

141:                                              ; preds = %162, %140
  %142 = load i32, ptr %2, align 4, !tbaa !9
  %143 = icmp sle i32 %142, 3
  br i1 %143, label %144, label %165

144:                                              ; preds = %141
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %145

145:                                              ; preds = %158, %144
  %146 = load i32, ptr %3, align 4, !tbaa !9
  %147 = icmp sle i32 %146, 1
  br i1 %147, label %148, label %161

148:                                              ; preds = %145
  %149 = load i32, ptr %1, align 4, !tbaa !9
  %150 = load i32, ptr %2, align 4, !tbaa !9
  %151 = load i32, ptr %3, align 4, !tbaa !9
  %152 = mul nsw i32 8, %151
  %153 = add nsw i32 %150, %152
  %154 = mul nsw i32 8, %153
  %155 = add nsw i32 %149, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 2), i64 0, i64 %156
  store i32 1, ptr %157, align 4, !tbaa !9
  br label %158

158:                                              ; preds = %148
  %159 = load i32, ptr %3, align 4, !tbaa !9
  %160 = add nsw i32 %159, 1
  store i32 %160, ptr %3, align 4, !tbaa !9
  br label %145, !llvm.loop !30

161:                                              ; preds = %145
  br label %162

162:                                              ; preds = %161
  %163 = load i32, ptr %2, align 4, !tbaa !9
  %164 = add nsw i32 %163, 1
  store i32 %164, ptr %2, align 4, !tbaa !9
  br label %141, !llvm.loop !31

165:                                              ; preds = %141
  br label %166

166:                                              ; preds = %165
  %167 = load i32, ptr %1, align 4, !tbaa !9
  %168 = add nsw i32 %167, 1
  store i32 %168, ptr %1, align 4, !tbaa !9
  br label %137, !llvm.loop !32

169:                                              ; preds = %137
  store i32 0, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 2), align 4, !tbaa !9
  store i32 88, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 2), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %170

170:                                              ; preds = %199, %169
  %171 = load i32, ptr %1, align 4, !tbaa !9
  %172 = icmp sle i32 %171, 1
  br i1 %172, label %173, label %202

173:                                              ; preds = %170
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %174

174:                                              ; preds = %195, %173
  %175 = load i32, ptr %2, align 4, !tbaa !9
  %176 = icmp sle i32 %175, 3
  br i1 %176, label %177, label %198

177:                                              ; preds = %174
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %178

178:                                              ; preds = %191, %177
  %179 = load i32, ptr %3, align 4, !tbaa !9
  %180 = icmp sle i32 %179, 0
  br i1 %180, label %181, label %194

181:                                              ; preds = %178
  %182 = load i32, ptr %1, align 4, !tbaa !9
  %183 = load i32, ptr %2, align 4, !tbaa !9
  %184 = load i32, ptr %3, align 4, !tbaa !9
  %185 = mul nsw i32 8, %184
  %186 = add nsw i32 %183, %185
  %187 = mul nsw i32 8, %186
  %188 = add nsw i32 %182, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 3), i64 0, i64 %189
  store i32 1, ptr %190, align 4, !tbaa !9
  br label %191

191:                                              ; preds = %181
  %192 = load i32, ptr %3, align 4, !tbaa !9
  %193 = add nsw i32 %192, 1
  store i32 %193, ptr %3, align 4, !tbaa !9
  br label %178, !llvm.loop !33

194:                                              ; preds = %178
  br label %195

195:                                              ; preds = %194
  %196 = load i32, ptr %2, align 4, !tbaa !9
  %197 = add nsw i32 %196, 1
  store i32 %197, ptr %2, align 4, !tbaa !9
  br label %174, !llvm.loop !34

198:                                              ; preds = %174
  br label %199

199:                                              ; preds = %198
  %200 = load i32, ptr %1, align 4, !tbaa !9
  %201 = add nsw i32 %200, 1
  store i32 %201, ptr %1, align 4, !tbaa !9
  br label %170, !llvm.loop !35

202:                                              ; preds = %170
  store i32 0, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 3), align 4, !tbaa !9
  store i32 25, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 3), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %203

203:                                              ; preds = %232, %202
  %204 = load i32, ptr %1, align 4, !tbaa !9
  %205 = icmp sle i32 %204, 3
  br i1 %205, label %206, label %235

206:                                              ; preds = %203
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %207

207:                                              ; preds = %228, %206
  %208 = load i32, ptr %2, align 4, !tbaa !9
  %209 = icmp sle i32 %208, 0
  br i1 %209, label %210, label %231

210:                                              ; preds = %207
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %211

211:                                              ; preds = %224, %210
  %212 = load i32, ptr %3, align 4, !tbaa !9
  %213 = icmp sle i32 %212, 1
  br i1 %213, label %214, label %227

214:                                              ; preds = %211
  %215 = load i32, ptr %1, align 4, !tbaa !9
  %216 = load i32, ptr %2, align 4, !tbaa !9
  %217 = load i32, ptr %3, align 4, !tbaa !9
  %218 = mul nsw i32 8, %217
  %219 = add nsw i32 %216, %218
  %220 = mul nsw i32 8, %219
  %221 = add nsw i32 %215, %220
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 4), i64 0, i64 %222
  store i32 1, ptr %223, align 4, !tbaa !9
  br label %224

224:                                              ; preds = %214
  %225 = load i32, ptr %3, align 4, !tbaa !9
  %226 = add nsw i32 %225, 1
  store i32 %226, ptr %3, align 4, !tbaa !9
  br label %211, !llvm.loop !36

227:                                              ; preds = %211
  br label %228

228:                                              ; preds = %227
  %229 = load i32, ptr %2, align 4, !tbaa !9
  %230 = add nsw i32 %229, 1
  store i32 %230, ptr %2, align 4, !tbaa !9
  br label %207, !llvm.loop !37

231:                                              ; preds = %207
  br label %232

232:                                              ; preds = %231
  %233 = load i32, ptr %1, align 4, !tbaa !9
  %234 = add nsw i32 %233, 1
  store i32 %234, ptr %1, align 4, !tbaa !9
  br label %203, !llvm.loop !38

235:                                              ; preds = %203
  store i32 0, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 4), align 4, !tbaa !9
  store i32 67, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 4), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %236

236:                                              ; preds = %265, %235
  %237 = load i32, ptr %1, align 4, !tbaa !9
  %238 = icmp sle i32 %237, 0
  br i1 %238, label %239, label %268

239:                                              ; preds = %236
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %240

240:                                              ; preds = %261, %239
  %241 = load i32, ptr %2, align 4, !tbaa !9
  %242 = icmp sle i32 %241, 1
  br i1 %242, label %243, label %264

243:                                              ; preds = %240
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %244

244:                                              ; preds = %257, %243
  %245 = load i32, ptr %3, align 4, !tbaa !9
  %246 = icmp sle i32 %245, 3
  br i1 %246, label %247, label %260

247:                                              ; preds = %244
  %248 = load i32, ptr %1, align 4, !tbaa !9
  %249 = load i32, ptr %2, align 4, !tbaa !9
  %250 = load i32, ptr %3, align 4, !tbaa !9
  %251 = mul nsw i32 8, %250
  %252 = add nsw i32 %249, %251
  %253 = mul nsw i32 8, %252
  %254 = add nsw i32 %248, %253
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 5), i64 0, i64 %255
  store i32 1, ptr %256, align 4, !tbaa !9
  br label %257

257:                                              ; preds = %247
  %258 = load i32, ptr %3, align 4, !tbaa !9
  %259 = add nsw i32 %258, 1
  store i32 %259, ptr %3, align 4, !tbaa !9
  br label %244, !llvm.loop !39

260:                                              ; preds = %244
  br label %261

261:                                              ; preds = %260
  %262 = load i32, ptr %2, align 4, !tbaa !9
  %263 = add nsw i32 %262, 1
  store i32 %263, ptr %2, align 4, !tbaa !9
  br label %240, !llvm.loop !40

264:                                              ; preds = %240
  br label %265

265:                                              ; preds = %264
  %266 = load i32, ptr %1, align 4, !tbaa !9
  %267 = add nsw i32 %266, 1
  store i32 %267, ptr %1, align 4, !tbaa !9
  br label %236, !llvm.loop !41

268:                                              ; preds = %236
  store i32 0, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 5), align 4, !tbaa !9
  store i32 200, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 5), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %269

269:                                              ; preds = %298, %268
  %270 = load i32, ptr %1, align 4, !tbaa !9
  %271 = icmp sle i32 %270, 2
  br i1 %271, label %272, label %301

272:                                              ; preds = %269
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %273

273:                                              ; preds = %294, %272
  %274 = load i32, ptr %2, align 4, !tbaa !9
  %275 = icmp sle i32 %274, 0
  br i1 %275, label %276, label %297

276:                                              ; preds = %273
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %277

277:                                              ; preds = %290, %276
  %278 = load i32, ptr %3, align 4, !tbaa !9
  %279 = icmp sle i32 %278, 0
  br i1 %279, label %280, label %293

280:                                              ; preds = %277
  %281 = load i32, ptr %1, align 4, !tbaa !9
  %282 = load i32, ptr %2, align 4, !tbaa !9
  %283 = load i32, ptr %3, align 4, !tbaa !9
  %284 = mul nsw i32 8, %283
  %285 = add nsw i32 %282, %284
  %286 = mul nsw i32 8, %285
  %287 = add nsw i32 %281, %286
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 6), i64 0, i64 %288
  store i32 1, ptr %289, align 4, !tbaa !9
  br label %290

290:                                              ; preds = %280
  %291 = load i32, ptr %3, align 4, !tbaa !9
  %292 = add nsw i32 %291, 1
  store i32 %292, ptr %3, align 4, !tbaa !9
  br label %277, !llvm.loop !42

293:                                              ; preds = %277
  br label %294

294:                                              ; preds = %293
  %295 = load i32, ptr %2, align 4, !tbaa !9
  %296 = add nsw i32 %295, 1
  store i32 %296, ptr %2, align 4, !tbaa !9
  br label %273, !llvm.loop !43

297:                                              ; preds = %273
  br label %298

298:                                              ; preds = %297
  %299 = load i32, ptr %1, align 4, !tbaa !9
  %300 = add nsw i32 %299, 1
  store i32 %300, ptr %1, align 4, !tbaa !9
  br label %269, !llvm.loop !44

301:                                              ; preds = %269
  store i32 1, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 6), align 4, !tbaa !9
  store i32 2, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 6), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %302

302:                                              ; preds = %331, %301
  %303 = load i32, ptr %1, align 4, !tbaa !9
  %304 = icmp sle i32 %303, 0
  br i1 %304, label %305, label %334

305:                                              ; preds = %302
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %306

306:                                              ; preds = %327, %305
  %307 = load i32, ptr %2, align 4, !tbaa !9
  %308 = icmp sle i32 %307, 2
  br i1 %308, label %309, label %330

309:                                              ; preds = %306
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %310

310:                                              ; preds = %323, %309
  %311 = load i32, ptr %3, align 4, !tbaa !9
  %312 = icmp sle i32 %311, 0
  br i1 %312, label %313, label %326

313:                                              ; preds = %310
  %314 = load i32, ptr %1, align 4, !tbaa !9
  %315 = load i32, ptr %2, align 4, !tbaa !9
  %316 = load i32, ptr %3, align 4, !tbaa !9
  %317 = mul nsw i32 8, %316
  %318 = add nsw i32 %315, %317
  %319 = mul nsw i32 8, %318
  %320 = add nsw i32 %314, %319
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 7), i64 0, i64 %321
  store i32 1, ptr %322, align 4, !tbaa !9
  br label %323

323:                                              ; preds = %313
  %324 = load i32, ptr %3, align 4, !tbaa !9
  %325 = add nsw i32 %324, 1
  store i32 %325, ptr %3, align 4, !tbaa !9
  br label %310, !llvm.loop !45

326:                                              ; preds = %310
  br label %327

327:                                              ; preds = %326
  %328 = load i32, ptr %2, align 4, !tbaa !9
  %329 = add nsw i32 %328, 1
  store i32 %329, ptr %2, align 4, !tbaa !9
  br label %306, !llvm.loop !46

330:                                              ; preds = %306
  br label %331

331:                                              ; preds = %330
  %332 = load i32, ptr %1, align 4, !tbaa !9
  %333 = add nsw i32 %332, 1
  store i32 %333, ptr %1, align 4, !tbaa !9
  br label %302, !llvm.loop !47

334:                                              ; preds = %302
  store i32 1, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 7), align 4, !tbaa !9
  store i32 16, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 7), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %335

335:                                              ; preds = %364, %334
  %336 = load i32, ptr %1, align 4, !tbaa !9
  %337 = icmp sle i32 %336, 0
  br i1 %337, label %338, label %367

338:                                              ; preds = %335
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %339

339:                                              ; preds = %360, %338
  %340 = load i32, ptr %2, align 4, !tbaa !9
  %341 = icmp sle i32 %340, 0
  br i1 %341, label %342, label %363

342:                                              ; preds = %339
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %343

343:                                              ; preds = %356, %342
  %344 = load i32, ptr %3, align 4, !tbaa !9
  %345 = icmp sle i32 %344, 2
  br i1 %345, label %346, label %359

346:                                              ; preds = %343
  %347 = load i32, ptr %1, align 4, !tbaa !9
  %348 = load i32, ptr %2, align 4, !tbaa !9
  %349 = load i32, ptr %3, align 4, !tbaa !9
  %350 = mul nsw i32 8, %349
  %351 = add nsw i32 %348, %350
  %352 = mul nsw i32 8, %351
  %353 = add nsw i32 %347, %352
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 8), i64 0, i64 %354
  store i32 1, ptr %355, align 4, !tbaa !9
  br label %356

356:                                              ; preds = %346
  %357 = load i32, ptr %3, align 4, !tbaa !9
  %358 = add nsw i32 %357, 1
  store i32 %358, ptr %3, align 4, !tbaa !9
  br label %343, !llvm.loop !48

359:                                              ; preds = %343
  br label %360

360:                                              ; preds = %359
  %361 = load i32, ptr %2, align 4, !tbaa !9
  %362 = add nsw i32 %361, 1
  store i32 %362, ptr %2, align 4, !tbaa !9
  br label %339, !llvm.loop !49

363:                                              ; preds = %339
  br label %364

364:                                              ; preds = %363
  %365 = load i32, ptr %1, align 4, !tbaa !9
  %366 = add nsw i32 %365, 1
  store i32 %366, ptr %1, align 4, !tbaa !9
  br label %335, !llvm.loop !50

367:                                              ; preds = %335
  store i32 1, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 8), align 4, !tbaa !9
  store i32 128, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 8), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %368

368:                                              ; preds = %397, %367
  %369 = load i32, ptr %1, align 4, !tbaa !9
  %370 = icmp sle i32 %369, 1
  br i1 %370, label %371, label %400

371:                                              ; preds = %368
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %372

372:                                              ; preds = %393, %371
  %373 = load i32, ptr %2, align 4, !tbaa !9
  %374 = icmp sle i32 %373, 1
  br i1 %374, label %375, label %396

375:                                              ; preds = %372
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %376

376:                                              ; preds = %389, %375
  %377 = load i32, ptr %3, align 4, !tbaa !9
  %378 = icmp sle i32 %377, 0
  br i1 %378, label %379, label %392

379:                                              ; preds = %376
  %380 = load i32, ptr %1, align 4, !tbaa !9
  %381 = load i32, ptr %2, align 4, !tbaa !9
  %382 = load i32, ptr %3, align 4, !tbaa !9
  %383 = mul nsw i32 8, %382
  %384 = add nsw i32 %381, %383
  %385 = mul nsw i32 8, %384
  %386 = add nsw i32 %380, %385
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 9), i64 0, i64 %387
  store i32 1, ptr %388, align 4, !tbaa !9
  br label %389

389:                                              ; preds = %379
  %390 = load i32, ptr %3, align 4, !tbaa !9
  %391 = add nsw i32 %390, 1
  store i32 %391, ptr %3, align 4, !tbaa !9
  br label %376, !llvm.loop !51

392:                                              ; preds = %376
  br label %393

393:                                              ; preds = %392
  %394 = load i32, ptr %2, align 4, !tbaa !9
  %395 = add nsw i32 %394, 1
  store i32 %395, ptr %2, align 4, !tbaa !9
  br label %372, !llvm.loop !52

396:                                              ; preds = %372
  br label %397

397:                                              ; preds = %396
  %398 = load i32, ptr %1, align 4, !tbaa !9
  %399 = add nsw i32 %398, 1
  store i32 %399, ptr %1, align 4, !tbaa !9
  br label %368, !llvm.loop !53

400:                                              ; preds = %368
  store i32 2, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 9), align 4, !tbaa !9
  store i32 9, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 9), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %401

401:                                              ; preds = %430, %400
  %402 = load i32, ptr %1, align 4, !tbaa !9
  %403 = icmp sle i32 %402, 1
  br i1 %403, label %404, label %433

404:                                              ; preds = %401
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %405

405:                                              ; preds = %426, %404
  %406 = load i32, ptr %2, align 4, !tbaa !9
  %407 = icmp sle i32 %406, 0
  br i1 %407, label %408, label %429

408:                                              ; preds = %405
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %409

409:                                              ; preds = %422, %408
  %410 = load i32, ptr %3, align 4, !tbaa !9
  %411 = icmp sle i32 %410, 1
  br i1 %411, label %412, label %425

412:                                              ; preds = %409
  %413 = load i32, ptr %1, align 4, !tbaa !9
  %414 = load i32, ptr %2, align 4, !tbaa !9
  %415 = load i32, ptr %3, align 4, !tbaa !9
  %416 = mul nsw i32 8, %415
  %417 = add nsw i32 %414, %416
  %418 = mul nsw i32 8, %417
  %419 = add nsw i32 %413, %418
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 10), i64 0, i64 %420
  store i32 1, ptr %421, align 4, !tbaa !9
  br label %422

422:                                              ; preds = %412
  %423 = load i32, ptr %3, align 4, !tbaa !9
  %424 = add nsw i32 %423, 1
  store i32 %424, ptr %3, align 4, !tbaa !9
  br label %409, !llvm.loop !54

425:                                              ; preds = %409
  br label %426

426:                                              ; preds = %425
  %427 = load i32, ptr %2, align 4, !tbaa !9
  %428 = add nsw i32 %427, 1
  store i32 %428, ptr %2, align 4, !tbaa !9
  br label %405, !llvm.loop !55

429:                                              ; preds = %405
  br label %430

430:                                              ; preds = %429
  %431 = load i32, ptr %1, align 4, !tbaa !9
  %432 = add nsw i32 %431, 1
  store i32 %432, ptr %1, align 4, !tbaa !9
  br label %401, !llvm.loop !56

433:                                              ; preds = %401
  store i32 2, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 10), align 4, !tbaa !9
  store i32 65, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 10), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %434

434:                                              ; preds = %463, %433
  %435 = load i32, ptr %1, align 4, !tbaa !9
  %436 = icmp sle i32 %435, 0
  br i1 %436, label %437, label %466

437:                                              ; preds = %434
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %438

438:                                              ; preds = %459, %437
  %439 = load i32, ptr %2, align 4, !tbaa !9
  %440 = icmp sle i32 %439, 1
  br i1 %440, label %441, label %462

441:                                              ; preds = %438
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %442

442:                                              ; preds = %455, %441
  %443 = load i32, ptr %3, align 4, !tbaa !9
  %444 = icmp sle i32 %443, 1
  br i1 %444, label %445, label %458

445:                                              ; preds = %442
  %446 = load i32, ptr %1, align 4, !tbaa !9
  %447 = load i32, ptr %2, align 4, !tbaa !9
  %448 = load i32, ptr %3, align 4, !tbaa !9
  %449 = mul nsw i32 8, %448
  %450 = add nsw i32 %447, %449
  %451 = mul nsw i32 8, %450
  %452 = add nsw i32 %446, %451
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 11), i64 0, i64 %453
  store i32 1, ptr %454, align 4, !tbaa !9
  br label %455

455:                                              ; preds = %445
  %456 = load i32, ptr %3, align 4, !tbaa !9
  %457 = add nsw i32 %456, 1
  store i32 %457, ptr %3, align 4, !tbaa !9
  br label %442, !llvm.loop !57

458:                                              ; preds = %442
  br label %459

459:                                              ; preds = %458
  %460 = load i32, ptr %2, align 4, !tbaa !9
  %461 = add nsw i32 %460, 1
  store i32 %461, ptr %2, align 4, !tbaa !9
  br label %438, !llvm.loop !58

462:                                              ; preds = %438
  br label %463

463:                                              ; preds = %462
  %464 = load i32, ptr %1, align 4, !tbaa !9
  %465 = add nsw i32 %464, 1
  store i32 %465, ptr %1, align 4, !tbaa !9
  br label %434, !llvm.loop !59

466:                                              ; preds = %434
  store i32 2, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 11), align 4, !tbaa !9
  store i32 72, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 11), align 4, !tbaa !9
  store i32 0, ptr %1, align 4, !tbaa !9
  br label %467

467:                                              ; preds = %496, %466
  %468 = load i32, ptr %1, align 4, !tbaa !9
  %469 = icmp sle i32 %468, 1
  br i1 %469, label %470, label %499

470:                                              ; preds = %467
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %471

471:                                              ; preds = %492, %470
  %472 = load i32, ptr %2, align 4, !tbaa !9
  %473 = icmp sle i32 %472, 1
  br i1 %473, label %474, label %495

474:                                              ; preds = %471
  store i32 0, ptr %3, align 4, !tbaa !9
  br label %475

475:                                              ; preds = %488, %474
  %476 = load i32, ptr %3, align 4, !tbaa !9
  %477 = icmp sle i32 %476, 1
  br i1 %477, label %478, label %491

478:                                              ; preds = %475
  %479 = load i32, ptr %1, align 4, !tbaa !9
  %480 = load i32, ptr %2, align 4, !tbaa !9
  %481 = load i32, ptr %3, align 4, !tbaa !9
  %482 = mul nsw i32 8, %481
  %483 = add nsw i32 %480, %482
  %484 = mul nsw i32 8, %483
  %485 = add nsw i32 %479, %484
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds [512 x i32], ptr getelementptr inbounds ([13 x [512 x i32]], ptr @p, i64 0, i64 12), i64 0, i64 %486
  store i32 1, ptr %487, align 4, !tbaa !9
  br label %488

488:                                              ; preds = %478
  %489 = load i32, ptr %3, align 4, !tbaa !9
  %490 = add nsw i32 %489, 1
  store i32 %490, ptr %3, align 4, !tbaa !9
  br label %475, !llvm.loop !60

491:                                              ; preds = %475
  br label %492

492:                                              ; preds = %491
  %493 = load i32, ptr %2, align 4, !tbaa !9
  %494 = add nsw i32 %493, 1
  store i32 %494, ptr %2, align 4, !tbaa !9
  br label %471, !llvm.loop !61

495:                                              ; preds = %471
  br label %496

496:                                              ; preds = %495
  %497 = load i32, ptr %1, align 4, !tbaa !9
  %498 = add nsw i32 %497, 1
  store i32 %498, ptr %1, align 4, !tbaa !9
  br label %467, !llvm.loop !62

499:                                              ; preds = %467
  store i32 3, ptr getelementptr inbounds ([13 x i32], ptr @class, i64 0, i64 12), align 4, !tbaa !9
  store i32 73, ptr getelementptr inbounds ([13 x i32], ptr @piecemax, i64 0, i64 12), align 4, !tbaa !9
  store i32 13, ptr @piececount, align 4, !tbaa !9
  store i32 3, ptr getelementptr inbounds ([4 x i32], ptr @piececount, i64 0, i64 1), align 4, !tbaa !9
  store i32 1, ptr getelementptr inbounds ([4 x i32], ptr @piececount, i64 0, i64 2), align 4, !tbaa !9
  store i32 1, ptr getelementptr inbounds ([4 x i32], ptr @piececount, i64 0, i64 3), align 4, !tbaa !9
  store i32 73, ptr %4, align 4, !tbaa !9
  store i32 0, ptr @kount, align 4, !tbaa !9
  %500 = load i32, ptr %4, align 4, !tbaa !9
  %501 = call i32 @Fit(i32 noundef 0, i32 noundef %500)
  %502 = icmp ne i32 %501, 0
  br i1 %502, label %503, label %506

503:                                              ; preds = %499
  %504 = load i32, ptr %4, align 4, !tbaa !9
  %505 = call i32 @Place(i32 noundef 0, i32 noundef %504)
  store i32 %505, ptr @n, align 4, !tbaa !9
  br label %508

506:                                              ; preds = %499
  %507 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %508

508:                                              ; preds = %506, %503
  %509 = load i32, ptr @n, align 4, !tbaa !9
  %510 = call i32 @Trial(i32 noundef %509)
  %511 = icmp ne i32 %510, 0
  br i1 %511, label %514, label %512

512:                                              ; preds = %508
  %513 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %520

514:                                              ; preds = %508
  %515 = load i32, ptr @kount, align 4, !tbaa !9
  %516 = icmp ne i32 %515, 2005
  br i1 %516, label %517, label %519

517:                                              ; preds = %514
  %518 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %519

519:                                              ; preds = %517, %514
  br label %520

520:                                              ; preds = %519, %512
  %521 = load i32, ptr @n, align 4, !tbaa !9
  %522 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %521)
  %523 = load i32, ptr @kount, align 4, !tbaa !9
  %524 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %523)
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #3
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #3
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
  store i32 0, ptr %2, align 4, !tbaa !9
  br label %3

3:                                                ; preds = %7, %0
  %4 = load i32, ptr %2, align 4, !tbaa !9
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  call void @Puzzle()
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %2, align 4, !tbaa !9
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %2, align 4, !tbaa !9
  br label %3, !llvm.loop !63

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
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
!16 = distinct !{!16, !12, !13}
!17 = distinct !{!17, !12, !13}
!18 = distinct !{!18, !12, !13}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !12, !13}
!24 = distinct !{!24, !12, !13}
!25 = distinct !{!25, !12, !13}
!26 = distinct !{!26, !12, !13}
!27 = distinct !{!27, !12, !13}
!28 = distinct !{!28, !12, !13}
!29 = distinct !{!29, !12, !13}
!30 = distinct !{!30, !12, !13}
!31 = distinct !{!31, !12, !13}
!32 = distinct !{!32, !12, !13}
!33 = distinct !{!33, !12, !13}
!34 = distinct !{!34, !12, !13}
!35 = distinct !{!35, !12, !13}
!36 = distinct !{!36, !12, !13}
!37 = distinct !{!37, !12, !13}
!38 = distinct !{!38, !12, !13}
!39 = distinct !{!39, !12, !13}
!40 = distinct !{!40, !12, !13}
!41 = distinct !{!41, !12, !13}
!42 = distinct !{!42, !12, !13}
!43 = distinct !{!43, !12, !13}
!44 = distinct !{!44, !12, !13}
!45 = distinct !{!45, !12, !13}
!46 = distinct !{!46, !12, !13}
!47 = distinct !{!47, !12, !13}
!48 = distinct !{!48, !12, !13}
!49 = distinct !{!49, !12, !13}
!50 = distinct !{!50, !12, !13}
!51 = distinct !{!51, !12, !13}
!52 = distinct !{!52, !12, !13}
!53 = distinct !{!53, !12, !13}
!54 = distinct !{!54, !12, !13}
!55 = distinct !{!55, !12, !13}
!56 = distinct !{!56, !12, !13}
!57 = distinct !{!57, !12, !13}
!58 = distinct !{!58, !12, !13}
!59 = distinct !{!59, !12, !13}
!60 = distinct !{!60, !12, !13}
!61 = distinct !{!61, !12, !13}
!62 = distinct !{!62, !12, !13}
!63 = distinct !{!63, !12, !13}
