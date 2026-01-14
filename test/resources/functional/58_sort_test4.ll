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
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %alloc_0, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sub i32 %3, 1
  %5 = icmp slt i32 %2, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.0, label %while.merge.0
while.body.0:
  %8 = load i32, i32* %alloc_0, align 4
  store i32 %8, i32* %alloc_2, align 4
  %9 = load i32, i32* %alloc_0, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %alloc_1, align 4
  br label %while.cond.1
while.cond.1:
  %11 = load i32, i32* %alloc_1, align 4
  %12 = load i32, i32* %1, align 4
  %13 = icmp slt i32 %11, %12
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %while.body.1, label %while.merge.1
while.body.1:
  %16 = load i32, i32* %alloc_2, align 4
  %17 = load i32*, i32** %0, align 8
  %18 = getelementptr inbounds i32, i32* %17, i32 %16
  %19 = load i32, i32* %18, align 4
  %20 = load i32, i32* %alloc_1, align 4
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = icmp sgt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then0, label %if.merge0
if.then0:
  %27 = load i32, i32* %alloc_1, align 4
  store i32 %27, i32* %alloc_2, align 4
  br label %if.merge0
if.merge0:
  %28 = load i32, i32* %alloc_1, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  %30 = load i32, i32* %alloc_2, align 4
  %31 = load i32, i32* %alloc_0, align 4
  %32 = icmp ne i32 %30, %31
  %33 = zext i1 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %if.then1, label %if.merge1
if.then1:
  %35 = load i32, i32* %alloc_2, align 4
  %36 = load i32*, i32** %0, align 8
  %37 = getelementptr inbounds i32, i32* %36, i32 %35
  %38 = load i32, i32* %37, align 4
  store i32 %38, i32* %alloc_3, align 4
  %39 = load i32, i32* %alloc_2, align 4
  %40 = load i32*, i32** %0, align 8
  %41 = getelementptr inbounds i32, i32* %40, i32 %39
  %42 = load i32, i32* %alloc_0, align 4
  %43 = load i32*, i32** %0, align 8
  %44 = getelementptr inbounds i32, i32* %43, i32 %42
  %45 = load i32, i32* %44, align 4
  store i32 %45, i32* %41, align 4
  %46 = load i32, i32* %alloc_0, align 4
  %47 = load i32*, i32** %0, align 8
  %48 = getelementptr inbounds i32, i32* %47, i32 %46
  %49 = load i32, i32* %alloc_3, align 4
  store i32 %49, i32* %48, align 4
  br label %if.merge1
if.merge1:
  %50 = load i32, i32* %alloc_0, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @main() {
entry1:
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
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 0
  %11 = load i32, i32* @n, align 4
  %12 = call i32 @select_sort(i32* %10, i32 %11)
  store i32 %12, i32* %alloc_5, align 4
  br label %while.cond.2
while.cond.2:
  %13 = load i32, i32* %alloc_5, align 4
  %14 = load i32, i32* @n, align 4
  %15 = icmp slt i32 %13, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %while.body.2, label %while.merge.2
while.body.2:
  %18 = load i32, i32* %alloc_5, align 4
  %19 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 %18
  %20 = load i32, i32* %19, align 4
  store i32 %20, i32* %alloc_6, align 4
  %21 = load i32, i32* %alloc_6, align 4
  call void @putint(i32 %21)
  store i32 10, i32* %alloc_6, align 4
  %22 = load i32, i32* %alloc_6, align 4
  call void @putch(i32 %22)
  %23 = load i32, i32* %alloc_5, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %alloc_5, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

