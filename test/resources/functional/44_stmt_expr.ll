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

@k = dso_local global i32 zeroinitializer, align 4
@n = dso_local constant i32 10, align 4

define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  store i32 0, i32* %0, align 4
  store i32 1, i32* @k, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %0, align 4
  %2 = sub i32 10, 1
  %3 = icmp sle i32 %1, %2
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = load i32, i32* %0, align 4
  %7 = add i32 %6, 1
  store i32 %7, i32* %0, align 4
  %8 = load i32, i32* @k, align 4
  %9 = add i32 %8, 1
  %10 = load i32, i32* @k, align 4
  %11 = load i32, i32* @k, align 4
  %12 = add i32 %10, %11
  store i32 %12, i32* @k, align 4
  br label %while.cond.0
while.merge.0:
  %13 = load i32, i32* @k, align 4
  call void @putint(i32 %13)
  %14 = load i32, i32* @k, align 4
  ret i32 %14
}

