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
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca [100 x i32], align 4
  store i32 0, i32* %alloc_1, align 4
  store i32 0, i32* %alloc_2, align 4
  br label %while.cond.0
while.cond.0:
  %0 = call i32 @getint()
  %1 = icmp ne i32 %0, 0
  br i1 %1, label %while.body.0, label %while.merge.0
while.body.0:
  %2 = load i32, i32* %alloc_1, align 4
  %3 = getelementptr inbounds [100 x i32], [100 x i32]* %alloc_0, i32 0, i32 %2
  %4 = call i32 @getint()
  store i32 %4, i32* %3, align 4
  %5 = load i32, i32* %alloc_1, align 4
  %6 = add i32 %5, 1
  store i32 %6, i32* %alloc_1, align 4
  br label %while.cond.0
while.merge.0:
  br label %while.cond.1
while.cond.1:
  %7 = load i32, i32* %alloc_1, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.1, label %while.merge.1
while.body.1:
  %9 = load i32, i32* %alloc_1, align 4
  %10 = sub i32 %9, 1
  store i32 %10, i32* %alloc_1, align 4
  %11 = load i32, i32* %alloc_2, align 4
  %12 = load i32, i32* %alloc_1, align 4
  %13 = getelementptr inbounds [100 x i32], [100 x i32]* %alloc_0, i32 0, i32 %12
  %14 = load i32, i32* %13, align 4
  %15 = add i32 %11, %14
  store i32 %15, i32* %alloc_2, align 4
  br label %while.cond.1
while.merge.1:
  %16 = load i32, i32* %alloc_2, align 4
  %17 = srem i32 %16, 79
  ret i32 %17
}

