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
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca [10 x i32], align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 0, i32* %alloc_1, align 4
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %0 = load i32, i32* %alloc_0, align 4
  %1 = icmp slt i32 %0, 10
  %2 = zext i1 %1 to i32
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %while.body.0, label %while.merge.0
while.body.0:
  %4 = load i32, i32* %alloc_0, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_2, i32 0, i32 %4
  %6 = load i32, i32* %alloc_0, align 4
  %7 = add i32 %6, 1
  store i32 %7, i32* %5, align 4
  %8 = load i32, i32* %alloc_0, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  store i32 10, i32* %alloc_7, align 4
  %10 = call i32 @getint()
  store i32 %10, i32* %alloc_3, align 4
  %11 = load i32, i32* %alloc_7, align 4
  %12 = sub i32 %11, 1
  store i32 %12, i32* %alloc_4, align 4
  store i32 0, i32* %alloc_5, align 4
  %13 = load i32, i32* %alloc_4, align 4
  %14 = load i32, i32* %alloc_5, align 4
  %15 = add i32 %13, %14
  %16 = sdiv i32 %15, 2
  store i32 %16, i32* %alloc_6, align 4
  br label %while.cond.1
while.cond.1:
  %17 = load i32, i32* %alloc_6, align 4
  %18 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_2, i32 0, i32 %17
  %19 = load i32, i32* %18, align 4
  %20 = load i32, i32* %alloc_3, align 4
  %21 = icmp ne i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs1, label %land.merge2
land.rhs1:
  %24 = load i32, i32* %alloc_5, align 4
  %25 = load i32, i32* %alloc_4, align 4
  %26 = icmp slt i32 %24, %25
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  %29 = zext i1 %28 to i32
  br label %land.merge2
land.merge2:
  %30 = phi i32 [0, %while.cond.1], [%29, %land.rhs1]
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %while.body.1, label %while.merge.1
while.body.1:
  %32 = load i32, i32* %alloc_4, align 4
  %33 = load i32, i32* %alloc_5, align 4
  %34 = add i32 %32, %33
  %35 = sdiv i32 %34, 2
  store i32 %35, i32* %alloc_6, align 4
  %36 = load i32, i32* %alloc_3, align 4
  %37 = load i32, i32* %alloc_6, align 4
  %38 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_2, i32 0, i32 %37
  %39 = load i32, i32* %38, align 4
  %40 = icmp slt i32 %36, %39
  %41 = zext i1 %40 to i32
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %if.then0, label %if.else0
if.then0:
  %43 = load i32, i32* %alloc_6, align 4
  %44 = sub i32 %43, 1
  store i32 %44, i32* %alloc_4, align 4
  br label %if.merge0
if.else0:
  %45 = load i32, i32* %alloc_6, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %alloc_5, align 4
  br label %if.merge0
if.merge0:
  br label %while.cond.1
while.merge.1:
  %47 = load i32, i32* %alloc_3, align 4
  %48 = load i32, i32* %alloc_6, align 4
  %49 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_2, i32 0, i32 %48
  %50 = load i32, i32* %49, align 4
  %51 = icmp eq i32 %47, %50
  %52 = zext i1 %51 to i32
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %if.then1, label %if.else1
if.then1:
  %54 = load i32, i32* %alloc_3, align 4
  call void @putint(i32 %54)
  br label %if.merge1
if.else1:
  store i32 0, i32* %alloc_3, align 4
  %55 = load i32, i32* %alloc_3, align 4
  call void @putint(i32 %55)
  br label %if.merge1
if.merge1:
  store i32 10, i32* %alloc_3, align 4
  %56 = load i32, i32* %alloc_3, align 4
  call void @putch(i32 %56)
  ret i32 0
}

