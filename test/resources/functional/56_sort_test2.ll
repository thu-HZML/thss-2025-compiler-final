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

define i32 @insertsort(i32* %arg0) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp slt i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = alloca i32, align 4
  %8 = load i32, i32* %1, align 4
  %9 = load i32*, i32** %0, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %7, align 4
  %12 = alloca i32, align 4
  %13 = load i32, i32* %1, align 4
  %14 = sub i32 %13, 1
  store i32 %14, i32* %12, align 4
  br label %while.cond.1
while.cond.1:
  %15 = load i32, i32* %12, align 4
  %16 = icmp sgt i32 %15, -1
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %land.rhs1, label %land.merge2
land.rhs1:
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %12, align 4
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = icmp slt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  br label %land.merge2
land.merge2:
  %28 = phi i32 [0, %while.cond.1], [%27, %land.rhs1]
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %while.body.1, label %while.merge.1
while.body.1:
  %30 = load i32, i32* %12, align 4
  %31 = add i32 %30, 1
  %32 = load i32*, i32** %0, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 %31
  %34 = load i32, i32* %12, align 4
  %35 = load i32*, i32** %0, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 %34
  %37 = load i32, i32* %36, align 4
  store i32 %37, i32* %33, align 4
  %38 = load i32, i32* %12, align 4
  %39 = sub i32 %38, 1
  store i32 %39, i32* %12, align 4
  br label %while.cond.1
while.merge.1:
  %40 = load i32, i32* %12, align 4
  %41 = add i32 %40, 1
  %42 = load i32*, i32** %0, align 8
  %43 = getelementptr inbounds i32, i32* %42, i32 %41
  %44 = load i32, i32* %7, align 4
  store i32 %44, i32* %43, align 4
  %45 = load i32, i32* %1, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @main() {
entry3:
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
  %13 = call i32 @insertsort(i32* %12)
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

