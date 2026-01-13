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

@a = dso_local constant i32 10, align 4

define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  store i32 2, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = sub i32 %1, 10
  ret i32 %2
}

