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
  %alloc_0 = alloca i32, align 4
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
  store i32 0, i32* %alloc_0, align 4
  %5 = load i32, i32* @a, align 4
  %6 = load i32, i32* @b, align 4
  %7 = load i32, i32* @c, align 4
  %8 = mul i32 %6, %7
  %9 = sub i32 %5, %8
  %10 = load i32, i32* @d, align 4
  %11 = load i32, i32* @a, align 4
  %12 = load i32, i32* @c, align 4
  %13 = sdiv i32 %11, %12
  %14 = sub i32 %10, %13
  %15 = icmp ne i32 %9, %14
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %lor.merge2, label %lor.rhs1
lor.rhs1:
  %18 = load i32, i32* @a, align 4
  %19 = load i32, i32* @b, align 4
  %20 = mul i32 %18, %19
  %21 = load i32, i32* @c, align 4
  %22 = sdiv i32 %20, %21
  %23 = load i32, i32* @e, align 4
  %24 = load i32, i32* @d, align 4
  %25 = add i32 %23, %24
  %26 = icmp eq i32 %22, %25
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  %29 = zext i1 %28 to i32
  br label %lor.merge2
lor.merge2:
  %30 = phi i32 [1, %entry0], [%29, %lor.rhs1]
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %lor.merge4, label %lor.rhs3
lor.rhs3:
  %32 = load i32, i32* @a, align 4
  %33 = load i32, i32* @b, align 4
  %34 = add i32 %32, %33
  %35 = load i32, i32* @c, align 4
  %36 = add i32 %34, %35
  %37 = load i32, i32* @d, align 4
  %38 = load i32, i32* @e, align 4
  %39 = add i32 %37, %38
  %40 = icmp eq i32 %36, %39
  %41 = zext i1 %40 to i32
  %42 = icmp ne i32 %41, 0
  %43 = zext i1 %42 to i32
  br label %lor.merge4
lor.merge4:
  %44 = phi i32 [1, %lor.merge2], [%43, %lor.rhs3]
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %if.then0, label %if.merge0
if.then0:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge0
if.merge0:
  %46 = load i32, i32* %alloc_0, align 4
  ret i32 %46
}

