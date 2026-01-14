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
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca [20 x i32], align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 2, i32* %alloc_0, align 4
  store i32 20, i32* %alloc_1, align 4
  %0 = bitcast [20 x i32]* %alloc_2 to i32*
  %1 = getelementptr inbounds i32, i32* %0, i32 0
  store i32 1, i32* %1, align 4
  %2 = getelementptr inbounds i32, i32* %0, i32 1
  store i32 2, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %0, i32 2
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %0, i32 3
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %0, i32 4
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %0, i32 5
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %0, i32 6
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %0, i32 7
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %0, i32 8
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %0, i32 9
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %0, i32 10
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %0, i32 11
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %0, i32 12
  store i32 0, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %0, i32 13
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %0, i32 14
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %0, i32 15
  store i32 0, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %0, i32 16
  store i32 0, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %0, i32 17
  store i32 0, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %0, i32 18
  store i32 0, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %0, i32 19
  store i32 0, i32* %20, align 4
  store i32 0, i32* %alloc_3, align 4
  br label %while.cond.0
while.cond.0:
  %21 = load i32, i32* %alloc_0, align 4
  %22 = icmp slt i32 %21, 20
  %23 = zext i1 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %while.body.0, label %while.merge.0
while.body.0:
  %25 = load i32, i32* %alloc_0, align 4
  %26 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_2, i32 0, i32 %25
  %27 = load i32, i32* %alloc_0, align 4
  %28 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_2, i32 0, i32 %27
  %29 = load i32, i32* %28, align 4
  %30 = load i32, i32* %alloc_0, align 4
  %31 = sub i32 %30, 1
  %32 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_2, i32 0, i32 %31
  %33 = load i32, i32* %32, align 4
  %34 = add i32 %29, %33
  %35 = load i32, i32* %alloc_0, align 4
  %36 = sub i32 %35, 2
  %37 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_2, i32 0, i32 %36
  %38 = load i32, i32* %37, align 4
  %39 = add i32 %34, %38
  store i32 %39, i32* %26, align 4
  %40 = load i32, i32* %alloc_3, align 4
  %41 = load i32, i32* %alloc_0, align 4
  %42 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_2, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  %44 = add i32 %40, %43
  store i32 %44, i32* %alloc_3, align 4
  %45 = load i32, i32* %alloc_0, align 4
  %46 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_2, i32 0, i32 %45
  %47 = load i32, i32* %46, align 4
  call void @putint(i32 %47)
  call void @putch(i32 10)
  %48 = load i32, i32* %alloc_0, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  %50 = load i32, i32* %alloc_3, align 4
  ret i32 %50
}

