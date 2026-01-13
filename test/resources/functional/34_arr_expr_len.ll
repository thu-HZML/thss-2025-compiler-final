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

@N = dso_local constant i32 -1, align 4
@arr = dso_local global [6 x i32] [i32 1, i32 2, i32 33, i32 4, i32 5, i32 6], align 4

define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  store i32 0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %0, align 4
  %3 = icmp slt i32 %2, 6
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = load i32, i32* %1, align 4
  %7 = load i32, i32* %0, align 4
  %8 = getelementptr inbounds [6 x i32], [6 x i32]* @arr, i32 0, i32 %7
  %9 = load i32, i32* %8, align 4
  %10 = add i32 %6, %9
  store i32 %10, i32* %1, align 4
  %11 = load i32, i32* %0, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %13 = load i32, i32* %1, align 4
  ret i32 %13
}

