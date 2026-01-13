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

@ascii_0 = dso_local constant i32 48, align 4

define i32 @my_getint() {
entry0:
  %0 = alloca i32, align 4
  store i32 0, i32* %0, align 4
  %1 = alloca i32, align 4
  br label %while.cond.0
while.cond.0:
  %2 = icmp ne i32 1, 0
  br i1 %2, label %while.body.0, label %while.merge.0
while.body.0:
  %3 = call i32 @getch()
  %4 = sub i32 %3, 48
  store i32 %4, i32* %1, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp slt i32 %5, 0
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %9 = load i32, i32* %1, align 4
  %10 = icmp sgt i32 %9, 9
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  %13 = zext i1 %12 to i32
  br label %lor.merge2
lor.merge2:
  %14 = phi i32 [1, %while.body.0], [%13, %lor.rhs1]
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %if.then0, label %if.else0
if.then0:
  br label %while.cond.0
continue.unreachable:
  br label %if.merge0
if.else0:
  br label %while.merge.0
break.unreachable:
  br label %if.merge0
if.merge0:
  br label %while.cond.0
while.merge.0:
  %16 = load i32, i32* %1, align 4
  store i32 %16, i32* %0, align 4
  br label %while.cond.1
while.cond.1:
  %17 = icmp ne i32 1, 0
  br i1 %17, label %while.body.1, label %while.merge.1
while.body.1:
  %18 = call i32 @getch()
  %19 = sub i32 %18, 48
  store i32 %19, i32* %1, align 4
  %20 = load i32, i32* %1, align 4
  %21 = icmp sge i32 %20, 0
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs3, label %land.merge4
land.rhs3:
  %24 = load i32, i32* %1, align 4
  %25 = icmp sle i32 %24, 9
  %26 = zext i1 %25 to i32
  %27 = icmp ne i32 %26, 0
  %28 = zext i1 %27 to i32
  br label %land.merge4
land.merge4:
  %29 = phi i32 [0, %while.body.1], [%28, %land.rhs3]
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %if.then1, label %if.else1
if.then1:
  %31 = load i32, i32* %0, align 4
  %32 = mul i32 %31, 10
  %33 = load i32, i32* %1, align 4
  %34 = add i32 %32, %33
  store i32 %34, i32* %0, align 4
  br label %if.merge1
if.else1:
  br label %while.merge.1
break.unreachable:
  br label %if.merge1
if.merge1:
  br label %while.cond.1
while.merge.1:
  %35 = load i32, i32* %0, align 4
  ret i32 %35
}

define void @my_putint(i32 %arg0) {
entry5:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca [16 x i32], align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.2
while.cond.2:
  %3 = load i32, i32* %0, align 4
  %4 = icmp sgt i32 %3, 0
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.2, label %while.merge.2
while.body.2:
  %7 = load i32, i32* %2, align 4
  %8 = getelementptr inbounds [16 x i32], [16 x i32]* %1, i32 0, i32 %7
  %9 = load i32, i32* %0, align 4
  %10 = srem i32 %9, 10
  %11 = add i32 %10, 48
  store i32 %11, i32* %8, align 4
  %12 = load i32, i32* %0, align 4
  %13 = sdiv i32 %12, 10
  store i32 %13, i32* %0, align 4
  %14 = load i32, i32* %2, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %2, align 4
  br label %while.cond.2
while.merge.2:
  br label %while.cond.3
while.cond.3:
  %16 = load i32, i32* %2, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %while.body.3, label %while.merge.3
while.body.3:
  %20 = load i32, i32* %2, align 4
  %21 = sub i32 %20, 1
  store i32 %21, i32* %2, align 4
  %22 = load i32, i32* %2, align 4
  %23 = getelementptr inbounds [16 x i32], [16 x i32]* %1, i32 0, i32 %22
  %24 = load i32, i32* %23, align 4
  call void @putch(i32 %24)
  br label %while.cond.3
while.merge.3:
  ret void
}

define i32 @main() {
entry6:
  %0 = alloca i32, align 4
  %1 = call i32 @my_getint()
  store i32 %1, i32* %0, align 4
  br label %while.cond.4
while.cond.4:
  %2 = load i32, i32* %0, align 4
  %3 = icmp sgt i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.4, label %while.merge.4
while.body.4:
  %6 = alloca i32, align 4
  %7 = call i32 @my_getint()
  store i32 %7, i32* %6, align 4
  %8 = load i32, i32* %6, align 4
  call void @my_putint(i32 %8)
  call void @putch(i32 10)
  %9 = load i32, i32* %0, align 4
  %10 = sub i32 %9, 1
  store i32 %10, i32* %0, align 4
  br label %while.cond.4
while.merge.4:
  ret i32 0
}

