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
  %0 = alloca i32, align 4
  store i32 5, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 10, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  %3 = icmp eq i32 %2, 6
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %6 = load i32, i32* %1, align 4
  %7 = icmp eq i32 %6, 11
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  %10 = zext i1 %9 to i32
  br label %lor.merge2
lor.merge2:
  %11 = phi i32 [1, %entry0], [%10, %lor.rhs1]
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then0, label %if.else0
if.then0:
  %13 = load i32, i32* %0, align 4
  ret i32 %13
if.else0:
  %14 = load i32, i32* %1, align 4
  %15 = icmp eq i32 %14, 10
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %land.rhs3, label %land.merge4
land.rhs3:
  %18 = load i32, i32* %0, align 4
  %19 = icmp eq i32 %18, 1
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  %22 = zext i1 %21 to i32
  br label %land.merge4
land.merge4:
  %23 = phi i32 [0, %if.else0], [%22, %land.rhs3]
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %if.then1, label %if.else1
if.then1:
  store i32 25, i32* %0, align 4
  br label %if.merge1
if.else1:
  %25 = load i32, i32* %1, align 4
  %26 = icmp eq i32 %25, 10
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %land.rhs5, label %land.merge6
land.rhs5:
  %29 = load i32, i32* %0, align 4
  %30 = icmp eq i32 %29, -5
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  br label %land.merge6
land.merge6:
  %34 = phi i32 [0, %if.else1], [%33, %land.rhs5]
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %if.then2, label %if.else2
if.then2:
  %36 = load i32, i32* %0, align 4
  %37 = add i32 %36, 15
  store i32 %37, i32* %0, align 4
  br label %if.merge2
if.else2:
  %38 = load i32, i32* %0, align 4
  %39 = sub i32 0, %38
  store i32 %39, i32* %0, align 4
  br label %if.merge2
if.merge2:
  br label %if.merge1
if.merge1:
  br label %if.merge0
if.merge0:
  %40 = load i32, i32* %0, align 4
  ret i32 %40
}

define i32 @main() {
entry7:
  %0 = call i32 @ifElseIf()
  call void @putint(i32 %0)
  ret i32 0
}

