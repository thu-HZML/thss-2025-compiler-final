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
  store i32 0, i32* %alloc_0, align 4
  store i32 0, i32* %alloc_1, align 4
  br label %while.cond.0
while.cond.0:
  %0 = load i32, i32* %alloc_0, align 4
  %1 = icmp slt i32 %0, 100
  %2 = zext i1 %1 to i32
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %while.body.0, label %while.merge.0
while.body.0:
  %4 = load i32, i32* %alloc_0, align 4
  %5 = icmp eq i32 %4, 50
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.merge0
if.then0:
  %8 = load i32, i32* %alloc_0, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %alloc_0, align 4
  br label %while.cond.0
continue.unreachable:
  br label %if.merge0
if.merge0:
  %10 = load i32, i32* %alloc_1, align 4
  %11 = load i32, i32* %alloc_0, align 4
  %12 = add i32 %10, %11
  store i32 %12, i32* %alloc_1, align 4
  %13 = load i32, i32* %alloc_0, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  %15 = load i32, i32* %alloc_1, align 4
  ret i32 %15
}

