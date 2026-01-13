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
  %0 = alloca i32, align 4
  %1 = load i32, i32* @a, align 4
  store i32 %1, i32* %0, align 4
  %2 = load i32, i32* %0, align 4
  %3 = add i32 %2, 1
  store i32 %3, i32* %0, align 4
  %4 = load i32, i32* %0, align 4
  store i32 %4, i32* @a, align 4
  %5 = load i32, i32* @a, align 4
  ret i32 %5
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  store i32 5, i32* %0, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %0, align 4
  %2 = icmp sge i32 %1, 0
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = call i32 @inc_a()
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %land.rhs2, label %land.merge3
land.rhs2:
  %7 = call i32 @inc_a()
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  br label %land.merge3
land.merge3:
  %10 = phi i32 [0, %while.body.0], [%9, %land.rhs2]
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %land.rhs4, label %land.merge5
land.rhs4:
  %12 = call i32 @inc_a()
  %13 = icmp ne i32 %12, 0
  %14 = zext i1 %13 to i32
  br label %land.merge5
land.merge5:
  %15 = phi i32 [0, %land.merge3], [%14, %land.rhs4]
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %if.then0, label %if.merge0
if.then0:
  %17 = load i32, i32* @a, align 4
  call void @putint(i32 %17)
  call void @putch(i32 32)
  %18 = load i32, i32* @b, align 4
  call void @putint(i32 %18)
  call void @putch(i32 10)
  br label %if.merge0
if.merge0:
  %19 = call i32 @inc_a()
  %20 = icmp slt i32 %19, 14
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %lor.merge7, label %lor.rhs6
lor.rhs6:
  %23 = call i32 @inc_a()
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %land.rhs8, label %land.merge9
land.rhs8:
  %25 = call i32 @inc_a()
  %26 = call i32 @inc_a()
  %27 = sub i32 %25, %26
  %28 = add i32 %27, 1
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  br label %land.merge9
land.merge9:
  %31 = phi i32 [0, %lor.rhs6], [%30, %land.rhs8]
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  br label %lor.merge7
lor.merge7:
  %34 = phi i32 [1, %if.merge0], [%33, %land.merge9]
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %if.then1, label %if.else1
if.then1:
  %36 = load i32, i32* @a, align 4
  call void @putint(i32 %36)
  call void @putch(i32 10)
  %37 = load i32, i32* @b, align 4
  %38 = mul i32 %37, 2
  store i32 %38, i32* @b, align 4
  br label %if.merge1
if.else1:
  %39 = call i32 @inc_a()
  br label %if.merge1
if.merge1:
  %40 = load i32, i32* %0, align 4
  %41 = sub i32 %40, 1
  store i32 %41, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %42 = load i32, i32* @a, align 4
  call void @putint(i32 %42)
  call void @putch(i32 32)
  %43 = load i32, i32* @b, align 4
  call void @putint(i32 %43)
  call void @putch(i32 10)
  %44 = load i32, i32* @a, align 4
  ret i32 %44
}

