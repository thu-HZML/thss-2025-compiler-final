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
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 5, i32* %alloc_0, align 4
  store i32 5, i32* %alloc_1, align 4
  store i32 1, i32* %alloc_2, align 4
  store i32 -2, i32* %alloc_3, align 4
  store i32 2, i32* %alloc_4, align 4
  %0 = load i32, i32* %alloc_3, align 4
  %1 = mul i32 %0, 1
  %2 = sdiv i32 %1, 2
  %3 = icmp slt i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %6 = load i32, i32* %alloc_0, align 4
  %7 = load i32, i32* %alloc_1, align 4
  %8 = sub i32 %6, %7
  %9 = icmp ne i32 %8, 0
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %land.rhs3, label %land.merge4
land.rhs3:
  %12 = load i32, i32* %alloc_2, align 4
  %13 = add i32 %12, 3
  %14 = srem i32 %13, 2
  %15 = icmp ne i32 %14, 0
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  %18 = zext i1 %17 to i32
  br label %land.merge4
land.merge4:
  %19 = phi i32 [0, %lor.rhs1], [%18, %land.rhs3]
  %20 = icmp ne i32 %19, 0
  %21 = zext i1 %20 to i32
  br label %lor.merge2
lor.merge2:
  %22 = phi i32 [1, %entry0], [%21, %land.merge4]
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %if.then0, label %if.merge0
if.then0:
  %24 = load i32, i32* %alloc_4, align 4
  call void @putint(i32 %24)
  br label %if.merge0
if.merge0:
  %25 = load i32, i32* %alloc_3, align 4
  %26 = srem i32 %25, 2
  %27 = add i32 %26, 67
  %28 = icmp slt i32 %27, 0
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %lor.merge6, label %lor.rhs5
lor.rhs5:
  %31 = load i32, i32* %alloc_0, align 4
  %32 = load i32, i32* %alloc_1, align 4
  %33 = sub i32 %31, %32
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %land.rhs7, label %land.merge8
land.rhs7:
  %37 = load i32, i32* %alloc_2, align 4
  %38 = add i32 %37, 2
  %39 = srem i32 %38, 2
  %40 = icmp ne i32 %39, 0
  %41 = zext i1 %40 to i32
  %42 = icmp ne i32 %41, 0
  %43 = zext i1 %42 to i32
  br label %land.merge8
land.merge8:
  %44 = phi i32 [0, %lor.rhs5], [%43, %land.rhs7]
  %45 = icmp ne i32 %44, 0
  %46 = zext i1 %45 to i32
  br label %lor.merge6
lor.merge6:
  %47 = phi i32 [1, %if.merge0], [%46, %land.merge8]
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %if.then1, label %if.merge1
if.then1:
  store i32 4, i32* %alloc_4, align 4
  %49 = load i32, i32* %alloc_4, align 4
  call void @putint(i32 %49)
  br label %if.merge1
if.merge1:
  ret i32 0
}

