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
  %alloc_0 = alloca i32, align 4
  store i32 10, i32* %alloc_0, align 4
  %0 = load i32, i32* %alloc_0, align 4
  %1 = icmp eq i32 %0, 0
  %2 = zext i1 %1 to i32
  %3 = icmp eq i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = icmp eq i32 %4, 0
  %6 = zext i1 %5 to i32
  %7 = sub i32 0, %6
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %if.then0, label %if.else0
if.then0:
  store i32 -1, i32* %alloc_0, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge0
if.merge0:
  %9 = load i32, i32* %alloc_0, align 4
  ret i32 %9
}

