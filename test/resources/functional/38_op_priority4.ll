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

@a = dso_local global i32 zeroinitializer, align 4
@b = dso_local global i32 zeroinitializer, align 4
@c = dso_local global i32 zeroinitializer, align 4
@d = dso_local global i32 zeroinitializer, align 4
@e = dso_local global i32 zeroinitializer, align 4

define i32 @main() {
entry0:
  %0 = call i32 @getint()
  store i32 %0, i32* @a, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* @b, align 4
  %2 = call i32 @getint()
  store i32 %2, i32* @c, align 4
  %3 = call i32 @getint()
  store i32 %3, i32* @d, align 4
  %4 = call i32 @getint()
  store i32 %4, i32* @e, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %5, align 4
  %6 = load i32, i32* @a, align 4
  %7 = load i32, i32* @b, align 4
  %8 = load i32, i32* @c, align 4
  %9 = mul i32 %7, %8
  %10 = sub i32 %6, %9
  %11 = load i32, i32* @d, align 4
  %12 = load i32, i32* @a, align 4
  %13 = load i32, i32* @c, align 4
  %14 = sdiv i32 %12, %13
  %15 = sub i32 %11, %14
  %16 = icmp ne i32 %10, %15
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %19 = load i32, i32* @a, align 4
  %20 = load i32, i32* @b, align 4
  %21 = mul i32 %19, %20
  %22 = load i32, i32* @c, align 4
  %23 = sdiv i32 %21, %22
  %24 = load i32, i32* @e, align 4
  %25 = load i32, i32* @d, align 4
  %26 = add i32 %24, %25
  %27 = icmp eq i32 %23, %26
  %28 = zext i1 %27 to i32
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  br label %lor.merge2
lor.merge2:
  %31 = phi i32 [1, %entry0], [%30, %lor.rhs1]
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %lor.merge4, label %lor.rhs3
lor.rhs3:
  %33 = load i32, i32* @a, align 4
  %34 = load i32, i32* @b, align 4
  %35 = add i32 %33, %34
  %36 = load i32, i32* @c, align 4
  %37 = add i32 %35, %36
  %38 = load i32, i32* @d, align 4
  %39 = load i32, i32* @e, align 4
  %40 = add i32 %38, %39
  %41 = icmp eq i32 %37, %40
  %42 = zext i1 %41 to i32
  %43 = icmp ne i32 %42, 0
  %44 = zext i1 %43 to i32
  br label %lor.merge4
lor.merge4:
  %45 = phi i32 [1, %lor.merge2], [%44, %lor.rhs3]
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %if.then0, label %if.merge0
if.then0:
  store i32 1, i32* %5, align 4
  br label %if.merge0
if.merge0:
  %47 = load i32, i32* %5, align 4
  ret i32 %47
}

