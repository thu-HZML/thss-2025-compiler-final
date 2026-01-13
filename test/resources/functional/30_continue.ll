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
  store i32 0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %0, align 4
  %3 = icmp slt i32 %2, 100
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = load i32, i32* %0, align 4
  %7 = icmp eq i32 %6, 50
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %if.then0, label %if.merge0
if.then0:
  %10 = load i32, i32* %0, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %0, align 4
  br label %while.cond.0
continue.unreachable:
  br label %if.merge0
if.merge0:
  %12 = load i32, i32* %1, align 4
  %13 = load i32, i32* %0, align 4
  %14 = add i32 %12, %13
  store i32 %14, i32* %1, align 4
  %15 = load i32, i32* %0, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %17 = load i32, i32* %1, align 4
  ret i32 %17
}

