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


define i32 @palindrome(i32 %arg0) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca [4 x i32], align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.0
while.cond.0:
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %4, 4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.0, label %while.merge.0
while.body.0:
  %8 = load i32, i32* %2, align 4
  %9 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 %8
  %10 = load i32, i32* %0, align 4
  %11 = srem i32 %10, 10
  store i32 %11, i32* %9, align 4
  %12 = load i32, i32* %0, align 4
  %13 = sdiv i32 %12, 10
  store i32 %13, i32* %0, align 4
  %14 = load i32, i32* %2, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %2, align 4
  br label %while.cond.0
while.merge.0:
  %16 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 0
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 3
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %17, %19
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %land.rhs1, label %land.merge2
land.rhs1:
  %23 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 1
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %1, i32 0, i32 2
  %26 = load i32, i32* %25, align 4
  %27 = icmp eq i32 %24, %26
  %28 = zext i1 %27 to i32
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  br label %land.merge2
land.merge2:
  %31 = phi i32 [0, %while.merge.0], [%30, %land.rhs1]
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %if.then0, label %if.else0
if.then0:
  store i32 1, i32* %3, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %3, align 4
  br label %if.merge0
if.merge0:
  %33 = load i32, i32* %3, align 4
  ret i32 %33
}

define i32 @main() {
entry3:
  %0 = alloca i32, align 4
  store i32 1221, i32* %0, align 4
  %1 = alloca i32, align 4
  %2 = load i32, i32* %0, align 4
  %3 = call i32 @palindrome(i32 %2)
  store i32 %3, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp eq i32 %4, 1
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then1, label %if.else1
if.then1:
  %8 = load i32, i32* %0, align 4
  call void @putint(i32 %8)
  br label %if.merge1
if.else1:
  store i32 0, i32* %1, align 4
  %9 = load i32, i32* %1, align 4
  call void @putint(i32 %9)
  br label %if.merge1
if.merge1:
  store i32 10, i32* %1, align 4
  %10 = load i32, i32* %1, align 4
  call void @putch(i32 %10)
  ret i32 0
}

