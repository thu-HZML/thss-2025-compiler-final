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
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 5, i32* %0, align 4
  store i32 5, i32* %1, align 4
  store i32 1, i32* %2, align 4
  store i32 -2, i32* %3, align 4
  %5 = load i32, i32* %3, align 4
  %6 = mul i32 %5, 1
  %7 = sdiv i32 %6, 2
  %8 = load i32, i32* %0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = sub i32 %8, %9
  %11 = add i32 %7, %10
  %12 = load i32, i32* %2, align 4
  %13 = add i32 %12, 3
  %14 = sub i32 0, %13
  %15 = srem i32 %14, 2
  %16 = sub i32 %11, %15
  store i32 %16, i32* %4, align 4
  %17 = load i32, i32* %4, align 4
  call void @putint(i32 %17)
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 2
  %20 = add i32 %19, 67
  %21 = load i32, i32* %0, align 4
  %22 = load i32, i32* %1, align 4
  %23 = sub i32 %21, %22
  %24 = sub i32 0, %23
  %25 = add i32 %20, %24
  %26 = load i32, i32* %2, align 4
  %27 = add i32 %26, 2
  %28 = srem i32 %27, 2
  %29 = sub i32 0, %28
  %30 = sub i32 %25, %29
  store i32 %30, i32* %4, align 4
  %31 = load i32, i32* %4, align 4
  %32 = add i32 %31, 3
  store i32 %32, i32* %4, align 4
  %33 = load i32, i32* %4, align 4
  call void @putint(i32 %33)
  ret i32 0
}

