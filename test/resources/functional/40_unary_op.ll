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
  store i32 10, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i1 %2 to i32
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  %6 = icmp eq i32 %5, 0
  %7 = zext i1 %6 to i32
  %8 = sub i32 0, %7
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %if.then0, label %if.else0
if.then0:
  store i32 -1, i32* %0, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %0, align 4
  br label %if.merge0
if.merge0:
  %10 = load i32, i32* %0, align 4
  ret i32 %10
}

