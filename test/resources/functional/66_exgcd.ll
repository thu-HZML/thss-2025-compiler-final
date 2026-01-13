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


define i32 @exgcd(i32 %arg0, i32 %arg1, i32* %arg2, i32* %arg3) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32*, align 4
  store i32* %arg2, i32** %2, align 8
  %3 = alloca i32*, align 4
  store i32* %arg3, i32** %3, align 8
  %4 = load i32, i32* %1, align 4
  %5 = icmp eq i32 %4, 0
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.else0
if.then0:
  %8 = load i32*, i32** %2, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 0
  store i32 1, i32* %9, align 4
  %10 = load i32*, i32** %3, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 0
  store i32 0, i32* %11, align 4
  %12 = load i32, i32* %0, align 4
  ret i32 %12
if.else0:
  %13 = alloca i32, align 4
  %14 = load i32, i32* %1, align 4
  %15 = load i32, i32* %0, align 4
  %16 = load i32, i32* %1, align 4
  %17 = srem i32 %15, %16
  %18 = load i32*, i32** %2, align 8
  %19 = load i32*, i32** %3, align 8
  %20 = call i32 @exgcd(i32 %14, i32 %17, i32* %18, i32* %19)
  store i32 %20, i32* %13, align 4
  %21 = alloca i32, align 4
  %22 = load i32*, i32** %2, align 8
  %23 = getelementptr inbounds i32, i32* %22, i32 0
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %21, align 4
  %25 = load i32*, i32** %2, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 0
  %27 = load i32*, i32** %3, align 8
  %28 = getelementptr inbounds i32, i32* %27, i32 0
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %26, align 4
  %30 = load i32*, i32** %3, align 8
  %31 = getelementptr inbounds i32, i32* %30, i32 0
  %32 = load i32, i32* %21, align 4
  %33 = load i32, i32* %0, align 4
  %34 = load i32, i32* %1, align 4
  %35 = sdiv i32 %33, %34
  %36 = load i32*, i32** %3, align 8
  %37 = getelementptr inbounds i32, i32* %36, i32 0
  %38 = load i32, i32* %37, align 4
  %39 = mul i32 %35, %38
  %40 = sub i32 %32, %39
  store i32 %40, i32* %31, align 4
  %41 = load i32, i32* %13, align 4
  ret i32 %41
if.merge0:
  ret i32 0
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  store i32 7, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 15, i32* %1, align 4
  %2 = alloca [1 x i32], align 4
  %3 = bitcast [1 x i32]* %2 to i32*
  %4 = getelementptr inbounds i32, i32* %3, i32 0
  store i32 1, i32* %4, align 4
  %5 = alloca [1 x i32], align 4
  %6 = bitcast [1 x i32]* %5 to i32*
  %7 = getelementptr inbounds i32, i32* %6, i32 0
  store i32 1, i32* %7, align 4
  %8 = load i32, i32* %0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = getelementptr inbounds [1 x i32], [1 x i32]* %2, i32 0, i32 0
  %11 = getelementptr inbounds [1 x i32], [1 x i32]* %5, i32 0, i32 0
  %12 = call i32 @exgcd(i32 %8, i32 %9, i32* %10, i32* %11)
  %13 = getelementptr inbounds [1 x i32], [1 x i32]* %2, i32 0, i32 0
  %14 = getelementptr inbounds [1 x i32], [1 x i32]* %2, i32 0, i32 0
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %1, align 4
  %17 = srem i32 %15, %16
  %18 = load i32, i32* %1, align 4
  %19 = add i32 %17, %18
  %20 = load i32, i32* %1, align 4
  %21 = srem i32 %19, %20
  store i32 %21, i32* %13, align 4
  %22 = getelementptr inbounds [1 x i32], [1 x i32]* %2, i32 0, i32 0
  %23 = load i32, i32* %22, align 4
  call void @putint(i32 %23)
  ret i32 0
}

