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
  store i32 56, i32* %0, align 4
  store i32 4, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  %3 = sub i32 %2, -4
  %4 = load i32, i32* %1, align 4
  %5 = add i32 %3, %4
  store i32 %5, i32* %0, align 4
  %6 = load i32, i32* %0, align 4
  %7 = icmp eq i32 %6, 0
  %8 = zext i1 %7 to i32
  %9 = icmp eq i32 %8, 0
  %10 = zext i1 %9 to i32
  %11 = icmp eq i32 %10, 0
  %12 = zext i1 %11 to i32
  %13 = sub i32 0, %12
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %if.then0, label %if.else0
if.then0:
  store i32 -1, i32* %0, align 4
  br label %if.merge0
if.else0:
  %15 = load i32, i32* %1, align 4
  %16 = add i32 0, %15
  store i32 %16, i32* %0, align 4
  br label %if.merge0
if.merge0:
  %17 = load i32, i32* %0, align 4
  call void @putint(i32 %17)
  ret i32 0
}

