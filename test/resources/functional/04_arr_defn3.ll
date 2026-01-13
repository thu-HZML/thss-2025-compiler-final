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
  %0 = alloca [4 x [2 x i32]], align 4
  %1 = bitcast [4 x [2 x i32]]* %0 to i32*
  %2 = getelementptr inbounds i32, i32* %1, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %1, i32 1
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %1, i32 2
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %1, i32 3
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %1, i32 4
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %1, i32 5
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %1, i32 6
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %1, i32 7
  store i32 0, i32* %9, align 4
  %10 = alloca [4 x [2 x i32]], align 4
  %11 = bitcast [4 x [2 x i32]]* %10 to i32*
  %12 = getelementptr inbounds i32, i32* %11, i32 0
  store i32 1, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %11, i32 1
  store i32 2, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %11, i32 2
  store i32 3, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %11, i32 3
  store i32 4, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %11, i32 4
  store i32 5, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %11, i32 5
  store i32 6, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %11, i32 6
  store i32 7, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %11, i32 7
  store i32 8, i32* %19, align 4
  %20 = alloca [4 x [2 x i32]], align 4
  %21 = bitcast [4 x [2 x i32]]* %20 to i32*
  %22 = getelementptr inbounds i32, i32* %21, i32 0
  store i32 1, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %21, i32 1
  store i32 2, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %21, i32 2
  store i32 3, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %21, i32 3
  store i32 4, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %21, i32 4
  store i32 5, i32* %26, align 4
  %27 = getelementptr inbounds i32, i32* %21, i32 5
  store i32 6, i32* %27, align 4
  %28 = getelementptr inbounds i32, i32* %21, i32 6
  store i32 7, i32* %28, align 4
  %29 = getelementptr inbounds i32, i32* %21, i32 7
  store i32 8, i32* %29, align 4
  %30 = alloca [4 x [2 x i32]], align 4
  %31 = bitcast [4 x [2 x i32]]* %30 to i32*
  %32 = getelementptr inbounds i32, i32* %31, i32 0
  store i32 1, i32* %32, align 4
  %33 = getelementptr inbounds i32, i32* %31, i32 1
  store i32 2, i32* %33, align 4
  %34 = getelementptr inbounds i32, i32* %31, i32 2
  store i32 3, i32* %34, align 4
  %35 = getelementptr inbounds i32, i32* %31, i32 3
  store i32 0, i32* %35, align 4
  %36 = getelementptr inbounds i32, i32* %31, i32 4
  store i32 5, i32* %36, align 4
  %37 = getelementptr inbounds i32, i32* %31, i32 5
  store i32 0, i32* %37, align 4
  %38 = getelementptr inbounds i32, i32* %31, i32 6
  store i32 7, i32* %38, align 4
  %39 = getelementptr inbounds i32, i32* %31, i32 7
  store i32 8, i32* %39, align 4
  %40 = alloca [4 x [2 x i32]], align 4
  %41 = bitcast [4 x [2 x i32]]* %40 to i32*
  %42 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %30, i32 0, i32 2
  %43 = getelementptr inbounds [2 x i32], [2 x i32]* %42, i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = getelementptr inbounds i32, i32* %41, i32 0
  store i32 %44, i32* %45, align 4
  %46 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %20, i32 0, i32 2
  %47 = getelementptr inbounds [2 x i32], [2 x i32]* %46, i32 0, i32 1
  %48 = load i32, i32* %47, align 4
  %49 = getelementptr inbounds i32, i32* %41, i32 1
  store i32 %48, i32* %49, align 4
  %50 = getelementptr inbounds i32, i32* %41, i32 2
  store i32 3, i32* %50, align 4
  %51 = getelementptr inbounds i32, i32* %41, i32 3
  store i32 4, i32* %51, align 4
  %52 = getelementptr inbounds i32, i32* %41, i32 4
  store i32 5, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %41, i32 5
  store i32 6, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %41, i32 6
  store i32 7, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %41, i32 7
  store i32 8, i32* %55, align 4
  %56 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %40, i32 0, i32 3
  %57 = getelementptr inbounds [2 x i32], [2 x i32]* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %40, i32 0, i32 0
  %60 = getelementptr inbounds [2 x i32], [2 x i32]* %59, i32 0, i32 0
  %61 = load i32, i32* %60, align 4
  %62 = add i32 %58, %61
  %63 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %40, i32 0, i32 0
  %64 = getelementptr inbounds [2 x i32], [2 x i32]* %63, i32 0, i32 1
  %65 = load i32, i32* %64, align 4
  %66 = add i32 %62, %65
  %67 = getelementptr inbounds [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 2
  %68 = getelementptr inbounds [2 x i32], [2 x i32]* %67, i32 0, i32 0
  %69 = load i32, i32* %68, align 4
  %70 = add i32 %66, %69
  ret i32 %70
}

