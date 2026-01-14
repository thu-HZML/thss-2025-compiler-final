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
  store i32 56, i32* %alloc_0, align 4
  store i32 4, i32* %alloc_1, align 4
  %0 = load i32, i32* %alloc_0, align 4
  %1 = sub i32 %0, -4
  %2 = load i32, i32* %alloc_1, align 4
  %3 = add i32 %1, %2
  store i32 %3, i32* %alloc_0, align 4
  %4 = load i32, i32* %alloc_0, align 4
  %5 = icmp eq i32 %4, 0
  %6 = zext i1 %5 to i32
  %7 = icmp eq i32 %6, 0
  %8 = zext i1 %7 to i32
  %9 = icmp eq i32 %8, 0
  %10 = zext i1 %9 to i32
  %11 = sub i32 0, %10
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then0, label %if.else0
if.then0:
  store i32 -1, i32* %alloc_0, align 4
  br label %if.merge0
if.else0:
  %13 = load i32, i32* %alloc_1, align 4
  %14 = add i32 0, %13
  store i32 %14, i32* %alloc_0, align 4
  br label %if.merge0
if.merge0:
  %15 = load i32, i32* %alloc_0, align 4
  call void @putint(i32 %15)
  ret i32 0
}

