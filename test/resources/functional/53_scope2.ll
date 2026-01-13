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

@k = dso_local global i32 zeroinitializer, align 4

define i32 @main() {
entry0:
  store i32 3389, i32* @k, align 4
  %0 = load i32, i32* @k, align 4
  %1 = icmp slt i32 %0, 10000
  %2 = zext i1 %1 to i32
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %if.then0, label %if.merge0
if.then0:
  %4 = load i32, i32* @k, align 4
  %5 = add i32 %4, 1
  store i32 %5, i32* @k, align 4
  %6 = alloca i32, align 4
  store i32 112, i32* %6, align 4
  br label %while.cond.0
while.cond.0:
  %7 = load i32, i32* %6, align 4
  %8 = icmp sgt i32 %7, 10
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %while.body.0, label %while.merge.0
while.body.0:
  %11 = load i32, i32* %6, align 4
  %12 = sub i32 %11, 88
  store i32 %12, i32* %6, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp slt i32 %13, 1000
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %if.then1, label %if.merge1
if.then1:
  %17 = alloca i32, align 4
  store i32 9, i32* %17, align 4
  %18 = alloca i32, align 4
  store i32 11, i32* %18, align 4
  store i32 10, i32* %17, align 4
  %19 = load i32, i32* %6, align 4
  %20 = load i32, i32* %17, align 4
  %21 = sub i32 %19, %20
  store i32 %21, i32* %6, align 4
  %22 = alloca i32, align 4
  store i32 11, i32* %22, align 4
  %23 = load i32, i32* %6, align 4
  %24 = load i32, i32* %22, align 4
  %25 = add i32 %23, %24
  %26 = load i32, i32* %18, align 4
  %27 = add i32 %25, %26
  store i32 %27, i32* %6, align 4
  br label %if.merge1
if.merge1:
  br label %while.cond.0
while.merge.0:
  %28 = load i32, i32* %6, align 4
  call void @putint(i32 %28)
  br label %if.merge0
if.merge0:
  %29 = load i32, i32* @k, align 4
  ret i32 %29
}

