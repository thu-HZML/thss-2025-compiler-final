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

define i32 @select_sort(i32* %arg0, i32 %arg1) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.0
while.cond.0:
  %5 = load i32, i32* %2, align 4
  %6 = load i32, i32* %1, align 4
  %7 = sub i32 %6, 1
  %8 = icmp slt i32 %5, %7
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %while.body.0, label %while.merge.0
while.body.0:
  %11 = load i32, i32* %2, align 4
  store i32 %11, i32* %4, align 4
  %12 = load i32, i32* %2, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %3, align 4
  br label %while.cond.1
while.cond.1:
  %14 = load i32, i32* %3, align 4
  %15 = load i32, i32* %1, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.1, label %while.merge.1
while.body.1:
  %19 = load i32, i32* %4, align 4
  %20 = load i32*, i32** %0, align 8
  %21 = getelementptr inbounds i32, i32* %20, i32 %19
  %22 = load i32, i32* %21, align 4
  %23 = load i32, i32* %3, align 4
  %24 = load i32*, i32** %0, align 8
  %25 = getelementptr inbounds i32, i32* %24, i32 %23
  %26 = load i32, i32* %25, align 4
  %27 = icmp sgt i32 %22, %26
  %28 = zext i1 %27 to i32
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %if.then0, label %if.merge0
if.then0:
  %30 = load i32, i32* %3, align 4
  store i32 %30, i32* %4, align 4
  br label %if.merge0
if.merge0:
  %31 = load i32, i32* %3, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %3, align 4
  br label %while.cond.1
while.merge.1:
  %33 = load i32, i32* %4, align 4
  %34 = load i32, i32* %2, align 4
  %35 = icmp ne i32 %33, %34
  %36 = zext i1 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %if.then1, label %if.merge1
if.then1:
  %38 = alloca i32, align 4
  %39 = load i32, i32* %4, align 4
  %40 = load i32*, i32** %0, align 8
  %41 = getelementptr inbounds i32, i32* %40, i32 %39
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %38, align 4
  %43 = load i32, i32* %4, align 4
  %44 = load i32*, i32** %0, align 8
  %45 = getelementptr inbounds i32, i32* %44, i32 %43
  %46 = load i32, i32* %2, align 4
  %47 = load i32*, i32** %0, align 8
  %48 = getelementptr inbounds i32, i32* %47, i32 %46
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %45, align 4
  %50 = load i32, i32* %2, align 4
  %51 = load i32*, i32** %0, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 %50
  %53 = load i32, i32* %38, align 4
  store i32 %53, i32* %52, align 4
  br label %if.merge1
if.merge1:
  %54 = load i32, i32* %2, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %2, align 4
  br label %while.cond.0
while.merge.0:
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
  %12 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  %13 = load i32, i32* @n, align 4
  %14 = call i32 @select_sort(i32* %12, i32 %13)
  store i32 %14, i32* %11, align 4
  br label %while.cond.2
while.cond.2:
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* @n, align 4
  %17 = icmp slt i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %while.body.2, label %while.merge.2
while.body.2:
  %20 = alloca i32, align 4
  %21 = load i32, i32* %11, align 4
  %22 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 %21
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %20, align 4
  %24 = load i32, i32* %20, align 4
  call void @putint(i32 %24)
  store i32 10, i32* %20, align 4
  %25 = load i32, i32* %20, align 4
  call void @putch(i32 %25)
  %26 = load i32, i32* %11, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* %11, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

