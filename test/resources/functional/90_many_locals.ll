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
  %alloc_18 = alloca i32, align 4
  %alloc_17 = alloca i32, align 4
  %alloc_16 = alloca i32, align 4
  %alloc_15 = alloca i32, align 4
  %alloc_14 = alloca i32, align 4
  %alloc_13 = alloca i32, align 4
  %alloc_12 = alloca i32, align 4
  %alloc_11 = alloca i32, align 4
  %alloc_10 = alloca i32, align 4
  %alloc_9 = alloca i32, align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca [16 x i32], align 4
  %0 = bitcast [16 x i32]* %alloc_0 to i32*
  %1 = getelementptr inbounds i32, i32* %0, i32 0
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds i32, i32* %0, i32 1
  store i32 1, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %0, i32 2
  store i32 2, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %0, i32 3
  store i32 3, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %0, i32 4
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %0, i32 5
  store i32 1, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %0, i32 6
  store i32 2, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %0, i32 7
  store i32 3, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %0, i32 8
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %0, i32 9
  store i32 1, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %0, i32 10
  store i32 2, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %0, i32 11
  store i32 3, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %0, i32 12
  store i32 0, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %0, i32 13
  store i32 1, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %0, i32 14
  store i32 2, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %0, i32 15
  store i32 3, i32* %16, align 4
  store i32 3, i32* %alloc_1, align 4
  store i32 7, i32* %alloc_2, align 4
  store i32 5, i32* %alloc_3, align 4
  store i32 6, i32* %alloc_4, align 4
  store i32 1, i32* %alloc_5, align 4
  store i32 0, i32* %alloc_6, align 4
  store i32 3, i32* %alloc_7, align 4
  store i32 5, i32* %alloc_8, align 4
  store i32 4, i32* %alloc_9, align 4
  store i32 2, i32* %alloc_10, align 4
  store i32 7, i32* %alloc_11, align 4
  store i32 9, i32* %alloc_12, align 4
  store i32 8, i32* %alloc_13, align 4
  store i32 1, i32* %alloc_14, align 4
  store i32 4, i32* %alloc_15, align 4
  store i32 6, i32* %alloc_16, align 4
  %17 = load i32, i32* %alloc_1, align 4
  %18 = load i32, i32* %alloc_2, align 4
  %19 = add i32 %17, %18
  %20 = load i32, i32* %alloc_3, align 4
  %21 = add i32 %19, %20
  %22 = load i32, i32* %alloc_4, align 4
  %23 = add i32 %21, %22
  %24 = load i32, i32* %alloc_5, align 4
  %25 = add i32 %23, %24
  %26 = load i32, i32* %alloc_6, align 4
  %27 = add i32 %25, %26
  %28 = load i32, i32* %alloc_7, align 4
  %29 = add i32 %27, %28
  %30 = load i32, i32* %alloc_8, align 4
  %31 = add i32 %29, %30
  store i32 %31, i32* %alloc_17, align 4
  %32 = load i32, i32* %alloc_9, align 4
  %33 = load i32, i32* %alloc_10, align 4
  %34 = add i32 %32, %33
  %35 = load i32, i32* %alloc_11, align 4
  %36 = add i32 %34, %35
  %37 = load i32, i32* %alloc_12, align 4
  %38 = add i32 %36, %37
  %39 = load i32, i32* %alloc_13, align 4
  %40 = add i32 %38, %39
  %41 = load i32, i32* %alloc_14, align 4
  %42 = add i32 %40, %41
  %43 = load i32, i32* %alloc_15, align 4
  %44 = add i32 %42, %43
  %45 = load i32, i32* %alloc_16, align 4
  %46 = add i32 %44, %45
  store i32 %46, i32* %alloc_18, align 4
  %47 = load i32, i32* %alloc_17, align 4
  %48 = load i32, i32* %alloc_18, align 4
  %49 = add i32 %47, %48
  %50 = load i32, i32* %alloc_1, align 4
  %51 = getelementptr inbounds [16 x i32], [16 x i32]* %alloc_0, i32 0, i32 %50
  %52 = load i32, i32* %51, align 4
  %53 = add i32 %49, %52
  ret i32 %53
}

define i32 @main() {
entry1:
  %alloc_46 = alloca i32, align 4
  %alloc_45 = alloca i32, align 4
  %alloc_44 = alloca i32, align 4
  %alloc_43 = alloca i32, align 4
  %alloc_42 = alloca i32, align 4
  %alloc_41 = alloca i32, align 4
  %alloc_40 = alloca i32, align 4
  %alloc_39 = alloca i32, align 4
  %alloc_38 = alloca i32, align 4
  %alloc_37 = alloca i32, align 4
  %alloc_36 = alloca i32, align 4
  %alloc_35 = alloca i32, align 4
  %alloc_34 = alloca i32, align 4
  %alloc_33 = alloca i32, align 4
  %alloc_32 = alloca i32, align 4
  %alloc_31 = alloca i32, align 4
  %alloc_30 = alloca i32, align 4
  %alloc_29 = alloca i32, align 4
  %alloc_28 = alloca i32, align 4
  %alloc_27 = alloca i32, align 4
  %alloc_26 = alloca i32, align 4
  %alloc_25 = alloca i32, align 4
  %alloc_24 = alloca i32, align 4
  %alloc_23 = alloca i32, align 4
  %alloc_22 = alloca i32, align 4
  %alloc_21 = alloca i32, align 4
  %alloc_20 = alloca i32, align 4
  %alloc_19 = alloca i32, align 4
  store i32 3, i32* %alloc_19, align 4
  store i32 7, i32* %alloc_20, align 4
  store i32 5, i32* %alloc_21, align 4
  store i32 6, i32* %alloc_22, align 4
  store i32 1, i32* %alloc_23, align 4
  store i32 0, i32* %alloc_24, align 4
  store i32 3, i32* %alloc_25, align 4
  store i32 5, i32* %alloc_26, align 4
  store i32 4, i32* %alloc_27, align 4
  store i32 2, i32* %alloc_28, align 4
  store i32 7, i32* %alloc_29, align 4
  store i32 9, i32* %alloc_30, align 4
  store i32 8, i32* %alloc_31, align 4
  store i32 1, i32* %alloc_32, align 4
  store i32 4, i32* %alloc_33, align 4
  store i32 6, i32* %alloc_34, align 4
  %0 = load i32, i32* %alloc_19, align 4
  %1 = load i32, i32* %alloc_20, align 4
  %2 = add i32 %0, %1
  %3 = load i32, i32* %alloc_21, align 4
  %4 = add i32 %2, %3
  %5 = load i32, i32* %alloc_22, align 4
  %6 = add i32 %4, %5
  %7 = load i32, i32* %alloc_23, align 4
  %8 = add i32 %6, %7
  %9 = load i32, i32* %alloc_24, align 4
  %10 = add i32 %8, %9
  %11 = load i32, i32* %alloc_25, align 4
  %12 = add i32 %10, %11
  %13 = load i32, i32* %alloc_26, align 4
  %14 = add i32 %12, %13
  store i32 %14, i32* %alloc_35, align 4
  %15 = load i32, i32* %alloc_27, align 4
  %16 = load i32, i32* %alloc_28, align 4
  %17 = add i32 %15, %16
  %18 = load i32, i32* %alloc_29, align 4
  %19 = add i32 %17, %18
  %20 = load i32, i32* %alloc_30, align 4
  %21 = add i32 %19, %20
  %22 = load i32, i32* %alloc_31, align 4
  %23 = add i32 %21, %22
  %24 = load i32, i32* %alloc_32, align 4
  %25 = add i32 %23, %24
  %26 = load i32, i32* %alloc_33, align 4
  %27 = add i32 %25, %26
  %28 = load i32, i32* %alloc_34, align 4
  %29 = add i32 %27, %28
  store i32 %29, i32* %alloc_36, align 4
  %30 = load i32, i32* %alloc_35, align 4
  %31 = call i32 @foo()
  %32 = add i32 %30, %31
  store i32 %32, i32* %alloc_35, align 4
  store i32 4, i32* %alloc_37, align 4
  store i32 7, i32* %alloc_38, align 4
  store i32 2, i32* %alloc_39, align 4
  store i32 5, i32* %alloc_40, align 4
  store i32 8, i32* %alloc_41, align 4
  store i32 0, i32* %alloc_42, align 4
  store i32 6, i32* %alloc_43, align 4
  store i32 3, i32* %alloc_44, align 4
  %33 = load i32, i32* %alloc_36, align 4
  %34 = call i32 @foo()
  %35 = add i32 %33, %34
  store i32 %35, i32* %alloc_36, align 4
  %36 = load i32, i32* %alloc_27, align 4
  store i32 %36, i32* %alloc_19, align 4
  %37 = load i32, i32* %alloc_28, align 4
  store i32 %37, i32* %alloc_20, align 4
  %38 = load i32, i32* %alloc_29, align 4
  store i32 %38, i32* %alloc_21, align 4
  %39 = load i32, i32* %alloc_30, align 4
  store i32 %39, i32* %alloc_22, align 4
  %40 = load i32, i32* %alloc_31, align 4
  store i32 %40, i32* %alloc_23, align 4
  %41 = load i32, i32* %alloc_32, align 4
  store i32 %41, i32* %alloc_24, align 4
  %42 = load i32, i32* %alloc_33, align 4
  store i32 %42, i32* %alloc_25, align 4
  %43 = load i32, i32* %alloc_34, align 4
  store i32 %43, i32* %alloc_26, align 4
  %44 = load i32, i32* %alloc_37, align 4
  %45 = load i32, i32* %alloc_38, align 4
  %46 = add i32 %44, %45
  %47 = load i32, i32* %alloc_39, align 4
  %48 = add i32 %46, %47
  %49 = load i32, i32* %alloc_40, align 4
  %50 = add i32 %48, %49
  %51 = load i32, i32* %alloc_41, align 4
  %52 = add i32 %50, %51
  %53 = load i32, i32* %alloc_42, align 4
  %54 = add i32 %52, %53
  %55 = load i32, i32* %alloc_43, align 4
  %56 = add i32 %54, %55
  %57 = load i32, i32* %alloc_44, align 4
  %58 = add i32 %56, %57
  store i32 %58, i32* %alloc_45, align 4
  %59 = load i32, i32* %alloc_35, align 4
  %60 = load i32, i32* %alloc_36, align 4
  %61 = add i32 %59, %60
  %62 = load i32, i32* %alloc_45, align 4
  %63 = add i32 %61, %62
  store i32 %63, i32* %alloc_46, align 4
  %64 = load i32, i32* %alloc_46, align 4
  call void @putint(i32 %64)
  call void @putch(i32 10)
  ret i32 0
}

