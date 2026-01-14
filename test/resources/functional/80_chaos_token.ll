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
@N4__mE___ = dso_local global [6 x [50 x i32]] [[50 x i32] [i32 83, i32 97, i32 97, i32 98, i32 97, i32 114, i32 117, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [50 x i32] [i32 75, i32 97, i32 98, i32 97, i32 110, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [50 x i32] [i32 72, i32 97, i32 115, i32 104, i32 105, i32 98, i32 105, i32 114, i32 111, i32 107, i32 111, i32 117, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [50 x i32] [i32 65, i32 114, i32 97, i32 105, i32 103, i32 117, i32 109, i32 97, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [50 x i32] [i32 72, i32 117, i32 110, i32 98, i32 111, i32 114, i32 117, i32 116, i32 111, i32 32, i32 80, i32 101, i32 110, i32 103, i32 105, i32 110, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [50 x i32] [i32 84, i32 97, i32 105, i32 114, i32 105, i32 107, i32 117, i32 32, i32 79, i32 111, i32 107, i32 97, i32 109, i32 105, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4
@saY_HeI10_To = dso_local global [40 x i32] [i32 32, i32 115, i32 97, i32 121, i32 115, i32 32, i32 104, i32 101, i32 108, i32 108, i32 111, i32 32, i32 116, i32 111, i32 32, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@RET = dso_local global [5 x i32] [i32 10, i32 0, i32 0, i32 0, i32 0], align 4

define i32 @putstr(i32* %arg0) {
entry0:
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_0, align 4
  %2 = load i32*, i32** %0, align 8
  %3 = getelementptr inbounds i32, i32* %2, i32 %1
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = load i32, i32* %alloc_0, align 4
  %7 = load i32*, i32** %0, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 %6
  %9 = load i32, i32* %8, align 4
  call void @putch(i32 %9)
  %10 = load i32, i32* %alloc_0, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  %12 = load i32, i32* %alloc_0, align 4
  ret i32 %12
}

define i32 @main() {
entry1:
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %0 = getelementptr inbounds [100 x i32], [100 x i32]* @__HELLO, i32 0, i32 0
  %1 = call i32 @putstr(i32* %0)
  store i32 0, i32* %alloc_1, align 4
  br label %while.cond.1
while.cond.1:
  %2 = icmp ne i32 1, 0
  br i1 %2, label %while.body.1, label %while.merge.1
while.body.1:
  %3 = load i32, i32* %alloc_1, align 4
  %4 = sdiv i32 %3, 6
  store i32 %4, i32* %alloc_2, align 4
  %5 = load i32, i32* %alloc_1, align 4
  %6 = srem i32 %5, 6
  store i32 %6, i32* %alloc_3, align 4
  %7 = load i32, i32* %alloc_2, align 4
  %8 = load i32, i32* %alloc_3, align 4
  %9 = icmp ne i32 %7, %8
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %if.then0, label %if.merge0
if.then0:
  %12 = load i32, i32* %alloc_2, align 4
  %13 = getelementptr inbounds [6 x [50 x i32]], [6 x [50 x i32]]* @N4__mE___, i32 0, i32 %12
  %14 = getelementptr inbounds [50 x i32], [50 x i32]* %13, i32 0, i32 0
  %15 = call i32 @putstr(i32* %14)
  %16 = getelementptr inbounds [40 x i32], [40 x i32]* @saY_HeI10_To, i32 0, i32 0
  %17 = call i32 @putstr(i32* %16)
  %18 = load i32, i32* %alloc_3, align 4
  %19 = getelementptr inbounds [6 x [50 x i32]], [6 x [50 x i32]]* @N4__mE___, i32 0, i32 %18
  %20 = getelementptr inbounds [50 x i32], [50 x i32]* %19, i32 0, i32 0
  %21 = call i32 @putstr(i32* %20)
  %22 = getelementptr inbounds [5 x i32], [5 x i32]* @RET, i32 0, i32 0
  %23 = call i32 @putstr(i32* %22)
  br label %if.merge0
if.merge0:
  %24 = load i32, i32* %alloc_1, align 4
  %25 = mul i32 %24, 17
  %26 = add i32 %25, 23
  %27 = srem i32 %26, 32
  store i32 %27, i32* %alloc_1, align 4
  %28 = load i32, i32* %alloc_1, align 4
  %29 = icmp eq i32 %28, 0
  %30 = zext i1 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %if.then1, label %if.merge1
if.then1:
  br label %while.merge.1
break.unreachable:
  br label %if.merge1
if.merge1:
  br label %while.cond.1
while.merge.1:
  ret i32 0
}

