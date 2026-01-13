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
  %8 = alloca i32, align 4
  %9 = load i32, i32* %0, align 4
  %10 = load i32, i32* %1, align 4
  %11 = add i32 %9, %10
  %12 = sdiv i32 %11, 2
  store i32 %12, i32* %8, align 4
  %13 = load i32, i32* %0, align 4
  %14 = load i32, i32* %8, align 4
  call void @merge_sort(i32 %13, i32 %14)
  %15 = load i32, i32* %8, align 4
  %16 = load i32, i32* %1, align 4
  call void @merge_sort(i32 %15, i32 %16)
  %17 = alloca i32, align 4
  %18 = load i32, i32* %0, align 4
  store i32 %18, i32* %17, align 4
  %19 = alloca i32, align 4
  %20 = load i32, i32* %8, align 4
  store i32 %20, i32* %19, align 4
  %21 = alloca i32, align 4
  %22 = load i32, i32* %0, align 4
  store i32 %22, i32* %21, align 4
  br label %while.cond.0
while.cond.0:
  %23 = load i32, i32* %17, align 4
  %24 = load i32, i32* %8, align 4
  %25 = icmp slt i32 %23, %24
  %26 = zext i1 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %land.rhs1, label %land.merge2
land.rhs1:
  %28 = load i32, i32* %19, align 4
  %29 = load i32, i32* %1, align 4
  %30 = icmp slt i32 %28, %29
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  br label %land.merge2
land.merge2:
  %34 = phi i32 [0, %while.cond.0], [%33, %land.rhs1]
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %while.body.0, label %while.merge.0
while.body.0:
  %36 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %37 = load i32, i32* %17, align 4
  %38 = getelementptr inbounds [100 x i32], [100 x i32]* %36, i32 0, i32 %37
  %39 = load i32, i32* %38, align 4
  %40 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %41 = load i32, i32* %19, align 4
  %42 = getelementptr inbounds [100 x i32], [100 x i32]* %40, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  %44 = icmp slt i32 %39, %43
  %45 = zext i1 %44 to i32
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %if.then1, label %if.else1
if.then1:
  %47 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %48 = load i32, i32* %21, align 4
  %49 = getelementptr inbounds [100 x i32], [100 x i32]* %47, i32 0, i32 %48
  %50 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %51 = load i32, i32* %17, align 4
  %52 = getelementptr inbounds [100 x i32], [100 x i32]* %50, i32 0, i32 %51
  %53 = load i32, i32* %52, align 4
  store i32 %53, i32* %49, align 4
  %54 = load i32, i32* %17, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %17, align 4
  br label %if.merge1
if.else1:
  %56 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %57 = load i32, i32* %21, align 4
  %58 = getelementptr inbounds [100 x i32], [100 x i32]* %56, i32 0, i32 %57
  %59 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %60 = load i32, i32* %19, align 4
  %61 = getelementptr inbounds [100 x i32], [100 x i32]* %59, i32 0, i32 %60
  %62 = load i32, i32* %61, align 4
  store i32 %62, i32* %58, align 4
  %63 = load i32, i32* %19, align 4
  %64 = add i32 %63, 1
  store i32 %64, i32* %19, align 4
  br label %if.merge1
if.merge1:
  %65 = load i32, i32* %21, align 4
  %66 = add i32 %65, 1
  store i32 %66, i32* %21, align 4
  br label %while.cond.0
while.merge.0:
  br label %while.cond.1
while.cond.1:
  %67 = load i32, i32* %17, align 4
  %68 = load i32, i32* %8, align 4
  %69 = icmp slt i32 %67, %68
  %70 = zext i1 %69 to i32
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %while.body.1, label %while.merge.1
while.body.1:
  %72 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %73 = load i32, i32* %21, align 4
  %74 = getelementptr inbounds [100 x i32], [100 x i32]* %72, i32 0, i32 %73
  %75 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %76 = load i32, i32* %17, align 4
  %77 = getelementptr inbounds [100 x i32], [100 x i32]* %75, i32 0, i32 %76
  %78 = load i32, i32* %77, align 4
  store i32 %78, i32* %74, align 4
  %79 = load i32, i32* %17, align 4
  %80 = add i32 %79, 1
  store i32 %80, i32* %17, align 4
  %81 = load i32, i32* %21, align 4
  %82 = add i32 %81, 1
  store i32 %82, i32* %21, align 4
  br label %while.cond.1
while.merge.1:
  br label %while.cond.2
while.cond.2:
  %83 = load i32, i32* %19, align 4
  %84 = load i32, i32* %1, align 4
  %85 = icmp slt i32 %83, %84
  %86 = zext i1 %85 to i32
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %while.body.2, label %while.merge.2
while.body.2:
  %88 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %89 = load i32, i32* %21, align 4
  %90 = getelementptr inbounds [100 x i32], [100 x i32]* %88, i32 0, i32 %89
  %91 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %92 = load i32, i32* %19, align 4
  %93 = getelementptr inbounds [100 x i32], [100 x i32]* %91, i32 0, i32 %92
  %94 = load i32, i32* %93, align 4
  store i32 %94, i32* %90, align 4
  %95 = load i32, i32* %19, align 4
  %96 = add i32 %95, 1
  store i32 %96, i32* %19, align 4
  %97 = load i32, i32* %21, align 4
  %98 = add i32 %97, 1
  store i32 %98, i32* %21, align 4
  br label %while.cond.2
while.merge.2:
  br label %while.cond.3
while.cond.3:
  %99 = load i32, i32* %0, align 4
  %100 = load i32, i32* %1, align 4
  %101 = icmp slt i32 %99, %100
  %102 = zext i1 %101 to i32
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %while.body.3, label %while.merge.3
while.body.3:
  %104 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %105 = load i32, i32* %0, align 4
  %106 = getelementptr inbounds [100 x i32], [100 x i32]* %104, i32 0, i32 %105
  %107 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 1
  %108 = load i32, i32* %0, align 4
  %109 = getelementptr inbounds [100 x i32], [100 x i32]* %107, i32 0, i32 %108
  %110 = load i32, i32* %109, align 4
  store i32 %110, i32* %106, align 4
  %111 = load i32, i32* %0, align 4
  %112 = add i32 %111, 1
  store i32 %112, i32* %0, align 4
  br label %while.cond.3
while.merge.3:
  ret void
}

define i32 @main() {
entry3:
  %0 = alloca i32, align 4
  %1 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %2 = getelementptr inbounds [100 x i32], [100 x i32]* %1, i32 0, i32 0
  %3 = call i32 @getarray(i32* %2)
  store i32 %3, i32* %0, align 4
  %4 = load i32, i32* %0, align 4
  call void @merge_sort(i32 0, i32 %4)
  %5 = load i32, i32* %0, align 4
  %6 = getelementptr inbounds [2 x [100 x i32]], [2 x [100 x i32]]* @buf, i32 0, i32 0
  %7 = getelementptr inbounds [100 x i32], [100 x i32]* %6, i32 0, i32 0
  call void @putarray(i32 %5, i32* %7)
  ret i32 0
}

