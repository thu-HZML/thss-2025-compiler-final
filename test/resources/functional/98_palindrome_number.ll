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
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca [4 x i32], align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  store i32 0, i32* %alloc_1, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_1, align 4
  %2 = icmp slt i32 %1, 4
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = load i32, i32* %alloc_1, align 4
  %6 = getelementptr inbounds [4 x i32], [4 x i32]* %alloc_0, i32 0, i32 %5
  %7 = load i32, i32* %0, align 4
  %8 = srem i32 %7, 10
  store i32 %8, i32* %6, align 4
  %9 = load i32, i32* %0, align 4
  %10 = sdiv i32 %9, 10
  store i32 %10, i32* %0, align 4
  %11 = load i32, i32* %alloc_1, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %alloc_1, align 4
  br label %while.cond.0
while.merge.0:
  %13 = getelementptr inbounds [4 x i32], [4 x i32]* %alloc_0, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %alloc_0, i32 0, i32 3
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %14, %16
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %land.rhs1, label %land.merge2
land.rhs1:
  %20 = getelementptr inbounds [4 x i32], [4 x i32]* %alloc_0, i32 0, i32 1
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds [4 x i32], [4 x i32]* %alloc_0, i32 0, i32 2
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %21, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  br label %land.merge2
land.merge2:
  %28 = phi i32 [0, %while.merge.0], [%27, %land.rhs1]
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %if.then0, label %if.else0
if.then0:
  store i32 1, i32* %alloc_2, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %alloc_2, align 4
  br label %if.merge0
if.merge0:
  %30 = load i32, i32* %alloc_2, align 4
  ret i32 %30
}

define i32 @main() {
entry3:
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  store i32 1221, i32* %alloc_3, align 4
  %0 = load i32, i32* %alloc_3, align 4
  %1 = call i32 @palindrome(i32 %0)
  store i32 %1, i32* %alloc_4, align 4
  %2 = load i32, i32* %alloc_4, align 4
  %3 = icmp eq i32 %2, 1
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %if.then1, label %if.else1
if.then1:
  %6 = load i32, i32* %alloc_3, align 4
  call void @putint(i32 %6)
  br label %if.merge1
if.else1:
  store i32 0, i32* %alloc_4, align 4
  %7 = load i32, i32* %alloc_4, align 4
  call void @putint(i32 %7)
  br label %if.merge1
if.merge1:
  store i32 10, i32* %alloc_4, align 4
  %8 = load i32, i32* %alloc_4, align 4
  call void @putch(i32 %8)
  ret i32 0
}

