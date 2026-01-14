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
  %alloc_0 = alloca i32, align 4
  store i32 0, i32* %alloc_0, align 4
  %0 = load i32, i32* @a, align 4
  %1 = load i32, i32* @b, align 4
  %2 = mul i32 %0, %1
  %3 = load i32, i32* @c, align 4
  %4 = sdiv i32 %2, %3
  %5 = load i32, i32* @e, align 4
  %6 = load i32, i32* @d, align 4
  %7 = add i32 %5, %6
  %8 = icmp eq i32 %4, %7
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %land.rhs1, label %land.merge2
land.rhs1:
  %11 = load i32, i32* @a, align 4
  %12 = load i32, i32* @a, align 4
  %13 = load i32, i32* @b, align 4
  %14 = add i32 %12, %13
  %15 = mul i32 %11, %14
  %16 = load i32, i32* @c, align 4
  %17 = add i32 %15, %16
  %18 = load i32, i32* @d, align 4
  %19 = load i32, i32* @e, align 4
  %20 = add i32 %18, %19
  %21 = icmp sle i32 %17, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  %24 = zext i1 %23 to i32
  br label %land.merge2
land.merge2:
  %25 = phi i32 [0, %entry0], [%24, %land.rhs1]
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %lor.merge4, label %lor.rhs3
lor.rhs3:
  %27 = load i32, i32* @a, align 4
  %28 = load i32, i32* @b, align 4
  %29 = load i32, i32* @c, align 4
  %30 = mul i32 %28, %29
  %31 = sub i32 %27, %30
  %32 = load i32, i32* @d, align 4
  %33 = load i32, i32* @a, align 4
  %34 = load i32, i32* @c, align 4
  %35 = sdiv i32 %33, %34
  %36 = sub i32 %32, %35
  %37 = icmp eq i32 %31, %36
  %38 = zext i1 %37 to i32
  %39 = icmp ne i32 %38, 0
  %40 = zext i1 %39 to i32
  br label %lor.merge4
lor.merge4:
  %41 = phi i32 [1, %land.merge2], [%40, %lor.rhs3]
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %if.then0, label %if.merge0
if.then0:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge0
if.merge0:
  %43 = load i32, i32* %alloc_0, align 4
  call void @putint(i32 %43)
  %44 = load i32, i32* %alloc_0, align 4
  ret i32 %44
}

