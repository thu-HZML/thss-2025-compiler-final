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


define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %0, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %0, align 4
  %4 = icmp slt i32 %3, 10
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = load i32, i32* %0, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i32 0, i32 %7
  %9 = load i32, i32* %0, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %8, align 4
  %11 = load i32, i32* %0, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 10, i32* %17, align 4
  %18 = call i32 @getint()
  store i32 %18, i32* %13, align 4
  %19 = load i32, i32* %17, align 4
  %20 = sub i32 %19, 1
  store i32 %20, i32* %14, align 4
  store i32 0, i32* %15, align 4
  %21 = load i32, i32* %14, align 4
  %22 = load i32, i32* %15, align 4
  %23 = add i32 %21, %22
  %24 = sdiv i32 %23, 2
  store i32 %24, i32* %16, align 4
  br label %while.cond.1
while.cond.1:
  %25 = load i32, i32* %16, align 4
  %26 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i32 0, i32 %25
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* %13, align 4
  %29 = icmp ne i32 %27, %28
  %30 = zext i1 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %land.rhs1, label %land.merge2
land.rhs1:
  %32 = load i32, i32* %15, align 4
  %33 = load i32, i32* %14, align 4
  %34 = icmp slt i32 %32, %33
  %35 = zext i1 %34 to i32
  %36 = icmp ne i32 %35, 0
  %37 = zext i1 %36 to i32
  br label %land.merge2
land.merge2:
  %38 = phi i32 [0, %while.cond.1], [%37, %land.rhs1]
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %while.body.1, label %while.merge.1
while.body.1:
  %40 = load i32, i32* %14, align 4
  %41 = load i32, i32* %15, align 4
  %42 = add i32 %40, %41
  %43 = sdiv i32 %42, 2
  store i32 %43, i32* %16, align 4
  %44 = load i32, i32* %13, align 4
  %45 = load i32, i32* %16, align 4
  %46 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i32 0, i32 %45
  %47 = load i32, i32* %46, align 4
  %48 = icmp slt i32 %44, %47
  %49 = zext i1 %48 to i32
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %if.then0, label %if.else0
if.then0:
  %51 = load i32, i32* %16, align 4
  %52 = sub i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %if.merge0
if.else0:
  %53 = load i32, i32* %16, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %15, align 4
  br label %if.merge0
if.merge0:
  br label %while.cond.1
while.merge.1:
  %55 = load i32, i32* %13, align 4
  %56 = load i32, i32* %16, align 4
  %57 = getelementptr inbounds [10 x i32], [10 x i32]* %2, i32 0, i32 %56
  %58 = load i32, i32* %57, align 4
  %59 = icmp eq i32 %55, %58
  %60 = zext i1 %59 to i32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %if.then1, label %if.else1
if.then1:
  %62 = load i32, i32* %13, align 4
  call void @putint(i32 %62)
  br label %if.merge1
if.else1:
  store i32 0, i32* %13, align 4
  %63 = load i32, i32* %13, align 4
  call void @putint(i32 %63)
  br label %if.merge1
if.merge1:
  store i32 10, i32* %13, align 4
  %64 = load i32, i32* %13, align 4
  call void @putch(i32 %64)
  ret i32 0
}

