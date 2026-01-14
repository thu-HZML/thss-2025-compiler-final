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

@buf = dso_local global [2 x [100 x i32]] zeroinitializer, align 4

define void @merge_sort(i32 %arg0, i32 %arg1) {
entry0:
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  %3 = add i32 %2, 1
  %4 = load i32, i32* %1, align 4
  %5 = icmp sge i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.merge0
if.then0:
  ret void
if.merge0:
  %8 = load i32, i32* %0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = add i32 %8, %9
  %11 = sdiv i32 %10, 2
  store i32 %11, i32* %alloc_0, align 4
  %12 = load i32, i32* %0, align 4
  %13 = load i32, i32* %alloc_0, align 4
  call void @merge_sort(i32 %12, i32 %13)
  %14 = load i32, i32* %alloc_0, align 4
  %15 = load i32, i32* %1, align 4
  call void @merge_sort(i32 %14, i32 %15)
  %16 = load i32, i32* %0, align 4
  store i32 %16, i32* %alloc_1, align 4
  %17 = load i32, i32* %alloc_0, align 4
  store i32 %17, i32* %alloc_2, align 4
  %18 = load i32, i32* %0, align 4
  store i32 %18, i32* %alloc_3, align 4
  br label %while.cond.0
while.cond.0:
  %19 = load i32, i32* %alloc_1, align 4
  %20 = load i32, i32* %alloc_0, align 4
  %21 = icmp slt i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs1, label %land.merge2
land.rhs1:
  %24 = load i32, i32* %alloc_2, align 4
  %25 = load i32, i32* %1, align 4
  %26 = icmp slt i32 %24, %25
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  %29 = zext i1 %28 to i32
  br label %land.merge2
land.merge2:
  %30 = phi i32 [0, %while.cond.0], [%29, %land.rhs1]
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %while.body.0, label %while.merge.0
while.body.0:
  %32 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %33 = load i32, i32* %alloc_1, align 4
  %34 = getelementptr inbounds [100 x i32], [100 x i32]* %32, i32 0, i32 %33
  %35 = load i32, i32* %34, align 4
  %36 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %37 = load i32, i32* %alloc_2, align 4
  %38 = getelementptr inbounds [100 x i32], [100 x i32]* %36, i32 0, i32 %37
  %39 = load i32, i32* %38, align 4
  %40 = icmp slt i32 %35, %39
  %41 = zext i1 %40 to i32
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %if.then1, label %if.else1
if.then1:
  %43 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %44 = load i32, i32* %alloc_3, align 4
  %45 = getelementptr inbounds [100 x i32], [100 x i32]* %43, i32 0, i32 %44
  %46 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %47 = load i32, i32* %alloc_1, align 4
  %48 = getelementptr inbounds [100 x i32], [100 x i32]* %46, i32 0, i32 %47
  %49 = load i32, i32* %48, align 4
  store i32 %49, i32* %45, align 4
  %50 = load i32, i32* %alloc_1, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %alloc_1, align 4
  br label %if.merge1
if.else1:
  %52 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %53 = load i32, i32* %alloc_3, align 4
  %54 = getelementptr inbounds [100 x i32], [100 x i32]* %52, i32 0, i32 %53
  %55 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %56 = load i32, i32* %alloc_2, align 4
  %57 = getelementptr inbounds [100 x i32], [100 x i32]* %55, i32 0, i32 %56
  %58 = load i32, i32* %57, align 4
  store i32 %58, i32* %54, align 4
  %59 = load i32, i32* %alloc_2, align 4
  %60 = add i32 %59, 1
  store i32 %60, i32* %alloc_2, align 4
  br label %if.merge1
if.merge1:
  %61 = load i32, i32* %alloc_3, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %alloc_3, align 4
  br label %while.cond.0
while.merge.0:
  br label %while.cond.1
while.cond.1:
  %63 = load i32, i32* %alloc_1, align 4
  %64 = load i32, i32* %alloc_0, align 4
  %65 = icmp slt i32 %63, %64
  %66 = zext i1 %65 to i32
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %while.body.1, label %while.merge.1
while.body.1:
  %68 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %69 = load i32, i32* %alloc_3, align 4
  %70 = getelementptr inbounds [100 x i32], [100 x i32]* %68, i32 0, i32 %69
  %71 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %72 = load i32, i32* %alloc_1, align 4
  %73 = getelementptr inbounds [100 x i32], [100 x i32]* %71, i32 0, i32 %72
  %74 = load i32, i32* %73, align 4
  store i32 %74, i32* %70, align 4
  %75 = load i32, i32* %alloc_1, align 4
  %76 = add i32 %75, 1
  store i32 %76, i32* %alloc_1, align 4
  %77 = load i32, i32* %alloc_3, align 4
  %78 = add i32 %77, 1
  store i32 %78, i32* %alloc_3, align 4
  br label %while.cond.1
while.merge.1:
  br label %while.cond.2
while.cond.2:
  %79 = load i32, i32* %alloc_2, align 4
  %80 = load i32, i32* %1, align 4
  %81 = icmp slt i32 %79, %80
  %82 = zext i1 %81 to i32
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %while.body.2, label %while.merge.2
while.body.2:
  %84 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %85 = load i32, i32* %alloc_3, align 4
  %86 = getelementptr inbounds [100 x i32], [100 x i32]* %84, i32 0, i32 %85
  %87 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %88 = load i32, i32* %alloc_2, align 4
  %89 = getelementptr inbounds [100 x i32], [100 x i32]* %87, i32 0, i32 %88
  %90 = load i32, i32* %89, align 4
  store i32 %90, i32* %86, align 4
  %91 = load i32, i32* %alloc_2, align 4
  %92 = add i32 %91, 1
  store i32 %92, i32* %alloc_2, align 4
  %93 = load i32, i32* %alloc_3, align 4
  %94 = add i32 %93, 1
  store i32 %94, i32* %alloc_3, align 4
  br label %while.cond.2
while.merge.2:
  br label %while.cond.3
while.cond.3:
  %95 = load i32, i32* %0, align 4
  %96 = load i32, i32* %1, align 4
  %97 = icmp slt i32 %95, %96
  %98 = zext i1 %97 to i32
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %while.body.3, label %while.merge.3
while.body.3:
  %100 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %101 = load i32, i32* %0, align 4
  %102 = getelementptr inbounds [100 x i32], [100 x i32]* %100, i32 0, i32 %101
  %103 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %104 = load i32, i32* %0, align 4
  %105 = getelementptr inbounds [100 x i32], [100 x i32]* %103, i32 0, i32 %104
  %106 = load i32, i32* %105, align 4
  store i32 %106, i32* %102, align 4
  %107 = load i32, i32* %0, align 4
  %108 = add i32 %107, 1
  store i32 %108, i32* %0, align 4
  br label %while.cond.3
while.merge.3:
  ret void
}

define i32 @main() {
entry3:
  %alloc_4 = alloca i32, align 4
  %0 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %1 = getelementptr inbounds [100 x i32], [100 x i32]* %0, i32 0, i32 0
  %2 = call i32 @getarray(i32* %1)
  store i32 %2, i32* %alloc_4, align 4
  %3 = load i32, i32* %alloc_4, align 4
  call void @merge_sort(i32 0, i32 %3)
  %4 = load i32, i32* %alloc_4, align 4
  %5 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %6 = getelementptr inbounds [100 x i32], [100 x i32]* %5, i32 0, i32 0
  call void @putarray(i32 %4, i32* %6)
  ret i32 0
}

