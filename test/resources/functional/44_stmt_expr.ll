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
  %alloc_0 = alloca i32, align 4
  store i32 0, i32* %alloc_0, align 4
  store i32 1, i32* @k, align 4
  br label %while.cond.0
while.cond.0:
  %0 = load i32, i32* %alloc_0, align 4
  %1 = sub i32 10, 1
  %2 = icmp sle i32 %0, %1
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = load i32, i32* %alloc_0, align 4
  %6 = add i32 %5, 1
  store i32 %6, i32* %alloc_0, align 4
  %7 = load i32, i32* @k, align 4
  %8 = add i32 %7, 1
  %9 = load i32, i32* @k, align 4
  %10 = load i32, i32* @k, align 4
  %11 = add i32 %9, %10
  store i32 %11, i32* @k, align 4
  br label %while.cond.0
while.merge.0:
  %12 = load i32, i32* @k, align 4
  call void @putint(i32 %12)
  %13 = load i32, i32* @k, align 4
  ret i32 %13
}

