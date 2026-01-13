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
  store i32 10, i32* %0, align 4
  store i32 4, i32* %1, align 4
  store i32 2, i32* %2, align 4
  store i32 2, i32* %3, align 4
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* %0, align 4
  %6 = load i32, i32* %1, align 4
  %7 = mul i32 %5, %6
  %8 = add i32 %4, %7
  %9 = load i32, i32* %3, align 4
  %10 = sub i32 %8, %9
  ret i32 %10
}

