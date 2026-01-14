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
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 5, i32* %alloc_0, align 4
  store i32 5, i32* %alloc_1, align 4
  store i32 1, i32* %alloc_2, align 4
  store i32 -2, i32* %alloc_3, align 4
  %0 = load i32, i32* %alloc_3, align 4
  %1 = mul i32 %0, 1
  %2 = sdiv i32 %1, 2
  %3 = load i32, i32* %alloc_0, align 4
  %4 = load i32, i32* %alloc_1, align 4
  %5 = sub i32 %3, %4
  %6 = add i32 %2, %5
  %7 = load i32, i32* %alloc_2, align 4
  %8 = add i32 %7, 3
  %9 = sub i32 0, %8
  %10 = srem i32 %9, 2
  %11 = sub i32 %6, %10
  store i32 %11, i32* %alloc_4, align 4
  %12 = load i32, i32* %alloc_4, align 4
  call void @putint(i32 %12)
  %13 = load i32, i32* %alloc_3, align 4
  %14 = srem i32 %13, 2
  %15 = add i32 %14, 67
  %16 = load i32, i32* %alloc_0, align 4
  %17 = load i32, i32* %alloc_1, align 4
  %18 = sub i32 %16, %17
  %19 = sub i32 0, %18
  %20 = add i32 %15, %19
  %21 = load i32, i32* %alloc_2, align 4
  %22 = add i32 %21, 2
  %23 = srem i32 %22, 2
  %24 = sub i32 0, %23
  %25 = sub i32 %20, %24
  store i32 %25, i32* %alloc_4, align 4
  %26 = load i32, i32* %alloc_4, align 4
  %27 = add i32 %26, 3
  store i32 %27, i32* %alloc_4, align 4
  %28 = load i32, i32* %alloc_4, align 4
  call void @putint(i32 %28)
  ret i32 0
}

