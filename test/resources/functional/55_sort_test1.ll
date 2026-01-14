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
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_0, align 4
  %2 = load i32, i32* @n, align 4
  %3 = sub i32 %2, 1
  %4 = icmp slt i32 %1, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  store i32 0, i32* %alloc_1, align 4
  br label %while.cond.1
while.cond.1:
  %7 = load i32, i32* %alloc_1, align 4
  %8 = load i32, i32* @n, align 4
  %9 = load i32, i32* %alloc_0, align 4
  %10 = sub i32 %8, %9
  %11 = sub i32 %10, 1
  %12 = icmp slt i32 %7, %11
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %while.body.1, label %while.merge.1
while.body.1:
  %15 = load i32, i32* %alloc_1, align 4
  %16 = load i32*, i32** %0, align 8
  %17 = getelementptr inbounds i32, i32* %16, i32 %15
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %alloc_1, align 4
  %20 = add i32 %19, 1
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = icmp sgt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then0, label %if.merge0
if.then0:
  %27 = load i32, i32* %alloc_1, align 4
  %28 = add i32 %27, 1
  %29 = load i32*, i32** %0, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 %28
  %31 = load i32, i32* %30, align 4
  store i32 %31, i32* %alloc_2, align 4
  %32 = load i32, i32* %alloc_1, align 4
  %33 = add i32 %32, 1
  %34 = load i32*, i32** %0, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 %33
  %36 = load i32, i32* %alloc_1, align 4
  %37 = load i32*, i32** %0, align 8
  %38 = getelementptr inbounds i32, i32* %37, i32 %36
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %35, align 4
  %40 = load i32, i32* %alloc_1, align 4
  %41 = load i32*, i32** %0, align 8
  %42 = getelementptr inbounds i32, i32* %41, i32 %40
  %43 = load i32, i32* %alloc_2, align 4
  store i32 %43, i32* %42, align 4
  br label %if.merge0
if.merge0:
  %44 = load i32, i32* %alloc_1, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  %46 = load i32, i32* %alloc_0, align 4
  %47 = add i32 %46, 1
  store i32 %47, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @main() {
entry1:
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca [10 x i32], align 4
  store i32 10, i32* @n, align 4
  %0 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 0
  store i32 4, i32* %0, align 4
  %1 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 1
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 2
  store i32 9, i32* %2, align 4
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 3
  store i32 2, i32* %3, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 4
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 5
  store i32 1, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 6
  store i32 6, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 7
  store i32 5, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 8
  store i32 7, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 9
  store i32 8, i32* %9, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 0
  %11 = call i32 @bubblesort(i32* %10)
  store i32 %11, i32* %alloc_4, align 4
  br label %while.cond.2
while.cond.2:
  %12 = load i32, i32* %alloc_4, align 4
  %13 = load i32, i32* @n, align 4
  %14 = icmp slt i32 %12, %13
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %while.body.2, label %while.merge.2
while.body.2:
  %17 = load i32, i32* %alloc_4, align 4
  %18 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_3, i32 0, i32 %17
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %alloc_5, align 4
  %20 = load i32, i32* %alloc_5, align 4
  call void @putint(i32 %20)
  store i32 10, i32* %alloc_5, align 4
  %21 = load i32, i32* %alloc_5, align 4
  call void @putch(i32 %21)
  %22 = load i32, i32* %alloc_4, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %alloc_4, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

