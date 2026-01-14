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

@a = dso_local global i32 -1, align 4
@b = dso_local global i32 1, align 4

define i32 @inc_a() {
entry0:
  %alloc_0 = alloca i32, align 4
  %0 = load i32, i32* @a, align 4
  store i32 %0, i32* %alloc_0, align 4
  %1 = load i32, i32* %alloc_0, align 4
  %2 = add i32 %1, 1
  store i32 %2, i32* %alloc_0, align 4
  %3 = load i32, i32* %alloc_0, align 4
  store i32 %3, i32* @a, align 4
  %4 = load i32, i32* @a, align 4
  ret i32 %4
}

define i32 @main() {
entry1:
  %alloc_1 = alloca i32, align 4
  store i32 5, i32* %alloc_1, align 4
  br label %while.cond.0
while.cond.0:
  %0 = load i32, i32* %alloc_1, align 4
  %1 = icmp sge i32 %0, 0
  %2 = zext i1 %1 to i32
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %while.body.0, label %while.merge.0
while.body.0:
  %4 = call i32 @inc_a()
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %land.rhs2, label %land.merge3
land.rhs2:
  %6 = call i32 @inc_a()
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  br label %land.merge3
land.merge3:
  %9 = phi i32 [0, %while.body.0], [%8, %land.rhs2]
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %land.rhs4, label %land.merge5
land.rhs4:
  %11 = call i32 @inc_a()
  %12 = icmp ne i32 %11, 0
  %13 = zext i1 %12 to i32
  br label %land.merge5
land.merge5:
  %14 = phi i32 [0, %land.merge3], [%13, %land.rhs4]
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %if.then0, label %if.merge0
if.then0:
  %16 = load i32, i32* @a, align 4
  call void @putint(i32 %16)
  call void @putch(i32 32)
  %17 = load i32, i32* @b, align 4
  call void @putint(i32 %17)
  call void @putch(i32 10)
  br label %if.merge0
if.merge0:
  %18 = call i32 @inc_a()
  %19 = icmp slt i32 %18, 14
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %lor.merge7, label %lor.rhs6
lor.rhs6:
  %22 = call i32 @inc_a()
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %land.rhs8, label %land.merge9
land.rhs8:
  %24 = call i32 @inc_a()
  %25 = call i32 @inc_a()
  %26 = sub i32 %24, %25
  %27 = add i32 %26, 1
  %28 = icmp ne i32 %27, 0
  %29 = zext i1 %28 to i32
  br label %land.merge9
land.merge9:
  %30 = phi i32 [0, %lor.rhs6], [%29, %land.rhs8]
  %31 = icmp ne i32 %30, 0
  %32 = zext i1 %31 to i32
  br label %lor.merge7
lor.merge7:
  %33 = phi i32 [1, %if.merge0], [%32, %land.merge9]
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %if.then1, label %if.else1
if.then1:
  %35 = load i32, i32* @a, align 4
  call void @putint(i32 %35)
  call void @putch(i32 10)
  %36 = load i32, i32* @b, align 4
  %37 = mul i32 %36, 2
  store i32 %37, i32* @b, align 4
  br label %if.merge1
if.else1:
  %38 = call i32 @inc_a()
  br label %if.merge1
if.merge1:
  %39 = load i32, i32* %alloc_1, align 4
  %40 = sub i32 %39, 1
  store i32 %40, i32* %alloc_1, align 4
  br label %while.cond.0
while.merge.0:
  %41 = load i32, i32* @a, align 4
  call void @putint(i32 %41)
  call void @putch(i32 32)
  %42 = load i32, i32* @b, align 4
  call void @putint(i32 %42)
  call void @putch(i32 10)
  %43 = load i32, i32* @a, align 4
  ret i32 %43
}

