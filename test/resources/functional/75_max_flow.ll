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
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %alloc_0, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.0, label %while.merge.0
while.body.0:
  %8 = load i32, i32* %alloc_0, align 4
  %9 = load i32*, i32** %0, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 %8
  %11 = load i32, i32* %1, align 4
  store i32 %11, i32* %10, align 4
  %12 = load i32, i32* %alloc_0, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %alloc_0, align 4
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
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
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
  store i32 0, i32* %alloc_1, align 4
  br label %while.cond.1
while.cond.1:
  %11 = load i32, i32* %alloc_1, align 4
  %12 = load i32, i32* %0, align 4
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 %12
  %14 = load i32, i32* %13, align 4
  %15 = icmp slt i32 %11, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %while.body.1, label %while.merge.1
while.body.1:
  %18 = load i32, i32* %0, align 4
  %19 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %18
  %20 = load i32, i32* %alloc_1, align 4
  %21 = getelementptr inbounds [10 x i32], [10 x i32]* %19, i32 0, i32 %20
  %22 = load i32, i32* %21, align 4
  %23 = getelementptr inbounds [10 x i32], [10 x i32]* @used, i32 0, i32 %22
  %24 = load i32, i32* %23, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %if.then1, label %if.merge1
if.then1:
  %26 = load i32, i32* %alloc_1, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* %alloc_1, align 4
  br label %while.cond.1
continue.unreachable:
  br label %if.merge1
if.merge1:
  %28 = load i32, i32* %0, align 4
  %29 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %28
  %30 = load i32, i32* %alloc_1, align 4
  %31 = getelementptr inbounds [10 x i32], [10 x i32]* %29, i32 0, i32 %30
  %32 = load i32, i32* %31, align 4
  %33 = icmp sle i32 %32, 0
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %if.then2, label %if.merge2
if.then2:
  %36 = load i32, i32* %alloc_1, align 4
  %37 = add i32 %36, 1
  store i32 %37, i32* %alloc_1, align 4
  br label %while.cond.1
continue.unreachable:
  br label %if.merge2
if.merge2:
  %38 = load i32, i32* %2, align 4
  %39 = load i32, i32* %0, align 4
  %40 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %39
  %41 = load i32, i32* %alloc_1, align 4
  %42 = getelementptr inbounds [10 x i32], [10 x i32]* %40, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  %44 = icmp slt i32 %38, %43
  %45 = zext i1 %44 to i32
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %if.then3, label %if.else3
if.then3:
  %47 = load i32, i32* %2, align 4
  store i32 %47, i32* %alloc_2, align 4
  br label %if.merge3
if.else3:
  %48 = load i32, i32* %0, align 4
  %49 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %48
  %50 = load i32, i32* %alloc_1, align 4
  %51 = getelementptr inbounds [10 x i32], [10 x i32]* %49, i32 0, i32 %50
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %alloc_2, align 4
  br label %if.merge3
if.merge3:
  %53 = load i32, i32* %0, align 4
  %54 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %53
  %55 = load i32, i32* %alloc_1, align 4
  %56 = getelementptr inbounds [10 x i32], [10 x i32]* %54, i32 0, i32 %55
  %57 = load i32, i32* %56, align 4
  %58 = load i32, i32* %1, align 4
  %59 = load i32, i32* %alloc_2, align 4
  %60 = call i32 @dfs(i32 %57, i32 %58, i32 %59)
  store i32 %60, i32* %alloc_3, align 4
  %61 = load i32, i32* %alloc_3, align 4
  %62 = icmp sgt i32 %61, 0
  %63 = zext i1 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %if.then4, label %if.merge4
if.then4:
  %65 = load i32, i32* %0, align 4
  %66 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %65
  %67 = load i32, i32* %alloc_1, align 4
  %68 = getelementptr inbounds [10 x i32], [10 x i32]* %66, i32 0, i32 %67
  %69 = load i32, i32* %0, align 4
  %70 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %69
  %71 = load i32, i32* %alloc_1, align 4
  %72 = getelementptr inbounds [10 x i32], [10 x i32]* %70, i32 0, i32 %71
  %73 = load i32, i32* %72, align 4
  %74 = load i32, i32* %alloc_3, align 4
  %75 = sub i32 %73, %74
  store i32 %75, i32* %68, align 4
  %76 = load i32, i32* %0, align 4
  %77 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %76
  %78 = load i32, i32* %alloc_1, align 4
  %79 = getelementptr inbounds [10 x i32], [10 x i32]* %77, i32 0, i32 %78
  %80 = load i32, i32* %79, align 4
  %81 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %80
  %82 = load i32, i32* %0, align 4
  %83 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %82
  %84 = load i32, i32* %alloc_1, align 4
  %85 = getelementptr inbounds [10 x i32], [10 x i32]* %83, i32 0, i32 %84
  %86 = load i32, i32* %85, align 4
  %87 = getelementptr inbounds [10 x i32], [10 x i32]* %81, i32 0, i32 %86
  %88 = load i32, i32* %0, align 4
  %89 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %88
  %90 = load i32, i32* %alloc_1, align 4
  %91 = getelementptr inbounds [10 x i32], [10 x i32]* %89, i32 0, i32 %90
  %92 = load i32, i32* %91, align 4
  %93 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %92
  %94 = load i32, i32* %0, align 4
  %95 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %94
  %96 = load i32, i32* %alloc_1, align 4
  %97 = getelementptr inbounds [10 x i32], [10 x i32]* %95, i32 0, i32 %96
  %98 = load i32, i32* %97, align 4
  %99 = getelementptr inbounds [10 x i32], [10 x i32]* %93, i32 0, i32 %98
  %100 = load i32, i32* %99, align 4
  %101 = load i32, i32* %alloc_3, align 4
  %102 = add i32 %100, %101
  store i32 %102, i32* %87, align 4
  %103 = load i32, i32* %alloc_3, align 4
  ret i32 %103
if.merge4:
  %104 = load i32, i32* %alloc_1, align 4
  %105 = add i32 %104, 1
  store i32 %105, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  ret i32 0
}

define i32 @max_flow(i32 %arg0, i32 %arg1) {
entry3:
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  store i32 0, i32* %alloc_4, align 4
  br label %while.cond.2
while.cond.2:
  %2 = icmp ne i32 1, 0
  br i1 %2, label %while.body.2, label %while.merge.2
while.body.2:
  %3 = getelementptr inbounds [10 x i32], [10 x i32]* @used, i32 0, i32 0
  call void @my_memset(i32* %3, i32 0, i32 10)
  %4 = load i32, i32* %0, align 4
  %5 = load i32, i32* %1, align 4
  %6 = call i32 @dfs(i32 %4, i32 %5, i32 1879048192)
  store i32 %6, i32* %alloc_5, align 4
  %7 = load i32, i32* %alloc_5, align 4
  %8 = icmp eq i32 %7, 0
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %if.then5, label %if.merge5
if.then5:
  %11 = load i32, i32* %alloc_4, align 4
  ret i32 %11
if.merge5:
  %12 = load i32, i32* %alloc_4, align 4
  %13 = load i32, i32* %alloc_5, align 4
  %14 = add i32 %12, %13
  store i32 %14, i32* %alloc_4, align 4
  br label %while.cond.2
while.merge.2:
  ret i32 0
}

define i32 @main() {
entry4:
  %alloc_10 = alloca i32, align 4
  %alloc_9 = alloca i32, align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_6, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* %alloc_7, align 4
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* @size, i32 0, i32 0
  call void @my_memset(i32* %2, i32 0, i32 10)
  br label %while.cond.3
while.cond.3:
  %3 = load i32, i32* %alloc_7, align 4
  %4 = icmp sgt i32 %3, 0
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.3, label %while.merge.3
while.body.3:
  %7 = call i32 @getint()
  store i32 %7, i32* %alloc_8, align 4
  %8 = call i32 @getint()
  store i32 %8, i32* %alloc_9, align 4
  %9 = call i32 @getint()
  store i32 %9, i32* %alloc_10, align 4
  %10 = load i32, i32* %alloc_8, align 4
  %11 = load i32, i32* %alloc_9, align 4
  %12 = load i32, i32* %alloc_10, align 4
  call void @add_node(i32 %10, i32 %11, i32 %12)
  %13 = load i32, i32* %alloc_7, align 4
  %14 = sub i32 %13, 1
  store i32 %14, i32* %alloc_7, align 4
  br label %while.cond.3
while.merge.3:
  %15 = load i32, i32* %alloc_6, align 4
  %16 = call i32 @max_flow(i32 1, i32 %15)
  call void @putint(i32 %16)
  call void @putch(i32 10)
  ret i32 0
}

