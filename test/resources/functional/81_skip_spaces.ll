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


define i32 @main() {
entry0:
  %0 = alloca [100 x i32], align 4
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.0
while.cond.0:
  %3 = call i32 @getint()
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = load i32, i32* %1, align 4
  %6 = getelementptr inbounds [100 x i32], [100 x i32]* %0, i32 0, i32 %5
  %7 = call i32 @getint()
  store i32 %7, i32* %6, align 4
  %8 = load i32, i32* %1, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  br label %while.cond.1
while.cond.1:
  %10 = load i32, i32* %1, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %while.body.1, label %while.merge.1
while.body.1:
  %12 = load i32, i32* %1, align 4
  %13 = sub i32 %12, 1
  store i32 %13, i32* %1, align 4
  %14 = load i32, i32* %2, align 4
  %15 = load i32, i32* %1, align 4
  %16 = getelementptr inbounds [100 x i32], [100 x i32]* %0, i32 0, i32 %15
  %17 = load i32, i32* %16, align 4
  %18 = add i32 %14, %17
  store i32 %18, i32* %2, align 4
  br label %while.cond.1
while.merge.1:
  %19 = load i32, i32* %2, align 4
  %20 = srem i32 %19, 79
  ret i32 %20
}

