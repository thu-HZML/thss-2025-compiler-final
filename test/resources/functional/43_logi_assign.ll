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
  %alloc_0 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* @a, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* @b, align 4
  %2 = load i32, i32* @a, align 4
  %3 = load i32, i32* @b, align 4
  %4 = icmp eq i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %land.rhs1, label %land.merge2
land.rhs1:
  %7 = load i32, i32* @a, align 4
  %8 = icmp ne i32 %7, 3
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  br label %land.merge2
land.merge2:
  %12 = phi i32 [0, %entry0], [%11, %land.rhs1]
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then0, label %if.else0
if.then0:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge0
if.merge0:
  %14 = load i32, i32* %alloc_0, align 4
  ret i32 %14
}

