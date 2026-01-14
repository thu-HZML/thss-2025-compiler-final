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
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %0 = icmp ne i32 1, 0
  br i1 %0, label %while.body.0, label %while.merge.0
while.body.0:
  %1 = call i32 @getch()
  %2 = sub i32 %1, 48
  store i32 %2, i32* %alloc_1, align 4
  %3 = load i32, i32* %alloc_1, align 4
  %4 = icmp slt i32 %3, 0
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %7 = load i32, i32* %alloc_1, align 4
  %8 = icmp sgt i32 %7, 9
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  br label %lor.merge2
lor.merge2:
  %12 = phi i32 [1, %while.body.0], [%11, %lor.rhs1]
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then0, label %if.else0
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
  %14 = load i32, i32* %alloc_1, align 4
  store i32 %14, i32* %alloc_0, align 4
  br label %while.cond.1
while.cond.1:
  %15 = icmp ne i32 1, 0
  br i1 %15, label %while.body.1, label %while.merge.1
while.body.1:
  %16 = call i32 @getch()
  %17 = sub i32 %16, 48
  store i32 %17, i32* %alloc_1, align 4
  %18 = load i32, i32* %alloc_1, align 4
  %19 = icmp sge i32 %18, 0
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %land.rhs3, label %land.merge4
land.rhs3:
  %22 = load i32, i32* %alloc_1, align 4
  %23 = icmp sle i32 %22, 9
  %24 = zext i1 %23 to i32
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  br label %land.merge4
land.merge4:
  %27 = phi i32 [0, %while.body.1], [%26, %land.rhs3]
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %if.then1, label %if.else1
if.then1:
  %29 = load i32, i32* %alloc_0, align 4
  %30 = mul i32 %29, 10
  %31 = load i32, i32* %alloc_1, align 4
  %32 = add i32 %30, %31
  store i32 %32, i32* %alloc_0, align 4
  br label %if.merge1
if.else1:
  br label %while.merge.1
break.unreachable:
  br label %if.merge1
if.merge1:
  br label %while.cond.1
while.merge.1:
  %33 = load i32, i32* %alloc_0, align 4
  ret i32 %33
}

define void @my_putint(i32 %arg0) {
entry5:
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca [16 x i32], align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  store i32 0, i32* %alloc_3, align 4
  br label %while.cond.2
while.cond.2:
  %1 = load i32, i32* %0, align 4
  %2 = icmp sgt i32 %1, 0
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.2, label %while.merge.2
while.body.2:
  %5 = load i32, i32* %alloc_3, align 4
  %6 = getelementptr inbounds [16 x i32], [16 x i32]* %alloc_2, i32 0, i32 %5
  %7 = load i32, i32* %0, align 4
  %8 = srem i32 %7, 10
  %9 = add i32 %8, 48
  store i32 %9, i32* %6, align 4
  %10 = load i32, i32* %0, align 4
  %11 = sdiv i32 %10, 10
  store i32 %11, i32* %0, align 4
  %12 = load i32, i32* %alloc_3, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %alloc_3, align 4
  br label %while.cond.2
while.merge.2:
  br label %while.cond.3
while.cond.3:
  %14 = load i32, i32* %alloc_3, align 4
  %15 = icmp sgt i32 %14, 0
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %while.body.3, label %while.merge.3
while.body.3:
  %18 = load i32, i32* %alloc_3, align 4
  %19 = sub i32 %18, 1
  store i32 %19, i32* %alloc_3, align 4
  %20 = load i32, i32* %alloc_3, align 4
  %21 = getelementptr inbounds [16 x i32], [16 x i32]* %alloc_2, i32 0, i32 %20
  %22 = load i32, i32* %21, align 4
  call void @putch(i32 %22)
  br label %while.cond.3
while.merge.3:
  ret void
}

define i32 @main() {
entry6:
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %0 = call i32 @my_getint()
  store i32 %0, i32* %alloc_4, align 4
  br label %while.cond.4
while.cond.4:
  %1 = load i32, i32* %alloc_4, align 4
  %2 = icmp sgt i32 %1, 0
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.4, label %while.merge.4
while.body.4:
  %5 = call i32 @my_getint()
  store i32 %5, i32* %alloc_5, align 4
  %6 = load i32, i32* %alloc_5, align 4
  call void @my_putint(i32 %6)
  call void @putch(i32 10)
  %7 = load i32, i32* %alloc_4, align 4
  %8 = sub i32 %7, 1
  store i32 %8, i32* %alloc_4, align 4
  br label %while.cond.4
while.merge.4:
  ret i32 0
}

