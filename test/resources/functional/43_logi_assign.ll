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

define i32 @main() {
entry0:
  %0 = call i32 @getint()
  store i32 %0, i32* @a, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* @b, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* @a, align 4
  %4 = load i32, i32* @b, align 4
  %5 = icmp eq i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %land.rhs1, label %land.merge2
land.rhs1:
  %8 = load i32, i32* @a, align 4
  %9 = icmp ne i32 %8, 3
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  %12 = zext i1 %11 to i32
  br label %land.merge2
land.merge2:
  %13 = phi i32 [0, %entry0], [%12, %land.rhs1]
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %if.then0, label %if.else0
if.then0:
  store i32 1, i32* %2, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %2, align 4
  br label %if.merge0
if.merge0:
  %15 = load i32, i32* %2, align 4
  ret i32 %15
}

