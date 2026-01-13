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

define i32 @bubblesort(i32* %arg0) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* @n, align 4
  %5 = sub i32 %4, 1
  %6 = icmp slt i32 %3, %5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.0, label %while.merge.0
while.body.0:
  store i32 0, i32* %2, align 4
  br label %while.cond.1
while.cond.1:
  %9 = load i32, i32* %2, align 4
  %10 = load i32, i32* @n, align 4
  %11 = load i32, i32* %1, align 4
  %12 = sub i32 %10, %11
  %13 = sub i32 %12, 1
  %14 = icmp slt i32 %9, %13
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %while.body.1, label %while.merge.1
while.body.1:
  %17 = load i32, i32* %2, align 4
  %18 = load i32*, i32** %0, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 %17
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %2, align 4
  %22 = add i32 %21, 1
  %23 = load i32*, i32** %0, align 8
  %24 = getelementptr inbounds i32, i32* %23, i32 %22
  %25 = load i32, i32* %24, align 4
  %26 = icmp sgt i32 %20, %25
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %if.then0, label %if.merge0
if.then0:
  %29 = alloca i32, align 4
  %30 = load i32, i32* %2, align 4
  %31 = add i32 %30, 1
  %32 = load i32*, i32** %0, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 %31
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %29, align 4
  %35 = load i32, i32* %2, align 4
  %36 = add i32 %35, 1
  %37 = load i32*, i32** %0, align 8
  %38 = getelementptr inbounds i32, i32* %37, i32 %36
  %39 = load i32, i32* %2, align 4
  %40 = load i32*, i32** %0, align 8
  %41 = getelementptr inbounds i32, i32* %40, i32 %39
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %38, align 4
  %43 = load i32, i32* %2, align 4
  %44 = load i32*, i32** %0, align 8
  %45 = getelementptr inbounds i32, i32* %44, i32 %43
  %46 = load i32, i32* %29, align 4
  store i32 %46, i32* %45, align 4
  br label %if.merge0
if.merge0:
  %47 = load i32, i32* %2, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %2, align 4
  br label %while.cond.1
while.merge.1:
  %49 = load i32, i32* %1, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @insertsort(i32* %arg0) {
entry1:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  br label %while.cond.2
while.cond.2:
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp slt i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.2, label %while.merge.2
while.body.2:
  %7 = alloca i32, align 4
  %8 = load i32, i32* %1, align 4
  %9 = load i32*, i32** %0, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %7, align 4
  %12 = alloca i32, align 4
  %13 = load i32, i32* %1, align 4
  %14 = sub i32 %13, 1
  store i32 %14, i32* %12, align 4
  br label %while.cond.3
while.cond.3:
  %15 = load i32, i32* %12, align 4
  %16 = icmp sgt i32 %15, -1
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %land.rhs2, label %land.merge3
land.rhs2:
  %19 = load i32, i32* %7, align 4
  %20 = load i32, i32* %12, align 4
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = icmp slt i32 %19, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  %27 = zext i1 %26 to i32
  br label %land.merge3
land.merge3:
  %28 = phi i32 [0, %while.cond.3], [%27, %land.rhs2]
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %while.body.3, label %while.merge.3
while.body.3:
  %30 = load i32, i32* %12, align 4
  %31 = add i32 %30, 1
  %32 = load i32*, i32** %0, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 %31
  %34 = load i32, i32* %12, align 4
  %35 = load i32*, i32** %0, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 %34
  %37 = load i32, i32* %36, align 4
  store i32 %37, i32* %33, align 4
  %38 = load i32, i32* %12, align 4
  %39 = sub i32 %38, 1
  store i32 %39, i32* %12, align 4
  br label %while.cond.3
while.merge.3:
  %40 = load i32, i32* %12, align 4
  %41 = add i32 %40, 1
  %42 = load i32*, i32** %0, align 8
  %43 = getelementptr inbounds i32, i32* %42, i32 %41
  %44 = load i32, i32* %7, align 4
  store i32 %44, i32* %43, align 4
  %45 = load i32, i32* %1, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %1, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

define i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %arg2) {
entry4:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then1, label %if.merge1
if.then1:
  %8 = alloca i32, align 4
  %9 = load i32, i32* %1, align 4
  store i32 %9, i32* %8, align 4
  %10 = alloca i32, align 4
  %11 = load i32, i32* %2, align 4
  store i32 %11, i32* %10, align 4
  %12 = alloca i32, align 4
  %13 = load i32, i32* %1, align 4
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %12, align 4
  br label %while.cond.4
while.cond.4:
  %17 = load i32, i32* %8, align 4
  %18 = load i32, i32* %10, align 4
  %19 = icmp slt i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %while.body.4, label %while.merge.4
while.body.4:
  br label %while.cond.5
while.cond.5:
  %22 = load i32, i32* %8, align 4
  %23 = load i32, i32* %10, align 4
  %24 = icmp slt i32 %22, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %land.rhs5, label %land.merge6
land.rhs5:
  %27 = load i32, i32* %10, align 4
  %28 = load i32*, i32** %0, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 %27
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %12, align 4
  %32 = sub i32 %31, 1
  %33 = icmp sgt i32 %30, %32
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  %36 = zext i1 %35 to i32
  br label %land.merge6
land.merge6:
  %37 = phi i32 [0, %while.cond.5], [%36, %land.rhs5]
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %while.body.5, label %while.merge.5
while.body.5:
  %39 = load i32, i32* %10, align 4
  %40 = sub i32 %39, 1
  store i32 %40, i32* %10, align 4
  br label %while.cond.5
while.merge.5:
  %41 = load i32, i32* %8, align 4
  %42 = load i32, i32* %10, align 4
  %43 = icmp slt i32 %41, %42
  %44 = zext i1 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %if.then2, label %if.merge2
if.then2:
  %46 = load i32, i32* %8, align 4
  %47 = load i32*, i32** %0, align 8
  %48 = getelementptr inbounds i32, i32* %47, i32 %46
  %49 = load i32, i32* %10, align 4
  %50 = load i32*, i32** %0, align 8
  %51 = getelementptr inbounds i32, i32* %50, i32 %49
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %48, align 4
  %53 = load i32, i32* %8, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %8, align 4
  br label %if.merge2
if.merge2:
  br label %while.cond.6
while.cond.6:
  %55 = load i32, i32* %8, align 4
  %56 = load i32, i32* %10, align 4
  %57 = icmp slt i32 %55, %56
  %58 = zext i1 %57 to i32
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %land.rhs7, label %land.merge8
land.rhs7:
  %60 = load i32, i32* %8, align 4
  %61 = load i32*, i32** %0, align 8
  %62 = getelementptr inbounds i32, i32* %61, i32 %60
  %63 = load i32, i32* %62, align 4
  %64 = load i32, i32* %12, align 4
  %65 = icmp slt i32 %63, %64
  %66 = zext i1 %65 to i32
  %67 = icmp ne i32 %66, 0
  %68 = zext i1 %67 to i32
  br label %land.merge8
land.merge8:
  %69 = phi i32 [0, %while.cond.6], [%68, %land.rhs7]
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %while.body.6, label %while.merge.6
while.body.6:
  %71 = load i32, i32* %8, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %8, align 4
  br label %while.cond.6
while.merge.6:
  %73 = load i32, i32* %8, align 4
  %74 = load i32, i32* %10, align 4
  %75 = icmp slt i32 %73, %74
  %76 = zext i1 %75 to i32
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %if.then3, label %if.merge3
if.then3:
  %78 = load i32, i32* %10, align 4
  %79 = load i32*, i32** %0, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 %78
  %81 = load i32, i32* %8, align 4
  %82 = load i32*, i32** %0, align 8
  %83 = getelementptr inbounds i32, i32* %82, i32 %81
  %84 = load i32, i32* %83, align 4
  store i32 %84, i32* %80, align 4
  %85 = load i32, i32* %10, align 4
  %86 = sub i32 %85, 1
  store i32 %86, i32* %10, align 4
  br label %if.merge3
if.merge3:
  br label %while.cond.4
while.merge.4:
  %87 = load i32, i32* %8, align 4
  %88 = load i32*, i32** %0, align 8
  %89 = getelementptr inbounds i32, i32* %88, i32 %87
  %90 = load i32, i32* %12, align 4
  store i32 %90, i32* %89, align 4
  %91 = alloca i32, align 4
  %92 = load i32, i32* %8, align 4
  %93 = sub i32 %92, 1
  store i32 %93, i32* %91, align 4
  %94 = load i32*, i32** %0, align 8
  %95 = load i32, i32* %1, align 4
  %96 = load i32, i32* %91, align 4
  %97 = call i32 @QuickSort(i32* %94, i32 %95, i32 %96)
  store i32 %97, i32* %91, align 4
  %98 = load i32, i32* %8, align 4
  %99 = add i32 %98, 1
  store i32 %99, i32* %91, align 4
  %100 = load i32*, i32** %0, align 8
  %101 = load i32, i32* %91, align 4
  %102 = load i32, i32* %2, align 4
  %103 = call i32 @QuickSort(i32* %100, i32 %101, i32 %102)
  store i32 %103, i32* %91, align 4
  br label %if.merge1
if.merge1:
  ret i32 0
}

define i32 @getMid(i32* %arg0) {
entry9:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  %2 = load i32, i32* @n, align 4
  %3 = srem i32 %2, 2
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %if.then4, label %if.else4
if.then4:
  %7 = load i32, i32* @n, align 4
  %8 = sdiv i32 %7, 2
  store i32 %8, i32* %1, align 4
  %9 = load i32, i32* %1, align 4
  %10 = load i32*, i32** %0, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 %9
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %1, align 4
  %14 = sub i32 %13, 1
  %15 = load i32*, i32** %0, align 8
  %16 = getelementptr inbounds i32, i32* %15, i32 %14
  %17 = load i32, i32* %16, align 4
  %18 = add i32 %12, %17
  %19 = sdiv i32 %18, 2
  ret i32 %19
if.else4:
  %20 = load i32, i32* @n, align 4
  %21 = sdiv i32 %20, 2
  store i32 %21, i32* %1, align 4
  %22 = load i32, i32* %1, align 4
  %23 = load i32*, i32** %0, align 8
  %24 = getelementptr inbounds i32, i32* %23, i32 %22
  %25 = load i32, i32* %24, align 4
  ret i32 %25
if.merge4:
  ret i32 0
}

define i32 @getMost(i32* %arg0) {
entry10:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca [1000 x i32], align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.7
while.cond.7:
  %3 = load i32, i32* %2, align 4
  %4 = icmp slt i32 %3, 1000
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.7, label %while.merge.7
while.body.7:
  %7 = load i32, i32* %2, align 4
  %8 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i32 0, i32 %7
  store i32 0, i32* %8, align 4
  %9 = load i32, i32* %2, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %2, align 4
  br label %while.cond.7
while.merge.7:
  store i32 0, i32* %2, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, i32* %11, align 4
  br label %while.cond.8
while.cond.8:
  %13 = load i32, i32* %2, align 4
  %14 = load i32, i32* @n, align 4
  %15 = icmp slt i32 %13, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %while.body.8, label %while.merge.8
while.body.8:
  %18 = alloca i32, align 4
  %19 = load i32, i32* %2, align 4
  %20 = load i32*, i32** %0, align 8
  %21 = getelementptr inbounds i32, i32* %20, i32 %19
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %18, align 4
  %23 = load i32, i32* %18, align 4
  %24 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i32 0, i32 %23
  %25 = load i32, i32* %18, align 4
  %26 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i32 0, i32 %25
  %27 = load i32, i32* %26, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %24, align 4
  %29 = load i32, i32* %18, align 4
  %30 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i32 0, i32 %29
  %31 = load i32, i32* %30, align 4
  %32 = load i32, i32* %11, align 4
  %33 = icmp sgt i32 %31, %32
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %if.then5, label %if.merge5
if.then5:
  %36 = load i32, i32* %18, align 4
  %37 = getelementptr inbounds [1000 x i32], [1000 x i32]* %1, i32 0, i32 %36
  %38 = load i32, i32* %37, align 4
  store i32 %38, i32* %11, align 4
  %39 = load i32, i32* %18, align 4
  store i32 %39, i32* %12, align 4
  br label %if.merge5
if.merge5:
  %40 = load i32, i32* %2, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* %2, align 4
  br label %while.cond.8
while.merge.8:
  %42 = load i32, i32* %12, align 4
  ret i32 %42
}

define i32 @revert(i32* %arg0) {
entry11:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  br label %while.cond.9
while.cond.9:
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp slt i32 %4, %5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.9, label %while.merge.9
while.body.9:
  %9 = load i32, i32* %2, align 4
  %10 = load i32*, i32** %0, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 %9
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %1, align 4
  %13 = load i32, i32* %2, align 4
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %3, align 4
  %17 = load i32*, i32** %0, align 8
  %18 = getelementptr inbounds i32, i32* %17, i32 %16
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %15, align 4
  %20 = load i32, i32* %3, align 4
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %1, align 4
  store i32 %23, i32* %22, align 4
  %24 = load i32, i32* %2, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %2, align 4
  %26 = load i32, i32* %3, align 4
  %27 = sub i32 %26, 1
  store i32 %27, i32* %3, align 4
  br label %while.cond.9
while.merge.9:
  ret i32 0
}

define i32 @arrCopy(i32* %arg0, i32* %arg1) {
entry12:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.10
while.cond.10:
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* @n, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.10, label %while.merge.10
while.body.10:
  %8 = load i32, i32* %2, align 4
  %9 = load i32*, i32** %1, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %2, align 4
  %12 = load i32*, i32** %0, align 8
  %13 = getelementptr inbounds i32, i32* %12, i32 %11
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %10, align 4
  %15 = load i32, i32* %2, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %2, align 4
  br label %while.cond.10
while.merge.10:
  ret i32 0
}

define i32 @calSum(i32* %arg0, i32 %arg1) {
entry13:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %while.cond.11
while.cond.11:
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* @n, align 4
  %6 = icmp slt i32 %4, %5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.11, label %while.merge.11
while.body.11:
  %9 = load i32, i32* %2, align 4
  %10 = load i32, i32* %3, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 %10
  %13 = load i32, i32* %12, align 4
  %14 = add i32 %9, %13
  store i32 %14, i32* %2, align 4
  %15 = load i32, i32* %3, align 4
  %16 = load i32, i32* %1, align 4
  %17 = srem i32 %15, %16
  %18 = load i32, i32* %1, align 4
  %19 = sub i32 %18, 1
  %20 = icmp ne i32 %17, %19
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %if.then6, label %if.else6
if.then6:
  %23 = load i32, i32* %3, align 4
  %24 = load i32*, i32** %0, align 8
  %25 = getelementptr inbounds i32, i32* %24, i32 %23
  store i32 0, i32* %25, align 4
  br label %if.merge6
if.else6:
  %26 = load i32, i32* %3, align 4
  %27 = load i32*, i32** %0, align 8
  %28 = getelementptr inbounds i32, i32* %27, i32 %26
  %29 = load i32, i32* %2, align 4
  store i32 %29, i32* %28, align 4
  store i32 0, i32* %2, align 4
  br label %if.merge6
if.merge6:
  %30 = load i32, i32* %3, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %3, align 4
  br label %while.cond.11
while.merge.11:
  ret i32 0
}

define i32 @avgPooling(i32* %arg0, i32 %arg1) {
entry14:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %2, align 4
  %4 = alloca i32, align 4
  br label %while.cond.12
while.cond.12:
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* @n, align 4
  %7 = icmp slt i32 %5, %6
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %while.body.12, label %while.merge.12
while.body.12:
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %1, align 4
  %12 = sub i32 %11, 1
  %13 = icmp slt i32 %10, %12
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %if.then7, label %if.else7
if.then7:
  %16 = load i32, i32* %2, align 4
  %17 = load i32, i32* %3, align 4
  %18 = load i32*, i32** %0, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 %17
  %20 = load i32, i32* %19, align 4
  %21 = add i32 %16, %20
  store i32 %21, i32* %2, align 4
  br label %if.merge7
if.else7:
  %22 = load i32, i32* %3, align 4
  %23 = load i32, i32* %1, align 4
  %24 = sub i32 %23, 1
  %25 = icmp eq i32 %22, %24
  %26 = zext i1 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %if.then8, label %if.else8
if.then8:
  %28 = load i32*, i32** %0, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 0
  %30 = load i32, i32* %29, align 4
  store i32 %30, i32* %4, align 4
  %31 = load i32*, i32** %0, align 8
  %32 = getelementptr inbounds i32, i32* %31, i32 0
  %33 = load i32, i32* %2, align 4
  %34 = load i32, i32* %1, align 4
  %35 = sdiv i32 %33, %34
  store i32 %35, i32* %32, align 4
  br label %if.merge8
if.else8:
  %36 = load i32, i32* %2, align 4
  %37 = load i32, i32* %3, align 4
  %38 = load i32*, i32** %0, align 8
  %39 = getelementptr inbounds i32, i32* %38, i32 %37
  %40 = load i32, i32* %39, align 4
  %41 = add i32 %36, %40
  %42 = load i32, i32* %4, align 4
  %43 = sub i32 %41, %42
  store i32 %43, i32* %2, align 4
  %44 = load i32, i32* %3, align 4
  %45 = load i32, i32* %1, align 4
  %46 = sub i32 %44, %45
  %47 = add i32 %46, 1
  %48 = load i32*, i32** %0, align 8
  %49 = getelementptr inbounds i32, i32* %48, i32 %47
  %50 = load i32, i32* %49, align 4
  store i32 %50, i32* %4, align 4
  %51 = load i32, i32* %3, align 4
  %52 = load i32, i32* %1, align 4
  %53 = sub i32 %51, %52
  %54 = add i32 %53, 1
  %55 = load i32*, i32** %0, align 8
  %56 = getelementptr inbounds i32, i32* %55, i32 %54
  %57 = load i32, i32* %2, align 4
  %58 = load i32, i32* %1, align 4
  %59 = sdiv i32 %57, %58
  store i32 %59, i32* %56, align 4
  br label %if.merge8
if.merge8:
  br label %if.merge7
if.merge7:
  %60 = load i32, i32* %3, align 4
  %61 = add i32 %60, 1
  store i32 %61, i32* %3, align 4
  br label %while.cond.12
while.merge.12:
  %62 = load i32, i32* @n, align 4
  %63 = load i32, i32* %1, align 4
  %64 = sub i32 %62, %63
  %65 = add i32 %64, 1
  store i32 %65, i32* %3, align 4
  br label %while.cond.13
while.cond.13:
  %66 = load i32, i32* %3, align 4
  %67 = load i32, i32* @n, align 4
  %68 = icmp slt i32 %66, %67
  %69 = zext i1 %68 to i32
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %while.body.13, label %while.merge.13
while.body.13:
  %71 = load i32, i32* %3, align 4
  %72 = load i32*, i32** %0, align 8
  %73 = getelementptr inbounds i32, i32* %72, i32 %71
  store i32 0, i32* %73, align 4
  %74 = load i32, i32* %3, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %3, align 4
  br label %while.cond.13
while.merge.13:
  ret i32 0
}

define i32 @main() {
entry15:
  store i32 32, i32* @n, align 4
  %0 = alloca [32 x i32], align 4
  %1 = alloca [32 x i32], align 4
  %2 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  store i32 7, i32* %2, align 4
  %3 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 1
  store i32 23, i32* %3, align 4
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 2
  store i32 89, i32* %4, align 4
  %5 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 3
  store i32 26, i32* %5, align 4
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 4
  store i32 282, i32* %6, align 4
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 5
  store i32 254, i32* %7, align 4
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 6
  store i32 27, i32* %8, align 4
  %9 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 7
  store i32 5, i32* %9, align 4
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 8
  store i32 83, i32* %10, align 4
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 9
  store i32 273, i32* %11, align 4
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 10
  store i32 574, i32* %12, align 4
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 11
  store i32 905, i32* %13, align 4
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 12
  store i32 354, i32* %14, align 4
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 13
  store i32 657, i32* %15, align 4
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 14
  store i32 935, i32* %16, align 4
  %17 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 15
  store i32 264, i32* %17, align 4
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 16
  store i32 639, i32* %18, align 4
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 17
  store i32 459, i32* %19, align 4
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 18
  store i32 29, i32* %20, align 4
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 19
  store i32 68, i32* %21, align 4
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 20
  store i32 929, i32* %22, align 4
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 21
  store i32 756, i32* %23, align 4
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 22
  store i32 452, i32* %24, align 4
  %25 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 23
  store i32 279, i32* %25, align 4
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 24
  store i32 58, i32* %26, align 4
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 25
  store i32 87, i32* %27, align 4
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 26
  store i32 96, i32* %28, align 4
  %29 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 27
  store i32 36, i32* %29, align 4
  %30 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 28
  store i32 39, i32* %30, align 4
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 29
  store i32 28, i32* %31, align 4
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 30
  store i32 1, i32* %32, align 4
  %33 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 31
  store i32 290, i32* %33, align 4
  %34 = alloca i32, align 4
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  %36 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %37 = call i32 @arrCopy(i32* %35, i32* %36)
  store i32 %37, i32* %34, align 4
  %38 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %39 = call i32 @revert(i32* %38)
  store i32 %39, i32* %34, align 4
  %40 = alloca i32, align 4
  store i32 0, i32* %40, align 4
  br label %while.cond.14
while.cond.14:
  %41 = load i32, i32* %40, align 4
  %42 = icmp slt i32 %41, 32
  %43 = zext i1 %42 to i32
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %while.body.14, label %while.merge.14
while.body.14:
  %45 = load i32, i32* %40, align 4
  %46 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %45
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* %34, align 4
  %48 = load i32, i32* %34, align 4
  call void @putint(i32 %48)
  %49 = load i32, i32* %40, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %40, align 4
  br label %while.cond.14
while.merge.14:
  %51 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %52 = call i32 @bubblesort(i32* %51)
  store i32 %52, i32* %34, align 4
  store i32 0, i32* %40, align 4
  br label %while.cond.15
while.cond.15:
  %53 = load i32, i32* %40, align 4
  %54 = icmp slt i32 %53, 32
  %55 = zext i1 %54 to i32
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %while.body.15, label %while.merge.15
while.body.15:
  %57 = load i32, i32* %40, align 4
  %58 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %57
  %59 = load i32, i32* %58, align 4
  store i32 %59, i32* %34, align 4
  %60 = load i32, i32* %34, align 4
  call void @putint(i32 %60)
  %61 = load i32, i32* %40, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %40, align 4
  br label %while.cond.15
while.merge.15:
  %63 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %64 = call i32 @getMid(i32* %63)
  store i32 %64, i32* %34, align 4
  %65 = load i32, i32* %34, align 4
  call void @putint(i32 %65)
  %66 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %67 = call i32 @getMost(i32* %66)
  store i32 %67, i32* %34, align 4
  %68 = load i32, i32* %34, align 4
  call void @putint(i32 %68)
  %69 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  %70 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %71 = call i32 @arrCopy(i32* %69, i32* %70)
  store i32 %71, i32* %34, align 4
  %72 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %73 = call i32 @bubblesort(i32* %72)
  store i32 %73, i32* %34, align 4
  store i32 0, i32* %40, align 4
  br label %while.cond.16
while.cond.16:
  %74 = load i32, i32* %40, align 4
  %75 = icmp slt i32 %74, 32
  %76 = zext i1 %75 to i32
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %while.body.16, label %while.merge.16
while.body.16:
  %78 = load i32, i32* %40, align 4
  %79 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %78
  %80 = load i32, i32* %79, align 4
  store i32 %80, i32* %34, align 4
  %81 = load i32, i32* %34, align 4
  call void @putint(i32 %81)
  %82 = load i32, i32* %40, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %40, align 4
  br label %while.cond.16
while.merge.16:
  %84 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  %85 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %86 = call i32 @arrCopy(i32* %84, i32* %85)
  store i32 %86, i32* %34, align 4
  %87 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %88 = call i32 @insertsort(i32* %87)
  store i32 %88, i32* %34, align 4
  store i32 0, i32* %40, align 4
  br label %while.cond.17
while.cond.17:
  %89 = load i32, i32* %40, align 4
  %90 = icmp slt i32 %89, 32
  %91 = zext i1 %90 to i32
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %while.body.17, label %while.merge.17
while.body.17:
  %93 = load i32, i32* %40, align 4
  %94 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %93
  %95 = load i32, i32* %94, align 4
  store i32 %95, i32* %34, align 4
  %96 = load i32, i32* %34, align 4
  call void @putint(i32 %96)
  %97 = load i32, i32* %40, align 4
  %98 = add i32 %97, 1
  store i32 %98, i32* %40, align 4
  br label %while.cond.17
while.merge.17:
  %99 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  %100 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %101 = call i32 @arrCopy(i32* %99, i32* %100)
  store i32 %101, i32* %34, align 4
  store i32 0, i32* %40, align 4
  store i32 31, i32* %34, align 4
  %102 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %103 = load i32, i32* %40, align 4
  %104 = load i32, i32* %34, align 4
  %105 = call i32 @QuickSort(i32* %102, i32 %103, i32 %104)
  store i32 %105, i32* %34, align 4
  br label %while.cond.18
while.cond.18:
  %106 = load i32, i32* %40, align 4
  %107 = icmp slt i32 %106, 32
  %108 = zext i1 %107 to i32
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %while.body.18, label %while.merge.18
while.body.18:
  %110 = load i32, i32* %40, align 4
  %111 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %110
  %112 = load i32, i32* %111, align 4
  store i32 %112, i32* %34, align 4
  %113 = load i32, i32* %34, align 4
  call void @putint(i32 %113)
  %114 = load i32, i32* %40, align 4
  %115 = add i32 %114, 1
  store i32 %115, i32* %40, align 4
  br label %while.cond.18
while.merge.18:
  %116 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  %117 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %118 = call i32 @arrCopy(i32* %116, i32* %117)
  store i32 %118, i32* %34, align 4
  %119 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %120 = call i32 @calSum(i32* %119, i32 4)
  store i32 %120, i32* %34, align 4
  store i32 0, i32* %40, align 4
  br label %while.cond.19
while.cond.19:
  %121 = load i32, i32* %40, align 4
  %122 = icmp slt i32 %121, 32
  %123 = zext i1 %122 to i32
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %while.body.19, label %while.merge.19
while.body.19:
  %125 = load i32, i32* %40, align 4
  %126 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %125
  %127 = load i32, i32* %126, align 4
  store i32 %127, i32* %34, align 4
  %128 = load i32, i32* %34, align 4
  call void @putint(i32 %128)
  %129 = load i32, i32* %40, align 4
  %130 = add i32 %129, 1
  store i32 %130, i32* %40, align 4
  br label %while.cond.19
while.merge.19:
  %131 = getelementptr inbounds [32 x i32], [32 x i32]* %0, i32 0, i32 0
  %132 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %133 = call i32 @arrCopy(i32* %131, i32* %132)
  store i32 %133, i32* %34, align 4
  %134 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 0
  %135 = call i32 @avgPooling(i32* %134, i32 3)
  store i32 %135, i32* %34, align 4
  store i32 0, i32* %40, align 4
  br label %while.cond.20
while.cond.20:
  %136 = load i32, i32* %40, align 4
  %137 = icmp slt i32 %136, 32
  %138 = zext i1 %137 to i32
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %while.body.20, label %while.merge.20
while.body.20:
  %140 = load i32, i32* %40, align 4
  %141 = getelementptr inbounds [32 x i32], [32 x i32]* %1, i32 0, i32 %140
  %142 = load i32, i32* %141, align 4
  store i32 %142, i32* %34, align 4
  %143 = load i32, i32* %34, align 4
  call void @putint(i32 %143)
  %144 = load i32, i32* %40, align 4
  %145 = add i32 %144, 1
  store i32 %145, i32* %40, align 4
  br label %while.cond.20
while.merge.20:
  ret i32 0
}

