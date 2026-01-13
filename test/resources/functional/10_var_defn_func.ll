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


define i32 @defn() {
entry0:
  ret i32 4
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  %1 = call i32 @defn()
  store i32 %1, i32* %0, align 4
  %2 = load i32, i32* %0, align 4
  ret i32 %2
}

