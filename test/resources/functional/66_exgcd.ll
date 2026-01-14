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
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
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
  %13 = load i32, i32* %1, align 4
  %14 = load i32, i32* %0, align 4
  %15 = load i32, i32* %1, align 4
  %16 = srem i32 %14, %15
  %17 = load i32*, i32** %2, align 8
  %18 = load i32*, i32** %3, align 8
  %19 = call i32 @exgcd(i32 %13, i32 %16, i32* %17, i32* %18)
  store i32 %19, i32* %alloc_0, align 4
  %20 = load i32*, i32** %2, align 8
  %21 = getelementptr inbounds i32, i32* %20, i32 0
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %alloc_1, align 4
  %23 = load i32*, i32** %2, align 8
  %24 = getelementptr inbounds i32, i32* %23, i32 0
  %25 = load i32*, i32** %3, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 0
  %27 = load i32, i32* %26, align 4
  store i32 %27, i32* %24, align 4
  %28 = load i32*, i32** %3, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 0
  %30 = load i32, i32* %alloc_1, align 4
  %31 = load i32, i32* %0, align 4
  %32 = load i32, i32* %1, align 4
  %33 = sdiv i32 %31, %32
  %34 = load i32*, i32** %3, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 0
  %36 = load i32, i32* %35, align 4
  %37 = mul i32 %33, %36
  %38 = sub i32 %30, %37
  store i32 %38, i32* %29, align 4
  %39 = load i32, i32* %alloc_0, align 4
  ret i32 %39
if.merge0:
  ret i32 0
}

define i32 @main() {
entry1:
  %alloc_5 = alloca [1 x i32], align 4
  %alloc_4 = alloca [1 x i32], align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  store i32 7, i32* %alloc_2, align 4
  store i32 15, i32* %alloc_3, align 4
  %0 = bitcast [1 x i32]* %alloc_4 to i32*
  %1 = getelementptr inbounds i32, i32* %0, i32 0
  store i32 1, i32* %1, align 4
  %2 = bitcast [1 x i32]* %alloc_5 to i32*
  %3 = getelementptr inbounds i32, i32* %2, i32 0
  store i32 1, i32* %3, align 4
  %4 = load i32, i32* %alloc_2, align 4
  %5 = load i32, i32* %alloc_3, align 4
  %6 = getelementptr inbounds [1 x i32], [1 x i32]* %alloc_4, i32 0, i32 0
  %7 = getelementptr inbounds [1 x i32], [1 x i32]* %alloc_5, i32 0, i32 0
  %8 = call i32 @exgcd(i32 %4, i32 %5, i32* %6, i32* %7)
  %9 = getelementptr inbounds [1 x i32], [1 x i32]* %alloc_4, i32 0, i32 0
  %10 = getelementptr inbounds [1 x i32], [1 x i32]* %alloc_4, i32 0, i32 0
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %alloc_3, align 4
  %13 = srem i32 %11, %12
  %14 = load i32, i32* %alloc_3, align 4
  %15 = add i32 %13, %14
  %16 = load i32, i32* %alloc_3, align 4
  %17 = srem i32 %15, %16
  store i32 %17, i32* %9, align 4
  %18 = getelementptr inbounds [1 x i32], [1 x i32]* %alloc_4, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  call void @putint(i32 %19)
  ret i32 0
}

