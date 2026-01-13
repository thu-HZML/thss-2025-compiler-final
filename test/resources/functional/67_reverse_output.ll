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


define void @reverse(i32 %arg0) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  %2 = load i32, i32* %0, align 4
  %3 = icmp sle i32 %2, 1
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %if.then0, label %if.else0
if.then0:
  %6 = call i32 @getint()
  store i32 %6, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  call void @putint(i32 %7)
  br label %if.merge0
if.else0:
  %8 = call i32 @getint()
  store i32 %8, i32* %1, align 4
  %9 = load i32, i32* %0, align 4
  %10 = sub i32 %9, 1
  call void @reverse(i32 %10)
  %11 = load i32, i32* %1, align 4
  call void @putint(i32 %11)
  br label %if.merge0
if.merge0:
  ret void
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  store i32 200, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  call void @reverse(i32 %1)
  ret i32 0
}

