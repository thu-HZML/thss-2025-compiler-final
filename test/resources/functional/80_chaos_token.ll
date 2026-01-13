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

@__HELLO = dso_local global [100 x i32] [i32 87, i32 101, i32 108, i32 99, i32 111, i32 109, i32 101, i32 32, i32 116, i32 111, i32 32, i32 116, i32 104, i32 101, i32 32, i32 74, i32 97, i32 112, i32 97, i32 114, i32 105, i32 32, i32 80, i32 97, i32 114, i32 107, i32 33, i32 10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@N4__mE___ = dso_local global [6 x [50 x i32]] zeroinitializer, align 4
@saY_HeI10_To = dso_local global [40 x i32] [i32 32, i32 115, i32 97, i32 121, i32 115, i32 32, i32 104, i32 101, i32 108, i32 108, i32 111, i32 32, i32 116, i32 111, i32 32, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@RET = dso_local global [5 x i32] [i32 10, i32 0, i32 0, i32 0, i32 0], align 4

define i32 @putstr(i32* %arg0) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %1, align 4
  %3 = load i32*, i32** %0, align 8
  %4 = getelementptr inbounds i32, i32* %3, i32 %2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = load i32, i32* %1, align 4
  %8 = load i32*, i32** %0, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 %7
  %10 = load i32, i32* %9, align 4
  call void @putch(i32 %10)
  %11 = load i32, i32* %1, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  %13 = load i32, i32* %1, align 4
  ret i32 %13
}

define i32 @main() {
entry1:
  %0 = getelementptr inbounds [100 x i32], [100 x i32]* @__HELLO, i32 0, i32 0
  %1 = call i32 @putstr(i32* %0)
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.1
while.cond.1:
  %3 = icmp ne i32 1, 0
  br i1 %3, label %while.body.1, label %while.merge.1
while.body.1:
  %4 = alloca i32, align 4
  %5 = load i32, i32* %2, align 4
  %6 = sdiv i32 %5, 6
  store i32 %6, i32* %4, align 4
  %7 = alloca i32, align 4
  %8 = load i32, i32* %2, align 4
  %9 = srem i32 %8, 6
  store i32 %9, i32* %7, align 4
  %10 = load i32, i32* %4, align 4
  %11 = load i32, i32* %7, align 4
  %12 = icmp ne i32 %10, %11
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %if.then0, label %if.merge0
if.then0:
  %15 = load i32, i32* %4, align 4
  %16 = getelementptr inbounds [6 x [50 x i32]], [6 x [50 x i32]]* @N4__mE___, i32 0, i32 %15
  %17 = getelementptr inbounds [50 x i32], [50 x i32]* %16, i32 0, i32 0
  %18 = call i32 @putstr(i32* %17)
  %19 = getelementptr inbounds [40 x i32], [40 x i32]* @saY_HeI10_To, i32 0, i32 0
  %20 = call i32 @putstr(i32* %19)
  %21 = load i32, i32* %7, align 4
  %22 = getelementptr inbounds [6 x [50 x i32]], [6 x [50 x i32]]* @N4__mE___, i32 0, i32 %21
  %23 = getelementptr inbounds [50 x i32], [50 x i32]* %22, i32 0, i32 0
  %24 = call i32 @putstr(i32* %23)
  %25 = getelementptr inbounds [5 x i32], [5 x i32]* @RET, i32 0, i32 0
  %26 = call i32 @putstr(i32* %25)
  br label %if.merge0
if.merge0:
  %27 = load i32, i32* %2, align 4
  %28 = mul i32 %27, 17
  %29 = add i32 %28, 23
  %30 = srem i32 %29, 32
  store i32 %30, i32* %2, align 4
  %31 = load i32, i32* %2, align 4
  %32 = icmp eq i32 %31, 0
  %33 = zext i1 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %if.then1, label %if.merge1
if.then1:
  br label %while.merge.1
break.unreachable:
  br label %if.merge1
if.merge1:
  br label %while.cond.1
while.merge.1:
  ret i32 0
}

