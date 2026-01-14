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

@a = dso_local constant [5 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4], align 16

define i32 @main() {
entry0:
  %0 = getelementptr inbounds [5 x i32], [5 x i32]* @a, i32 0, i32 4
  %1 = load i32, i32* %0, align 4
  ret i32 %1
}

