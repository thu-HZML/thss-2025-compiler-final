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


define i32 @main() {
entry0:
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 2, i32* %0, align 4
  store i32 20, i32* %alloc_0, align 4
  %1 = alloca [20 x i32], align 4
  %2 = bitcast [20 x i32]* %1 to i32*
  %3 = getelementptr inbounds i32, i32* %2, i32 0
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %2, i32 1
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %2, i32 2
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %2, i32 3
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %2, i32 4
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %2, i32 5
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %2, i32 6
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %2, i32 7
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %2, i32 8
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %2, i32 9
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %2, i32 10
  store i32 0, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %2, i32 11
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %2, i32 12
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %2, i32 13
  store i32 0, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %2, i32 14
  store i32 0, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %2, i32 15
  store i32 0, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %2, i32 16
  store i32 0, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %2, i32 17
  store i32 0, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %2, i32 18
  store i32 0, i32* %21, align 4
  %22 = getelementptr inbounds i32, i32* %2, i32 19
  store i32 0, i32* %22, align 4
  %23 = alloca i32, align 4
  store i32 0, i32* %23, align 4
  br label %while.cond.0
while.cond.0:
  %24 = load i32, i32* %0, align 4
  %25 = icmp slt i32 %24, 20
  %26 = zext i1 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %while.body.0, label %while.merge.0
while.body.0:
  %28 = load i32, i32* %0, align 4
  %29 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i32 0, i32 %28
  %30 = load i32, i32* %0, align 4
  %31 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i32 0, i32 %30
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* %0, align 4
  %34 = sub i32 %33, 1
  %35 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i32 0, i32 %34
  %36 = load i32, i32* %35, align 4
  %37 = add i32 %32, %36
  %38 = load i32, i32* %0, align 4
  %39 = sub i32 %38, 2
  %40 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i32 0, i32 %39
  %41 = load i32, i32* %40, align 4
  %42 = add i32 %37, %41
  store i32 %42, i32* %29, align 4
  %43 = load i32, i32* %23, align 4
  %44 = load i32, i32* %0, align 4
  %45 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i32 0, i32 %44
  %46 = load i32, i32* %45, align 4
  %47 = add i32 %43, %46
  store i32 %47, i32* %23, align 4
  %48 = load i32, i32* %0, align 4
  %49 = getelementptr inbounds [20 x i32], [20 x i32]* %1, i32 0, i32 %48
  %50 = load i32, i32* %49, align 4
  call void @putint(i32 %50)
  call void @putch(i32 10)
  %51 = load i32, i32* %0, align 4
  %52 = add i32 %51, 1
  store i32 %52, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %53 = load i32, i32* %23, align 4
  ret i32 %53
}

