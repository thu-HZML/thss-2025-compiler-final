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
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
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
  store i32 112, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %6 = load i32, i32* %alloc_0, align 4
  %7 = icmp sgt i32 %6, 10
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %while.body.0, label %while.merge.0
while.body.0:
  %10 = load i32, i32* %alloc_0, align 4
  %11 = sub i32 %10, 88
  store i32 %11, i32* %alloc_0, align 4
  %12 = load i32, i32* %alloc_0, align 4
  %13 = icmp slt i32 %12, 1000
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %if.then1, label %if.merge1
if.then1:
  store i32 9, i32* %alloc_1, align 4
  store i32 11, i32* %alloc_2, align 4
  store i32 10, i32* %alloc_1, align 4
  %16 = load i32, i32* %alloc_0, align 4
  %17 = load i32, i32* %alloc_1, align 4
  %18 = sub i32 %16, %17
  store i32 %18, i32* %alloc_0, align 4
  store i32 11, i32* %alloc_3, align 4
  %19 = load i32, i32* %alloc_0, align 4
  %20 = load i32, i32* %alloc_3, align 4
  %21 = add i32 %19, %20
  %22 = load i32, i32* %alloc_2, align 4
  %23 = add i32 %21, %22
  store i32 %23, i32* %alloc_0, align 4
  br label %if.merge1
if.merge1:
  br label %while.cond.0
while.merge.0:
  %24 = load i32, i32* %alloc_0, align 4
  call void @putint(i32 %24)
  br label %if.merge0
if.merge0:
  %25 = load i32, i32* @k, align 4
  ret i32 %25
}

