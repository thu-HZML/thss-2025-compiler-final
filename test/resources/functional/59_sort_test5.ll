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

@n = dso_local global i32 zeroinitializer, align 4

define i32 @swap(i32* %arg0, i32 %arg1, i32 %arg2) {
entry0:
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32*, i32** %0, align 8
  %5 = getelementptr inbounds i32, i32* %4, i32 %3
  %6 = load i32, i32* %5, align 4
  store i32 %6, i32* %alloc_0, align 4
  %7 = load i32, i32* %1, align 4
  %8 = load i32*, i32** %0, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 %7
  %10 = load i32, i32* %2, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 %10
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %9, align 4
  %14 = load i32, i32* %2, align 4
  %15 = load i32*, i32** %0, align 8
  %16 = getelementptr inbounds i32, i32* %15, i32 %14
  %17 = load i32, i32* %alloc_0, align 4
  store i32 %17, i32* %16, align 4
  ret i32 0
}

define i32 @heap_ajust(i32* %arg0, i32 %arg1, i32 %arg2) {
entry1:
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  store i32 %3, i32* %alloc_1, align 4
  %4 = load i32, i32* %alloc_1, align 4
  %5 = mul i32 %4, 2
  %6 = add i32 %5, 1
  store i32 %6, i32* %alloc_2, align 4
  br label %while.cond.0
while.cond.0:
  %7 = load i32, i32* %alloc_2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = add i32 %8, 1
  %10 = icmp slt i32 %7, %9
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %while.body.0, label %while.merge.0
while.body.0:
  %13 = load i32, i32* %alloc_2, align 4
  %14 = load i32, i32* %2, align 4
  %15 = icmp slt i32 %13, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %land.rhs2, label %land.merge3
land.rhs2:
  %18 = load i32, i32* %alloc_2, align 4
  %19 = load i32*, i32** %0, align 8
  %20 = getelementptr inbounds i32, i32* %19, i32 %18
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* %alloc_2, align 4
  %23 = add i32 %22, 1
  %24 = load i32*, i32** %0, align 8
  %25 = getelementptr inbounds i32, i32* %24, i32 %23
  %26 = load i32, i32* %25, align 4
  %27 = icmp slt i32 %21, %26
  %28 = zext i1 %27 to i32
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  br label %land.merge3
land.merge3:
  %31 = phi i32 [0, %while.body.0], [%30, %land.rhs2]
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %if.then0, label %if.merge0
if.then0:
  %33 = load i32, i32* %alloc_2, align 4
  %34 = add i32 %33, 1
  store i32 %34, i32* %alloc_2, align 4
  br label %if.merge0
if.merge0:
  %35 = load i32, i32* %alloc_1, align 4
  %36 = load i32*, i32** %0, align 8
  %37 = getelementptr inbounds i32, i32* %36, i32 %35
  %38 = load i32, i32* %37, align 4
  %39 = load i32, i32* %alloc_2, align 4
  %40 = load i32*, i32** %0, align 8
  %41 = getelementptr inbounds i32, i32* %40, i32 %39
  %42 = load i32, i32* %41, align 4
  %43 = icmp sgt i32 %38, %42
  %44 = zext i1 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %if.then1, label %if.else1
if.then1:
  ret i32 0
if.else1:
  %46 = load i32*, i32** %0, align 8
  %47 = load i32, i32* %alloc_1, align 4
  %48 = load i32, i32* %alloc_2, align 4
  %49 = call i32 @swap(i32* %46, i32 %47, i32 %48)
  store i32 %49, i32* %alloc_1, align 4
  %50 = load i32, i32* %alloc_2, align 4
  store i32 %50, i32* %alloc_1, align 4
  %51 = load i32, i32* %alloc_1, align 4
  %52 = mul i32 %51, 2
  %53 = add i32 %52, 1
  store i32 %53, i32* %alloc_2, align 4
  br label %if.merge1
if.merge1:
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @heap_sort(i32* %arg0, i32 %arg1) {
entry4:
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = sdiv i32 %2, 2
  %4 = sub i32 %3, 1
  store i32 %4, i32* %alloc_3, align 4
  br label %while.cond.1
while.cond.1:
  %5 = load i32, i32* %alloc_3, align 4
  %6 = icmp sgt i32 %5, -1
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.1, label %while.merge.1
while.body.1:
  %9 = load i32, i32* %1, align 4
  %10 = sub i32 %9, 1
  store i32 %10, i32* %alloc_4, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = load i32, i32* %alloc_3, align 4
  %13 = load i32, i32* %alloc_4, align 4
  %14 = call i32 @heap_ajust(i32* %11, i32 %12, i32 %13)
  store i32 %14, i32* %alloc_4, align 4
  %15 = load i32, i32* %alloc_3, align 4
  %16 = sub i32 %15, 1
  store i32 %16, i32* %alloc_3, align 4
  br label %while.cond.1
while.merge.1:
  %17 = load i32, i32* %1, align 4
  %18 = sub i32 %17, 1
  store i32 %18, i32* %alloc_3, align 4
  br label %while.cond.2
while.cond.2:
  %19 = load i32, i32* %alloc_3, align 4
  %20 = icmp sgt i32 %19, 0
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %while.body.2, label %while.merge.2
while.body.2:
  store i32 0, i32* %alloc_5, align 4
  %23 = load i32*, i32** %0, align 8
  %24 = load i32, i32* %alloc_5, align 4
  %25 = load i32, i32* %alloc_3, align 4
  %26 = call i32 @swap(i32* %23, i32 %24, i32 %25)
  store i32 %26, i32* %alloc_4, align 4
  %27 = load i32, i32* %alloc_3, align 4
  %28 = sub i32 %27, 1
  store i32 %28, i32* %alloc_4, align 4
  %29 = load i32*, i32** %0, align 8
  %30 = load i32, i32* %alloc_5, align 4
  %31 = load i32, i32* %alloc_4, align 4
  %32 = call i32 @heap_ajust(i32* %29, i32 %30, i32 %31)
  store i32 %32, i32* %alloc_4, align 4
  %33 = load i32, i32* %alloc_3, align 4
  %34 = sub i32 %33, 1
  store i32 %34, i32* %alloc_3, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

define i32 @main() {
entry5:
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca [10 x i32], align 4
  store i32 10, i32* @n, align 4
  %0 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 0
  store i32 4, i32* %0, align 4
  %1 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 1
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 2
  store i32 9, i32* %2, align 4
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 3
  store i32 2, i32* %3, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 4
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 5
  store i32 1, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 6
  store i32 6, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 7
  store i32 5, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 8
  store i32 7, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 9
  store i32 8, i32* %9, align 4
  store i32 0, i32* %alloc_7, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 0
  %11 = load i32, i32* @n, align 4
  %12 = call i32 @heap_sort(i32* %10, i32 %11)
  store i32 %12, i32* %alloc_7, align 4
  br label %while.cond.3
while.cond.3:
  %13 = load i32, i32* %alloc_7, align 4
  %14 = load i32, i32* @n, align 4
  %15 = icmp slt i32 %13, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %while.body.3, label %while.merge.3
while.body.3:
  %18 = load i32, i32* %alloc_7, align 4
  %19 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 %18
  %20 = load i32, i32* %19, align 4
  store i32 %20, i32* %alloc_8, align 4
  %21 = load i32, i32* %alloc_8, align 4
  call void @putint(i32 %21)
  store i32 10, i32* %alloc_8, align 4
  %22 = load i32, i32* %alloc_8, align 4
  call void @putch(i32 %22)
  %23 = load i32, i32* %alloc_7, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %alloc_7, align 4
  br label %while.cond.3
while.merge.3:
  ret i32 0
}

