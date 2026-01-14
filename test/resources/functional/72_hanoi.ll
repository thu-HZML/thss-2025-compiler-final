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


define void @move(i32 %arg0, i32 %arg1) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  call void @putint(i32 %2)
  call void @putch(i32 32)
  %3 = load i32, i32* %1, align 4
  call void @putint(i32 %3)
  call void @putch(i32 44)
  call void @putch(i32 32)
  ret void
}

define void @hanoi(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3) {
entry1:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = alloca i32, align 4
  store i32 %arg3, i32* %3, align 4
  %4 = load i32, i32* %0, align 4
  %5 = icmp eq i32 %4, 1
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.else0
if.then0:
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %3, align 4
  call void @move(i32 %8, i32 %9)
  br label %if.merge0
if.else0:
  %10 = load i32, i32* %0, align 4
  %11 = sub i32 %10, 1
  %12 = load i32, i32* %1, align 4
  %13 = load i32, i32* %3, align 4
  %14 = load i32, i32* %2, align 4
  call void @hanoi(i32 %11, i32 %12, i32 %13, i32 %14)
  %15 = load i32, i32* %1, align 4
  %16 = load i32, i32* %3, align 4
  call void @move(i32 %15, i32 %16)
  %17 = load i32, i32* %0, align 4
  %18 = sub i32 %17, 1
  %19 = load i32, i32* %2, align 4
  %20 = load i32, i32* %1, align 4
  %21 = load i32, i32* %3, align 4
  call void @hanoi(i32 %18, i32 %19, i32 %20, i32 %21)
  br label %if.merge0
if.merge0:
  ret void
}

define i32 @main() {
entry2:
  %alloc_0 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_0, align 4
  %2 = icmp sgt i32 %1, 0
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  %5 = call i32 @getint()
  call void @hanoi(i32 %5, i32 1, i32 2, i32 3)
  call void @putch(i32 10)
  %6 = load i32, i32* %alloc_0, align 4
  %7 = sub i32 %6, 1
  store i32 %7, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  ret i32 0
}

