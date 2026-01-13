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

@INF = dso_local constant i32 1879048192, align 4
@size = dso_local global [10 x i32] zeroinitializer, align 4
@to = dso_local global [10 x [10 x i32]] zeroinitializer, align 4
@cap = dso_local global [10 x [10 x i32]] zeroinitializer, align 4
@rev = dso_local global [10 x [10 x i32]] zeroinitializer, align 4
@used = dso_local global [10 x i32] zeroinitializer, align 4

define void @my_memset(i32* %arg0, i32 %arg1, i32 %arg2) {
entry0:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %while.cond.0
while.cond.0:
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.0, label %while.merge.0
while.body.0:
  %9 = load i32, i32* %3, align 4
  %10 = load i32*, i32** %0, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 %9
  %12 = load i32, i32* %1, align 4
  store i32 %12, i32* %11, align 4
  %13 = load i32, i32* %3, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %3, align 4
  br label %while.cond.0
while.merge.0:
  ret void
}

define void @add_node(i32 %arg0, i32 %arg1, i32 %arg2) {
entry1:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = load i32, i32* %0, align 4
  %4 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %3
  %5 = load i32, i32* %0, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %5
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %4, i32 0, i32 %7
  %9 = load i32, i32* %1, align 4
  store i32 %9, i32* %8, align 4
  %10 = load i32, i32* %0, align 4
  %11 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %10
  %12 = load i32, i32* %0, align 4
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %12
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds [10 x i32], [10 x i32]* %11, i32 0, i32 %14
  %16 = load i32, i32* %2, align 4
  store i32 %16, i32* %15, align 4
  %17 = load i32, i32* %0, align 4
  %18 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %17
  %19 = load i32, i32* %0, align 4
  %20 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %19
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds [10 x i32], [10 x i32]* %18, i32 0, i32 %21
  %23 = load i32, i32* %1, align 4
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %23
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %22, align 4
  %26 = load i32, i32* %1, align 4
  %27 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %26
  %28 = load i32, i32* %1, align 4
  %29 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = getelementptr inbounds [10 x i32], [10 x i32]* %27, i32 0, i32 %30
  %32 = load i32, i32* %0, align 4
  store i32 %32, i32* %31, align 4
  %33 = load i32, i32* %1, align 4
  %34 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %33
  %35 = load i32, i32* %1, align 4
  %36 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %35
  %37 = load i32, i32* %36, align 4
  %38 = getelementptr inbounds [10 x i32], [10 x i32]* %34, i32 0, i32 %37
  store i32 0, i32* %38, align 4
  %39 = load i32, i32* %1, align 4
  %40 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %39
  %41 = load i32, i32* %1, align 4
  %42 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds [10 x i32], [10 x i32]* %40, i32 0, i32 %43
  %45 = load i32, i32* %0, align 4
  %46 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %45
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* %44, align 4
  %48 = load i32, i32* %0, align 4
  %49 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %48
  %50 = load i32, i32* %0, align 4
  %51 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %50
  %52 = load i32, i32* %51, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %49, align 4
  %54 = load i32, i32* %1, align 4
  %55 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %54
  %56 = load i32, i32* %1, align 4
  %57 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %56
  %58 = load i32, i32* %57, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %55, align 4
  ret void
}

define i32 @dfs(i32 %arg0, i32 %arg1, i32 %arg2) {
entry2:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp eq i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.merge0
if.then0:
  %8 = load i32, i32* %2, align 4
  ret i32 %8
if.merge0:
  %9 = load i32, i32* %0, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* @used, i32 0, i32 %9
  store i32 1, i32* %10, align 4
  %11 = alloca i32, align 4
  store i32 0, i32* %11, align 4
  br label %while.cond.1
while.cond.1:
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %0, align 4
  %14 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %13
  %15 = load i32, i32* %14, align 4
  %16 = icmp slt i32 %12, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %while.body.1, label %while.merge.1
while.body.1:
  %19 = load i32, i32* %0, align 4
  %20 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %19
  %21 = load i32, i32* %11, align 4
  %22 = getelementptr inbounds [10 x i32], [10 x i32]* %20, i32 0, i32 %21
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* @used, i32 0, i32 %23
  %25 = load i32, i32* %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then1, label %if.merge1
if.then1:
  %27 = load i32, i32* %11, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %11, align 4
  br label %while.cond.1
continue.unreachable:
  br label %if.merge1
if.merge1:
  %29 = load i32, i32* %0, align 4
  %30 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %29
  %31 = load i32, i32* %11, align 4
  %32 = getelementptr inbounds [10 x i32], [10 x i32]* %30, i32 0, i32 %31
  %33 = load i32, i32* %32, align 4
  %34 = icmp sle i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %if.then2, label %if.merge2
if.then2:
  %37 = load i32, i32* %11, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %11, align 4
  br label %while.cond.1
continue.unreachable:
  br label %if.merge2
if.merge2:
  %39 = alloca i32, align 4
  %40 = load i32, i32* %2, align 4
  %41 = load i32, i32* %0, align 4
  %42 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %41
  %43 = load i32, i32* %11, align 4
  %44 = getelementptr inbounds [10 x i32], [10 x i32]* %42, i32 0, i32 %43
  %45 = load i32, i32* %44, align 4
  %46 = icmp slt i32 %40, %45
  %47 = zext i1 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %if.then3, label %if.else3
if.then3:
  %49 = load i32, i32* %2, align 4
  store i32 %49, i32* %39, align 4
  br label %if.merge3
if.else3:
  %50 = load i32, i32* %0, align 4
  %51 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %50
  %52 = load i32, i32* %11, align 4
  %53 = getelementptr inbounds [10 x i32], [10 x i32]* %51, i32 0, i32 %52
  %54 = load i32, i32* %53, align 4
  store i32 %54, i32* %39, align 4
  br label %if.merge3
if.merge3:
  %55 = alloca i32, align 4
  %56 = load i32, i32* %0, align 4
  %57 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %56
  %58 = load i32, i32* %11, align 4
  %59 = getelementptr inbounds [10 x i32], [10 x i32]* %57, i32 0, i32 %58
  %60 = load i32, i32* %59, align 4
  %61 = load i32, i32* %1, align 4
  %62 = load i32, i32* %39, align 4
  %63 = call i32 @dfs(i32 %60, i32 %61, i32 %62)
  store i32 %63, i32* %55, align 4
  %64 = load i32, i32* %55, align 4
  %65 = icmp sgt i32 %64, 0
  %66 = zext i1 %65 to i32
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %if.then4, label %if.merge4
if.then4:
  %68 = load i32, i32* %0, align 4
  %69 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %68
  %70 = load i32, i32* %11, align 4
  %71 = getelementptr inbounds [10 x i32], [10 x i32]* %69, i32 0, i32 %70
  %72 = load i32, i32* %0, align 4
  %73 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %72
  %74 = load i32, i32* %11, align 4
  %75 = getelementptr inbounds [10 x i32], [10 x i32]* %73, i32 0, i32 %74
  %76 = load i32, i32* %75, align 4
  %77 = load i32, i32* %55, align 4
  %78 = sub i32 %76, %77
  store i32 %78, i32* %71, align 4
  %79 = load i32, i32* %0, align 4
  %80 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %79
  %81 = load i32, i32* %11, align 4
  %82 = getelementptr inbounds [10 x i32], [10 x i32]* %80, i32 0, i32 %81
  %83 = load i32, i32* %82, align 4
  %84 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %83
  %85 = load i32, i32* %0, align 4
  %86 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %85
  %87 = load i32, i32* %11, align 4
  %88 = getelementptr inbounds [10 x i32], [10 x i32]* %86, i32 0, i32 %87
  %89 = load i32, i32* %88, align 4
  %90 = getelementptr inbounds [10 x i32], [10 x i32]* %84, i32 0, i32 %89
  %91 = load i32, i32* %0, align 4
  %92 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %91
  %93 = load i32, i32* %11, align 4
  %94 = getelementptr inbounds [10 x i32], [10 x i32]* %92, i32 0, i32 %93
  %95 = load i32, i32* %94, align 4
  %96 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %95
  %97 = load i32, i32* %0, align 4
  %98 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %97
  %99 = load i32, i32* %11, align 4
  %100 = getelementptr inbounds [10 x i32], [10 x i32]* %98, i32 0, i32 %99
  %101 = load i32, i32* %100, align 4
  %102 = getelementptr inbounds [10 x i32], [10 x i32]* %96, i32 0, i32 %101
  %103 = load i32, i32* %102, align 4
  %104 = load i32, i32* %55, align 4
  %105 = add i32 %103, %104
  store i32 %105, i32* %90, align 4
  %106 = load i32, i32* %55, align 4
  ret i32 %106
if.merge4:
  %107 = load i32, i32* %11, align 4
  %108 = add i32 %107, 1
  store i32 %108, i32* %11, align 4
  br label %while.cond.1
while.merge.1:
  ret i32 0
}

define i32 @max_flow(i32 %arg0, i32 %arg1) {
entry3:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.2
while.cond.2:
  %3 = icmp ne i32 1, 0
  br i1 %3, label %while.body.2, label %while.merge.2
while.body.2:
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* @used, i32 0, i32 0
  call void @my_memset(i32* %4, i32 0, i32 10)
  %5 = alloca i32, align 4
  %6 = load i32, i32* %0, align 4
  %7 = load i32, i32* %1, align 4
  %8 = call i32 @dfs(i32 %6, i32 %7, i32 1879048192)
  store i32 %8, i32* %5, align 4
  %9 = load i32, i32* %5, align 4
  %10 = icmp eq i32 %9, 0
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then5, label %if.merge5
if.then5:
  %13 = load i32, i32* %2, align 4
  ret i32 %13
if.merge5:
  %14 = load i32, i32* %2, align 4
  %15 = load i32, i32* %5, align 4
  %16 = add i32 %14, %15
  store i32 %16, i32* %2, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

define i32 @main() {
entry4:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = call i32 @getint()
  store i32 %2, i32* %0, align 4
  %3 = call i32 @getint()
  store i32 %3, i32* %1, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 0
  call void @my_memset(i32* %4, i32 0, i32 10)
  br label %while.cond.3
while.cond.3:
  %5 = load i32, i32* %1, align 4
  %6 = icmp sgt i32 %5, 0
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.3, label %while.merge.3
while.body.3:
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = call i32 @getint()
  store i32 %11, i32* %9, align 4
  %12 = call i32 @getint()
  store i32 %12, i32* %10, align 4
  %13 = alloca i32, align 4
  %14 = call i32 @getint()
  store i32 %14, i32* %13, align 4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %10, align 4
  %17 = load i32, i32* %13, align 4
  call void @add_node(i32 %15, i32 %16, i32 %17)
  %18 = load i32, i32* %1, align 4
  %19 = sub i32 %18, 1
  store i32 %19, i32* %1, align 4
  br label %while.cond.3
while.merge.3:
  %20 = load i32, i32* %0, align 4
  %21 = call i32 @max_flow(i32 1, i32 %20)
  call void @putint(i32 %21)
  call void @putch(i32 10)
  ret i32 0
}

