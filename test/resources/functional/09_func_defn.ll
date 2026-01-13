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

@a = dso_local global i32 zeroinitializer, align 4

define i32 @func(i32 %arg0) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = sub i32 %1, 1
  store i32 %2, i32* %0, align 4
  %3 = load i32, i32* %0, align 4
  ret i32 %3
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  store i32 10, i32* @a, align 4
  %1 = load i32, i32* @a, align 4
  %2 = call i32 @func(i32 %1)
  store i32 %2, i32* %0, align 4
  %3 = load i32, i32* %0, align 4
  ret i32 %3
}

