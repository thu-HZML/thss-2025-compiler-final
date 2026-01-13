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

@g = dso_local global i32 0, align 4

define i32 @func(i32 %arg0) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* @g, align 4
  %2 = load i32, i32* %0, align 4
  %3 = add i32 %1, %2
  store i32 %3, i32* @g, align 4
  %4 = load i32, i32* @g, align 4
  call void @putint(i32 %4)
  %5 = load i32, i32* @g, align 4
  ret i32 %5
}

define i32 @main() {
entry1:
  %0 = alloca i32, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* %0, align 4
  %2 = load i32, i32* %0, align 4
  %3 = icmp sgt i32 %2, 10
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %land.rhs2, label %land.merge3
land.rhs2:
  %6 = load i32, i32* %0, align 4
  %7 = call i32 @func(i32 %6)
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  br label %land.merge3
land.merge3:
  %10 = phi i32 [0, %entry1], [%9, %land.rhs2]
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %if.then0, label %if.else0
if.then0:
  store i32 1, i32* %0, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %0, align 4
  br label %if.merge0
if.merge0:
  %12 = call i32 @getint()
  store i32 %12, i32* %0, align 4
  %13 = load i32, i32* %0, align 4
  %14 = icmp sgt i32 %13, 11
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %land.rhs4, label %land.merge5
land.rhs4:
  %17 = load i32, i32* %0, align 4
  %18 = call i32 @func(i32 %17)
  %19 = icmp ne i32 %18, 0
  %20 = zext i1 %19 to i32
  br label %land.merge5
land.merge5:
  %21 = phi i32 [0, %if.merge0], [%20, %land.rhs4]
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %if.then1, label %if.else1
if.then1:
  store i32 1, i32* %0, align 4
  br label %if.merge1
if.else1:
  store i32 0, i32* %0, align 4
  br label %if.merge1
if.merge1:
  %23 = call i32 @getint()
  store i32 %23, i32* %0, align 4
  %24 = load i32, i32* %0, align 4
  %25 = icmp sle i32 %24, 99
  %26 = zext i1 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %lor.merge7, label %lor.rhs6
lor.rhs6:
  %28 = load i32, i32* %0, align 4
  %29 = call i32 @func(i32 %28)
  %30 = icmp ne i32 %29, 0
  %31 = zext i1 %30 to i32
  br label %lor.merge7
lor.merge7:
  %32 = phi i32 [1, %if.merge1], [%31, %lor.rhs6]
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %if.then2, label %if.else2
if.then2:
  store i32 1, i32* %0, align 4
  br label %if.merge2
if.else2:
  store i32 0, i32* %0, align 4
  br label %if.merge2
if.merge2:
  %34 = call i32 @getint()
  store i32 %34, i32* %0, align 4
  %35 = load i32, i32* %0, align 4
  %36 = icmp sle i32 %35, 100
  %37 = zext i1 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %lor.merge9, label %lor.rhs8
lor.rhs8:
  %39 = load i32, i32* %0, align 4
  %40 = call i32 @func(i32 %39)
  %41 = icmp ne i32 %40, 0
  %42 = zext i1 %41 to i32
  br label %lor.merge9
lor.merge9:
  %43 = phi i32 [1, %if.merge2], [%42, %lor.rhs8]
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %if.then3, label %if.else3
if.then3:
  store i32 1, i32* %0, align 4
  br label %if.merge3
if.else3:
  store i32 0, i32* %0, align 4
  br label %if.merge3
if.merge3:
  %45 = call i32 @func(i32 99)
  %46 = icmp eq i32 %45, 0
  %47 = zext i1 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %land.rhs10, label %land.merge11
land.rhs10:
  %49 = call i32 @func(i32 100)
  %50 = icmp ne i32 %49, 0
  %51 = zext i1 %50 to i32
  br label %land.merge11
land.merge11:
  %52 = phi i32 [0, %if.merge3], [%51, %land.rhs10]
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %if.then4, label %if.else4
if.then4:
  store i32 1, i32* %0, align 4
  br label %if.merge4
if.else4:
  store i32 0, i32* %0, align 4
  br label %if.merge4
if.merge4:
  ret i32 0
}

