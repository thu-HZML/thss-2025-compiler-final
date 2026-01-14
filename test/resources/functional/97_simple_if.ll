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
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 2, i32* %alloc_0, align 4
  store i32 10, i32* %alloc_1, align 4
  %0 = load i32, i32* %alloc_0, align 4
  %1 = load i32, i32* %alloc_1, align 4
  %2 = icmp slt i32 %0, %1
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %if.then0, label %if.else0
if.then0:
  store i32 30, i32* %alloc_2, align 4
  br label %if.merge0
if.else0:
  %5 = load i32, i32* %alloc_0, align 4
  %6 = load i32, i32* %alloc_1, align 4
  %7 = sub i32 %5, %6
  %8 = mul i32 %7, 10
  %9 = add i32 %8, 30
  store i32 %9, i32* %alloc_2, align 4
  br label %if.merge0
if.merge0:
  %10 = load i32, i32* %alloc_2, align 4
  %11 = icmp sgt i32 %10, 1000
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then1, label %if.merge1
if.then1:
  store i32 1000, i32* %alloc_2, align 4
  br label %if.merge1
if.merge1:
  %14 = load i32, i32* %alloc_2, align 4
  ret i32 %14
}

