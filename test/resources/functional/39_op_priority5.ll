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

@a = dso_local global i32 1, align 4
@b = dso_local global i32 0, align 4
@c = dso_local global i32 1, align 4
@d = dso_local global i32 2, align 4
@e = dso_local global i32 4, align 4

define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  store i32 0, i32* %0, align 4
  %1 = load i32, i32* @a, align 4
  %2 = load i32, i32* @b, align 4
  %3 = mul i32 %1, %2
  %4 = load i32, i32* @c, align 4
  %5 = sdiv i32 %3, %4
  %6 = load i32, i32* @e, align 4
  %7 = load i32, i32* @d, align 4
  %8 = add i32 %6, %7
  %9 = icmp eq i32 %5, %8
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %land.rhs1, label %land.merge2
land.rhs1:
  %12 = load i32, i32* @a, align 4
  %13 = load i32, i32* @a, align 4
  %14 = load i32, i32* @b, align 4
  %15 = add i32 %13, %14
  %16 = mul i32 %12, %15
  %17 = load i32, i32* @c, align 4
  %18 = add i32 %16, %17
  %19 = load i32, i32* @d, align 4
  %20 = load i32, i32* @e, align 4
  %21 = add i32 %19, %20
  %22 = icmp sle i32 %18, %21
  %23 = zext i1 %22 to i32
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i32
  br label %land.merge2
land.merge2:
  %26 = phi i32 [0, %entry0], [%25, %land.rhs1]
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %lor.merge4, label %lor.rhs3
lor.rhs3:
  %28 = load i32, i32* @a, align 4
  %29 = load i32, i32* @b, align 4
  %30 = load i32, i32* @c, align 4
  %31 = mul i32 %29, %30
  %32 = sub i32 %28, %31
  %33 = load i32, i32* @d, align 4
  %34 = load i32, i32* @a, align 4
  %35 = load i32, i32* @c, align 4
  %36 = sdiv i32 %34, %35
  %37 = sub i32 %33, %36
  %38 = icmp eq i32 %32, %37
  %39 = zext i1 %38 to i32
  %40 = icmp ne i32 %39, 0
  %41 = zext i1 %40 to i32
  br label %lor.merge4
lor.merge4:
  %42 = phi i32 [1, %land.merge2], [%41, %lor.rhs3]
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %if.then0, label %if.merge0
if.then0:
  store i32 1, i32* %0, align 4
  br label %if.merge0
if.merge0:
  %44 = load i32, i32* %0, align 4
  call void @putint(i32 %44)
  %45 = load i32, i32* %0, align 4
  ret i32 %45
}

