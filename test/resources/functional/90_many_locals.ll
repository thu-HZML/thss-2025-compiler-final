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


define i32 @foo() {
entry0:
  %0 = alloca [16 x i32], align 4
  %1 = bitcast [16 x i32]* %0 to i32*
  %2 = getelementptr inbounds i32, i32* %1, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %1, i32 1
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %1, i32 2
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %1, i32 3
  store i32 3, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %1, i32 4
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %1, i32 5
  store i32 1, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %1, i32 6
  store i32 2, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %1, i32 7
  store i32 3, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %1, i32 8
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %1, i32 9
  store i32 1, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %1, i32 10
  store i32 2, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %1, i32 11
  store i32 3, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %1, i32 12
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %1, i32 13
  store i32 1, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %1, i32 14
  store i32 2, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %1, i32 15
  store i32 3, i32* %17, align 4
  %18 = alloca i32, align 4
  store i32 3, i32* %18, align 4
  %19 = alloca i32, align 4
  store i32 7, i32* %19, align 4
  %20 = alloca i32, align 4
  store i32 5, i32* %20, align 4
  %21 = alloca i32, align 4
  store i32 6, i32* %21, align 4
  %22 = alloca i32, align 4
  store i32 1, i32* %22, align 4
  %23 = alloca i32, align 4
  store i32 0, i32* %23, align 4
  %24 = alloca i32, align 4
  store i32 3, i32* %24, align 4
  %25 = alloca i32, align 4
  store i32 5, i32* %25, align 4
  %26 = alloca i32, align 4
  store i32 4, i32* %26, align 4
  %27 = alloca i32, align 4
  store i32 2, i32* %27, align 4
  %28 = alloca i32, align 4
  store i32 7, i32* %28, align 4
  %29 = alloca i32, align 4
  store i32 9, i32* %29, align 4
  %30 = alloca i32, align 4
  store i32 8, i32* %30, align 4
  %31 = alloca i32, align 4
  store i32 1, i32* %31, align 4
  %32 = alloca i32, align 4
  store i32 4, i32* %32, align 4
  %33 = alloca i32, align 4
  store i32 6, i32* %33, align 4
  %34 = alloca i32, align 4
  %35 = load i32, i32* %18, align 4
  %36 = load i32, i32* %19, align 4
  %37 = add i32 %35, %36
  %38 = load i32, i32* %20, align 4
  %39 = add i32 %37, %38
  %40 = load i32, i32* %21, align 4
  %41 = add i32 %39, %40
  %42 = load i32, i32* %22, align 4
  %43 = add i32 %41, %42
  %44 = load i32, i32* %23, align 4
  %45 = add i32 %43, %44
  %46 = load i32, i32* %24, align 4
  %47 = add i32 %45, %46
  %48 = load i32, i32* %25, align 4
  %49 = add i32 %47, %48
  store i32 %49, i32* %34, align 4
  %50 = alloca i32, align 4
  %51 = load i32, i32* %26, align 4
  %52 = load i32, i32* %27, align 4
  %53 = add i32 %51, %52
  %54 = load i32, i32* %28, align 4
  %55 = add i32 %53, %54
  %56 = load i32, i32* %29, align 4
  %57 = add i32 %55, %56
  %58 = load i32, i32* %30, align 4
  %59 = add i32 %57, %58
  %60 = load i32, i32* %31, align 4
  %61 = add i32 %59, %60
  %62 = load i32, i32* %32, align 4
  %63 = add i32 %61, %62
  %64 = load i32, i32* %33, align 4
  %65 = add i32 %63, %64
  store i32 %65, i32* %50, align 4
  %66 = load i32, i32* %34, align 4
  %67 = load i32, i32* %50, align 4
  %68 = add i32 %66, %67
  %69 = load i32, i32* %18, align 4
  %70 = getelementptr inbounds [16 x i32], [16 x i32]* %0, i32 0, i32 %69
  %71 = load i32, i32* %70, align 4
  %72 = add i32 %68, %71
  ret i32 %72
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  store i32 3, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 7, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 5, i32* %2, align 4
  %3 = alloca i32, align 4
  store i32 6, i32* %3, align 4
  %4 = alloca i32, align 4
  store i32 1, i32* %4, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  %6 = alloca i32, align 4
  store i32 3, i32* %6, align 4
  %7 = alloca i32, align 4
  store i32 5, i32* %7, align 4
  %8 = alloca i32, align 4
  store i32 4, i32* %8, align 4
  %9 = alloca i32, align 4
  store i32 2, i32* %9, align 4
  %10 = alloca i32, align 4
  store i32 7, i32* %10, align 4
  %11 = alloca i32, align 4
  store i32 9, i32* %11, align 4
  %12 = alloca i32, align 4
  store i32 8, i32* %12, align 4
  %13 = alloca i32, align 4
  store i32 1, i32* %13, align 4
  %14 = alloca i32, align 4
  store i32 4, i32* %14, align 4
  %15 = alloca i32, align 4
  store i32 6, i32* %15, align 4
  %16 = alloca i32, align 4
  %17 = load i32, i32* %0, align 4
  %18 = load i32, i32* %1, align 4
  %19 = add i32 %17, %18
  %20 = load i32, i32* %2, align 4
  %21 = add i32 %19, %20
  %22 = load i32, i32* %3, align 4
  %23 = add i32 %21, %22
  %24 = load i32, i32* %4, align 4
  %25 = add i32 %23, %24
  %26 = load i32, i32* %5, align 4
  %27 = add i32 %25, %26
  %28 = load i32, i32* %6, align 4
  %29 = add i32 %27, %28
  %30 = load i32, i32* %7, align 4
  %31 = add i32 %29, %30
  store i32 %31, i32* %16, align 4
  %32 = alloca i32, align 4
  %33 = load i32, i32* %8, align 4
  %34 = load i32, i32* %9, align 4
  %35 = add i32 %33, %34
  %36 = load i32, i32* %10, align 4
  %37 = add i32 %35, %36
  %38 = load i32, i32* %11, align 4
  %39 = add i32 %37, %38
  %40 = load i32, i32* %12, align 4
  %41 = add i32 %39, %40
  %42 = load i32, i32* %13, align 4
  %43 = add i32 %41, %42
  %44 = load i32, i32* %14, align 4
  %45 = add i32 %43, %44
  %46 = load i32, i32* %15, align 4
  %47 = add i32 %45, %46
  store i32 %47, i32* %32, align 4
  %48 = load i32, i32* %16, align 4
  %49 = call i32 @foo()
  %50 = add i32 %48, %49
  store i32 %50, i32* %16, align 4
  %51 = alloca i32, align 4
  store i32 4, i32* %51, align 4
  %52 = alloca i32, align 4
  store i32 7, i32* %52, align 4
  %53 = alloca i32, align 4
  store i32 2, i32* %53, align 4
  %54 = alloca i32, align 4
  store i32 5, i32* %54, align 4
  %55 = alloca i32, align 4
  store i32 8, i32* %55, align 4
  %56 = alloca i32, align 4
  store i32 0, i32* %56, align 4
  %57 = alloca i32, align 4
  store i32 6, i32* %57, align 4
  %58 = alloca i32, align 4
  store i32 3, i32* %58, align 4
  %59 = load i32, i32* %32, align 4
  %60 = call i32 @foo()
  %61 = add i32 %59, %60
  store i32 %61, i32* %32, align 4
  %62 = load i32, i32* %8, align 4
  store i32 %62, i32* %0, align 4
  %63 = load i32, i32* %9, align 4
  store i32 %63, i32* %1, align 4
  %64 = load i32, i32* %10, align 4
  store i32 %64, i32* %2, align 4
  %65 = load i32, i32* %11, align 4
  store i32 %65, i32* %3, align 4
  %66 = load i32, i32* %12, align 4
  store i32 %66, i32* %4, align 4
  %67 = load i32, i32* %13, align 4
  store i32 %67, i32* %5, align 4
  %68 = load i32, i32* %14, align 4
  store i32 %68, i32* %6, align 4
  %69 = load i32, i32* %15, align 4
  store i32 %69, i32* %7, align 4
  %70 = alloca i32, align 4
  %71 = load i32, i32* %51, align 4
  %72 = load i32, i32* %52, align 4
  %73 = add i32 %71, %72
  %74 = load i32, i32* %53, align 4
  %75 = add i32 %73, %74
  %76 = load i32, i32* %54, align 4
  %77 = add i32 %75, %76
  %78 = load i32, i32* %55, align 4
  %79 = add i32 %77, %78
  %80 = load i32, i32* %56, align 4
  %81 = add i32 %79, %80
  %82 = load i32, i32* %57, align 4
  %83 = add i32 %81, %82
  %84 = load i32, i32* %58, align 4
  %85 = add i32 %83, %84
  store i32 %85, i32* %70, align 4
  %86 = alloca i32, align 4
  %87 = load i32, i32* %16, align 4
  %88 = load i32, i32* %32, align 4
  %89 = add i32 %87, %88
  %90 = load i32, i32* %70, align 4
  %91 = add i32 %89, %90
  store i32 %91, i32* %86, align 4
  %92 = load i32, i32* %86, align 4
  call void @putint(i32 %92)
  call void @putch(i32 10)
  ret i32 0
}

