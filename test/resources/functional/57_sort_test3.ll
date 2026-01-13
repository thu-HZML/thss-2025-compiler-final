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
  %8 = alloca i32, align 4
  %9 = load i32, i32* %1, align 4
  store i32 %9, i32* %8, align 4
  %10 = alloca i32, align 4
  %11 = load i32, i32* %2, align 4
  store i32 %11, i32* %10, align 4
  %12 = alloca i32, align 4
  %13 = load i32, i32* %1, align 4
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %12, align 4
  br label %while.cond.0
while.cond.0:
  %17 = load i32, i32* %8, align 4
  %18 = load i32, i32* %10, align 4
  %19 = icmp slt i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %while.body.0, label %while.merge.0
while.body.0:
  br label %while.cond.1
while.cond.1:
  %22 = load i32, i32* %8, align 4
  %23 = load i32, i32* %10, align 4
  %24 = icmp slt i32 %22, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %land.rhs1, label %land.merge2
land.rhs1:
  %27 = load i32, i32* %10, align 4
  %28 = load i32*, i32** %0, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 %27
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %12, align 4
  %32 = sub i32 %31, 1
  %33 = icmp sgt i32 %30, %32
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  %36 = zext i1 %35 to i32
  br label %land.merge2
land.merge2:
  %37 = phi i32 [0, %while.cond.1], [%36, %land.rhs1]
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %while.body.1, label %while.merge.1
while.body.1:
  %39 = load i32, i32* %10, align 4
  %40 = sub i32 %39, 1
  store i32 %40, i32* %10, align 4
  br label %while.cond.1
while.merge.1:
  %41 = load i32, i32* %8, align 4
  %42 = load i32, i32* %10, align 4
  %43 = icmp slt i32 %41, %42
  %44 = zext i1 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %if.then1, label %if.merge1
if.then1:
  %46 = load i32, i32* %8, align 4
  %47 = load i32*, i32** %0, align 8
  %48 = getelementptr inbounds i32, i32* %47, i32 %46
  %49 = load i32, i32* %10, align 4
  %50 = load i32*, i32** %0, align 8
  %51 = getelementptr inbounds i32, i32* %50, i32 %49
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %48, align 4
  %53 = load i32, i32* %8, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %8, align 4
  br label %if.merge1
if.merge1:
  br label %while.cond.2
while.cond.2:
  %55 = load i32, i32* %8, align 4
  %56 = load i32, i32* %10, align 4
  %57 = icmp slt i32 %55, %56
  %58 = zext i1 %57 to i32
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %land.rhs3, label %land.merge4
land.rhs3:
  %60 = load i32, i32* %8, align 4
  %61 = load i32*, i32** %0, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 %60
  %63 = load i32, i32* %62, align 4
  %64 = load i32, i32* %12, align 4
  %65 = icmp slt i32 %63, %64
  %66 = zext i1 %65 to i32
  %67 = icmp ne i32 %66, 0
  %68 = zext i1 %67 to i32
  br label %land.merge4
land.merge4:
  %69 = phi i32 [0, %while.cond.2], [%68, %land.rhs3]
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %while.body.2, label %while.merge.2
while.body.2:
  %71 = load i32, i32* %8, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %8, align 4
  br label %while.cond.2
while.merge.2:
  %73 = load i32, i32* %8, align 4
  %74 = load i32, i32* %10, align 4
  %75 = icmp slt i32 %73, %74
  %76 = zext i1 %75 to i32
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %if.then2, label %if.merge2
if.then2:
  %78 = load i32, i32* %10, align 4
  %79 = load i32*, i32** %0, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 %78
  %81 = load i32, i32* %8, align 4
  %82 = load i32*, i32** %0, align 8
  %83 = getelementptr inbounds i32, i32* %82, i32 %81
  %84 = load i32, i32* %83, align 4
  store i32 %84, i32* %80, align 4
  %85 = load i32, i32* %10, align 4
  %86 = sub i32 %85, 1
  store i32 %86, i32* %10, align 4
  br label %if.merge2
if.merge2:
  br label %while.cond.0
while.merge.0:
  %87 = load i32, i32* %8, align 4
  %88 = load i32*, i32** %0, align 8
  %89 = getelementptr inbounds i32, i32* %88, i32 %87
  %90 = load i32, i32* %12, align 4
  store i32 %90, i32* %89, align 4
  %91 = alloca i32, align 4
  %92 = load i32, i32* %8, align 4
  %93 = sub i32 %92, 1
  store i32 %93, i32* %91, align 4
  %94 = load i32*, i32** %0, align 8
  %95 = load i32, i32* %1, align 4
  %96 = load i32, i32* %91, align 4
  %97 = call i32 @QuickSort(i32* %94, i32 %95, i32 %96)
  store i32 %97, i32* %91, align 4
  %98 = load i32, i32* %8, align 4
  %99 = add i32 %98, 1
  store i32 %99, i32* %91, align 4
  %100 = load i32*, i32** %0, align 8
  %101 = load i32, i32* %91, align 4
  %102 = load i32, i32* %2, align 4
  %103 = call i32 @QuickSort(i32* %100, i32 %101, i32 %102)
  store i32 %103, i32* %91, align 4
  br label %if.merge0
if.merge0:
  ret i32 0
}

define i32 @main() {
entry5:
  store i32 10, i32* @n, align 4
  %0 = alloca [10 x i32], align 4
  %1 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  store i32 4, i32* %1, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 1
  store i32 3, i32* %2, align 4
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 2
  store i32 9, i32* %3, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 3
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 4
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 5
  store i32 1, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 6
  store i32 6, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 7
  store i32 5, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 8
  store i32 7, i32* %9, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 9
  store i32 8, i32* %10, align 4
  %11 = alloca i32, align 4
  store i32 0, i32* %11, align 4
  %12 = alloca i32, align 4
  store i32 9, i32* %12, align 4
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  %14 = load i32, i32* %11, align 4
  %15 = load i32, i32* %12, align 4
  %16 = call i32 @QuickSort(i32* %13, i32 %14, i32 %15)
  store i32 %16, i32* %11, align 4
  br label %while.cond.3
while.cond.3:
  %17 = load i32, i32* %11, align 4
  %18 = load i32, i32* @n, align 4
  %19 = icmp slt i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %while.body.3, label %while.merge.3
while.body.3:
  %22 = alloca i32, align 4
  %23 = load i32, i32* %11, align 4
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 %23
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %22, align 4
  %26 = load i32, i32* %22, align 4
  call void @putint(i32 %26)
  store i32 10, i32* %22, align 4
  %27 = load i32, i32* %22, align 4
  call void @putch(i32 %27)
  %28 = load i32, i32* %11, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %11, align 4
  br label %while.cond.3
while.merge.3:
  ret i32 0
}

