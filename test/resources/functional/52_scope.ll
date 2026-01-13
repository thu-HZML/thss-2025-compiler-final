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

@a = dso_local global i32 7, align 4

define i32 @func() {
entry0:
  %0 = alloca i32, align 4
  %1 = load i32, i32* @a, align 4
  store i32 %1, i32* %0, align 4
  %2 = alloca i32, align 4
  store i32 1, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* %0, align 4
  %5 = icmp eq i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.else0
if.then0:
  %8 = load i32, i32* %2, align 4
  %9 = add i32 %8, 1
  store i32 %9, i32* %2, align 4
  ret i32 1
if.else0:
  ret i32 0
if.merge0:
  ret i32 0
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  store i32 0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %1, align 4
  %3 = icmp slt i32 %2, 100
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = call i32 @func()
  %7 = icmp eq i32 %6, 1
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %if.then1, label %if.merge1
if.then1:
  %10 = load i32, i32* %0, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %0, align 4
  br label %if.merge1
if.merge1:
  %12 = load i32, i32* %1, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  %14 = load i32, i32* %0, align 4
  %15 = icmp slt i32 %14, 100
  %16 = zext i1 %15 to i32
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %if.then2, label %if.else2
if.then2:
  call void @putint(i32 1)
  br label %if.merge2
if.else2:
  call void @putint(i32 0)
  br label %if.merge2
if.merge2:
  ret i32 0
}

