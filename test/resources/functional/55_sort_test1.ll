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

define i32 @bubblesort(i32* %arg0) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* @n, align 4
  %5 = sub i32 %4, 1
  %6 = icmp slt i32 %3, %5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.0, label %while.merge.0
while.body.0:
  store i32 0, i32* %2, align 4
  br label %while.cond.1
while.cond.1:
  %9 = load i32, i32* %2, align 4
  %10 = load i32, i32* @n, align 4
  %11 = load i32, i32* %1, align 4
  %12 = sub i32 %10, %11
  %13 = sub i32 %12, 1
  %14 = icmp slt i32 %9, %13
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %while.body.1, label %while.merge.1
while.body.1:
  %17 = load i32, i32* %2, align 4
  %18 = load i32*, i32** %0, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 %17
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %2, align 4
  %22 = add i32 %21, 1
  %23 = load i32*, i32** %0, align 8
  %24 = getelementptr inbounds i32, i32* %23, i32 %22
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %20, %25
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %if.then0, label %if.merge0
if.then0:
  %29 = alloca i32, align 4
  %30 = load i32, i32* %2, align 4
  %31 = add i32 %30, 1
  %32 = load i32*, i32** %0, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 %31
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %29, align 4
  %35 = load i32, i32* %2, align 4
  %36 = add i32 %35, 1
  %37 = load i32*, i32** %0, align 8
  %38 = getelementptr inbounds i32, i32* %37, i32 %36
  %39 = load i32, i32* %2, align 4
  %40 = load i32*, i32** %0, align 8
  %41 = getelementptr inbounds i32, i32* %40, i32 %39
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %38, align 4
  %43 = load i32, i32* %2, align 4
  %44 = load i32*, i32** %0, align 8
  %45 = getelementptr inbounds i32, i32* %44, i32 %43
  %46 = load i32, i32* %29, align 4
  store i32 %46, i32* %45, align 4
  br label %if.merge0
if.merge0:
  %47 = load i32, i32* %2, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %2, align 4
  br label %while.cond.1
while.merge.1:
  %49 = load i32, i32* %1, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %1, align 4
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
  %12 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  %13 = call i32 @bubblesort(i32* %12)
  store i32 %13, i32* %11, align 4
  br label %while.cond.2
while.cond.2:
  %14 = load i32, i32* %11, align 4
  %15 = load i32, i32* @n, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.2, label %while.merge.2
while.body.2:
  %19 = alloca i32, align 4
  %20 = load i32, i32* %11, align 4
  %21 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 %20
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %19, align 4
  %23 = load i32, i32* %19, align 4
  call void @putint(i32 %23)
  store i32 10, i32* %19, align 4
  %24 = load i32, i32* %19, align 4
  call void @putch(i32 %24)
  %25 = load i32, i32* %11, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %11, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

