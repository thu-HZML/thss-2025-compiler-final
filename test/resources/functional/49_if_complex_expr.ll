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
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 5, i32* %0, align 4
  store i32 5, i32* %1, align 4
  store i32 1, i32* %2, align 4
  store i32 -2, i32* %3, align 4
  store i32 2, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = mul i32 %5, 1
  %7 = sdiv i32 %6, 2
  %8 = icmp slt i32 %7, 0
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %11 = load i32, i32* %0, align 4
  %12 = load i32, i32* %1, align 4
  %13 = sub i32 %11, %12
  %14 = icmp ne i32 %13, 0
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %land.rhs3, label %land.merge4
land.rhs3:
  %17 = load i32, i32* %2, align 4
  %18 = add i32 %17, 3
  %19 = srem i32 %18, 2
  %20 = icmp ne i32 %19, 0
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %land.merge4
land.merge4:
  %24 = phi i32 [0, %lor.rhs1], [%23, %land.rhs3]
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  br label %lor.merge2
lor.merge2:
  %27 = phi i32 [1, %entry0], [%26, %land.merge4]
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %if.then0, label %if.merge0
if.then0:
  %29 = load i32, i32* %4, align 4
  call void @putint(i32 %29)
  br label %if.merge0
if.merge0:
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 2
  %32 = add i32 %31, 67
  %33 = icmp slt i32 %32, 0
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %lor.merge6, label %lor.rhs5
lor.rhs5:
  %36 = load i32, i32* %0, align 4
  %37 = load i32, i32* %1, align 4
  %38 = sub i32 %36, %37
  %39 = icmp ne i32 %38, 0
  %40 = zext i1 %39 to i32
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %land.rhs7, label %land.merge8
land.rhs7:
  %42 = load i32, i32* %2, align 4
  %43 = add i32 %42, 2
  %44 = srem i32 %43, 2
  %45 = icmp ne i32 %44, 0
  %46 = zext i1 %45 to i32
  %47 = icmp ne i32 %46, 0
  %48 = zext i1 %47 to i32
  br label %land.merge8
land.merge8:
  %49 = phi i32 [0, %lor.rhs5], [%48, %land.rhs7]
  %50 = icmp ne i32 %49, 0
  %51 = zext i1 %50 to i32
  br label %lor.merge6
lor.merge6:
  %52 = phi i32 [1, %if.merge0], [%51, %land.merge8]
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %if.then1, label %if.merge1
if.then1:
  store i32 4, i32* %4, align 4
  %54 = load i32, i32* %4, align 4
  call void @putint(i32 %54)
  br label %if.merge1
if.merge1:
  ret i32 0
}

