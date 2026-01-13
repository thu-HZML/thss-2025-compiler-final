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
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = getelementptr inbounds i32, i32* %2, i32 0
  store i32 -1, i32* %3, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %4, align 4
  %5 = alloca i32, align 4
  store i32 -1, i32* %5, align 4
  br label %while.cond.0
while.cond.0:
  %6 = load i32, i32* %4, align 4
  %7 = load i32*, i32** %0, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 %6
  %9 = load i32, i32* %8, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %while.body.0, label %while.merge.0
while.body.0:
  %11 = load i32, i32* %5, align 4
  %12 = icmp eq i32 %11, -1
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %15 = load i32, i32* %4, align 4
  %16 = load i32*, i32** %0, align 8
  %17 = getelementptr inbounds i32, i32* %16, i32 %15
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %5, align 4
  %20 = load i32*, i32** %0, align 8
  %21 = getelementptr inbounds i32, i32* %20, i32 %19
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  br label %lor.merge2
lor.merge2:
  %27 = phi i32 [1, %while.body.0], [%26, %lor.rhs1]
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %if.then0, label %if.else0
if.then0:
  %29 = load i32, i32* %5, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %5, align 4
  %31 = load i32, i32* %4, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %4, align 4
  %33 = load i32, i32* %4, align 4
  %34 = load i32*, i32** %1, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 %33
  %36 = load i32, i32* %5, align 4
  store i32 %36, i32* %35, align 4
  br label %if.merge0
if.else0:
  %37 = load i32, i32* %5, align 4
  %38 = load i32*, i32** %1, align 8
  %39 = getelementptr inbounds i32, i32* %38, i32 %37
  %40 = load i32, i32* %39, align 4
  store i32 %40, i32* %5, align 4
  br label %if.merge0
if.merge0:
  br label %while.cond.0
while.merge.0:
  ret void
}

define i32 @KMP(i32* %arg0, i32* %arg1) {
entry3:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = alloca [4096 x i32], align 4
  %3 = load i32*, i32** %0, align 8
  %4 = getelementptr inbounds [4096 x i32], [4096 x i32]* %2, i32 0, i32 0
  call void @get_next(i32* %3, i32* %4)
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %6, align 4
  br label %while.cond.1
while.cond.1:
  %7 = load i32, i32* %6, align 4
  %8 = load i32*, i32** %1, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 %7
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %while.body.1, label %while.merge.1
while.body.1:
  %12 = load i32, i32* %5, align 4
  %13 = load i32*, i32** %0, align 8
  %14 = getelementptr inbounds i32, i32* %13, i32 %12
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %6, align 4
  %17 = load i32*, i32** %1, align 8
  %18 = getelementptr inbounds i32, i32* %17, i32 %16
  %19 = load i32, i32* %18, align 4
  %20 = icmp eq i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %if.then1, label %if.else1
if.then1:
  %23 = load i32, i32* %5, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %5, align 4
  %25 = load i32, i32* %6, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %5, align 4
  %28 = load i32*, i32** %0, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 %27
  %30 = load i32, i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %if.then2, label %if.merge2
if.then2:
  %34 = load i32, i32* %6, align 4
  ret i32 %34
if.merge2:
  br label %if.merge1
if.else1:
  %35 = load i32, i32* %5, align 4
  %36 = getelementptr inbounds [4096 x i32], [4096 x i32]* %2, i32 0, i32 %35
  %37 = load i32, i32* %36, align 4
  store i32 %37, i32* %5, align 4
  %38 = load i32, i32* %5, align 4
  %39 = icmp eq i32 %38, -1
  %40 = zext i1 %39 to i32
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %if.then3, label %if.merge3
if.then3:
  %42 = load i32, i32* %5, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %5, align 4
  %44 = load i32, i32* %6, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %6, align 4
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
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.2
while.cond.2:
  %2 = icmp ne i32 1, 0
  br i1 %2, label %while.body.2, label %while.merge.2
while.body.2:
  %3 = load i32, i32* %1, align 4
  %4 = load i32*, i32** %0, align 8
  %5 = getelementptr inbounds i32, i32* %4, i32 %3
  %6 = call i32 @getch()
  store i32 %6, i32* %5, align 4
  %7 = load i32, i32* %1, align 4
  %8 = load i32*, i32** %0, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 %7
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %10, 10
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then4, label %if.merge4
if.then4:
  br label %while.merge.2
break.unreachable:
  br label %if.merge4
if.merge4:
  %14 = load i32, i32* %1, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %1, align 4
  br label %while.cond.2
while.merge.2:
  %16 = load i32, i32* %1, align 4
  %17 = load i32*, i32** %0, align 8
  %18 = getelementptr inbounds i32, i32* %17, i32 %16
  store i32 0, i32* %18, align 4
  %19 = load i32, i32* %1, align 4
  ret i32 %19
}

define i32 @main() {
entry5:
  %0 = alloca [4096 x i32], align 4
  %1 = alloca [4096 x i32], align 4
  %2 = getelementptr inbounds [4096 x i32], [4096 x i32]* %0, i32 0, i32 0
  %3 = call i32 @read_str(i32* %2)
  %4 = getelementptr inbounds [4096 x i32], [4096 x i32]* %1, i32 0, i32 0
  %5 = call i32 @read_str(i32* %4)
  %6 = getelementptr inbounds [4096 x i32], [4096 x i32]* %0, i32 0, i32 0
  %7 = getelementptr inbounds [4096 x i32], [4096 x i32]* %1, i32 0, i32 0
  %8 = call i32 @KMP(i32* %6, i32* %7)
  call void @putint(i32 %8)
  call void @putch(i32 10)
  ret i32 0
}

