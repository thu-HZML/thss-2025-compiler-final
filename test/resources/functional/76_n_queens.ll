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
  %0 = load i32, i32* @sum, align 4
  %1 = add i32 %0, 1
  store i32 %1, i32* @sum, align 4
  %2 = alloca i32, align 4
  store i32 1, i32* %2, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* @n, align 4
  %5 = icmp sle i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.0, label %while.merge.0
while.body.0:
  %8 = load i32, i32* %2, align 4
  %9 = getelementptr inbounds [50 x i32], [50 x i32]* @ans, i32 0, i32 %8
  %10 = load i32, i32* %9, align 4
  call void @putint(i32 %10)
  %11 = load i32, i32* %2, align 4
  %12 = load i32, i32* @n, align 4
  %13 = icmp eq i32 %11, %12
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %if.then0, label %if.else0
if.then0:
  call void @putch(i32 10)
  ret void
if.else0:
  call void @putch(i32 32)
  br label %if.merge0
if.merge0:
  %16 = load i32, i32* %2, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* %2, align 4
  br label %while.cond.0
while.merge.0:
  ret void
}

define void @f(i32 %arg0) {
entry1:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  br label %while.cond.1
while.cond.1:
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* @n, align 4
  %4 = icmp sle i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.1, label %while.merge.1
while.body.1:
  %7 = load i32, i32* %1, align 4
  %8 = getelementptr inbounds [50 x i32], [50 x i32]* @row, i32 0, i32 %7
  %9 = load i32, i32* %8, align 4
  %10 = icmp ne i32 %9, 1
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %land.rhs2, label %land.merge3
land.rhs2:
  %13 = load i32, i32* %0, align 4
  %14 = load i32, i32* %1, align 4
  %15 = add i32 %13, %14
  %16 = getelementptr inbounds [50 x i32], [50 x i32]* @line1, i32 0, i32 %15
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  %19 = zext i1 %18 to i32
  %20 = icmp ne i32 %19, 0
  %21 = zext i1 %20 to i32
  br label %land.merge3
land.merge3:
  %22 = phi i32 [0, %while.body.1], [%21, %land.rhs2]
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs4, label %land.merge5
land.rhs4:
  %24 = load i32, i32* @n, align 4
  %25 = load i32, i32* %0, align 4
  %26 = add i32 %24, %25
  %27 = load i32, i32* %1, align 4
  %28 = sub i32 %26, %27
  %29 = getelementptr inbounds [100 x i32], [100 x i32]* @line2, i32 0, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  %34 = zext i1 %33 to i32
  br label %land.merge5
land.merge5:
  %35 = phi i32 [0, %land.merge3], [%34, %land.rhs4]
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %if.then1, label %if.merge1
if.then1:
  %37 = load i32, i32* %0, align 4
  %38 = getelementptr inbounds [50 x i32], [50 x i32]* @ans, i32 0, i32 %37
  %39 = load i32, i32* %1, align 4
  store i32 %39, i32* %38, align 4
  %40 = load i32, i32* %0, align 4
  %41 = load i32, i32* @n, align 4
  %42 = icmp eq i32 %40, %41
  %43 = zext i1 %42 to i32
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %if.then2, label %if.merge2
if.then2:
  call void @printans()
  br label %if.merge2
if.merge2:
  %45 = load i32, i32* %1, align 4
  %46 = getelementptr inbounds [50 x i32], [50 x i32]* @row, i32 0, i32 %45
  store i32 1, i32* %46, align 4
  %47 = load i32, i32* %0, align 4
  %48 = load i32, i32* %1, align 4
  %49 = add i32 %47, %48
  %50 = getelementptr inbounds [50 x i32], [50 x i32]* @line1, i32 0, i32 %49
  store i32 1, i32* %50, align 4
  %51 = load i32, i32* @n, align 4
  %52 = load i32, i32* %0, align 4
  %53 = add i32 %51, %52
  %54 = load i32, i32* %1, align 4
  %55 = sub i32 %53, %54
  %56 = getelementptr inbounds [100 x i32], [100 x i32]* @line2, i32 0, i32 %55
  store i32 1, i32* %56, align 4
  %57 = load i32, i32* %0, align 4
  %58 = add i32 %57, 1
  call void @f(i32 %58)
  %59 = load i32, i32* %1, align 4
  %60 = getelementptr inbounds [50 x i32], [50 x i32]* @row, i32 0, i32 %59
  store i32 0, i32* %60, align 4
  %61 = load i32, i32* %0, align 4
  %62 = load i32, i32* %1, align 4
  %63 = add i32 %61, %62
  %64 = getelementptr inbounds [50 x i32], [50 x i32]* @line1, i32 0, i32 %63
  store i32 0, i32* %64, align 4
  %65 = load i32, i32* @n, align 4
  %66 = load i32, i32* %0, align 4
  %67 = add i32 %65, %66
  %68 = load i32, i32* %1, align 4
  %69 = sub i32 %67, %68
  %70 = getelementptr inbounds [100 x i32], [100 x i32]* @line2, i32 0, i32 %69
  store i32 0, i32* %70, align 4
  br label %if.merge1
if.merge1:
  %71 = load i32, i32* %1, align 4
  %72 = add i32 %71, 1
  store i32 %72, i32* %1, align 4
  br label %while.cond.1
while.merge.1:
  ret void
}

define i32 @main() {
entry6:
  %0 = alloca i32, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* %0, align 4
  br label %while.cond.2
while.cond.2:
  %2 = load i32, i32* %0, align 4
  %3 = icmp sgt i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.2, label %while.merge.2
while.body.2:
  %6 = call i32 @getint()
  store i32 %6, i32* @n, align 4
  call void @f(i32 1)
  %7 = load i32, i32* %0, align 4
  %8 = sub i32 %7, 1
  store i32 %8, i32* %0, align 4
  br label %while.cond.2
while.merge.2:
  %9 = load i32, i32* @sum, align 4
  ret i32 %9
}

