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
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 15, i32* %alloc_0, align 4
  store i32 12, i32* %alloc_1, align 4
  %0 = load i32, i32* %alloc_0, align 4
  %1 = load i32, i32* %alloc_1, align 4
  %2 = add i32 %0, %1
  %3 = add i32 %2, 61
  ret i32 %3
}

