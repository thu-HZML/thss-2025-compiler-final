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
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = alloca i32, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32*, i32** %0, align 8
  %6 = getelementptr inbounds i32, i32* %5, i32 %4
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %3, align 4
  %8 = load i32, i32* %1, align 4
  %9 = load i32*, i32** %0, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %2, align 4
  %12 = load i32*, i32** %0, align 8
  %13 = getelementptr inbounds i32, i32* %12, i32 %11
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %10, align 4
  %15 = load i32, i32* %2, align 4
  %16 = load i32*, i32** %0, align 8
  %17 = getelementptr inbounds i32, i32* %16, i32 %15
  %18 = load i32, i32* %3, align 4
  store i32 %18, i32* %17, align 4
  ret i32 0
}

define i32 @heap_ajust(i32* %arg0, i32 %arg1, i32 %arg2) {
entry1:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = alloca i32, align 4
  %4 = load i32, i32* %1, align 4
  store i32 %4, i32* %3, align 4
  %5 = alloca i32, align 4
  %6 = load i32, i32* %3, align 4
  %7 = mul i32 %6, 2
  %8 = add i32 %7, 1
  store i32 %8, i32* %5, align 4
  br label %while.cond.0
while.cond.0:
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %2, align 4
  %11 = add i32 %10, 1
  %12 = icmp slt i32 %9, %11
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %while.body.0, label %while.merge.0
while.body.0:
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %2, align 4
  %17 = icmp slt i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %land.rhs2, label %land.merge3
land.rhs2:
  %20 = load i32, i32* %5, align 4
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = load i32, i32* %5, align 4
  %25 = add i32 %24, 1
  %26 = load i32*, i32** %0, align 8
  %27 = getelementptr inbounds i32, i32* %26, i32 %25
  %28 = load i32, i32* %27, align 4
  %29 = icmp slt i32 %23, %28
  %30 = zext i1 %29 to i32
  %31 = icmp ne i32 %30, 0
  %32 = zext i1 %31 to i32
  br label %land.merge3
land.merge3:
  %33 = phi i32 [0, %while.body.0], [%32, %land.rhs2]
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %if.then0, label %if.merge0
if.then0:
  %35 = load i32, i32* %5, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %5, align 4
  br label %if.merge0
if.merge0:
  %37 = load i32, i32* %3, align 4
  %38 = load i32*, i32** %0, align 8
  %39 = getelementptr inbounds i32, i32* %38, i32 %37
  %40 = load i32, i32* %39, align 4
  %41 = load i32, i32* %5, align 4
  %42 = load i32*, i32** %0, align 8
  %43 = getelementptr inbounds i32, i32* %42, i32 %41
  %44 = load i32, i32* %43, align 4
  %45 = icmp sgt i32 %40, %44
  %46 = zext i1 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %if.then1, label %if.else1
if.then1:
  ret i32 0
if.else1:
  %48 = load i32*, i32** %0, align 8
  %49 = load i32, i32* %3, align 4
  %50 = load i32, i32* %5, align 4
  %51 = call i32 @swap(i32* %48, i32 %49, i32 %50)
  store i32 %51, i32* %3, align 4
  %52 = load i32, i32* %5, align 4
  store i32 %52, i32* %3, align 4
  %53 = load i32, i32* %3, align 4
  %54 = mul i32 %53, 2
  %55 = add i32 %54, 1
  store i32 %55, i32* %5, align 4
  br label %if.merge1
if.merge1:
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @heap_sort(i32* %arg0, i32 %arg1) {
entry4:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = load i32, i32* %1, align 4
  %5 = sdiv i32 %4, 2
  %6 = sub i32 %5, 1
  store i32 %6, i32* %2, align 4
  br label %while.cond.1
while.cond.1:
  %7 = load i32, i32* %2, align 4
  %8 = icmp sgt i32 %7, -1
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %while.body.1, label %while.merge.1
while.body.1:
  %11 = load i32, i32* %1, align 4
  %12 = sub i32 %11, 1
  store i32 %12, i32* %3, align 4
  %13 = load i32*, i32** %0, align 8
  %14 = load i32, i32* %2, align 4
  %15 = load i32, i32* %3, align 4
  %16 = call i32 @heap_ajust(i32* %13, i32 %14, i32 %15)
  store i32 %16, i32* %3, align 4
  %17 = load i32, i32* %2, align 4
  %18 = sub i32 %17, 1
  store i32 %18, i32* %2, align 4
  br label %while.cond.1
while.merge.1:
  %19 = load i32, i32* %1, align 4
  %20 = sub i32 %19, 1
  store i32 %20, i32* %2, align 4
  br label %while.cond.2
while.cond.2:
  %21 = load i32, i32* %2, align 4
  %22 = icmp sgt i32 %21, 0
  %23 = zext i1 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %while.body.2, label %while.merge.2
while.body.2:
  %25 = alloca i32, align 4
  store i32 0, i32* %25, align 4
  %26 = load i32*, i32** %0, align 8
  %27 = load i32, i32* %25, align 4
  %28 = load i32, i32* %2, align 4
  %29 = call i32 @swap(i32* %26, i32 %27, i32 %28)
  store i32 %29, i32* %3, align 4
  %30 = load i32, i32* %2, align 4
  %31 = sub i32 %30, 1
  store i32 %31, i32* %3, align 4
  %32 = load i32*, i32** %0, align 8
  %33 = load i32, i32* %25, align 4
  %34 = load i32, i32* %3, align 4
  %35 = call i32 @heap_ajust(i32* %32, i32 %33, i32 %34)
  store i32 %35, i32* %3, align 4
  %36 = load i32, i32* %2, align 4
  %37 = sub i32 %36, 1
  store i32 %37, i32* %2, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

define i32 @main() {
entry5:
  store i32 10, i32* @n, align 4
  %0 = alloca [10 x i32], align 4
  %1 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  store i32 4, i32* %1, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 1
  store i32 3, i32* %2, align 4
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 2
  store i32 9, i32* %3, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 3
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 4
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 5
  store i32 1, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 6
  store i32 6, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 7
  store i32 5, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 8
  store i32 7, i32* %9, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 9
  store i32 8, i32* %10, align 4
  %11 = alloca i32, align 4
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 0
  %13 = load i32, i32* @n, align 4
  %14 = call i32 @heap_sort(i32* %12, i32 %13)
  store i32 %14, i32* %11, align 4
  br label %while.cond.3
while.cond.3:
  %15 = load i32, i32* %11, align 4
  %16 = load i32, i32* @n, align 4
  %17 = icmp slt i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %while.body.3, label %while.merge.3
while.body.3:
  %20 = alloca i32, align 4
  %21 = load i32, i32* %11, align 4
  %22 = getelementptr inbounds [10 x i32], [10 x i32]* %0, i32 0, i32 %21
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %20, align 4
  %24 = load i32, i32* %20, align 4
  call void @putint(i32 %24)
  store i32 10, i32* %20, align 4
  %25 = load i32, i32* %20, align 4
  call void @putch(i32 %25)
  %26 = load i32, i32* %11, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* %11, align 4
  br label %while.cond.3
while.merge.3:
  ret i32 0
}

