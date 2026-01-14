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

define i32 @counting_sort(i32* %arg0, i32* %arg1, i32 %arg2) {
entry0:
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca [10 x i32], align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32*, align 4
  store i32* %arg1, i32** %1, align 8
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  store i32 0, i32* %alloc_3, align 4
  store i32 0, i32* %alloc_1, align 4
  store i32 0, i32* %alloc_2, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %alloc_3, align 4
  %4 = icmp slt i32 %3, 10
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = load i32, i32* %alloc_3, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %7
  store i32 0, i32* %8, align 4
  %9 = load i32, i32* %alloc_3, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %alloc_3, align 4
  br label %while.cond.0
while.merge.0:
  br label %while.cond.1
while.cond.1:
  %11 = load i32, i32* %alloc_1, align 4
  %12 = load i32, i32* %2, align 4
  %13 = icmp slt i32 %11, %12
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %while.body.1, label %while.merge.1
while.body.1:
  %16 = load i32, i32* %alloc_1, align 4
  %17 = load i32*, i32** %0, align 8
  %18 = getelementptr inbounds i32, i32* %17, i32 %16
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %19
  %21 = load i32, i32* %alloc_1, align 4
  %22 = load i32*, i32** %0, align 8
  %23 = getelementptr inbounds i32, i32* %22, i32 %21
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %24
  %26 = load i32, i32* %25, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* %20, align 4
  %28 = load i32, i32* %alloc_1, align 4
  %29 = add i32 %28, 1
  store i32 %29, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  store i32 1, i32* %alloc_3, align 4
  br label %while.cond.2
while.cond.2:
  %30 = load i32, i32* %alloc_3, align 4
  %31 = icmp slt i32 %30, 10
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %while.body.2, label %while.merge.2
while.body.2:
  %34 = load i32, i32* %alloc_3, align 4
  %35 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %34
  %36 = load i32, i32* %alloc_3, align 4
  %37 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %36
  %38 = load i32, i32* %37, align 4
  %39 = load i32, i32* %alloc_3, align 4
  %40 = sub i32 %39, 1
  %41 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %40
  %42 = load i32, i32* %41, align 4
  %43 = add i32 %38, %42
  store i32 %43, i32* %35, align 4
  %44 = load i32, i32* %alloc_3, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %alloc_3, align 4
  br label %while.cond.2
while.merge.2:
  %46 = load i32, i32* %2, align 4
  store i32 %46, i32* %alloc_2, align 4
  br label %while.cond.3
while.cond.3:
  %47 = load i32, i32* %alloc_2, align 4
  %48 = icmp sgt i32 %47, 0
  %49 = zext i1 %48 to i32
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %while.body.3, label %while.merge.3
while.body.3:
  %51 = load i32, i32* %alloc_2, align 4
  %52 = sub i32 %51, 1
  %53 = load i32*, i32** %0, align 8
  %54 = getelementptr inbounds i32, i32* %53, i32 %52
  %55 = load i32, i32* %54, align 4
  %56 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %55
  %57 = load i32, i32* %alloc_2, align 4
  %58 = sub i32 %57, 1
  %59 = load i32*, i32** %0, align 8
  %60 = getelementptr inbounds i32, i32* %59, i32 %58
  %61 = load i32, i32* %60, align 4
  %62 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %61
  %63 = load i32, i32* %62, align 4
  %64 = sub i32 %63, 1
  store i32 %64, i32* %56, align 4
  %65 = load i32, i32* %alloc_2, align 4
  %66 = sub i32 %65, 1
  %67 = load i32*, i32** %0, align 8
  %68 = getelementptr inbounds i32, i32* %67, i32 %66
  %69 = load i32, i32* %68, align 4
  %70 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_0, i32 0, i32 %69
  %71 = load i32, i32* %70, align 4
  %72 = load i32*, i32** %1, align 8
  %73 = getelementptr inbounds i32, i32* %72, i32 %71
  %74 = load i32, i32* %alloc_2, align 4
  %75 = sub i32 %74, 1
  %76 = load i32*, i32** %0, align 8
  %77 = getelementptr inbounds i32, i32* %76, i32 %75
  %78 = load i32, i32* %77, align 4
  store i32 %78, i32* %73, align 4
  %79 = load i32, i32* %alloc_2, align 4
  %80 = sub i32 %79, 1
  store i32 %80, i32* %alloc_2, align 4
  br label %while.cond.3
while.merge.3:
  ret i32 0
}

define i32 @main() {
entry1:
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca [10 x i32], align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca [10 x i32], align 4
  store i32 10, i32* @n, align 4
  %0 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 0
  store i32 4, i32* %0, align 4
  %1 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 1
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 2
  store i32 9, i32* %2, align 4
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 3
  store i32 2, i32* %3, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 4
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 5
  store i32 1, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 6
  store i32 6, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 7
  store i32 5, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 8
  store i32 7, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 9
  store i32 8, i32* %9, align 4
  store i32 0, i32* %alloc_5, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_4, i32 0, i32 0
  %11 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 0
  %12 = load i32, i32* @n, align 4
  %13 = call i32 @counting_sort(i32* %10, i32* %11, i32 %12)
  store i32 %13, i32* %alloc_5, align 4
  br label %while.cond.4
while.cond.4:
  %14 = load i32, i32* %alloc_5, align 4
  %15 = load i32, i32* @n, align 4
  %16 = icmp slt i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.4, label %while.merge.4
while.body.4:
  %19 = load i32, i32* %alloc_5, align 4
  %20 = getelementptr inbounds [10 x i32], [10 x i32]* %alloc_6, i32 0, i32 %19
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %alloc_7, align 4
  %22 = load i32, i32* %alloc_7, align 4
  call void @putint(i32 %22)
  store i32 10, i32* %alloc_7, align 4
  %23 = load i32, i32* %alloc_7, align 4
  call void @putch(i32 %23)
  %24 = load i32, i32* %alloc_5, align 4
  %25 = add i32 %24, 1
  store i32 %25, i32* %alloc_5, align 4
  br label %while.cond.4
while.merge.4:
  ret i32 0
}

