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

@b = dso_local global i32 5, align 4
@c = dso_local global [4 x i32] [i32 6, i32 7, i32 8, i32 9], align 4

define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  store i32 1, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 2, i32* %1, align 4
  store i32 3, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  call void @putint(i32 %2)
  %3 = load i32, i32* %1, align 4
  call void @putint(i32 %3)
  %4 = load i32, i32* %0, align 4
  call void @putint(i32 %4)
  call void @putch(i32 10)
  br label %while.cond.0
while.cond.0:
  %5 = load i32, i32* %0, align 4
  %6 = icmp slt i32 %5, 5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.0, label %while.merge.0
while.body.0:
  %9 = alloca i32, align 4
  store i32 0, i32* %9, align 4
  %10 = load i32, i32* %9, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %9, align 4
  %12 = load i32, i32* %9, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then0, label %if.merge0
if.then0:
  br label %while.merge.0
break.unreachable:
  br label %if.merge0
if.merge0:
  br label %while.cond.0
while.merge.0:
  %14 = load i32, i32* %0, align 4
  call void @putint(i32 %14)
  call void @putch(i32 10)
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* @c, i32 0, i32 2
  store i32 1, i32* %15, align 4
  %16 = alloca [2 x [8 x i32]], align 4
  %17 = bitcast [2 x [8 x i32]]* %16 to i32*
  %18 = getelementptr inbounds i32, i32* %17, i32 0
  store i32 0, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %17, i32 1
  store i32 9, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %17, i32 2
  store i32 0, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %17, i32 3
  store i32 0, i32* %21, align 4
  %22 = getelementptr inbounds i32, i32* %17, i32 4
  store i32 0, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %17, i32 5
  store i32 0, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %17, i32 6
  store i32 0, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %17, i32 7
  store i32 0, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %17, i32 8
  store i32 8, i32* %26, align 4
  %27 = getelementptr inbounds i32, i32* %17, i32 9
  store i32 3, i32* %27, align 4
  %28 = getelementptr inbounds i32, i32* %17, i32 10
  store i32 0, i32* %28, align 4
  %29 = getelementptr inbounds i32, i32* %17, i32 11
  store i32 0, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %17, i32 12
  store i32 0, i32* %30, align 4
  %31 = getelementptr inbounds i32, i32* %17, i32 13
  store i32 0, i32* %31, align 4
  %32 = getelementptr inbounds i32, i32* %17, i32 14
  store i32 0, i32* %32, align 4
  %33 = getelementptr inbounds i32, i32* %17, i32 15
  store i32 0, i32* %33, align 4
  %34 = alloca i32, align 4
  store i32 2, i32* %34, align 4
  %35 = getelementptr inbounds [4 x i32], [4 x i32]* @c, i32 0, i32 2
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %if.then1, label %if.merge1
if.then1:
  %38 = alloca [7 x [1 x [5 x i32]]], align 4
  %39 = bitcast [7 x [1 x [5 x i32]]]* %38 to i32*
  %40 = getelementptr inbounds i32, i32* %39, i32 0
  store i32 0, i32* %40, align 4
  %41 = getelementptr inbounds i32, i32* %39, i32 1
  store i32 0, i32* %41, align 4
  %42 = getelementptr inbounds i32, i32* %39, i32 2
  store i32 0, i32* %42, align 4
  %43 = getelementptr inbounds i32, i32* %39, i32 3
  store i32 0, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %39, i32 4
  store i32 0, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %39, i32 5
  store i32 0, i32* %45, align 4
  %46 = getelementptr inbounds i32, i32* %39, i32 6
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds i32, i32* %39, i32 7
  store i32 0, i32* %47, align 4
  %48 = getelementptr inbounds i32, i32* %39, i32 8
  store i32 0, i32* %48, align 4
  %49 = getelementptr inbounds i32, i32* %39, i32 9
  store i32 0, i32* %49, align 4
  %50 = getelementptr inbounds i32, i32* %39, i32 10
  store i32 2, i32* %50, align 4
  %51 = getelementptr inbounds i32, i32* %39, i32 11
  store i32 1, i32* %51, align 4
  %52 = getelementptr inbounds i32, i32* %39, i32 12
  store i32 8, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %39, i32 13
  store i32 0, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %39, i32 14
  store i32 0, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %39, i32 15
  store i32 0, i32* %55, align 4
  %56 = getelementptr inbounds i32, i32* %39, i32 16
  store i32 0, i32* %56, align 4
  %57 = getelementptr inbounds i32, i32* %39, i32 17
  store i32 0, i32* %57, align 4
  %58 = getelementptr inbounds i32, i32* %39, i32 18
  store i32 0, i32* %58, align 4
  %59 = getelementptr inbounds i32, i32* %39, i32 19
  store i32 0, i32* %59, align 4
  %60 = getelementptr inbounds i32, i32* %39, i32 20
  store i32 0, i32* %60, align 4
  %61 = getelementptr inbounds i32, i32* %39, i32 21
  store i32 0, i32* %61, align 4
  %62 = getelementptr inbounds i32, i32* %39, i32 22
  store i32 0, i32* %62, align 4
  %63 = getelementptr inbounds i32, i32* %39, i32 23
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds i32, i32* %39, i32 24
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds i32, i32* %39, i32 25
  store i32 0, i32* %65, align 4
  %66 = getelementptr inbounds i32, i32* %39, i32 26
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds i32, i32* %39, i32 27
  store i32 0, i32* %67, align 4
  %68 = getelementptr inbounds i32, i32* %39, i32 28
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds i32, i32* %39, i32 29
  store i32 0, i32* %69, align 4
  %70 = getelementptr inbounds i32, i32* %39, i32 30
  store i32 0, i32* %70, align 4
  %71 = getelementptr inbounds i32, i32* %39, i32 31
  store i32 0, i32* %71, align 4
  %72 = getelementptr inbounds i32, i32* %39, i32 32
  store i32 0, i32* %72, align 4
  %73 = getelementptr inbounds i32, i32* %39, i32 33
  store i32 0, i32* %73, align 4
  %74 = getelementptr inbounds i32, i32* %39, i32 34
  store i32 0, i32* %74, align 4
  %75 = load i32, i32* %34, align 4
  %76 = getelementptr inbounds [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %38, i32 0, i32 %75
  %77 = getelementptr inbounds [1 x [5 x i32]], [1 x [5 x i32]]* %76, i32 0, i32 0
  %78 = getelementptr inbounds [5 x i32], [5 x i32]* %77, i32 0, i32 0
  %79 = load i32, i32* %78, align 4
  call void @putint(i32 %79)
  %80 = load i32, i32* %34, align 4
  %81 = getelementptr inbounds [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %38, i32 0, i32 %80
  %82 = getelementptr inbounds [1 x [5 x i32]], [1 x [5 x i32]]* %81, i32 0, i32 0
  %83 = getelementptr inbounds [5 x i32], [5 x i32]* %82, i32 0, i32 1
  %84 = load i32, i32* %83, align 4
  call void @putint(i32 %84)
  %85 = load i32, i32* %34, align 4
  %86 = getelementptr inbounds [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %38, i32 0, i32 %85
  %87 = getelementptr inbounds [1 x [5 x i32]], [1 x [5 x i32]]* %86, i32 0, i32 0
  %88 = getelementptr inbounds [5 x i32], [5 x i32]* %87, i32 0, i32 2
  %89 = load i32, i32* %88, align 4
  call void @putint(i32 %89)
  br label %if.merge1
if.merge1:
  call void @putch(i32 10)
  %90 = load i32, i32* @b, align 4
  call void @putint(i32 %90)
  call void @putch(i32 10)
  %91 = getelementptr inbounds [4 x i32], [4 x i32]* @c, i32 0, i32 0
  %92 = load i32, i32* %91, align 4
  call void @putint(i32 %92)
  %93 = getelementptr inbounds [4 x i32], [4 x i32]* @c, i32 0, i32 1
  %94 = load i32, i32* %93, align 4
  call void @putint(i32 %94)
  %95 = getelementptr inbounds [4 x i32], [4 x i32]* @c, i32 0, i32 2
  %96 = load i32, i32* %95, align 4
  call void @putint(i32 %96)
  %97 = getelementptr inbounds [4 x i32], [4 x i32]* @c, i32 0, i32 3
  %98 = load i32, i32* %97, align 4
  call void @putint(i32 %98)
  call void @putch(i32 10)
  ret i32 0
}

