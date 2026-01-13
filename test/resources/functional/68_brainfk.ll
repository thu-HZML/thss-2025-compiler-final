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
  %0 = alloca i32, align 4
  store i32 0, i32* %0, align 4
  %1 = alloca i32, align 4
  %2 = call i32 @getint()
  store i32 %2, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.0, label %while.merge.0
while.body.0:
  %8 = load i32, i32* %0, align 4
  %9 = getelementptr inbounds [32768 x i32], [32768 x i32]* @program, i32 0, i32 %8
  %10 = call i32 @getch()
  store i32 %10, i32* %9, align 4
  %11 = load i32, i32* %0, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  %13 = load i32, i32* %0, align 4
  %14 = getelementptr inbounds [32768 x i32], [32768 x i32]* @program, i32 0, i32 %13
  store i32 0, i32* %14, align 4
  ret void
}

define void @interpret(i32* %arg0) {
entry1:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %while.cond.1
while.cond.1:
  %4 = load i32, i32* %3, align 4
  %5 = load i32*, i32** %0, align 8
  %6 = getelementptr inbounds i32, i32* %5, i32 %4
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.1, label %while.merge.1
while.body.1:
  %9 = load i32, i32* %3, align 4
  %10 = load i32*, i32** %0, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 %9
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %1, align 4
  %13 = load i32, i32* %1, align 4
  %14 = icmp eq i32 %13, 62
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %if.then0, label %if.else0
if.then0:
  %17 = load i32, i32* @ptr, align 4
  %18 = add i32 %17, 1
  store i32 %18, i32* @ptr, align 4
  br label %if.merge0
if.else0:
  %19 = load i32, i32* %1, align 4
  %20 = icmp eq i32 %19, 60
  %21 = zext i1 %20 to i32
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %if.then1, label %if.else1
if.then1:
  %23 = load i32, i32* @ptr, align 4
  %24 = sub i32 %23, 1
  store i32 %24, i32* @ptr, align 4
  br label %if.merge1
if.else1:
  %25 = load i32, i32* %1, align 4
  %26 = icmp eq i32 %25, 43
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %if.then2, label %if.else2
if.then2:
  %29 = load i32, i32* @ptr, align 4
  %30 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %29
  %31 = load i32, i32* @ptr, align 4
  %32 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %31
  %33 = load i32, i32* %32, align 4
  %34 = add i32 %33, 1
  store i32 %34, i32* %30, align 4
  br label %if.merge2
if.else2:
  %35 = load i32, i32* %1, align 4
  %36 = icmp eq i32 %35, 45
  %37 = zext i1 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %if.then3, label %if.else3
if.then3:
  %39 = load i32, i32* @ptr, align 4
  %40 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %39
  %41 = load i32, i32* @ptr, align 4
  %42 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  %44 = sub i32 %43, 1
  store i32 %44, i32* %40, align 4
  br label %if.merge3
if.else3:
  %45 = load i32, i32* %1, align 4
  %46 = icmp eq i32 %45, 46
  %47 = zext i1 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %if.then4, label %if.else4
if.then4:
  %49 = load i32, i32* @ptr, align 4
  %50 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %49
  %51 = load i32, i32* %50, align 4
  call void @putch(i32 %51)
  br label %if.merge4
if.else4:
  %52 = load i32, i32* %1, align 4
  %53 = icmp eq i32 %52, 44
  %54 = zext i1 %53 to i32
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %if.then5, label %if.else5
if.then5:
  %56 = load i32, i32* @ptr, align 4
  %57 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %56
  %58 = call i32 @getch()
  store i32 %58, i32* %57, align 4
  br label %if.merge5
if.else5:
  %59 = load i32, i32* %1, align 4
  %60 = icmp eq i32 %59, 93
  %61 = zext i1 %60 to i32
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %land.rhs2, label %land.merge3
land.rhs2:
  %63 = load i32, i32* @ptr, align 4
  %64 = getelementptr inbounds [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %63
  %65 = load i32, i32* %64, align 4
  %66 = icmp ne i32 %65, 0
  %67 = zext i1 %66 to i32
  br label %land.merge3
land.merge3:
  %68 = phi i32 [0, %if.else5], [%67, %land.rhs2]
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %if.then6, label %if.merge6
if.then6:
  store i32 1, i32* %2, align 4
  br label %while.cond.2
while.cond.2:
  %70 = load i32, i32* %2, align 4
  %71 = icmp sgt i32 %70, 0
  %72 = zext i1 %71 to i32
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %while.body.2, label %while.merge.2
while.body.2:
  %74 = load i32, i32* %3, align 4
  %75 = sub i32 %74, 1
  store i32 %75, i32* %3, align 4
  %76 = load i32, i32* %3, align 4
  %77 = load i32*, i32** %0, align 8
  %78 = getelementptr inbounds i32, i32* %77, i32 %76
  %79 = load i32, i32* %78, align 4
  store i32 %79, i32* %1, align 4
  %80 = load i32, i32* %1, align 4
  %81 = icmp eq i32 %80, 91
  %82 = zext i1 %81 to i32
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %if.then7, label %if.else7
if.then7:
  %84 = load i32, i32* %2, align 4
  %85 = sub i32 %84, 1
  store i32 %85, i32* %2, align 4
  br label %if.merge7
if.else7:
  %86 = load i32, i32* %1, align 4
  %87 = icmp eq i32 %86, 93
  %88 = zext i1 %87 to i32
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %if.then8, label %if.merge8
if.then8:
  %90 = load i32, i32* %2, align 4
  %91 = add i32 %90, 1
  store i32 %91, i32* %2, align 4
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
  %92 = load i32, i32* %3, align 4
  %93 = add i32 %92, 1
  store i32 %93, i32* %3, align 4
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

