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
  store i32 2, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 10, i32* %1, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.else0
if.then0:
  store i32 30, i32* %2, align 4
  br label %if.merge0
if.else0:
  %8 = load i32, i32* %0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = sub i32 %8, %9
  %11 = mul i32 %10, 10
  %12 = add i32 %11, 30
  store i32 %12, i32* %2, align 4
  br label %if.merge0
if.merge0:
  %13 = load i32, i32* %2, align 4
  %14 = icmp sgt i32 %13, 1000
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %if.then1, label %if.merge1
if.then1:
  store i32 1000, i32* %2, align 4
  br label %if.merge1
if.merge1:
  %17 = load i32, i32* %2, align 4
  ret i32 %17
}

