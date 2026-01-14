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
  %alloc_0 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_0, align 4
  %1 = load i32, i32* %alloc_0, align 4
  %2 = icmp sgt i32 %1, 10
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %land.rhs2, label %land.merge3
land.rhs2:
  %5 = load i32, i32* %alloc_0, align 4
  %6 = call i32 @func(i32 %5)
  %7 = icmp ne i32 %6, 0
  %8 = zext i1 %7 to i32
  br label %land.merge3
land.merge3:
  %9 = phi i32 [0, %entry1], [%8, %land.rhs2]
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %if.then0, label %if.else0
if.then0:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge0
if.else0:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge0
if.merge0:
  %11 = call i32 @getint()
  store i32 %11, i32* %alloc_0, align 4
  %12 = load i32, i32* %alloc_0, align 4
  %13 = icmp sgt i32 %12, 11
  %14 = zext i1 %13 to i32
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %land.rhs4, label %land.merge5
land.rhs4:
  %16 = load i32, i32* %alloc_0, align 4
  %17 = call i32 @func(i32 %16)
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i32
  br label %land.merge5
land.merge5:
  %20 = phi i32 [0, %if.merge0], [%19, %land.rhs4]
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %if.then1, label %if.else1
if.then1:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge1
if.else1:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge1
if.merge1:
  %22 = call i32 @getint()
  store i32 %22, i32* %alloc_0, align 4
  %23 = load i32, i32* %alloc_0, align 4
  %24 = icmp sle i32 %23, 99
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %lor.merge7, label %lor.rhs6
lor.rhs6:
  %27 = load i32, i32* %alloc_0, align 4
  %28 = call i32 @func(i32 %27)
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  br label %lor.merge7
lor.merge7:
  %31 = phi i32 [1, %if.merge1], [%30, %lor.rhs6]
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %if.then2, label %if.else2
if.then2:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge2
if.else2:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge2
if.merge2:
  %33 = call i32 @getint()
  store i32 %33, i32* %alloc_0, align 4
  %34 = load i32, i32* %alloc_0, align 4
  %35 = icmp sle i32 %34, 100
  %36 = zext i1 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %lor.merge9, label %lor.rhs8
lor.rhs8:
  %38 = load i32, i32* %alloc_0, align 4
  %39 = call i32 @func(i32 %38)
  %40 = icmp ne i32 %39, 0
  %41 = zext i1 %40 to i32
  br label %lor.merge9
lor.merge9:
  %42 = phi i32 [1, %if.merge2], [%41, %lor.rhs8]
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %if.then3, label %if.else3
if.then3:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge3
if.else3:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge3
if.merge3:
  %44 = call i32 @func(i32 99)
  %45 = icmp eq i32 %44, 0
  %46 = zext i1 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %land.rhs10, label %land.merge11
land.rhs10:
  %48 = call i32 @func(i32 100)
  %49 = icmp ne i32 %48, 0
  %50 = zext i1 %49 to i32
  br label %land.merge11
land.merge11:
  %51 = phi i32 [0, %if.merge3], [%50, %land.rhs10]
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %if.then4, label %if.else4
if.then4:
  store i32 1, i32* %alloc_0, align 4
  br label %if.merge4
if.else4:
  store i32 0, i32* %alloc_0, align 4
  br label %if.merge4
if.merge4:
  ret i32 0
}

