; ModuleID = 'Oscar.c'
source_filename = "Oscar.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.complex = type { float, float }
%struct.element = type { i32, i32 }

@seed = global i64 0, align 8
@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"  %15.3f%15.3f\00", align 1
@e = global [130 x %struct.complex] zeroinitializer, align 4
@zr = global float 0.000000e+00, align 4
@zi = global float 0.000000e+00, align 4
@z = global [257 x %struct.complex] zeroinitializer, align 4
@w = global [257 x %struct.complex] zeroinitializer, align 4
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
define float @Cos(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store float %0, ptr %2, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #5
  store float 1.000000e+00, ptr %5, align 4, !tbaa !9
  store i32 1, ptr %4, align 4, !tbaa !11
  %7 = load float, ptr %2, align 4, !tbaa !9
  store float %7, ptr %6, align 4, !tbaa !9
  store i32 2, ptr %3, align 4, !tbaa !11
  br label %8

8:                                                ; preds = %41, %1
  %9 = load i32, ptr %3, align 4, !tbaa !11
  %10 = icmp sle i32 %9, 10
  br i1 %10, label %11, label %44

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4, !tbaa !11
  %13 = load i32, ptr %3, align 4, !tbaa !11
  %14 = mul nsw i32 %12, %13
  store i32 %14, ptr %4, align 4, !tbaa !11
  %15 = load float, ptr %6, align 4, !tbaa !9
  %16 = load float, ptr %2, align 4, !tbaa !9
  %17 = fmul float %15, %16
  store float %17, ptr %6, align 4, !tbaa !9
  %18 = load i32, ptr %3, align 4, !tbaa !11
  %19 = and i32 %18, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %40

21:                                               ; preds = %11
  %22 = load i32, ptr %3, align 4, !tbaa !11
  %23 = and i32 %22, 3
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %32

25:                                               ; preds = %21
  %26 = load float, ptr %5, align 4, !tbaa !9
  %27 = load float, ptr %6, align 4, !tbaa !9
  %28 = load i32, ptr %4, align 4, !tbaa !11
  %29 = sitofp i32 %28 to float
  %30 = fdiv float %27, %29
  %31 = fadd float %26, %30
  store float %31, ptr %5, align 4, !tbaa !9
  br label %39

32:                                               ; preds = %21
  %33 = load float, ptr %5, align 4, !tbaa !9
  %34 = load float, ptr %6, align 4, !tbaa !9
  %35 = load i32, ptr %4, align 4, !tbaa !11
  %36 = sitofp i32 %35 to float
  %37 = fdiv float %34, %36
  %38 = fsub float %33, %37
  store float %38, ptr %5, align 4, !tbaa !9
  br label %39

39:                                               ; preds = %32, %25
  br label %40

40:                                               ; preds = %39, %11
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %3, align 4, !tbaa !11
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %3, align 4, !tbaa !11
  br label %8, !llvm.loop !13

44:                                               ; preds = %8
  %45 = load float, ptr %5, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #5
  ret float %45
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @Min0(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4, !tbaa !11
  store i32 %1, ptr %5, align 4, !tbaa !11
  %6 = load i32, ptr %4, align 4, !tbaa !11
  %7 = load i32, ptr %5, align 4, !tbaa !11
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !tbaa !11
  store i32 %10, ptr %3, align 4
  br label %13

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4, !tbaa !11
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %11, %9
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Printcomplex(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !16
  store i32 %1, ptr %6, align 4, !tbaa !11
  store i32 %2, ptr %7, align 4, !tbaa !11
  store i32 %3, ptr %8, align 4, !tbaa !11
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #5
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %11 = load i32, ptr %6, align 4, !tbaa !11
  store i32 %11, ptr %9, align 4, !tbaa !11
  br label %12

12:                                               ; preds = %50, %4
  %13 = load ptr, ptr %5, align 8, !tbaa !16
  %14 = load i32, ptr %9, align 4, !tbaa !11
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.complex, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.complex, ptr %16, i32 0, i32 0
  %18 = load float, ptr %17, align 4, !tbaa !18
  %19 = fpext float %18 to double
  %20 = load ptr, ptr %5, align 8, !tbaa !16
  %21 = load i32, ptr %9, align 4, !tbaa !11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.complex, ptr %20, i64 %22
  %24 = getelementptr inbounds %struct.complex, ptr %23, i32 0, i32 1
  %25 = load float, ptr %24, align 4, !tbaa !20
  %26 = fpext float %25 to double
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %19, double noundef %26)
  %28 = load i32, ptr %9, align 4, !tbaa !11
  %29 = load i32, ptr %8, align 4, !tbaa !11
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr %9, align 4, !tbaa !11
  %31 = load ptr, ptr %5, align 8, !tbaa !16
  %32 = load i32, ptr %9, align 4, !tbaa !11
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.complex, ptr %31, i64 %33
  %35 = getelementptr inbounds %struct.complex, ptr %34, i32 0, i32 0
  %36 = load float, ptr %35, align 4, !tbaa !18
  %37 = fpext float %36 to double
  %38 = load ptr, ptr %5, align 8, !tbaa !16
  %39 = load i32, ptr %9, align 4, !tbaa !11
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.complex, ptr %38, i64 %40
  %42 = getelementptr inbounds %struct.complex, ptr %41, i32 0, i32 1
  %43 = load float, ptr %42, align 4, !tbaa !20
  %44 = fpext float %43 to double
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %37, double noundef %44)
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %47 = load i32, ptr %9, align 4, !tbaa !11
  %48 = load i32, ptr %8, align 4, !tbaa !11
  %49 = add nsw i32 %47, %48
  store i32 %49, ptr %9, align 4, !tbaa !11
  br label %50

50:                                               ; preds = %12
  %51 = load i32, ptr %9, align 4, !tbaa !11
  %52 = load i32, ptr %7, align 4, !tbaa !11
  %53 = icmp sle i32 %51, %52
  br i1 %53, label %12, label %54, !llvm.loop !21

54:                                               ; preds = %50
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #5
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind ssp uwtable(sync)
define void @Uniform11(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !16
  store ptr %1, ptr %4, align 8, !tbaa !16
  %5 = load ptr, ptr %3, align 8, !tbaa !16
  %6 = load i32, ptr %5, align 4, !tbaa !11
  %7 = mul nsw i32 4855, %6
  %8 = add nsw i32 %7, 1731
  %9 = and i32 %8, 8191
  %10 = load ptr, ptr %3, align 8, !tbaa !16
  store i32 %9, ptr %10, align 4, !tbaa !11
  %11 = load ptr, ptr %3, align 8, !tbaa !16
  %12 = load i32, ptr %11, align 4, !tbaa !11
  %13 = sitofp i32 %12 to float
  %14 = fdiv float %13, 8.192000e+03
  %15 = load ptr, ptr %4, align 8, !tbaa !16
  store float %14, ptr %15, align 4, !tbaa !9
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Exptab(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca [26 x float], align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !11
  store ptr %1, ptr %4, align 8, !tbaa !16
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #5
  call void @llvm.lifetime.start.p0(i64 104, ptr %7) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %12) #5
  store float 0x400921FB60000000, ptr %5, align 4, !tbaa !9
  store float 4.000000e+00, ptr %6, align 4, !tbaa !9
  store i32 1, ptr %8, align 4, !tbaa !11
  br label %13

13:                                               ; preds = %29, %2
  %14 = load i32, ptr %8, align 4, !tbaa !11
  %15 = icmp sle i32 %14, 25
  br i1 %15, label %16, label %32

16:                                               ; preds = %13
  %17 = load float, ptr %5, align 4, !tbaa !9
  %18 = load float, ptr %6, align 4, !tbaa !9
  %19 = fdiv float %17, %18
  %20 = call float @Cos(float noundef %19)
  %21 = fmul float 2.000000e+00, %20
  %22 = fdiv float 1.000000e+00, %21
  %23 = load i32, ptr %8, align 4, !tbaa !11
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [26 x float], ptr %7, i64 0, i64 %24
  store float %22, ptr %25, align 4, !tbaa !9
  %26 = load float, ptr %6, align 4, !tbaa !9
  %27 = load float, ptr %6, align 4, !tbaa !9
  %28 = fadd float %26, %27
  store float %28, ptr %6, align 4, !tbaa !9
  br label %29

29:                                               ; preds = %16
  %30 = load i32, ptr %8, align 4, !tbaa !11
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %8, align 4, !tbaa !11
  br label %13, !llvm.loop !22

32:                                               ; preds = %13
  %33 = load i32, ptr %3, align 4, !tbaa !11
  %34 = sdiv i32 %33, 2
  store i32 %34, ptr %12, align 4, !tbaa !11
  %35 = load i32, ptr %12, align 4, !tbaa !11
  %36 = sdiv i32 %35, 2
  store i32 %36, ptr %11, align 4, !tbaa !11
  store i32 1, ptr %9, align 4, !tbaa !11
  %37 = load ptr, ptr %4, align 8, !tbaa !16
  %38 = getelementptr inbounds %struct.complex, ptr %37, i64 1
  %39 = getelementptr inbounds %struct.complex, ptr %38, i32 0, i32 0
  store float 1.000000e+00, ptr %39, align 4, !tbaa !18
  %40 = load ptr, ptr %4, align 8, !tbaa !16
  %41 = getelementptr inbounds %struct.complex, ptr %40, i64 1
  %42 = getelementptr inbounds %struct.complex, ptr %41, i32 0, i32 1
  store float 0.000000e+00, ptr %42, align 4, !tbaa !20
  %43 = load ptr, ptr %4, align 8, !tbaa !16
  %44 = load i32, ptr %11, align 4, !tbaa !11
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %struct.complex, ptr %43, i64 %46
  %48 = getelementptr inbounds %struct.complex, ptr %47, i32 0, i32 0
  store float 0.000000e+00, ptr %48, align 4, !tbaa !18
  %49 = load ptr, ptr %4, align 8, !tbaa !16
  %50 = load i32, ptr %11, align 4, !tbaa !11
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.complex, ptr %49, i64 %52
  %54 = getelementptr inbounds %struct.complex, ptr %53, i32 0, i32 1
  store float 1.000000e+00, ptr %54, align 4, !tbaa !20
  %55 = load ptr, ptr %4, align 8, !tbaa !16
  %56 = load i32, ptr %12, align 4, !tbaa !11
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.complex, ptr %55, i64 %58
  %60 = getelementptr inbounds %struct.complex, ptr %59, i32 0, i32 0
  store float -1.000000e+00, ptr %60, align 4, !tbaa !18
  %61 = load ptr, ptr %4, align 8, !tbaa !16
  %62 = load i32, ptr %12, align 4, !tbaa !11
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.complex, ptr %61, i64 %64
  %66 = getelementptr inbounds %struct.complex, ptr %65, i32 0, i32 1
  store float 0.000000e+00, ptr %66, align 4, !tbaa !20
  br label %67

67:                                               ; preds = %144, %32
  %68 = load i32, ptr %11, align 4, !tbaa !11
  %69 = sdiv i32 %68, 2
  store i32 %69, ptr %8, align 4, !tbaa !11
  %70 = load i32, ptr %8, align 4, !tbaa !11
  store i32 %70, ptr %10, align 4, !tbaa !11
  br label %71

71:                                               ; preds = %135, %67
  %72 = load i32, ptr %9, align 4, !tbaa !11
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [26 x float], ptr %7, i64 0, i64 %73
  %75 = load float, ptr %74, align 4, !tbaa !9
  %76 = load ptr, ptr %4, align 8, !tbaa !16
  %77 = load i32, ptr %10, align 4, !tbaa !11
  %78 = load i32, ptr %8, align 4, !tbaa !11
  %79 = add nsw i32 %77, %78
  %80 = add nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds %struct.complex, ptr %76, i64 %81
  %83 = getelementptr inbounds %struct.complex, ptr %82, i32 0, i32 0
  %84 = load float, ptr %83, align 4, !tbaa !18
  %85 = load ptr, ptr %4, align 8, !tbaa !16
  %86 = load i32, ptr %10, align 4, !tbaa !11
  %87 = load i32, ptr %8, align 4, !tbaa !11
  %88 = sub nsw i32 %86, %87
  %89 = add nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.complex, ptr %85, i64 %90
  %92 = getelementptr inbounds %struct.complex, ptr %91, i32 0, i32 0
  %93 = load float, ptr %92, align 4, !tbaa !18
  %94 = fadd float %84, %93
  %95 = fmul float %75, %94
  %96 = load ptr, ptr %4, align 8, !tbaa !16
  %97 = load i32, ptr %10, align 4, !tbaa !11
  %98 = add nsw i32 %97, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.complex, ptr %96, i64 %99
  %101 = getelementptr inbounds %struct.complex, ptr %100, i32 0, i32 0
  store float %95, ptr %101, align 4, !tbaa !18
  %102 = load i32, ptr %9, align 4, !tbaa !11
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [26 x float], ptr %7, i64 0, i64 %103
  %105 = load float, ptr %104, align 4, !tbaa !9
  %106 = load ptr, ptr %4, align 8, !tbaa !16
  %107 = load i32, ptr %10, align 4, !tbaa !11
  %108 = load i32, ptr %8, align 4, !tbaa !11
  %109 = add nsw i32 %107, %108
  %110 = add nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds %struct.complex, ptr %106, i64 %111
  %113 = getelementptr inbounds %struct.complex, ptr %112, i32 0, i32 1
  %114 = load float, ptr %113, align 4, !tbaa !20
  %115 = load ptr, ptr %4, align 8, !tbaa !16
  %116 = load i32, ptr %10, align 4, !tbaa !11
  %117 = load i32, ptr %8, align 4, !tbaa !11
  %118 = sub nsw i32 %116, %117
  %119 = add nsw i32 %118, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds %struct.complex, ptr %115, i64 %120
  %122 = getelementptr inbounds %struct.complex, ptr %121, i32 0, i32 1
  %123 = load float, ptr %122, align 4, !tbaa !20
  %124 = fadd float %114, %123
  %125 = fmul float %105, %124
  %126 = load ptr, ptr %4, align 8, !tbaa !16
  %127 = load i32, ptr %10, align 4, !tbaa !11
  %128 = add nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds %struct.complex, ptr %126, i64 %129
  %131 = getelementptr inbounds %struct.complex, ptr %130, i32 0, i32 1
  store float %125, ptr %131, align 4, !tbaa !20
  %132 = load i32, ptr %10, align 4, !tbaa !11
  %133 = load i32, ptr %11, align 4, !tbaa !11
  %134 = add nsw i32 %132, %133
  store i32 %134, ptr %10, align 4, !tbaa !11
  br label %135

135:                                              ; preds = %71
  %136 = load i32, ptr %10, align 4, !tbaa !11
  %137 = load i32, ptr %12, align 4, !tbaa !11
  %138 = icmp sle i32 %136, %137
  br i1 %138, label %71, label %139, !llvm.loop !23

139:                                              ; preds = %135
  %140 = load i32, ptr %9, align 4, !tbaa !11
  %141 = add nsw i32 %140, 1
  %142 = call i32 @Min0(i32 noundef %141, i32 noundef 25)
  store i32 %142, ptr %9, align 4, !tbaa !11
  %143 = load i32, ptr %8, align 4, !tbaa !11
  store i32 %143, ptr %11, align 4, !tbaa !11
  br label %144

144:                                              ; preds = %139
  %145 = load i32, ptr %11, align 4, !tbaa !11
  %146 = icmp sgt i32 %145, 1
  br i1 %146, label %67, label %147, !llvm.loop !24

147:                                              ; preds = %144
  call void @llvm.lifetime.end.p0(i64 4, ptr %12) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #5
  call void @llvm.lifetime.end.p0(i64 104, ptr %7) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #5
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @Fft(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, float noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca float, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 %0, ptr %6, align 4, !tbaa !11
  store ptr %1, ptr %7, align 8, !tbaa !16
  store ptr %2, ptr %8, align 8, !tbaa !16
  store ptr %3, ptr %9, align 8, !tbaa !16
  store float %4, ptr %10, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %12) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %13) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %14) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %15) #5
  call void @llvm.lifetime.start.p0(i64 4, ptr %16) #5
  %17 = load i32, ptr %6, align 4, !tbaa !11
  %18 = sdiv i32 %17, 2
  store i32 %18, ptr %15, align 4, !tbaa !11
  store i32 1, ptr %14, align 4, !tbaa !11
  br label %19

19:                                               ; preds = %209, %5
  store i32 0, ptr %13, align 4, !tbaa !11
  %20 = load i32, ptr %14, align 4, !tbaa !11
  store i32 %20, ptr %12, align 4, !tbaa !11
  store i32 1, ptr %11, align 4, !tbaa !11
  br label %21

21:                                               ; preds = %185, %19
  br label %22

22:                                               ; preds = %176, %21
  %23 = load ptr, ptr %7, align 8, !tbaa !16
  %24 = load i32, ptr %11, align 4, !tbaa !11
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.complex, ptr %23, i64 %25
  %27 = getelementptr inbounds %struct.complex, ptr %26, i32 0, i32 0
  %28 = load float, ptr %27, align 4, !tbaa !18
  %29 = load ptr, ptr %7, align 8, !tbaa !16
  %30 = load i32, ptr %15, align 4, !tbaa !11
  %31 = load i32, ptr %11, align 4, !tbaa !11
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.complex, ptr %29, i64 %33
  %35 = getelementptr inbounds %struct.complex, ptr %34, i32 0, i32 0
  %36 = load float, ptr %35, align 4, !tbaa !18
  %37 = fadd float %28, %36
  %38 = load ptr, ptr %8, align 8, !tbaa !16
  %39 = load i32, ptr %11, align 4, !tbaa !11
  %40 = load i32, ptr %13, align 4, !tbaa !11
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %struct.complex, ptr %38, i64 %42
  %44 = getelementptr inbounds %struct.complex, ptr %43, i32 0, i32 0
  store float %37, ptr %44, align 4, !tbaa !18
  %45 = load ptr, ptr %7, align 8, !tbaa !16
  %46 = load i32, ptr %11, align 4, !tbaa !11
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.complex, ptr %45, i64 %47
  %49 = getelementptr inbounds %struct.complex, ptr %48, i32 0, i32 1
  %50 = load float, ptr %49, align 4, !tbaa !20
  %51 = load ptr, ptr %7, align 8, !tbaa !16
  %52 = load i32, ptr %15, align 4, !tbaa !11
  %53 = load i32, ptr %11, align 4, !tbaa !11
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.complex, ptr %51, i64 %55
  %57 = getelementptr inbounds %struct.complex, ptr %56, i32 0, i32 1
  %58 = load float, ptr %57, align 4, !tbaa !20
  %59 = fadd float %50, %58
  %60 = load ptr, ptr %8, align 8, !tbaa !16
  %61 = load i32, ptr %11, align 4, !tbaa !11
  %62 = load i32, ptr %13, align 4, !tbaa !11
  %63 = add nsw i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.complex, ptr %60, i64 %64
  %66 = getelementptr inbounds %struct.complex, ptr %65, i32 0, i32 1
  store float %59, ptr %66, align 4, !tbaa !20
  %67 = load ptr, ptr %9, align 8, !tbaa !16
  %68 = load i32, ptr %13, align 4, !tbaa !11
  %69 = add nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds %struct.complex, ptr %67, i64 %70
  %72 = getelementptr inbounds %struct.complex, ptr %71, i32 0, i32 0
  %73 = load float, ptr %72, align 4, !tbaa !18
  %74 = load ptr, ptr %7, align 8, !tbaa !16
  %75 = load i32, ptr %11, align 4, !tbaa !11
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds %struct.complex, ptr %74, i64 %76
  %78 = getelementptr inbounds %struct.complex, ptr %77, i32 0, i32 0
  %79 = load float, ptr %78, align 4, !tbaa !18
  %80 = load ptr, ptr %7, align 8, !tbaa !16
  %81 = load i32, ptr %11, align 4, !tbaa !11
  %82 = load i32, ptr %15, align 4, !tbaa !11
  %83 = add nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.complex, ptr %80, i64 %84
  %86 = getelementptr inbounds %struct.complex, ptr %85, i32 0, i32 0
  %87 = load float, ptr %86, align 4, !tbaa !18
  %88 = fsub float %79, %87
  %89 = load ptr, ptr %9, align 8, !tbaa !16
  %90 = load i32, ptr %13, align 4, !tbaa !11
  %91 = add nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds %struct.complex, ptr %89, i64 %92
  %94 = getelementptr inbounds %struct.complex, ptr %93, i32 0, i32 1
  %95 = load float, ptr %94, align 4, !tbaa !20
  %96 = load ptr, ptr %7, align 8, !tbaa !16
  %97 = load i32, ptr %11, align 4, !tbaa !11
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.complex, ptr %96, i64 %98
  %100 = getelementptr inbounds %struct.complex, ptr %99, i32 0, i32 1
  %101 = load float, ptr %100, align 4, !tbaa !20
  %102 = load ptr, ptr %7, align 8, !tbaa !16
  %103 = load i32, ptr %11, align 4, !tbaa !11
  %104 = load i32, ptr %15, align 4, !tbaa !11
  %105 = add nsw i32 %103, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds %struct.complex, ptr %102, i64 %106
  %108 = getelementptr inbounds %struct.complex, ptr %107, i32 0, i32 1
  %109 = load float, ptr %108, align 4, !tbaa !20
  %110 = fsub float %101, %109
  %111 = fmul float %95, %110
  %112 = fneg float %111
  %113 = call float @llvm.fmuladd.f32(float %73, float %88, float %112)
  %114 = load ptr, ptr %8, align 8, !tbaa !16
  %115 = load i32, ptr %11, align 4, !tbaa !11
  %116 = load i32, ptr %12, align 4, !tbaa !11
  %117 = add nsw i32 %115, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds %struct.complex, ptr %114, i64 %118
  %120 = getelementptr inbounds %struct.complex, ptr %119, i32 0, i32 0
  store float %113, ptr %120, align 4, !tbaa !18
  %121 = load ptr, ptr %9, align 8, !tbaa !16
  %122 = load i32, ptr %13, align 4, !tbaa !11
  %123 = add nsw i32 %122, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds %struct.complex, ptr %121, i64 %124
  %126 = getelementptr inbounds %struct.complex, ptr %125, i32 0, i32 0
  %127 = load float, ptr %126, align 4, !tbaa !18
  %128 = load ptr, ptr %7, align 8, !tbaa !16
  %129 = load i32, ptr %11, align 4, !tbaa !11
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds %struct.complex, ptr %128, i64 %130
  %132 = getelementptr inbounds %struct.complex, ptr %131, i32 0, i32 1
  %133 = load float, ptr %132, align 4, !tbaa !20
  %134 = load ptr, ptr %7, align 8, !tbaa !16
  %135 = load i32, ptr %11, align 4, !tbaa !11
  %136 = load i32, ptr %15, align 4, !tbaa !11
  %137 = add nsw i32 %135, %136
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds %struct.complex, ptr %134, i64 %138
  %140 = getelementptr inbounds %struct.complex, ptr %139, i32 0, i32 1
  %141 = load float, ptr %140, align 4, !tbaa !20
  %142 = fsub float %133, %141
  %143 = load ptr, ptr %9, align 8, !tbaa !16
  %144 = load i32, ptr %13, align 4, !tbaa !11
  %145 = add nsw i32 %144, 1
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds %struct.complex, ptr %143, i64 %146
  %148 = getelementptr inbounds %struct.complex, ptr %147, i32 0, i32 1
  %149 = load float, ptr %148, align 4, !tbaa !20
  %150 = load ptr, ptr %7, align 8, !tbaa !16
  %151 = load i32, ptr %11, align 4, !tbaa !11
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds %struct.complex, ptr %150, i64 %152
  %154 = getelementptr inbounds %struct.complex, ptr %153, i32 0, i32 0
  %155 = load float, ptr %154, align 4, !tbaa !18
  %156 = load ptr, ptr %7, align 8, !tbaa !16
  %157 = load i32, ptr %11, align 4, !tbaa !11
  %158 = load i32, ptr %15, align 4, !tbaa !11
  %159 = add nsw i32 %157, %158
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds %struct.complex, ptr %156, i64 %160
  %162 = getelementptr inbounds %struct.complex, ptr %161, i32 0, i32 0
  %163 = load float, ptr %162, align 4, !tbaa !18
  %164 = fsub float %155, %163
  %165 = fmul float %149, %164
  %166 = call float @llvm.fmuladd.f32(float %127, float %142, float %165)
  %167 = load ptr, ptr %8, align 8, !tbaa !16
  %168 = load i32, ptr %11, align 4, !tbaa !11
  %169 = load i32, ptr %12, align 4, !tbaa !11
  %170 = add nsw i32 %168, %169
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds %struct.complex, ptr %167, i64 %171
  %173 = getelementptr inbounds %struct.complex, ptr %172, i32 0, i32 1
  store float %166, ptr %173, align 4, !tbaa !20
  %174 = load i32, ptr %11, align 4, !tbaa !11
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %11, align 4, !tbaa !11
  br label %176

176:                                              ; preds = %22
  %177 = load i32, ptr %11, align 4, !tbaa !11
  %178 = load i32, ptr %12, align 4, !tbaa !11
  %179 = icmp sle i32 %177, %178
  br i1 %179, label %22, label %180, !llvm.loop !25

180:                                              ; preds = %176
  %181 = load i32, ptr %12, align 4, !tbaa !11
  store i32 %181, ptr %13, align 4, !tbaa !11
  %182 = load i32, ptr %13, align 4, !tbaa !11
  %183 = load i32, ptr %14, align 4, !tbaa !11
  %184 = add nsw i32 %182, %183
  store i32 %184, ptr %12, align 4, !tbaa !11
  br label %185

185:                                              ; preds = %180
  %186 = load i32, ptr %12, align 4, !tbaa !11
  %187 = load i32, ptr %15, align 4, !tbaa !11
  %188 = icmp sle i32 %186, %187
  br i1 %188, label %21, label %189, !llvm.loop !26

189:                                              ; preds = %185
  store i32 1, ptr %16, align 4, !tbaa !11
  br label %190

190:                                              ; preds = %201, %189
  %191 = load ptr, ptr %7, align 8, !tbaa !16
  %192 = load i32, ptr %16, align 4, !tbaa !11
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds %struct.complex, ptr %191, i64 %193
  %195 = load ptr, ptr %8, align 8, !tbaa !16
  %196 = load i32, ptr %16, align 4, !tbaa !11
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds %struct.complex, ptr %195, i64 %197
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %194, ptr align 4 %198, i64 8, i1 false), !tbaa.struct !27
  %199 = load i32, ptr %16, align 4, !tbaa !11
  %200 = add nsw i32 %199, 1
  store i32 %200, ptr %16, align 4, !tbaa !11
  br label %201

201:                                              ; preds = %190
  %202 = load i32, ptr %16, align 4, !tbaa !11
  %203 = load i32, ptr %6, align 4, !tbaa !11
  %204 = icmp sle i32 %202, %203
  br i1 %204, label %190, label %205, !llvm.loop !28

205:                                              ; preds = %201
  %206 = load i32, ptr %14, align 4, !tbaa !11
  %207 = load i32, ptr %14, align 4, !tbaa !11
  %208 = add nsw i32 %206, %207
  store i32 %208, ptr %14, align 4, !tbaa !11
  br label %209

209:                                              ; preds = %205
  %210 = load i32, ptr %14, align 4, !tbaa !11
  %211 = load i32, ptr %15, align 4, !tbaa !11
  %212 = icmp sle i32 %210, %211
  br i1 %212, label %19, label %213, !llvm.loop !29

213:                                              ; preds = %209
  store i32 1, ptr %11, align 4, !tbaa !11
  br label %214

214:                                              ; preds = %246, %213
  %215 = load i32, ptr %11, align 4, !tbaa !11
  %216 = load i32, ptr %6, align 4, !tbaa !11
  %217 = icmp sle i32 %215, %216
  br i1 %217, label %218, label %249

218:                                              ; preds = %214
  %219 = load float, ptr %10, align 4, !tbaa !9
  %220 = load ptr, ptr %7, align 8, !tbaa !16
  %221 = load i32, ptr %11, align 4, !tbaa !11
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds %struct.complex, ptr %220, i64 %222
  %224 = getelementptr inbounds %struct.complex, ptr %223, i32 0, i32 0
  %225 = load float, ptr %224, align 4, !tbaa !18
  %226 = fmul float %219, %225
  %227 = load ptr, ptr %7, align 8, !tbaa !16
  %228 = load i32, ptr %11, align 4, !tbaa !11
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds %struct.complex, ptr %227, i64 %229
  %231 = getelementptr inbounds %struct.complex, ptr %230, i32 0, i32 0
  store float %226, ptr %231, align 4, !tbaa !18
  %232 = load float, ptr %10, align 4, !tbaa !9
  %233 = fneg float %232
  %234 = load ptr, ptr %7, align 8, !tbaa !16
  %235 = load i32, ptr %11, align 4, !tbaa !11
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds %struct.complex, ptr %234, i64 %236
  %238 = getelementptr inbounds %struct.complex, ptr %237, i32 0, i32 1
  %239 = load float, ptr %238, align 4, !tbaa !20
  %240 = fmul float %233, %239
  %241 = load ptr, ptr %7, align 8, !tbaa !16
  %242 = load i32, ptr %11, align 4, !tbaa !11
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds %struct.complex, ptr %241, i64 %243
  %245 = getelementptr inbounds %struct.complex, ptr %244, i32 0, i32 1
  store float %240, ptr %245, align 4, !tbaa !20
  br label %246

246:                                              ; preds = %218
  %247 = load i32, ptr %11, align 4, !tbaa !11
  %248 = add nsw i32 %247, 1
  store i32 %248, ptr %11, align 4, !tbaa !11
  br label %214, !llvm.loop !30

249:                                              ; preds = %214
  call void @llvm.lifetime.end.p0(i64 4, ptr %16) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %15) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %14) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %13) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %12) #5
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #5
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind ssp uwtable(sync)
define void @Oscar() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %1) #5
  call void @Exptab(i32 noundef 256, ptr noundef @e)
  store i64 5767, ptr @seed, align 8, !tbaa !5
  store i32 1, ptr %1, align 4, !tbaa !11
  br label %3

3:                                                ; preds = %25, %0
  %4 = load i32, ptr %1, align 4, !tbaa !11
  %5 = icmp sle i32 %4, 256
  br i1 %5, label %6, label %28

6:                                                ; preds = %3
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #5
  %7 = load i64, ptr @seed, align 8, !tbaa !5
  %8 = trunc i64 %7 to i32
  store i32 %8, ptr %2, align 4, !tbaa !11
  call void @Uniform11(ptr noundef %2, ptr noundef @zr)
  %9 = load i32, ptr %2, align 4, !tbaa !11
  %10 = sext i32 %9 to i64
  store i64 %10, ptr @seed, align 8, !tbaa !5
  call void @Uniform11(ptr noundef %2, ptr noundef @zi)
  %11 = load i32, ptr %2, align 4, !tbaa !11
  %12 = sext i32 %11 to i64
  store i64 %12, ptr @seed, align 8, !tbaa !5
  %13 = load float, ptr @zr, align 4, !tbaa !9
  %14 = call float @llvm.fmuladd.f32(float 2.000000e+01, float %13, float -1.000000e+01)
  %15 = load i32, ptr %1, align 4, !tbaa !11
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [257 x %struct.complex], ptr @z, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.complex, ptr %17, i32 0, i32 0
  store float %14, ptr %18, align 4, !tbaa !18
  %19 = load float, ptr @zi, align 4, !tbaa !9
  %20 = call float @llvm.fmuladd.f32(float 2.000000e+01, float %19, float -1.000000e+01)
  %21 = load i32, ptr %1, align 4, !tbaa !11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [257 x %struct.complex], ptr @z, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.complex, ptr %23, i32 0, i32 1
  store float %20, ptr %24, align 4, !tbaa !20
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #5
  br label %25

25:                                               ; preds = %6
  %26 = load i32, ptr %1, align 4, !tbaa !11
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %1, align 4, !tbaa !11
  br label %3, !llvm.loop !31

28:                                               ; preds = %3
  store i32 1, ptr %1, align 4, !tbaa !11
  br label %29

29:                                               ; preds = %33, %28
  %30 = load i32, ptr %1, align 4, !tbaa !11
  %31 = icmp sle i32 %30, 20
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  call void @Fft(i32 noundef 256, ptr noundef @z, ptr noundef @w, ptr noundef @e, float noundef 6.250000e-02)
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %1, align 4, !tbaa !11
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %1, align 4, !tbaa !11
  br label %29, !llvm.loop !32

36:                                               ; preds = %29
  call void @Printcomplex(ptr noundef @z, i32 noundef 1, i32 noundef 256, i32 noundef 17)
  call void @llvm.lifetime.end.p0(i64 4, ptr %1) #5
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #5
  store i32 0, ptr %2, align 4, !tbaa !11
  br label %3

3:                                                ; preds = %7, %0
  %4 = load i32, ptr %2, align 4, !tbaa !11
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %10

6:                                                ; preds = %3
  call void @Oscar()
  br label %7

7:                                                ; preds = %6
  %8 = load i32, ptr %2, align 4, !tbaa !11
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %2, align 4, !tbaa !11
  br label %3, !llvm.loop !33

10:                                               ; preds = %3
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #5
  ret i32 0
}

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }

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
!10 = !{!"float", !7, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !7, i64 0}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !7, i64 0}
!18 = !{!19, !10, i64 0}
!19 = !{!"complex", !10, i64 0, !10, i64 4}
!20 = !{!19, !10, i64 4}
!21 = distinct !{!21, !14, !15}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}
!26 = distinct !{!26, !14, !15}
!27 = !{i64 0, i64 4, !9, i64 4, i64 4, !9}
!28 = distinct !{!28, !14, !15}
!29 = distinct !{!29, !14, !15}
!30 = distinct !{!30, !14, !15}
!31 = distinct !{!31, !14, !15}
!32 = distinct !{!32, !14, !15}
!33 = distinct !{!33, !14, !15}
