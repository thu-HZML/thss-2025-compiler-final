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

@ans = dso_local global [50 x i32] zeroinitializer, align 4
@sum = dso_local global i32 0, align 4
@n = dso_local global i32 zeroinitializer, align 4
@row = dso_local global [50 x i32] zeroinitializer, align 4
@line1 = dso_local global [50 x i32] zeroinitializer, align 4
@line2 = dso_local global [100 x i32] zeroinitializer, align 4

define void @printans() {
entry0:
  %alloc_0 = alloca i32, align 4
  %0 = load i32, i32* @sum, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @sum, align 4
  store i32 1, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %alloc_0, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp sle i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = load i32, i32* %alloc_0, align 4
  %8 = getelementptr inbounds [50 x i32], [50 x i32]* @ans, i32 0, i32 %7
  %9 = load i32, i32* %8, align 4
  call void @putint(i32 %9)
  %10 = load i32, i32* %alloc_0, align 4
  %11 = load i32, i32* @n, align 4
  %12 = icmp eq i32 %10, %11
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %if.then0, label %if.else0
if.then0:
  call void @putch(i32 10)
  ret void
if.else0:
  call void @putch(i32 32)
  br label %if.merge0
if.merge0:
  %15 = load i32, i32* %alloc_0, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  ret void
}

define void @f(i32 %arg0) {
entry1:
  %alloc_1 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  store i32 1, i32* %alloc_1, align 4
  br label %while.cond.1
while.cond.1:
  %1 = load i32, i32* %alloc_1, align 4
  %2 = load i32, i32* @n, align 4
  %3 = icmp sle i32 %1, %2
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.1, label %while.merge.1
while.body.1:
  %6 = load i32, i32* %alloc_1, align 4
  %7 = getelementptr inbounds [50 x i32], [50 x i32]* @row, i32 0, i32 %6
  %8 = load i32, i32* %7, align 4
  %9 = icmp ne i32 %8, 1
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %land.rhs2, label %land.merge3
land.rhs2:
  %12 = load i32, i32* %0, align 4
  %13 = load i32, i32* %alloc_1, align 4
  %14 = add i32 %12, %13
  %15 = getelementptr inbounds [50 x i32], [50 x i32]* @line1, i32 0, i32 %14
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %16, 0
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  %20 = zext i1 %19 to i32
  br label %land.merge3
land.merge3:
  %21 = phi i32 [0, %while.body.1], [%20, %land.rhs2]
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %land.rhs4, label %land.merge5
land.rhs4:
  %23 = load i32, i32* @n, align 4
  %24 = load i32, i32* %0, align 4
  %25 = add i32 %23, %24
  %26 = load i32, i32* %alloc_1, align 4
  %27 = sub i32 %25, %26
  %28 = getelementptr inbounds [100 x i32], [100 x i32]* @line2, i32 0, i32 %27
  %29 = load i32, i32* %28, align 4
  %30 = icmp eq i32 %29, 0
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  br label %land.merge5
land.merge5:
  %34 = phi i32 [0, %land.merge3], [%33, %land.rhs4]
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %if.then1, label %if.merge1
if.then1:
  %36 = load i32, i32* %0, align 4
  %37 = getelementptr inbounds [50 x i32], [50 x i32]* @ans, i32 0, i32 %36
  %38 = load i32, i32* %alloc_1, align 4
  store i32 %38, i32* %37, align 4
  %39 = load i32, i32* %0, align 4
  %40 = load i32, i32* @n, align 4
  %41 = icmp eq i32 %39, %40
  %42 = zext i1 %41 to i32
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %if.then2, label %if.merge2
if.then2:
  call void @printans()
  br label %if.merge2
if.merge2:
  %44 = load i32, i32* %alloc_1, align 4
  %45 = getelementptr inbounds [50 x i32], [50 x i32]* @row, i32 0, i32 %44
  store i32 1, i32* %45, align 4
  %46 = load i32, i32* %0, align 4
  %47 = load i32, i32* %alloc_1, align 4
  %48 = add i32 %46, %47
  %49 = getelementptr inbounds [50 x i32], [50 x i32]* @line1, i32 0, i32 %48
  store i32 1, i32* %49, align 4
  %50 = load i32, i32* @n, align 4
  %51 = load i32, i32* %0, align 4
  %52 = add i32 %50, %51
  %53 = load i32, i32* %alloc_1, align 4
  %54 = sub i32 %52, %53
  %55 = getelementptr inbounds [100 x i32], [100 x i32]* @line2, i32 0, i32 %54
  store i32 1, i32* %55, align 4
  %56 = load i32, i32* %0, align 4
  %57 = add i32 %56, 1
  call void @f(i32 %57)
  %58 = load i32, i32* %alloc_1, align 4
  %59 = getelementptr inbounds [50 x i32], [50 x i32]* @row, i32 0, i32 %58
  store i32 0, i32* %59, align 4
  %60 = load i32, i32* %0, align 4
  %61 = load i32, i32* %alloc_1, align 4
  %62 = add i32 %60, %61
  %63 = getelementptr inbounds [50 x i32], [50 x i32]* @line1, i32 0, i32 %62
  store i32 0, i32* %63, align 4
  %64 = load i32, i32* @n, align 4
  %65 = load i32, i32* %0, align 4
  %66 = add i32 %64, %65
  %67 = load i32, i32* %alloc_1, align 4
  %68 = sub i32 %66, %67
  %69 = getelementptr inbounds [100 x i32], [100 x i32]* @line2, i32 0, i32 %68
  store i32 0, i32* %69, align 4
  br label %if.merge1
if.merge1:
  %70 = load i32, i32* %alloc_1, align 4
  %71 = add i32 %70, 1
  store i32 %71, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  ret void
}

define i32 @main() {
entry6:
  %alloc_2 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_2, align 4
  br label %while.cond.2
while.cond.2:
  %1 = load i32, i32* %alloc_2, align 4
  %2 = icmp sgt i32 %1, 0
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.2, label %while.merge.2
while.body.2:
  %5 = call i32 @getint()
  store i32 %5, i32* @n, align 4
  call void @f(i32 1)
  %6 = load i32, i32* %alloc_2, align 4
  %7 = sub i32 %6, 1
  store i32 %7, i32* %alloc_2, align 4
  br label %while.cond.2
while.merge.2:
  %8 = load i32, i32* @sum, align 4
  ret i32 %8
}

