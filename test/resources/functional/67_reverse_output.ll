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
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = icmp sle i32 %1, 1
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %if.then0, label %if.else0
if.then0:
  %5 = call i32 @getint()
  store i32 %5, i32* %alloc_0, align 4
  %6 = load i32, i32* %alloc_0, align 4
  call void @putint(i32 %6)
  br label %if.merge0
if.else0:
  %7 = call i32 @getint()
  store i32 %7, i32* %alloc_0, align 4
  %8 = load i32, i32* %0, align 4
  %9 = sub i32 %8, 1
  call void @reverse(i32 %9)
  %10 = load i32, i32* %alloc_0, align 4
  call void @putint(i32 %10)
  br label %if.merge0
if.merge0:
  ret void
}

define i32 @main() {
entry1:
  %alloc_1 = alloca i32, align 4
  store i32 200, i32* %alloc_1, align 4
  %0 = load i32, i32* %alloc_1, align 4
  call void @reverse(i32 %0)
  ret i32 0
}

