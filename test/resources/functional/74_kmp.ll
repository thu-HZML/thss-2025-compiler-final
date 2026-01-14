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


define void @get_next(i32* %arg0, i32* %arg1) {
entry0:
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = getelementptr inbounds i32, i32* %2, i32 0
  store i32 -1, i32* %3, align 4
  store i32 0, i32* %alloc_0, align 4
  store i32 -1, i32* %alloc_1, align 4
  br label %while.cond.0
while.cond.0:
  %4 = load i32, i32* %alloc_0, align 4
  %5 = load i32*, i32** %0, align 8
  %6 = getelementptr inbounds i32, i32* %5, i32 %4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.0, label %while.merge.0
while.body.0:
  %9 = load i32, i32* %alloc_1, align 4
  %10 = icmp eq i32 %9, -1
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %13 = load i32, i32* %alloc_0, align 4
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %15, align 4
  %17 = load i32, i32* %alloc_1, align 4
  %18 = load i32*, i32** %0, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 %17
  %20 = load i32, i32* %19, align 4
  %21 = icmp eq i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  %24 = zext i1 %23 to i32
  br label %lor.merge2
lor.merge2:
  %25 = phi i32 [1, %while.body.0], [%24, %lor.rhs1]
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then0, label %if.else0
if.then0:
  %27 = load i32, i32* %alloc_1, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %alloc_1, align 4
  %29 = load i32, i32* %alloc_0, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %alloc_0, align 4
  %31 = load i32, i32* %alloc_0, align 4
  %32 = load i32*, i32** %1, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 %31
  %34 = load i32, i32* %alloc_1, align 4
  store i32 %34, i32* %33, align 4
  br label %if.merge0
if.else0:
  %35 = load i32, i32* %alloc_1, align 4
  %36 = load i32*, i32** %1, align 8
  %37 = getelementptr inbounds i32, i32* %36, i32 %35
  %38 = load i32, i32* %37, align 4
  store i32 %38, i32* %alloc_1, align 4
  br label %if.merge0
if.merge0:
  br label %while.cond.0
while.merge.0:
  ret void
}

define i32 @KMP(i32* %arg0, i32* %arg1) {
entry3:
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca [4096 x i32], align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = load i32*, i32** %0, align 8
  %3 = getelementptr inbounds [4096 x i32], [4096 x i32]* %alloc_2, i32 0, i32 0
  call void @get_next(i32* %2, i32* %3)
  store i32 0, i32* %alloc_3, align 4
  store i32 0, i32* %alloc_4, align 4
  br label %while.cond.1
while.cond.1:
  %4 = load i32, i32* %alloc_4, align 4
  %5 = load i32*, i32** %1, align 8
  %6 = getelementptr inbounds i32, i32* %5, i32 %4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.1, label %while.merge.1
while.body.1:
  %9 = load i32, i32* %alloc_3, align 4
  %10 = load i32*, i32** %0, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 %9
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %alloc_4, align 4
  %14 = load i32*, i32** %1, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %if.then1, label %if.else1
if.then1:
  %20 = load i32, i32* %alloc_3, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* %alloc_3, align 4
  %22 = load i32, i32* %alloc_4, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %alloc_4, align 4
  %24 = load i32, i32* %alloc_3, align 4
  %25 = load i32*, i32** %0, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 %24
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %if.then2, label %if.merge2
if.then2:
  %31 = load i32, i32* %alloc_4, align 4
  ret i32 %31
if.merge2:
  br label %if.merge1
if.else1:
  %32 = load i32, i32* %alloc_3, align 4
  %33 = getelementptr inbounds [4096 x i32], [4096 x i32]* %alloc_2, i32 0, i32 %32
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %alloc_3, align 4
  %35 = load i32, i32* %alloc_3, align 4
  %36 = icmp eq i32 %35, -1
  %37 = zext i1 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %if.then3, label %if.merge3
if.then3:
  %39 = load i32, i32* %alloc_3, align 4
  %40 = add i32 %39, 1
  store i32 %40, i32* %alloc_3, align 4
  %41 = load i32, i32* %alloc_4, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %alloc_4, align 4
  br label %if.merge3
if.merge3:
  br label %if.merge1
if.merge1:
  br label %while.cond.1
while.merge.1:
  ret i32 -1
}

define i32 @read_str(i32* %arg0) {
entry4:
  %alloc_5 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_5, align 4
  br label %while.cond.2
while.cond.2:
  %1 = icmp ne i32 1, 0
  br i1 %1, label %while.body.2, label %while.merge.2
while.body.2:
  %2 = load i32, i32* %alloc_5, align 4
  %3 = load i32*, i32** %0, align 8
  %4 = getelementptr inbounds i32, i32* %3, i32 %2
  %5 = call i32 @getch()
  store i32 %5, i32* %4, align 4
  %6 = load i32, i32* %alloc_5, align 4
  %7 = load i32*, i32** %0, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 %6
  %9 = load i32, i32* %8, align 4
  %10 = icmp eq i32 %9, 10
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then4, label %if.merge4
if.then4:
  br label %while.merge.2
break.unreachable:
  br label %if.merge4
if.merge4:
  %13 = load i32, i32* %alloc_5, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %alloc_5, align 4
  br label %while.cond.2
while.merge.2:
  %15 = load i32, i32* %alloc_5, align 4
  %16 = load i32*, i32** %0, align 8
  %17 = getelementptr inbounds i32, i32* %16, i32 %15
  store i32 0, i32* %17, align 4
  %18 = load i32, i32* %alloc_5, align 4
  ret i32 %18
}

define i32 @main() {
entry5:
  %alloc_7 = alloca [4096 x i32], align 4
  %alloc_6 = alloca [4096 x i32], align 4
  %0 = getelementptr inbounds [4096 x i32], [4096 x i32]* %alloc_6, i32 0, i32 0
  %1 = call i32 @read_str(i32* %0)
  %2 = getelementptr inbounds [4096 x i32], [4096 x i32]* %alloc_7, i32 0, i32 0
  %3 = call i32 @read_str(i32* %2)
  %4 = getelementptr inbounds [4096 x i32], [4096 x i32]* %alloc_6, i32 0, i32 0
  %5 = getelementptr inbounds [4096 x i32], [4096 x i32]* %alloc_7, i32 0, i32 0
  %6 = call i32 @KMP(i32* %4, i32* %5)
  call void @putint(i32 %6)
  call void @putch(i32 10)
  ret i32 0
}

