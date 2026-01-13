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

@INF = dso_local constant i32 65535, align 4
@e = dso_local global [16 x [16 x i32]] zeroinitializer, align 4
@book = dso_local global [16 x i32] zeroinitializer, align 4
@dis = dso_local global [16 x i32] zeroinitializer, align 4
@n = dso_local global i32 zeroinitializer, align 4
@m = dso_local global i32 zeroinitializer, align 4
@v1 = dso_local global i32 zeroinitializer, align 4
@v2 = dso_local global i32 zeroinitializer, align 4
@w = dso_local global i32 zeroinitializer, align 4

define void @Dijkstra() {
entry0:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  store i32 1, i32* %0, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %0, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp sle i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = load i32, i32* %0, align 4
  %8 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %7
  %9 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 1
  %10 = load i32, i32* %0, align 4
  %11 = getelementptr inbounds [16 x i32], [16 x i32]* %9, i32 0, i32 %10
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %8, align 4
  %13 = load i32, i32* %0, align 4
  %14 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 %13
  store i32 0, i32* %14, align 4
  %15 = load i32, i32* %0, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %17 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 1
  store i32 1, i32* %17, align 4
  store i32 1, i32* %0, align 4
  br label %while.cond.1
while.cond.1:
  %18 = load i32, i32* %0, align 4
  %19 = load i32, i32* @n, align 4
  %20 = sub i32 %19, 1
  %21 = icmp sle i32 %18, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %while.body.1, label %while.merge.1
while.body.1:
  %24 = alloca i32, align 4
  store i32 65535, i32* %24, align 4
  %25 = alloca i32, align 4
  store i32 0, i32* %25, align 4
  %26 = alloca i32, align 4
  store i32 1, i32* %26, align 4
  br label %while.cond.2
while.cond.2:
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* @n, align 4
  %29 = icmp sle i32 %27, %28
  %30 = zext i1 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %while.body.2, label %while.merge.2
while.body.2:
  %32 = load i32, i32* %24, align 4
  %33 = load i32, i32* %26, align 4
  %34 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %33
  %35 = load i32, i32* %34, align 4
  %36 = icmp sgt i32 %32, %35
  %37 = zext i1 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %land.rhs1, label %land.merge2
land.rhs1:
  %39 = load i32, i32* %26, align 4
  %40 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 %39
  %41 = load i32, i32* %40, align 4
  %42 = icmp eq i32 %41, 0
  %43 = zext i1 %42 to i32
  %44 = icmp ne i32 %43, 0
  %45 = zext i1 %44 to i32
  br label %land.merge2
land.merge2:
  %46 = phi i32 [0, %while.body.2], [%45, %land.rhs1]
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %if.then0, label %if.merge0
if.then0:
  %48 = load i32, i32* %26, align 4
  %49 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %48
  %50 = load i32, i32* %49, align 4
  store i32 %50, i32* %24, align 4
  %51 = load i32, i32* %26, align 4
  store i32 %51, i32* %25, align 4
  br label %if.merge0
if.merge0:
  %52 = load i32, i32* %26, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %26, align 4
  br label %while.cond.2
while.merge.2:
  %54 = load i32, i32* %25, align 4
  %55 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 %54
  store i32 1, i32* %55, align 4
  %56 = alloca i32, align 4
  store i32 1, i32* %56, align 4
  br label %while.cond.3
while.cond.3:
  %57 = load i32, i32* %56, align 4
  %58 = load i32, i32* @n, align 4
  %59 = icmp sle i32 %57, %58
  %60 = zext i1 %59 to i32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %while.body.3, label %while.merge.3
while.body.3:
  %62 = load i32, i32* %25, align 4
  %63 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %62
  %64 = load i32, i32* %56, align 4
  %65 = getelementptr inbounds [16 x i32], [16 x i32]* %63, i32 0, i32 %64
  %66 = load i32, i32* %65, align 4
  %67 = icmp slt i32 %66, 65535
  %68 = zext i1 %67 to i32
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %if.then1, label %if.merge1
if.then1:
  %70 = load i32, i32* %56, align 4
  %71 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %70
  %72 = load i32, i32* %71, align 4
  %73 = load i32, i32* %25, align 4
  %74 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %73
  %75 = load i32, i32* %74, align 4
  %76 = load i32, i32* %25, align 4
  %77 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %76
  %78 = load i32, i32* %56, align 4
  %79 = getelementptr inbounds [16 x i32], [16 x i32]* %77, i32 0, i32 %78
  %80 = load i32, i32* %79, align 4
  %81 = add i32 %75, %80
  %82 = icmp sgt i32 %72, %81
  %83 = zext i1 %82 to i32
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %if.then2, label %if.merge2
if.then2:
  %85 = load i32, i32* %56, align 4
  %86 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %85
  %87 = load i32, i32* %25, align 4
  %88 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %87
  %89 = load i32, i32* %88, align 4
  %90 = load i32, i32* %25, align 4
  %91 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %90
  %92 = load i32, i32* %56, align 4
  %93 = getelementptr inbounds [16 x i32], [16 x i32]* %91, i32 0, i32 %92
  %94 = load i32, i32* %93, align 4
  %95 = add i32 %89, %94
  store i32 %95, i32* %86, align 4
  br label %if.merge2
if.merge2:
  br label %if.merge1
if.merge1:
  %96 = load i32, i32* %56, align 4
  %97 = add i32 %96, 1
  store i32 %97, i32* %56, align 4
  br label %while.cond.3
while.merge.3:
  %98 = load i32, i32* %0, align 4
  %99 = add i32 %98, 1
  store i32 %99, i32* %0, align 4
  br label %while.cond.1
while.merge.1:
  ret void
}

define i32 @main() {
entry3:
  %0 = alloca i32, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* @n, align 4
  %2 = call i32 @getint()
  store i32 %2, i32* @m, align 4
  store i32 1, i32* %0, align 4
  br label %while.cond.4
while.cond.4:
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* @n, align 4
  %5 = icmp sle i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.4, label %while.merge.4
while.body.4:
  %8 = alloca i32, align 4
  store i32 1, i32* %8, align 4
  br label %while.cond.5
while.cond.5:
  %9 = load i32, i32* %8, align 4
  %10 = load i32, i32* @n, align 4
  %11 = icmp sle i32 %9, %10
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %while.body.5, label %while.merge.5
while.body.5:
  %14 = load i32, i32* %0, align 4
  %15 = load i32, i32* %8, align 4
  %16 = icmp eq i32 %14, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %if.then3, label %if.else3
if.then3:
  %19 = load i32, i32* %0, align 4
  %20 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %19
  %21 = load i32, i32* %8, align 4
  %22 = getelementptr inbounds [16 x i32], [16 x i32]* %20, i32 0, i32 %21
  store i32 0, i32* %22, align 4
  br label %if.merge3
if.else3:
  %23 = load i32, i32* %0, align 4
  %24 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %23
  %25 = load i32, i32* %8, align 4
  %26 = getelementptr inbounds [16 x i32], [16 x i32]* %24, i32 0, i32 %25
  store i32 65535, i32* %26, align 4
  br label %if.merge3
if.merge3:
  %27 = load i32, i32* %8, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %8, align 4
  br label %while.cond.5
while.merge.5:
  %29 = load i32, i32* %0, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %0, align 4
  br label %while.cond.4
while.merge.4:
  store i32 1, i32* %0, align 4
  br label %while.cond.6
while.cond.6:
  %31 = load i32, i32* %0, align 4
  %32 = load i32, i32* @m, align 4
  %33 = icmp sle i32 %31, %32
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %while.body.6, label %while.merge.6
while.body.6:
  %36 = alloca i32, align 4
  %37 = call i32 @getint()
  store i32 %37, i32* %36, align 4
  %38 = alloca i32, align 4
  %39 = call i32 @getint()
  store i32 %39, i32* %38, align 4
  %40 = load i32, i32* %36, align 4
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %40
  %42 = load i32, i32* %38, align 4
  %43 = getelementptr inbounds [16 x i32], [16 x i32]* %41, i32 0, i32 %42
  %44 = call i32 @getint()
  store i32 %44, i32* %43, align 4
  %45 = load i32, i32* %0, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %0, align 4
  br label %while.cond.6
while.merge.6:
  call void @Dijkstra()
  store i32 1, i32* %0, align 4
  br label %while.cond.7
while.cond.7:
  %47 = load i32, i32* %0, align 4
  %48 = load i32, i32* @n, align 4
  %49 = icmp sle i32 %47, %48
  %50 = zext i1 %49 to i32
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %while.body.7, label %while.merge.7
while.body.7:
  %52 = load i32, i32* %0, align 4
  %53 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %52
  %54 = load i32, i32* %53, align 4
  call void @putint(i32 %54)
  call void @putch(i32 32)
  %55 = load i32, i32* %0, align 4
  %56 = add i32 %55, 1
  store i32 %56, i32* %0, align 4
  br label %while.cond.7
while.merge.7:
  call void @putch(i32 10)
  ret i32 0
}

