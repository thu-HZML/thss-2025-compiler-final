declare i32 @getint()
declare i32 @getch()
declare float @getfloat()
declare i32 @getarray(i32*)
declare i32 @getfarray(float*)
declare void @putint(i32)
declare void @putch(i32)
declare void @putfloat(float)
declare void @putarray(i32, i32*)
declare void @putfarray(i32, float*)
declare void @starttime()
declare void @stoptime()

@n = dso_local global i32 zeroinitializer, align 4

define i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %arg2) {
entry0:
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.merge0
if.then0:
  %8 = load i32, i32* %1, align 4
  store i32 %8, i32* %alloc_0, align 4
  %9 = load i32, i32* %2, align 4
  store i32 %9, i32* %alloc_1, align 4
  %10 = load i32, i32* %1, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 %10
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %alloc_2, align 4
  br label %while.cond.0
while.cond.0:
  %14 = load i32, i32* %alloc_0, align 4
  %15 = load i32, i32* %alloc_1, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.0, label %while.merge.0
while.body.0:
  br label %while.cond.1
while.cond.1:
  %19 = load i32, i32* %alloc_0, align 4
  %20 = load i32, i32* %alloc_1, align 4
  %21 = icmp slt i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs1, label %land.merge2
land.rhs1:
  %24 = load i32, i32* %alloc_1, align 4
  %25 = load i32*, i32** %0, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 %24
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* %alloc_2, align 4
  %29 = sub i32 %28, 1
  %30 = icmp sgt i32 %27, %29
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  br label %land.merge2
land.merge2:
  %34 = phi i32 [0, %while.cond.1], [%33, %land.rhs1]
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %while.body.1, label %while.merge.1
while.body.1:
  %36 = load i32, i32* %alloc_1, align 4
  %37 = sub i32 %36, 1
  store i32 %37, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  %38 = load i32, i32* %alloc_0, align 4
  %39 = load i32, i32* %alloc_1, align 4
  %40 = icmp slt i32 %38, %39
  %41 = zext i1 %40 to i32
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %if.then1, label %if.merge1
if.then1:
  %43 = load i32, i32* %alloc_0, align 4
  %44 = load i32*, i32** %0, align 8
  %45 = getelementptr inbounds i32, i32* %44, i32 %43
  %46 = load i32, i32* %alloc_1, align 4
  %47 = load i32*, i32** %0, align 8
  %48 = getelementptr inbounds i32, i32* %47, i32 %46
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %45, align 4
  %50 = load i32, i32* %alloc_0, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %alloc_0, align 4
  br label %if.merge1
if.merge1:
  br label %while.cond.2
while.cond.2:
  %52 = load i32, i32* %alloc_0, align 4
  %53 = load i32, i32* %alloc_1, align 4
  %54 = icmp slt i32 %52, %53
  %55 = zext i1 %54 to i32
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %land.rhs3, label %land.merge4
land.rhs3:
  %57 = load i32, i32* %alloc_0, align 4
  %58 = load i32*, i32** %0, align 8
  %59 = getelementptr inbounds i32, i32* %58, i32 %57
  %60 = load i32, i32* %59, align 4
  %61 = load i32, i32* %alloc_2, align 4
  %62 = icmp slt i32 %60, %61
  %63 = zext i1 %62 to i32
  %64 = icmp ne i32 %63, 0
  %65 = zext i1 %64 to i32
  br label %land.merge4
land.merge4:
  %66 = phi i32 [0, %while.cond.2], [%65, %land.rhs3]
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %while.body.2, label %while.merge.2
while.body.2:
  %68 = load i32, i32* %alloc_0, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %alloc_0, align 4
  br label %while.cond.2
while.merge.2:
  %70 = load i32, i32* %alloc_0, align 4
  %71 = load i32, i32* %alloc_1, align 4
  %72 = icmp slt i32 %70, %71
  %73 = zext i1 %72 to i32
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %if.then2, label %if.merge2
if.then2:
  %75 = load i32, i32* %alloc_1, align 4
  %76 = load i32*, i32** %0, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 %75
  %78 = load i32, i32* %alloc_0, align 4
  %79 = load i32*, i32** %0, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 %78
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %77, align 4
  %82 = load i32, i32* %alloc_1, align 4
  %83 = sub i32 %82, 1
  store i32 %83, i32* %alloc_1, align 4
  br label %if.merge2
if.merge2:
  br label %while.cond.0
while.merge.0:
  %84 = load i32, i32* %alloc_0, align 4
  %85 = load i32*, i32** %0, align 8
  %86 = getelementptr inbounds i32, i32* %85, i32 %84
  %87 = load i32, i32* %alloc_2, align 4
  store i32 %87, i32* %86, align 4
  %88 = load i32, i32* %alloc_0, align 4
  %89 = sub i32 %88, 1
  store i32 %89, i32* %alloc_3, align 4
  %90 = load i32*, i32** %0, align 8
  %91 = load i32, i32* %1, align 4
  %92 = load i32, i32* %alloc_3, align 4
  %93 = call i32 @QuickSort(i32* %90, i32 %91, i32 %92)
  store i32 %93, i32* %alloc_3, align 4
  %94 = load i32, i32* %alloc_0, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %alloc_3, align 4
  %96 = load i32*, i32** %0, align 8
  %97 = load i32, i32* %alloc_3, align 4
  %98 = load i32, i32* %2, align 4
  %99 = call i32 @QuickSort(i32* %96, i32 %97, i32 %98)
  store i32 %99, i32* %alloc_3, align 4
  br label %if.merge0
if.merge0:
  ret i32 0
}

define i32 @main() {
entry5:
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca [10 x i32], align 4
  store i32 10, i32* @n, align 4
  %0 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 0
  store i32 4, i32* %0, align 4
  %1 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 1
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 2
  store i32 9, i32* %2, align 4
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 3
  store i32 2, i32* %3, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 4
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 5
  store i32 1, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 6
  store i32 6, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 7
  store i32 5, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 8
  store i32 7, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 9
  store i32 8, i32* %9, align 4
  store i32 0, i32* %alloc_5, align 4
  store i32 9, i32* %alloc_6, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 0
  %11 = load i32, i32* %alloc_5, align 4
  %12 = load i32, i32* %alloc_6, align 4
  %13 = call i32 @QuickSort(i32* %10, i32 %11, i32 %12)
  store i32 %13, i32* %alloc_5, align 4
  br label %while.cond.3
while.cond.3:
  %14 = load i32, i32* %alloc_5, align 4
  %15 = load i32, i32* @n, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.3, label %while.merge.3
while.body.3:
  %19 = load i32, i32* %alloc_5, align 4
  %20 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 %19
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %alloc_7, align 4
  %22 = load i32, i32* %alloc_7, align 4
  call void @putint(i32 %22)
  store i32 10, i32* %alloc_7, align 4
  %23 = load i32, i32* %alloc_7, align 4
  call void @putch(i32 %23)
  %24 = load i32, i32* %alloc_5, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %alloc_5, align 4
  br label %while.cond.3
while.merge.3:
  ret i32 0
}

