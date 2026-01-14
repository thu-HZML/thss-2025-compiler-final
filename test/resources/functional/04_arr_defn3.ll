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


define i32 @main() {
entry0:
  %alloc_4 = alloca [4 x [2 x i32]], align 4
  %alloc_3 = alloca [4 x [2 x i32]], align 4
  %alloc_2 = alloca [4 x [2 x i32]], align 4
  %alloc_1 = alloca [4 x [2 x i32]], align 4
  %alloc_0 = alloca [4 x [2 x i32]], align 4
  %0 = bitcast [4 x [2 x i32]]* %alloc_0 to i32*
  %1 = getelementptr inbounds i32, i32* %0, i32 0
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds i32, i32* %0, i32 1
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %0, i32 2
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %0, i32 3
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %0, i32 4
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %0, i32 5
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %0, i32 6
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %0, i32 7
  store i32 0, i32* %8, align 4
  %9 = bitcast [4 x [2 x i32]]* %alloc_1 to i32*
  %10 = getelementptr inbounds i32, i32* %9, i32 0
  store i32 1, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %9, i32 1
  store i32 2, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %9, i32 2
  store i32 3, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %9, i32 3
  store i32 4, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %9, i32 4
  store i32 5, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %9, i32 5
  store i32 6, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %9, i32 6
  store i32 7, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %9, i32 7
  store i32 8, i32* %17, align 4
  %18 = bitcast [4 x [2 x i32]]* %alloc_2 to i32*
  %19 = getelementptr inbounds i32, i32* %18, i32 0
  store i32 1, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %18, i32 1
  store i32 2, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %18, i32 2
  store i32 3, i32* %21, align 4
  %22 = getelementptr inbounds i32, i32* %18, i32 3
  store i32 4, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %18, i32 4
  store i32 5, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %18, i32 5
  store i32 6, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %18, i32 6
  store i32 7, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %18, i32 7
  store i32 8, i32* %26, align 4
  %27 = bitcast [4 x [2 x i32]]* %alloc_3 to i32*
  %28 = getelementptr inbounds i32, i32* %27, i32 0
  store i32 1, i32* %28, align 4
  %29 = getelementptr inbounds i32, i32* %27, i32 1
  store i32 2, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %27, i32 2
  store i32 3, i32* %30, align 4
  %31 = getelementptr inbounds i32, i32* %27, i32 3
  store i32 0, i32* %31, align 4
  %32 = getelementptr inbounds i32, i32* %27, i32 4
  store i32 5, i32* %32, align 4
  %33 = getelementptr inbounds i32, i32* %27, i32 5
  store i32 0, i32* %33, align 4
  %34 = getelementptr inbounds i32, i32* %27, i32 6
  store i32 7, i32* %34, align 4
  %35 = getelementptr inbounds i32, i32* %27, i32 7
  store i32 8, i32* %35, align 4
  %36 = bitcast [4 x [2 x i32]]* %alloc_4 to i32*
  %37 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %alloc_3, i32 0, i32 2
  %38 = getelementptr inbounds [2 x i32], [2 x i32]* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = getelementptr inbounds i32, i32* %36, i32 0
  store i32 %39, i32* %40, align 4
  %41 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %alloc_2, i32 0, i32 2
  %42 = getelementptr inbounds [2 x i32], [2 x i32]* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds i32, i32* %36, i32 1
  store i32 %43, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %36, i32 2
  store i32 3, i32* %45, align 4
  %46 = getelementptr inbounds i32, i32* %36, i32 3
  store i32 4, i32* %46, align 4
  %47 = getelementptr inbounds i32, i32* %36, i32 4
  store i32 5, i32* %47, align 4
  %48 = getelementptr inbounds i32, i32* %36, i32 5
  store i32 6, i32* %48, align 4
  %49 = getelementptr inbounds i32, i32* %36, i32 6
  store i32 7, i32* %49, align 4
  %50 = getelementptr inbounds i32, i32* %36, i32 7
  store i32 8, i32* %50, align 4
  %51 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %alloc_4, i32 0, i32 3
  %52 = getelementptr inbounds [2 x i32], [2 x i32]* %51, i32 0, i32 1
  %53 = load i32, i32* %52, align 4
  %54 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %alloc_4, i32 0, i32 0
  %55 = getelementptr inbounds [2 x i32], [2 x i32]* %54, i32 0, i32 0
  %56 = load i32, i32* %55, align 4
  %57 = add i32 %53, %56
  %58 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %alloc_4, i32 0, i32 0
  %59 = getelementptr inbounds [2 x i32], [2 x i32]* %58, i32 0, i32 1
  %60 = load i32, i32* %59, align 4
  %61 = add i32 %57, %60
  %62 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %alloc_0, i32 0, i32 2
  %63 = getelementptr inbounds [2 x i32], [2 x i32]* %62, i32 0, i32 0
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %61, %64
  ret i32 %65
}

