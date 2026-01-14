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


define i32 @ifElseIf() {
entry0:
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 5, i32* %alloc_0, align 4
  store i32 10, i32* %alloc_1, align 4
  %0 = load i32, i32* %alloc_0, align 4
  %1 = icmp eq i32 %0, 6
  %2 = zext i1 %1 to i32
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %4 = load i32, i32* %alloc_1, align 4
  %5 = icmp eq i32 %4, 11
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  br label %lor.merge2
lor.merge2:
  %9 = phi i32 [1, %entry0], [%8, %lor.rhs1]
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %if.then0, label %if.else0
if.then0:
  %11 = load i32, i32* %alloc_0, align 4
  ret i32 %11
if.else0:
  %12 = load i32, i32* %alloc_1, align 4
  %13 = icmp eq i32 %12, 10
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %land.rhs3, label %land.merge4
land.rhs3:
  %16 = load i32, i32* %alloc_0, align 4
  %17 = icmp eq i32 %16, 1
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  %20 = zext i1 %19 to i32
  br label %land.merge4
land.merge4:
  %21 = phi i32 [0, %if.else0], [%20, %land.rhs3]
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %if.then1, label %if.else1
if.then1:
  store i32 25, i32* %alloc_0, align 4
  br label %if.merge1
if.else1:
  %23 = load i32, i32* %alloc_1, align 4
  %24 = icmp eq i32 %23, 10
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %land.rhs5, label %land.merge6
land.rhs5:
  %27 = load i32, i32* %alloc_0, align 4
  %28 = icmp eq i32 %27, -5
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %29, 0
  %31 = zext i1 %30 to i32
  br label %land.merge6
land.merge6:
  %32 = phi i32 [0, %if.else1], [%31, %land.rhs5]
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %if.then2, label %if.else2
if.then2:
  %34 = load i32, i32* %alloc_0, align 4
  %35 = add i32 %34, 15
  store i32 %35, i32* %alloc_0, align 4
  br label %if.merge2
if.else2:
  %36 = load i32, i32* %alloc_0, align 4
  %37 = sub i32 0, %36
  store i32 %37, i32* %alloc_0, align 4
  br label %if.merge2
if.merge2:
  br label %if.merge1
if.merge1:
  br label %if.merge0
if.merge0:
  %38 = load i32, i32* %alloc_0, align 4
  ret i32 %38
}

define i32 @main() {
entry7:
  %0 = call i32 @ifElseIf()
  call void @putint(i32 %0)
  ret i32 0
}

