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

define i32 @main() {
entry0:
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
  %alloc_0 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_30, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_30, align 4
  %2 = icmp eq i32 %1, 5
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = load i32, i32* %alloc_30, align 4
  %6 = add i32 %5, 1
  store i32 %6, i32* %alloc_30, align 4
  br label %while.cond.0
while.merge.0:
  store i32 0, i32* %alloc_0, align 4
  %7 = load i32, i32* %alloc_0, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* %alloc_1, align 4
  %9 = load i32, i32* %alloc_1, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %alloc_2, align 4
  %11 = load i32, i32* %alloc_2, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %alloc_3, align 4
  %13 = load i32, i32* %alloc_3, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %alloc_4, align 4
  %15 = load i32, i32* %alloc_4, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %alloc_5, align 4
  %17 = load i32, i32* %alloc_5, align 4
  %18 = add i32 %17, 1
  store i32 %18, i32* %alloc_6, align 4
  %19 = load i32, i32* %alloc_6, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* %alloc_7, align 4
  %21 = load i32, i32* %alloc_7, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %alloc_8, align 4
  %23 = load i32, i32* %alloc_8, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %alloc_9, align 4
  %25 = load i32, i32* %alloc_9, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %alloc_10, align 4
  %27 = load i32, i32* %alloc_10, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %alloc_11, align 4
  %29 = load i32, i32* %alloc_11, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %alloc_12, align 4
  %31 = load i32, i32* %alloc_12, align 4
  %32 = add i32 %31, 1
  store i32 %32, i32* %alloc_13, align 4
  %33 = load i32, i32* %alloc_13, align 4
  %34 = add i32 %33, 1
  store i32 %34, i32* %alloc_14, align 4
  %35 = load i32, i32* %alloc_14, align 4
  %36 = add i32 %35, 1
  store i32 %36, i32* %alloc_15, align 4
  %37 = load i32, i32* %alloc_15, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %alloc_16, align 4
  %39 = load i32, i32* %alloc_16, align 4
  %40 = add i32 %39, 1
  store i32 %40, i32* %alloc_17, align 4
  %41 = load i32, i32* %alloc_17, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %alloc_18, align 4
  %43 = load i32, i32* %alloc_18, align 4
  %44 = add i32 %43, 1
  store i32 %44, i32* %alloc_19, align 4
  %45 = load i32, i32* %alloc_19, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %alloc_20, align 4
  %47 = load i32, i32* %alloc_20, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %alloc_21, align 4
  %49 = load i32, i32* %alloc_21, align 4
  %50 = add i32 %49, 1
  store i32 %50, i32* %alloc_22, align 4
  %51 = load i32, i32* %alloc_22, align 4
  %52 = add i32 %51, 1
  store i32 %52, i32* %alloc_23, align 4
  %53 = load i32, i32* %alloc_23, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %alloc_24, align 4
  %55 = load i32, i32* %alloc_24, align 4
  %56 = add i32 %55, 1
  store i32 %56, i32* %alloc_25, align 4
  %57 = load i32, i32* %alloc_25, align 4
  %58 = add i32 %57, 1
  store i32 %58, i32* %alloc_26, align 4
  %59 = load i32, i32* %alloc_26, align 4
  %60 = add i32 %59, 1
  store i32 %60, i32* %alloc_27, align 4
  %61 = load i32, i32* %alloc_27, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %alloc_28, align 4
  %63 = load i32, i32* %alloc_28, align 4
  %64 = add i32 %63, 1
  store i32 %64, i32* %alloc_29, align 4
  %65 = load i32, i32* %alloc_0, align 4
  call void @putint(i32 %65)
  %66 = load i32, i32* %alloc_1, align 4
  call void @putint(i32 %66)
  %67 = load i32, i32* %alloc_2, align 4
  call void @putint(i32 %67)
  %68 = load i32, i32* %alloc_3, align 4
  call void @putint(i32 %68)
  %69 = load i32, i32* %alloc_4, align 4
  call void @putint(i32 %69)
  %70 = load i32, i32* %alloc_5, align 4
  call void @putint(i32 %70)
  %71 = load i32, i32* %alloc_6, align 4
  call void @putint(i32 %71)
  %72 = load i32, i32* %alloc_7, align 4
  call void @putint(i32 %72)
  %73 = load i32, i32* %alloc_8, align 4
  call void @putint(i32 %73)
  %74 = load i32, i32* %alloc_9, align 4
  call void @putint(i32 %74)
  %75 = load i32, i32* %alloc_10, align 4
  call void @putint(i32 %75)
  %76 = load i32, i32* %alloc_11, align 4
  call void @putint(i32 %76)
  %77 = load i32, i32* %alloc_12, align 4
  call void @putint(i32 %77)
  %78 = load i32, i32* %alloc_13, align 4
  call void @putint(i32 %78)
  %79 = load i32, i32* %alloc_14, align 4
  call void @putint(i32 %79)
  %80 = load i32, i32* %alloc_15, align 4
  call void @putint(i32 %80)
  %81 = load i32, i32* %alloc_16, align 4
  call void @putint(i32 %81)
  %82 = load i32, i32* %alloc_17, align 4
  call void @putint(i32 %82)
  %83 = load i32, i32* %alloc_18, align 4
  call void @putint(i32 %83)
  %84 = load i32, i32* %alloc_19, align 4
  call void @putint(i32 %84)
  %85 = load i32, i32* %alloc_20, align 4
  call void @putint(i32 %85)
  %86 = load i32, i32* %alloc_21, align 4
  call void @putint(i32 %86)
  %87 = load i32, i32* %alloc_22, align 4
  call void @putint(i32 %87)
  %88 = load i32, i32* %alloc_23, align 4
  call void @putint(i32 %88)
  %89 = load i32, i32* %alloc_24, align 4
  call void @putint(i32 %89)
  %90 = load i32, i32* %alloc_25, align 4
  call void @putint(i32 %90)
  %91 = load i32, i32* %alloc_26, align 4
  call void @putint(i32 %91)
  %92 = load i32, i32* %alloc_27, align 4
  call void @putint(i32 %92)
  %93 = load i32, i32* %alloc_28, align 4
  call void @putint(i32 %93)
  %94 = load i32, i32* %alloc_29, align 4
  call void @putint(i32 %94)
  store i32 10, i32* %alloc_32, align 4
  %95 = load i32, i32* %alloc_32, align 4
  call void @putch(i32 %95)
  %96 = load i32, i32* %alloc_30, align 4
  call void @putint(i32 %96)
  %97 = load i32, i32* %alloc_32, align 4
  call void @putch(i32 %97)
  %98 = load i32, i32* %alloc_25, align 4
  ret i32 %98
}

