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
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_0, align 4
  %2 = load i32, i32* @n, align 4
  %3 = sub i32 %2, 1
  %4 = icmp slt i32 %1, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  store i32 0, i32* %alloc_1, align 4
  br label %while.cond.1
while.cond.1:
  %7 = load i32, i32* %alloc_1, align 4
  %8 = load i32, i32* @n, align 4
  %9 = load i32, i32* %alloc_0, align 4
  %10 = sub i32 %8, %9
  %11 = sub i32 %10, 1
  %12 = icmp slt i32 %7, %11
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %while.body.1, label %while.merge.1
while.body.1:
  %15 = load i32, i32* %alloc_1, align 4
  %16 = load i32*, i32** %0, align 8
  %17 = getelementptr inbounds i32, i32* %16, i32 %15
  %18 = load i32, i32* %17, align 4
  %19 = load i32, i32* %alloc_1, align 4
  %20 = add i32 %19, 1
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 %20
  %23 = load i32, i32* %22, align 4
  %24 = icmp sgt i32 %18, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then0, label %if.merge0
if.then0:
  %27 = load i32, i32* %alloc_1, align 4
  %28 = add i32 %27, 1
  %29 = load i32*, i32** %0, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 %28
  %31 = load i32, i32* %30, align 4
  store i32 %31, i32* %alloc_2, align 4
  %32 = load i32, i32* %alloc_1, align 4
  %33 = add i32 %32, 1
  %34 = load i32*, i32** %0, align 8
  %35 = getelementptr inbounds i32, i32* %34, i32 %33
  %36 = load i32, i32* %alloc_1, align 4
  %37 = load i32*, i32** %0, align 8
  %38 = getelementptr inbounds i32, i32* %37, i32 %36
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %35, align 4
  %40 = load i32, i32* %alloc_1, align 4
  %41 = load i32*, i32** %0, align 8
  %42 = getelementptr inbounds i32, i32* %41, i32 %40
  %43 = load i32, i32* %alloc_2, align 4
  store i32 %43, i32* %42, align 4
  br label %if.merge0
if.merge0:
  %44 = load i32, i32* %alloc_1, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  %46 = load i32, i32* %alloc_0, align 4
  %47 = add i32 %46, 1
  store i32 %47, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

define i32 @insertsort(i32* %arg0) {
entry1:
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 1, i32* %alloc_3, align 4
  br label %while.cond.2
while.cond.2:
  %1 = load i32, i32* %alloc_3, align 4
  %2 = load i32, i32* @n, align 4
  %3 = icmp slt i32 %1, %2
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.2, label %while.merge.2
while.body.2:
  %6 = load i32, i32* %alloc_3, align 4
  %7 = load i32*, i32** %0, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 %6
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %alloc_4, align 4
  %10 = load i32, i32* %alloc_3, align 4
  %11 = sub i32 %10, 1
  store i32 %11, i32* %alloc_5, align 4
  br label %while.cond.3
while.cond.3:
  %12 = load i32, i32* %alloc_5, align 4
  %13 = icmp sgt i32 %12, -1
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %land.rhs2, label %land.merge3
land.rhs2:
  %16 = load i32, i32* %alloc_4, align 4
  %17 = load i32, i32* %alloc_5, align 4
  %18 = load i32*, i32** %0, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 %17
  %20 = load i32, i32* %19, align 4
  %21 = icmp slt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  %24 = zext i1 %23 to i32
  br label %land.merge3
land.merge3:
  %25 = phi i32 [0, %while.cond.3], [%24, %land.rhs2]
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %while.body.3, label %while.merge.3
while.body.3:
  %27 = load i32, i32* %alloc_5, align 4
  %28 = add i32 %27, 1
  %29 = load i32*, i32** %0, align 8
  %30 = getelementptr inbounds i32, i32* %29, i32 %28
  %31 = load i32, i32* %alloc_5, align 4
  %32 = load i32*, i32** %0, align 8
  %33 = getelementptr inbounds i32, i32* %32, i32 %31
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %30, align 4
  %35 = load i32, i32* %alloc_5, align 4
  %36 = sub i32 %35, 1
  store i32 %36, i32* %alloc_5, align 4
  br label %while.cond.3
while.merge.3:
  %37 = load i32, i32* %alloc_5, align 4
  %38 = add i32 %37, 1
  %39 = load i32*, i32** %0, align 8
  %40 = getelementptr inbounds i32, i32* %39, i32 %38
  %41 = load i32, i32* %alloc_4, align 4
  store i32 %41, i32* %40, align 4
  %42 = load i32, i32* %alloc_3, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %alloc_3, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

define i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %arg2) {
entry4:
  %alloc_9 = alloca i32, align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
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
  %8 = load i32, i32* %1, align 4
  store i32 %8, i32* %alloc_6, align 4
  %9 = load i32, i32* %2, align 4
  store i32 %9, i32* %alloc_7, align 4
  %10 = load i32, i32* %1, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 %10
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %alloc_8, align 4
  br label %while.cond.4
while.cond.4:
  %14 = load i32, i32* %alloc_6, align 4
  %15 = load i32, i32* %alloc_7, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.4, label %while.merge.4
while.body.4:
  br label %while.cond.5
while.cond.5:
  %19 = load i32, i32* %alloc_6, align 4
  %20 = load i32, i32* %alloc_7, align 4
  %21 = icmp slt i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs5, label %land.merge6
land.rhs5:
  %24 = load i32, i32* %alloc_7, align 4
  %25 = load i32*, i32** %0, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 %24
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* %alloc_8, align 4
  %29 = sub i32 %28, 1
  %30 = icmp sgt i32 %27, %29
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  br label %land.merge6
land.merge6:
  %34 = phi i32 [0, %while.cond.5], [%33, %land.rhs5]
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %while.body.5, label %while.merge.5
while.body.5:
  %36 = load i32, i32* %alloc_7, align 4
  %37 = sub i32 %36, 1
  store i32 %37, i32* %alloc_7, align 4
  br label %while.cond.5
while.merge.5:
  %38 = load i32, i32* %alloc_6, align 4
  %39 = load i32, i32* %alloc_7, align 4
  %40 = icmp slt i32 %38, %39
  %41 = zext i1 %40 to i32
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %if.then2, label %if.merge2
if.then2:
  %43 = load i32, i32* %alloc_6, align 4
  %44 = load i32*, i32** %0, align 8
  %45 = getelementptr inbounds i32, i32* %44, i32 %43
  %46 = load i32, i32* %alloc_7, align 4
  %47 = load i32*, i32** %0, align 8
  %48 = getelementptr inbounds i32, i32* %47, i32 %46
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %45, align 4
  %50 = load i32, i32* %alloc_6, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %alloc_6, align 4
  br label %if.merge2
if.merge2:
  br label %while.cond.6
while.cond.6:
  %52 = load i32, i32* %alloc_6, align 4
  %53 = load i32, i32* %alloc_7, align 4
  %54 = icmp slt i32 %52, %53
  %55 = zext i1 %54 to i32
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %land.rhs7, label %land.merge8
land.rhs7:
  %57 = load i32, i32* %alloc_6, align 4
  %58 = load i32*, i32** %0, align 8
  %59 = getelementptr inbounds i32, i32* %58, i32 %57
  %60 = load i32, i32* %59, align 4
  %61 = load i32, i32* %alloc_8, align 4
  %62 = icmp slt i32 %60, %61
  %63 = zext i1 %62 to i32
  %64 = icmp ne i32 %63, 0
  %65 = zext i1 %64 to i32
  br label %land.merge8
land.merge8:
  %66 = phi i32 [0, %while.cond.6], [%65, %land.rhs7]
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %while.body.6, label %while.merge.6
while.body.6:
  %68 = load i32, i32* %alloc_6, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %alloc_6, align 4
  br label %while.cond.6
while.merge.6:
  %70 = load i32, i32* %alloc_6, align 4
  %71 = load i32, i32* %alloc_7, align 4
  %72 = icmp slt i32 %70, %71
  %73 = zext i1 %72 to i32
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %if.then3, label %if.merge3
if.then3:
  %75 = load i32, i32* %alloc_7, align 4
  %76 = load i32*, i32** %0, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 %75
  %78 = load i32, i32* %alloc_6, align 4
  %79 = load i32*, i32** %0, align 8
  %80 = getelementptr inbounds i32, i32* %79, i32 %78
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %77, align 4
  %82 = load i32, i32* %alloc_7, align 4
  %83 = sub i32 %82, 1
  store i32 %83, i32* %alloc_7, align 4
  br label %if.merge3
if.merge3:
  br label %while.cond.4
while.merge.4:
  %84 = load i32, i32* %alloc_6, align 4
  %85 = load i32*, i32** %0, align 8
  %86 = getelementptr inbounds i32, i32* %85, i32 %84
  %87 = load i32, i32* %alloc_8, align 4
  store i32 %87, i32* %86, align 4
  %88 = load i32, i32* %alloc_6, align 4
  %89 = sub i32 %88, 1
  store i32 %89, i32* %alloc_9, align 4
  %90 = load i32*, i32** %0, align 8
  %91 = load i32, i32* %1, align 4
  %92 = load i32, i32* %alloc_9, align 4
  %93 = call i32 @QuickSort(i32* %90, i32 %91, i32 %92)
  store i32 %93, i32* %alloc_9, align 4
  %94 = load i32, i32* %alloc_6, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %alloc_9, align 4
  %96 = load i32*, i32** %0, align 8
  %97 = load i32, i32* %alloc_9, align 4
  %98 = load i32, i32* %2, align 4
  %99 = call i32 @QuickSort(i32* %96, i32 %97, i32 %98)
  store i32 %99, i32* %alloc_9, align 4
  br label %if.merge1
if.merge1:
  ret i32 0
}

define i32 @getMid(i32* %arg0) {
entry9:
  %alloc_10 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = load i32, i32* @n, align 4
  %2 = srem i32 %1, 2
  %3 = icmp eq i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %if.then4, label %if.else4
if.then4:
  %6 = load i32, i32* @n, align 4
  %7 = sdiv i32 %6, 2
  store i32 %7, i32* %alloc_10, align 4
  %8 = load i32, i32* %alloc_10, align 4
  %9 = load i32*, i32** %0, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %alloc_10, align 4
  %13 = sub i32 %12, 1
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %15, align 4
  %17 = add i32 %11, %16
  %18 = sdiv i32 %17, 2
  ret i32 %18
if.else4:
  %19 = load i32, i32* @n, align 4
  %20 = sdiv i32 %19, 2
  store i32 %20, i32* %alloc_10, align 4
  %21 = load i32, i32* %alloc_10, align 4
  %22 = load i32*, i32** %0, align 8
  %23 = getelementptr inbounds i32, i32* %22, i32 %21
  %24 = load i32, i32* %23, align 4
  ret i32 %24
if.merge4:
  ret i32 0
}

define i32 @getMost(i32* %arg0) {
entry10:
  %alloc_15 = alloca i32, align 4
  %alloc_14 = alloca i32, align 4
  %alloc_13 = alloca i32, align 4
  %alloc_12 = alloca i32, align 4
  %alloc_11 = alloca [1000 x i32], align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_12, align 4
  br label %while.cond.7
while.cond.7:
  %1 = load i32, i32* %alloc_12, align 4
  %2 = icmp slt i32 %1, 1000
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.7, label %while.merge.7
while.body.7:
  %5 = load i32, i32* %alloc_12, align 4
  %6 = getelementptr inbounds [1000 x i32], [1000 x i32]* %alloc_11, i32 0, i32 %5
  store i32 0, i32* %6, align 4
  %7 = load i32, i32* %alloc_12, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* %alloc_12, align 4
  br label %while.cond.7
while.merge.7:
  store i32 0, i32* %alloc_12, align 4
  store i32 0, i32* %alloc_13, align 4
  br label %while.cond.8
while.cond.8:
  %9 = load i32, i32* %alloc_12, align 4
  %10 = load i32, i32* @n, align 4
  %11 = icmp slt i32 %9, %10
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %while.body.8, label %while.merge.8
while.body.8:
  %14 = load i32, i32* %alloc_12, align 4
  %15 = load i32*, i32** %0, align 8
  %16 = getelementptr inbounds i32, i32* %15, i32 %14
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %alloc_15, align 4
  %18 = load i32, i32* %alloc_15, align 4
  %19 = getelementptr inbounds [1000 x i32], [1000 x i32]* %alloc_11, i32 0, i32 %18
  %20 = load i32, i32* %alloc_15, align 4
  %21 = getelementptr inbounds [1000 x i32], [1000 x i32]* %alloc_11, i32 0, i32 %20
  %22 = load i32, i32* %21, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %19, align 4
  %24 = load i32, i32* %alloc_15, align 4
  %25 = getelementptr inbounds [1000 x i32], [1000 x i32]* %alloc_11, i32 0, i32 %24
  %26 = load i32, i32* %25, align 4
  %27 = load i32, i32* %alloc_13, align 4
  %28 = icmp sgt i32 %26, %27
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %if.then5, label %if.merge5
if.then5:
  %31 = load i32, i32* %alloc_15, align 4
  %32 = getelementptr inbounds [1000 x i32], [1000 x i32]* %alloc_11, i32 0, i32 %31
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %alloc_13, align 4
  %34 = load i32, i32* %alloc_15, align 4
  store i32 %34, i32* %alloc_14, align 4
  br label %if.merge5
if.merge5:
  %35 = load i32, i32* %alloc_12, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %alloc_12, align 4
  br label %while.cond.8
while.merge.8:
  %37 = load i32, i32* %alloc_14, align 4
  ret i32 %37
}

define i32 @revert(i32* %arg0) {
entry11:
  %alloc_18 = alloca i32, align 4
  %alloc_17 = alloca i32, align 4
  %alloc_16 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_17, align 4
  store i32 0, i32* %alloc_18, align 4
  br label %while.cond.9
while.cond.9:
  %1 = load i32, i32* %alloc_17, align 4
  %2 = load i32, i32* %alloc_18, align 4
  %3 = icmp slt i32 %1, %2
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.9, label %while.merge.9
while.body.9:
  %6 = load i32, i32* %alloc_17, align 4
  %7 = load i32*, i32** %0, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 %6
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %alloc_16, align 4
  %10 = load i32, i32* %alloc_17, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 %10
  %13 = load i32, i32* %alloc_18, align 4
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %12, align 4
  %17 = load i32, i32* %alloc_18, align 4
  %18 = load i32*, i32** %0, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 %17
  %20 = load i32, i32* %alloc_16, align 4
  store i32 %20, i32* %19, align 4
  %21 = load i32, i32* %alloc_17, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %alloc_17, align 4
  %23 = load i32, i32* %alloc_18, align 4
  %24 = sub i32 %23, 1
  store i32 %24, i32* %alloc_18, align 4
  br label %while.cond.9
while.merge.9:
  ret i32 0
}

define i32 @arrCopy(i32* %arg0, i32* %arg1) {
entry12:
  %alloc_19 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  store i32 0, i32* %alloc_19, align 4
  br label %while.cond.10
while.cond.10:
  %2 = load i32, i32* %alloc_19, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp slt i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.10, label %while.merge.10
while.body.10:
  %7 = load i32, i32* %alloc_19, align 4
  %8 = load i32*, i32** %1, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 %7
  %10 = load i32, i32* %alloc_19, align 4
  %11 = load i32*, i32** %0, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 %10
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %9, align 4
  %14 = load i32, i32* %alloc_19, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* %alloc_19, align 4
  br label %while.cond.10
while.merge.10:
  ret i32 0
}

define i32 @calSum(i32* %arg0, i32 %arg1) {
entry13:
  %alloc_21 = alloca i32, align 4
  %alloc_20 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  store i32 0, i32* %alloc_20, align 4
  store i32 0, i32* %alloc_21, align 4
  br label %while.cond.11
while.cond.11:
  %2 = load i32, i32* %alloc_21, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp slt i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.11, label %while.merge.11
while.body.11:
  %7 = load i32, i32* %alloc_20, align 4
  %8 = load i32, i32* %alloc_21, align 4
  %9 = load i32*, i32** %0, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %10, align 4
  %12 = add i32 %7, %11
  store i32 %12, i32* %alloc_20, align 4
  %13 = load i32, i32* %alloc_21, align 4
  %14 = load i32, i32* %1, align 4
  %15 = srem i32 %13, %14
  %16 = load i32, i32* %1, align 4
  %17 = sub i32 %16, 1
  %18 = icmp ne i32 %15, %17
  %19 = zext i1 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %if.then6, label %if.else6
if.then6:
  %21 = load i32, i32* %alloc_21, align 4
  %22 = load i32*, i32** %0, align 8
  %23 = getelementptr inbounds i32, i32* %22, i32 %21
  store i32 0, i32* %23, align 4
  br label %if.merge6
if.else6:
  %24 = load i32, i32* %alloc_21, align 4
  %25 = load i32*, i32** %0, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 %24
  %27 = load i32, i32* %alloc_20, align 4
  store i32 %27, i32* %26, align 4
  store i32 0, i32* %alloc_20, align 4
  br label %if.merge6
if.merge6:
  %28 = load i32, i32* %alloc_21, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %alloc_21, align 4
  br label %while.cond.11
while.merge.11:
  ret i32 0
}

define i32 @avgPooling(i32* %arg0, i32 %arg1) {
entry14:
  %alloc_24 = alloca i32, align 4
  %alloc_23 = alloca i32, align 4
  %alloc_22 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  store i32 0, i32* %alloc_23, align 4
  store i32 0, i32* %alloc_22, align 4
  br label %while.cond.12
while.cond.12:
  %2 = load i32, i32* %alloc_23, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp slt i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.12, label %while.merge.12
while.body.12:
  %7 = load i32, i32* %alloc_23, align 4
  %8 = load i32, i32* %1, align 4
  %9 = sub i32 %8, 1
  %10 = icmp slt i32 %7, %9
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then7, label %if.else7
if.then7:
  %13 = load i32, i32* %alloc_22, align 4
  %14 = load i32, i32* %alloc_23, align 4
  %15 = load i32*, i32** %0, align 8
  %16 = getelementptr inbounds i32, i32* %15, i32 %14
  %17 = load i32, i32* %16, align 4
  %18 = add i32 %13, %17
  store i32 %18, i32* %alloc_22, align 4
  br label %if.merge7
if.else7:
  %19 = load i32, i32* %alloc_23, align 4
  %20 = load i32, i32* %1, align 4
  %21 = sub i32 %20, 1
  %22 = icmp eq i32 %19, %21
  %23 = zext i1 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %if.then8, label %if.else8
if.then8:
  %25 = load i32*, i32** %0, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 0
  %27 = load i32, i32* %26, align 4
  store i32 %27, i32* %alloc_24, align 4
  %28 = load i32*, i32** %0, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 0
  %30 = load i32, i32* %alloc_22, align 4
  %31 = load i32, i32* %1, align 4
  %32 = sdiv i32 %30, %31
  store i32 %32, i32* %29, align 4
  br label %if.merge8
if.else8:
  %33 = load i32, i32* %alloc_22, align 4
  %34 = load i32, i32* %alloc_23, align 4
  %35 = load i32*, i32** %0, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 %34
  %37 = load i32, i32* %36, align 4
  %38 = add i32 %33, %37
  %39 = load i32, i32* %alloc_24, align 4
  %40 = sub i32 %38, %39
  store i32 %40, i32* %alloc_22, align 4
  %41 = load i32, i32* %alloc_23, align 4
  %42 = load i32, i32* %1, align 4
  %43 = sub i32 %41, %42
  %44 = add i32 %43, 1
  %45 = load i32*, i32** %0, align 8
  %46 = getelementptr inbounds i32, i32* %45, i32 %44
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* %alloc_24, align 4
  %48 = load i32, i32* %alloc_23, align 4
  %49 = load i32, i32* %1, align 4
  %50 = sub i32 %48, %49
  %51 = add i32 %50, 1
  %52 = load i32*, i32** %0, align 8
  %53 = getelementptr inbounds i32, i32* %52, i32 %51
  %54 = load i32, i32* %alloc_22, align 4
  %55 = load i32, i32* %1, align 4
  %56 = sdiv i32 %54, %55
  store i32 %56, i32* %53, align 4
  br label %if.merge8
if.merge8:
  br label %if.merge7
if.merge7:
  %57 = load i32, i32* %alloc_23, align 4
  %58 = add i32 %57, 1
  store i32 %58, i32* %alloc_23, align 4
  br label %while.cond.12
while.merge.12:
  %59 = load i32, i32* @n, align 4
  %60 = load i32, i32* %1, align 4
  %61 = sub i32 %59, %60
  %62 = add i32 %61, 1
  store i32 %62, i32* %alloc_23, align 4
  br label %while.cond.13
while.cond.13:
  %63 = load i32, i32* %alloc_23, align 4
  %64 = load i32, i32* @n, align 4
  %65 = icmp slt i32 %63, %64
  %66 = zext i1 %65 to i32
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %while.body.13, label %while.merge.13
while.body.13:
  %68 = load i32, i32* %alloc_23, align 4
  %69 = load i32*, i32** %0, align 8
  %70 = getelementptr inbounds i32, i32* %69, i32 %68
  store i32 0, i32* %70, align 4
  %71 = load i32, i32* %alloc_23, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %alloc_23, align 4
  br label %while.cond.13
while.merge.13:
  ret i32 0
}

define i32 @main() {
entry15:
  %alloc_28 = alloca i32, align 4
  %alloc_27 = alloca i32, align 4
  %alloc_26 = alloca [32 x i32], align 4
  %alloc_25 = alloca [32 x i32], align 4
  store i32 32, i32* @n, align 4
  %0 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  store i32 7, i32* %0, align 4
  %1 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 1
  store i32 23, i32* %1, align 4
  %2 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 2
  store i32 89, i32* %2, align 4
  %3 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 3
  store i32 26, i32* %3, align 4
  %4 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 4
  store i32 282, i32* %4, align 4
  %5 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 5
  store i32 254, i32* %5, align 4
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 6
  store i32 27, i32* %6, align 4
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 7
  store i32 5, i32* %7, align 4
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 8
  store i32 83, i32* %8, align 4
  %9 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 9
  store i32 273, i32* %9, align 4
  %10 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 10
  store i32 574, i32* %10, align 4
  %11 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 11
  store i32 905, i32* %11, align 4
  %12 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 12
  store i32 354, i32* %12, align 4
  %13 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 13
  store i32 657, i32* %13, align 4
  %14 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 14
  store i32 935, i32* %14, align 4
  %15 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 15
  store i32 264, i32* %15, align 4
  %16 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 16
  store i32 639, i32* %16, align 4
  %17 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 17
  store i32 459, i32* %17, align 4
  %18 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 18
  store i32 29, i32* %18, align 4
  %19 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 19
  store i32 68, i32* %19, align 4
  %20 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 20
  store i32 929, i32* %20, align 4
  %21 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 21
  store i32 756, i32* %21, align 4
  %22 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 22
  store i32 452, i32* %22, align 4
  %23 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 23
  store i32 279, i32* %23, align 4
  %24 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 24
  store i32 58, i32* %24, align 4
  %25 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 25
  store i32 87, i32* %25, align 4
  %26 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 26
  store i32 96, i32* %26, align 4
  %27 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 27
  store i32 36, i32* %27, align 4
  %28 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 28
  store i32 39, i32* %28, align 4
  %29 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 29
  store i32 28, i32* %29, align 4
  %30 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 30
  store i32 1, i32* %30, align 4
  %31 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 31
  store i32 290, i32* %31, align 4
  %32 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  %33 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %34 = call i32 @arrCopy(i32* %32, i32* %33)
  store i32 %34, i32* %alloc_27, align 4
  %35 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %36 = call i32 @revert(i32* %35)
  store i32 %36, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  br label %while.cond.14
while.cond.14:
  %37 = load i32, i32* %alloc_28, align 4
  %38 = icmp slt i32 %37, 32
  %39 = zext i1 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %while.body.14, label %while.merge.14
while.body.14:
  %41 = load i32, i32* %alloc_28, align 4
  %42 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %alloc_27, align 4
  %44 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %44)
  %45 = load i32, i32* %alloc_28, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %alloc_28, align 4
  br label %while.cond.14
while.merge.14:
  %47 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %48 = call i32 @bubblesort(i32* %47)
  store i32 %48, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  br label %while.cond.15
while.cond.15:
  %49 = load i32, i32* %alloc_28, align 4
  %50 = icmp slt i32 %49, 32
  %51 = zext i1 %50 to i32
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %while.body.15, label %while.merge.15
while.body.15:
  %53 = load i32, i32* %alloc_28, align 4
  %54 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %53
  %55 = load i32, i32* %54, align 4
  store i32 %55, i32* %alloc_27, align 4
  %56 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %56)
  %57 = load i32, i32* %alloc_28, align 4
  %58 = add i32 %57, 1
  store i32 %58, i32* %alloc_28, align 4
  br label %while.cond.15
while.merge.15:
  %59 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %60 = call i32 @getMid(i32* %59)
  store i32 %60, i32* %alloc_27, align 4
  %61 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %61)
  %62 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %63 = call i32 @getMost(i32* %62)
  store i32 %63, i32* %alloc_27, align 4
  %64 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %64)
  %65 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  %66 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %67 = call i32 @arrCopy(i32* %65, i32* %66)
  store i32 %67, i32* %alloc_27, align 4
  %68 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %69 = call i32 @bubblesort(i32* %68)
  store i32 %69, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  br label %while.cond.16
while.cond.16:
  %70 = load i32, i32* %alloc_28, align 4
  %71 = icmp slt i32 %70, 32
  %72 = zext i1 %71 to i32
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %while.body.16, label %while.merge.16
while.body.16:
  %74 = load i32, i32* %alloc_28, align 4
  %75 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %74
  %76 = load i32, i32* %75, align 4
  store i32 %76, i32* %alloc_27, align 4
  %77 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %77)
  %78 = load i32, i32* %alloc_28, align 4
  %79 = add i32 %78, 1
  store i32 %79, i32* %alloc_28, align 4
  br label %while.cond.16
while.merge.16:
  %80 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  %81 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %82 = call i32 @arrCopy(i32* %80, i32* %81)
  store i32 %82, i32* %alloc_27, align 4
  %83 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %84 = call i32 @insertsort(i32* %83)
  store i32 %84, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  br label %while.cond.17
while.cond.17:
  %85 = load i32, i32* %alloc_28, align 4
  %86 = icmp slt i32 %85, 32
  %87 = zext i1 %86 to i32
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %while.body.17, label %while.merge.17
while.body.17:
  %89 = load i32, i32* %alloc_28, align 4
  %90 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %89
  %91 = load i32, i32* %90, align 4
  store i32 %91, i32* %alloc_27, align 4
  %92 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %92)
  %93 = load i32, i32* %alloc_28, align 4
  %94 = add i32 %93, 1
  store i32 %94, i32* %alloc_28, align 4
  br label %while.cond.17
while.merge.17:
  %95 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  %96 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %97 = call i32 @arrCopy(i32* %95, i32* %96)
  store i32 %97, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  store i32 31, i32* %alloc_27, align 4
  %98 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %99 = load i32, i32* %alloc_28, align 4
  %100 = load i32, i32* %alloc_27, align 4
  %101 = call i32 @QuickSort(i32* %98, i32 %99, i32 %100)
  store i32 %101, i32* %alloc_27, align 4
  br label %while.cond.18
while.cond.18:
  %102 = load i32, i32* %alloc_28, align 4
  %103 = icmp slt i32 %102, 32
  %104 = zext i1 %103 to i32
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %while.body.18, label %while.merge.18
while.body.18:
  %106 = load i32, i32* %alloc_28, align 4
  %107 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %106
  %108 = load i32, i32* %107, align 4
  store i32 %108, i32* %alloc_27, align 4
  %109 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %109)
  %110 = load i32, i32* %alloc_28, align 4
  %111 = add i32 %110, 1
  store i32 %111, i32* %alloc_28, align 4
  br label %while.cond.18
while.merge.18:
  %112 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  %113 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %114 = call i32 @arrCopy(i32* %112, i32* %113)
  store i32 %114, i32* %alloc_27, align 4
  %115 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %116 = call i32 @calSum(i32* %115, i32 4)
  store i32 %116, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  br label %while.cond.19
while.cond.19:
  %117 = load i32, i32* %alloc_28, align 4
  %118 = icmp slt i32 %117, 32
  %119 = zext i1 %118 to i32
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %while.body.19, label %while.merge.19
while.body.19:
  %121 = load i32, i32* %alloc_28, align 4
  %122 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %121
  %123 = load i32, i32* %122, align 4
  store i32 %123, i32* %alloc_27, align 4
  %124 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %124)
  %125 = load i32, i32* %alloc_28, align 4
  %126 = add i32 %125, 1
  store i32 %126, i32* %alloc_28, align 4
  br label %while.cond.19
while.merge.19:
  %127 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_25, i32 0, i32 0
  %128 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %129 = call i32 @arrCopy(i32* %127, i32* %128)
  store i32 %129, i32* %alloc_27, align 4
  %130 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 0
  %131 = call i32 @avgPooling(i32* %130, i32 3)
  store i32 %131, i32* %alloc_27, align 4
  store i32 0, i32* %alloc_28, align 4
  br label %while.cond.20
while.cond.20:
  %132 = load i32, i32* %alloc_28, align 4
  %133 = icmp slt i32 %132, 32
  %134 = zext i1 %133 to i32
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %while.body.20, label %while.merge.20
while.body.20:
  %136 = load i32, i32* %alloc_28, align 4
  %137 = getelementptr inbounds [32 x i32], [32 x i32]* %alloc_26, i32 0, i32 %136
  %138 = load i32, i32* %137, align 4
  store i32 %138, i32* %alloc_27, align 4
  %139 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %139)
  %140 = load i32, i32* %alloc_28, align 4
  %141 = add i32 %140, 1
  store i32 %141, i32* %alloc_28, align 4
  br label %while.cond.20
while.merge.20:
  ret i32 0
}

