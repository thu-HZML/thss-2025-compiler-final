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

define i32 @counting_sort(i32* %arg0, i32* %arg1, i32 %arg2) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = alloca [10 x i32], align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %while.cond.0
while.cond.0:
  %7 = load i32, i32* %6, align 4
  %8 = icmp slt i32 %7, 10
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %while.body.0, label %while.merge.0
while.body.0:
  %11 = load i32, i32* %6, align 4
  %12 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %11
  store i32 0, i32* %12, align 4
  %13 = load i32, i32* %6, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %6, align 4
  br label %while.cond.0
while.merge.0:
  br label %while.cond.1
while.cond.1:
  %15 = load i32, i32* %4, align 4
  %16 = load i32, i32* %2, align 4
  %17 = icmp slt i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %while.body.1, label %while.merge.1
while.body.1:
  %20 = load i32, i32* %4, align 4
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %23
  %25 = load i32, i32* %4, align 4
  %26 = load i32*, i32** %0, align 8
  %27 = getelementptr inbounds i32, i32* %26, i32 %25
  %28 = load i32, i32* %27, align 4
  %29 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %24, align 4
  %32 = load i32, i32* %4, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %4, align 4
  br label %while.cond.1
while.merge.1:
  store i32 1, i32* %6, align 4
  br label %while.cond.2
while.cond.2:
  %34 = load i32, i32* %6, align 4
  %35 = icmp slt i32 %34, 10
  %36 = zext i1 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %while.body.2, label %while.merge.2
while.body.2:
  %38 = load i32, i32* %6, align 4
  %39 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %38
  %40 = load i32, i32* %6, align 4
  %41 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %40
  %42 = load i32, i32* %41, align 4
  %43 = load i32, i32* %6, align 4
  %44 = sub i32 %43, 1
  %45 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %44
  %46 = load i32, i32* %45, align 4
  %47 = add i32 %42, %46
  store i32 %47, i32* %39, align 4
  %48 = load i32, i32* %6, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %6, align 4
  br label %while.cond.2
while.merge.2:
  %50 = load i32, i32* %2, align 4
  store i32 %50, i32* %5, align 4
  br label %while.cond.3
while.cond.3:
  %51 = load i32, i32* %5, align 4
  %52 = icmp sgt i32 %51, 0
  %53 = zext i1 %52 to i32
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %while.body.3, label %while.merge.3
while.body.3:
  %55 = load i32, i32* %5, align 4
  %56 = sub i32 %55, 1
  %57 = load i32*, i32** %0, align 8
  %58 = getelementptr inbounds i32, i32* %57, i32 %56
  %59 = load i32, i32* %58, align 4
  %60 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %59
  %61 = load i32, i32* %5, align 4
  %62 = sub i32 %61, 1
  %63 = load i32*, i32** %0, align 8
  %64 = getelementptr inbounds i32, i32* %63, i32 %62
  %65 = load i32, i32* %64, align 4
  %66 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %65
  %67 = load i32, i32* %66, align 4
  %68 = sub i32 %67, 1
  store i32 %68, i32* %60, align 4
  %69 = load i32, i32* %5, align 4
  %70 = sub i32 %69, 1
  %71 = load i32*, i32** %0, align 8
  %72 = getelementptr inbounds i32, i32* %71, i32 %70
  %73 = load i32, i32* %72, align 4
  %74 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 %73
  %75 = load i32, i32* %74, align 4
  %76 = load i32*, i32** %1, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 %75
  %78 = load i32, i32* %5, align 4
  %79 = sub i32 %78, 1
  %80 = load i32*, i32** %0, align 8
  %81 = getelementptr inbounds i32, i32* %80, i32 %79
  %82 = load i32, i32* %81, align 4
  store i32 %82, i32* %77, align 4
  %83 = load i32, i32* %5, align 4
  %84 = sub i32 %83, 1
  store i32 %84, i32* %5, align 4
  br label %while.cond.3
while.merge.3:
  ret i32 0
}

define i32 @main() {
entry1:
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
  %12 = alloca [10 x i32], align 4
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  %14 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i32 0, i32 0
  %15 = load i32, i32* @n, align 4
  %16 = call i32 @counting_sort(i32* %13, i32* %14, i32 %15)
  store i32 %16, i32* %11, align 4
  br label %while.cond.4
while.cond.4:
  %17 = load i32, i32* %11, align 4
  %18 = load i32, i32* @n, align 4
  %19 = icmp slt i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %while.body.4, label %while.merge.4
while.body.4:
  %22 = alloca i32, align 4
  %23 = load i32, i32* %11, align 4
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* %12, i32 0, i32 %23
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
  br label %while.cond.4
while.merge.4:
  ret i32 0
}

