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

@TAPE_LEN = dso_local constant i32 65536, align 4
@BUFFER_LEN = dso_local constant i32 32768, align 4
@tape = dso_local global [65536 x i32] zeroinitializer, align 4
@program = dso_local global [32768 x i32] zeroinitializer, align 4
@ptr = dso_local global i32 0, align 4

define void @read_program() {
entry0:
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  store i32 0, i32* %alloc_0, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_1, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_0, align 4
  %2 = load i32, i32* %alloc_1, align 4
  %3 = icmp slt i32 %1, %2
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = load i32, i32* %alloc_0, align 4
  %7 = getelementptr inbounds [32768 x i32], [32768 x i32]* @program, i32 0, i32 %6
  %8 = call i32 @getch()
  store i32 %8, i32* %7, align 4
  %9 = load i32, i32* %alloc_0, align 4
  %10 = add i32 %9, 1
  store i32 %10, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  %11 = load i32, i32* %alloc_0, align 4
  %12 = getelementptr inbounds [32768 x i32], [32768 x i32]* @program, i32 0, i32 %11
  store i32 0, i32* %12, align 4
  ret void
}

define void @interpret(i32* %arg0) {
entry1:
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  store i32 0, i32* %alloc_4, align 4
  br label %while.cond.1
while.cond.1:
  %1 = load i32, i32* %alloc_4, align 4
  %2 = load i32*, i32** %0, align 8
  %3 = getelementptr inbounds i32, i32* %2, i32 %1
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.1, label %while.merge.1
while.body.1:
  %6 = load i32, i32* %alloc_4, align 4
  %7 = load i32*, i32** %0, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 %6
  %9 = load i32, i32* %8, align 4
  store i32 %9, i32* %alloc_2, align 4
  %10 = load i32, i32* %alloc_2, align 4
  %11 = icmp eq i32 %10, 62
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then0, label %if.else0
if.then0:
  %14 = load i32, i32* @ptr, align 4
  %15 = add i32 %14, 1
  store i32 %15, i32* @ptr, align 4
  br label %if.merge0
if.else0:
  %16 = load i32, i32* %alloc_2, align 4
  %17 = icmp eq i32 %16, 60
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %if.then1, label %if.else1
if.then1:
  %20 = load i32, i32* @ptr, align 4
  %21 = sub i32 %20, 1
  store i32 %21, i32* @ptr, align 4
  br label %if.merge1
if.else1:
  %22 = load i32, i32* %alloc_2, align 4
  %23 = icmp eq i32 %22, 43
  %24 = zext i1 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %if.then2, label %if.else2
if.then2:
  %26 = load i32, i32* @ptr, align 4
  %27 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %26
  %28 = load i32, i32* @ptr, align 4
  %29 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %27, align 4
  br label %if.merge2
if.else2:
  %32 = load i32, i32* %alloc_2, align 4
  %33 = icmp eq i32 %32, 45
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %if.then3, label %if.else3
if.then3:
  %36 = load i32, i32* @ptr, align 4
  %37 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %36
  %38 = load i32, i32* @ptr, align 4
  %39 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %38
  %40 = load i32, i32* %39, align 4
  %41 = sub i32 %40, 1
  store i32 %41, i32* %37, align 4
  br label %if.merge3
if.else3:
  %42 = load i32, i32* %alloc_2, align 4
  %43 = icmp eq i32 %42, 46
  %44 = zext i1 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %if.then4, label %if.else4
if.then4:
  %46 = load i32, i32* @ptr, align 4
  %47 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %46
  %48 = load i32, i32* %47, align 4
  call void @putch(i32 %48)
  br label %if.merge4
if.else4:
  %49 = load i32, i32* %alloc_2, align 4
  %50 = icmp eq i32 %49, 44
  %51 = zext i1 %50 to i32
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %if.then5, label %if.else5
if.then5:
  %53 = load i32, i32* @ptr, align 4
  %54 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %53
  %55 = call i32 @getch()
  store i32 %55, i32* %54, align 4
  br label %if.merge5
if.else5:
  %56 = load i32, i32* %alloc_2, align 4
  %57 = icmp eq i32 %56, 93
  %58 = zext i1 %57 to i32
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %land.rhs2, label %land.merge3
land.rhs2:
  %60 = load i32, i32* @ptr, align 4
  %61 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %60
  %62 = load i32, i32* %61, align 4
  %63 = icmp ne i32 %62, 0
  %64 = zext i1 %63 to i32
  br label %land.merge3
land.merge3:
  %65 = phi i32 [0, %if.else5], [%64, %land.rhs2]
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %if.then6, label %if.merge6
if.then6:
  store i32 1, i32* %alloc_3, align 4
  br label %while.cond.2
while.cond.2:
  %67 = load i32, i32* %alloc_3, align 4
  %68 = icmp sgt i32 %67, 0
  %69 = zext i1 %68 to i32
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %while.body.2, label %while.merge.2
while.body.2:
  %71 = load i32, i32* %alloc_4, align 4
  %72 = sub i32 %71, 1
  store i32 %72, i32* %alloc_4, align 4
  %73 = load i32, i32* %alloc_4, align 4
  %74 = load i32*, i32** %0, align 8
  %75 = getelementptr inbounds i32, i32* %74, i32 %73
  %76 = load i32, i32* %75, align 4
  store i32 %76, i32* %alloc_2, align 4
  %77 = load i32, i32* %alloc_2, align 4
  %78 = icmp eq i32 %77, 91
  %79 = zext i1 %78 to i32
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %if.then7, label %if.else7
if.then7:
  %81 = load i32, i32* %alloc_3, align 4
  %82 = sub i32 %81, 1
  store i32 %82, i32* %alloc_3, align 4
  br label %if.merge7
if.else7:
  %83 = load i32, i32* %alloc_2, align 4
  %84 = icmp eq i32 %83, 93
  %85 = zext i1 %84 to i32
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %if.then8, label %if.merge8
if.then8:
  %87 = load i32, i32* %alloc_3, align 4
  %88 = add i32 %87, 1
  store i32 %88, i32* %alloc_3, align 4
  br label %if.merge8
if.merge8:
  br label %if.merge7
if.merge7:
  br label %while.cond.2
while.merge.2:
  br label %if.merge6
if.merge6:
  br label %if.merge5
if.merge5:
  br label %if.merge4
if.merge4:
  br label %if.merge3
if.merge3:
  br label %if.merge2
if.merge2:
  br label %if.merge1
if.merge1:
  br label %if.merge0
if.merge0:
  %89 = load i32, i32* %alloc_4, align 4
  %90 = add i32 %89, 1
  store i32 %90, i32* %alloc_4, align 4
  br label %while.cond.1
while.merge.1:
  ret void
}

define i32 @main() {
entry4:
  call void @read_program()
  %0 = getelementptr inbounds [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  call void @interpret(i32* %0)
  ret i32 0
}

