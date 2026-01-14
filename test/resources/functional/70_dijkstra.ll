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
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 1, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %0 = load i32, i32* %alloc_0, align 4
  %1 = load i32, i32* @n, align 4
  %2 = icmp sle i32 %0, %1
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = load i32, i32* %alloc_0, align 4
  %6 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %5
  %7 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 1
  %8 = load i32, i32* %alloc_0, align 4
  %9 = getelementptr inbounds [16 x i32], [16 x i32]* %7, i32 0, i32 %8
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %6, align 4
  %11 = load i32, i32* %alloc_0, align 4
  %12 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 %11
  store i32 0, i32* %12, align 4
  %13 = load i32, i32* %alloc_0, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  %15 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 1
  store i32 1, i32* %15, align 4
  store i32 1, i32* %alloc_0, align 4
  br label %while.cond.1
while.cond.1:
  %16 = load i32, i32* %alloc_0, align 4
  %17 = load i32, i32* @n, align 4
  %18 = sub i32 %17, 1
  %19 = icmp sle i32 %16, %18
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %while.body.1, label %while.merge.1
while.body.1:
  store i32 65535, i32* %alloc_2, align 4
  store i32 0, i32* %alloc_3, align 4
  store i32 1, i32* %alloc_4, align 4
  br label %while.cond.2
while.cond.2:
  %22 = load i32, i32* %alloc_4, align 4
  %23 = load i32, i32* @n, align 4
  %24 = icmp sle i32 %22, %23
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %while.body.2, label %while.merge.2
while.body.2:
  %27 = load i32, i32* %alloc_2, align 4
  %28 = load i32, i32* %alloc_4, align 4
  %29 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = icmp sgt i32 %27, %30
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %land.rhs1, label %land.merge2
land.rhs1:
  %34 = load i32, i32* %alloc_4, align 4
  %35 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 %34
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 0
  %38 = zext i1 %37 to i32
  %39 = icmp ne i32 %38, 0
  %40 = zext i1 %39 to i32
  br label %land.merge2
land.merge2:
  %41 = phi i32 [0, %while.body.2], [%40, %land.rhs1]
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %if.then0, label %if.merge0
if.then0:
  %43 = load i32, i32* %alloc_4, align 4
  %44 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %43
  %45 = load i32, i32* %44, align 4
  store i32 %45, i32* %alloc_2, align 4
  %46 = load i32, i32* %alloc_4, align 4
  store i32 %46, i32* %alloc_3, align 4
  br label %if.merge0
if.merge0:
  %47 = load i32, i32* %alloc_4, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %alloc_4, align 4
  br label %while.cond.2
while.merge.2:
  %49 = load i32, i32* %alloc_3, align 4
  %50 = getelementptr inbounds [16 x i32], [16 x i32]* @book, i32 0, i32 %49
  store i32 1, i32* %50, align 4
  store i32 1, i32* %alloc_5, align 4
  br label %while.cond.3
while.cond.3:
  %51 = load i32, i32* %alloc_5, align 4
  %52 = load i32, i32* @n, align 4
  %53 = icmp sle i32 %51, %52
  %54 = zext i1 %53 to i32
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %while.body.3, label %while.merge.3
while.body.3:
  %56 = load i32, i32* %alloc_3, align 4
  %57 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %56
  %58 = load i32, i32* %alloc_5, align 4
  %59 = getelementptr inbounds [16 x i32], [16 x i32]* %57, i32 0, i32 %58
  %60 = load i32, i32* %59, align 4
  %61 = icmp slt i32 %60, 65535
  %62 = zext i1 %61 to i32
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %if.then1, label %if.merge1
if.then1:
  %64 = load i32, i32* %alloc_5, align 4
  %65 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %64
  %66 = load i32, i32* %65, align 4
  %67 = load i32, i32* %alloc_3, align 4
  %68 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %67
  %69 = load i32, i32* %68, align 4
  %70 = load i32, i32* %alloc_3, align 4
  %71 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %70
  %72 = load i32, i32* %alloc_5, align 4
  %73 = getelementptr inbounds [16 x i32], [16 x i32]* %71, i32 0, i32 %72
  %74 = load i32, i32* %73, align 4
  %75 = add i32 %69, %74
  %76 = icmp sgt i32 %66, %75
  %77 = zext i1 %76 to i32
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %if.then2, label %if.merge2
if.then2:
  %79 = load i32, i32* %alloc_5, align 4
  %80 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %79
  %81 = load i32, i32* %alloc_3, align 4
  %82 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %81
  %83 = load i32, i32* %82, align 4
  %84 = load i32, i32* %alloc_3, align 4
  %85 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %84
  %86 = load i32, i32* %alloc_5, align 4
  %87 = getelementptr inbounds [16 x i32], [16 x i32]* %85, i32 0, i32 %86
  %88 = load i32, i32* %87, align 4
  %89 = add i32 %83, %88
  store i32 %89, i32* %80, align 4
  br label %if.merge2
if.merge2:
  br label %if.merge1
if.merge1:
  %90 = load i32, i32* %alloc_5, align 4
  %91 = add i32 %90, 1
  store i32 %91, i32* %alloc_5, align 4
  br label %while.cond.3
while.merge.3:
  %92 = load i32, i32* %alloc_0, align 4
  %93 = add i32 %92, 1
  store i32 %93, i32* %alloc_0, align 4
  br label %while.cond.1
while.merge.1:
  ret void
}

define i32 @main() {
entry3:
  %alloc_9 = alloca i32, align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* @n, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* @m, align 4
  store i32 1, i32* %alloc_6, align 4
  br label %while.cond.4
while.cond.4:
  %2 = load i32, i32* %alloc_6, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp sle i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.4, label %while.merge.4
while.body.4:
  store i32 1, i32* %alloc_7, align 4
  br label %while.cond.5
while.cond.5:
  %7 = load i32, i32* %alloc_7, align 4
  %8 = load i32, i32* @n, align 4
  %9 = icmp sle i32 %7, %8
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %while.body.5, label %while.merge.5
while.body.5:
  %12 = load i32, i32* %alloc_6, align 4
  %13 = load i32, i32* %alloc_7, align 4
  %14 = icmp eq i32 %12, %13
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %if.then3, label %if.else3
if.then3:
  %17 = load i32, i32* %alloc_6, align 4
  %18 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %17
  %19 = load i32, i32* %alloc_7, align 4
  %20 = getelementptr inbounds [16 x i32], [16 x i32]* %18, i32 0, i32 %19
  store i32 0, i32* %20, align 4
  br label %if.merge3
if.else3:
  %21 = load i32, i32* %alloc_6, align 4
  %22 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %21
  %23 = load i32, i32* %alloc_7, align 4
  %24 = getelementptr inbounds [16 x i32], [16 x i32]* %22, i32 0, i32 %23
  store i32 65535, i32* %24, align 4
  br label %if.merge3
if.merge3:
  %25 = load i32, i32* %alloc_7, align 4
  %26 = add i32 %25, 1
  store i32 %26, i32* %alloc_7, align 4
  br label %while.cond.5
while.merge.5:
  %27 = load i32, i32* %alloc_6, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %alloc_6, align 4
  br label %while.cond.4
while.merge.4:
  store i32 1, i32* %alloc_6, align 4
  br label %while.cond.6
while.cond.6:
  %29 = load i32, i32* %alloc_6, align 4
  %30 = load i32, i32* @m, align 4
  %31 = icmp sle i32 %29, %30
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %while.body.6, label %while.merge.6
while.body.6:
  %34 = call i32 @getint()
  store i32 %34, i32* %alloc_8, align 4
  %35 = call i32 @getint()
  store i32 %35, i32* %alloc_9, align 4
  %36 = load i32, i32* %alloc_8, align 4
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %36
  %38 = load i32, i32* %alloc_9, align 4
  %39 = getelementptr inbounds [16 x i32], [16 x i32]* %37, i32 0, i32 %38
  %40 = call i32 @getint()
  store i32 %40, i32* %39, align 4
  %41 = load i32, i32* %alloc_6, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %alloc_6, align 4
  br label %while.cond.6
while.merge.6:
  call void @Dijkstra()
  store i32 1, i32* %alloc_6, align 4
  br label %while.cond.7
while.cond.7:
  %43 = load i32, i32* %alloc_6, align 4
  %44 = load i32, i32* @n, align 4
  %45 = icmp sle i32 %43, %44
  %46 = zext i1 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %while.body.7, label %while.merge.7
while.body.7:
  %48 = load i32, i32* %alloc_6, align 4
  %49 = getelementptr inbounds [16 x i32], [16 x i32]* @dis, i32 0, i32 %48
  %50 = load i32, i32* %49, align 4
  call void @putint(i32 %50)
  call void @putch(i32 32)
  %51 = load i32, i32* %alloc_6, align 4
  %52 = add i32 %51, 1
  store i32 %52, i32* %alloc_6, align 4
  br label %while.cond.7
while.merge.7:
  call void @putch(i32 10)
  ret i32 0
}

