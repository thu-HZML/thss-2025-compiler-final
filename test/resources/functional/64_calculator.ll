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

@ints = dso_local global [10000 x i32] zeroinitializer, align 4
@intt = dso_local global i32 zeroinitializer, align 4
@chas = dso_local global [10000 x i32] zeroinitializer, align 4
@chat = dso_local global i32 zeroinitializer, align 4
@i = dso_local global i32 0, align 4
@ii = dso_local global i32 1, align 4
@c = dso_local global i32 zeroinitializer, align 4
@get = dso_local global [10000 x i32] zeroinitializer, align 4
@get2 = dso_local global [10000 x i32] zeroinitializer, align 4

define i32 @isdigit(i32 %arg0) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = icmp sge i32 %1, 48
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %land.rhs1, label %land.merge2
land.rhs1:
  %5 = load i32, i32* %0, align 4
  %6 = icmp sle i32 %5, 57
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  br label %land.merge2
land.merge2:
  %10 = phi i32 [0, %entry0], [%9, %land.rhs1]
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %if.then0, label %if.merge0
if.then0:
  ret i32 1
if.merge0:
  ret i32 0
}

define i32 @power(i32 %arg0, i32 %arg1) {
entry3:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 1, i32* %2, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = load i32, i32* %2, align 4
  %8 = load i32, i32* %0, align 4
  %9 = mul i32 %7, %8
  store i32 %9, i32* %2, align 4
  %10 = load i32, i32* %1, align 4
  %11 = sub i32 %10, 1
  store i32 %11, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  %12 = load i32, i32* %2, align 4
  ret i32 %12
}

define i32 @getstr(i32* %arg0) {
entry4:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  %2 = call i32 @getch()
  store i32 %2, i32* %1, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %while.cond.1
while.cond.1:
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %4, 13
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %land.rhs5, label %land.merge6
land.rhs5:
  %8 = load i32, i32* %1, align 4
  %9 = icmp ne i32 %8, 10
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  %12 = zext i1 %11 to i32
  br label %land.merge6
land.merge6:
  %13 = phi i32 [0, %while.cond.1], [%12, %land.rhs5]
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %while.body.1, label %while.merge.1
while.body.1:
  %15 = load i32, i32* %3, align 4
  %16 = load i32*, i32** %0, align 8
  %17 = getelementptr inbounds i32, i32* %16, i32 %15
  %18 = load i32, i32* %1, align 4
  store i32 %18, i32* %17, align 4
  %19 = load i32, i32* %3, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* %3, align 4
  %21 = call i32 @getch()
  store i32 %21, i32* %1, align 4
  br label %while.cond.1
while.merge.1:
  %22 = load i32, i32* %3, align 4
  ret i32 %22
}

define void @intpush(i32 %arg0) {
entry7:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* @intt, align 4
  %2 = add i32 %1, 1
  store i32 %2, i32* @intt, align 4
  %3 = load i32, i32* @intt, align 4
  %4 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %3
  %5 = load i32, i32* %0, align 4
  store i32 %5, i32* %4, align 4
  ret void
}

define void @chapush(i32 %arg0) {
entry8:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* @chat, align 4
  %2 = add i32 %1, 1
  store i32 %2, i32* @chat, align 4
  %3 = load i32, i32* @chat, align 4
  %4 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %3
  %5 = load i32, i32* %0, align 4
  store i32 %5, i32* %4, align 4
  ret void
}

define i32 @intpop() {
entry9:
  %0 = load i32, i32* @intt, align 4
  %1 = sub i32 %0, 1
  store i32 %1, i32* @intt, align 4
  %2 = load i32, i32* @intt, align 4
  %3 = add i32 %2, 1
  %4 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %3
  %5 = load i32, i32* %4, align 4
  ret i32 %5
}

define i32 @chapop() {
entry10:
  %0 = load i32, i32* @chat, align 4
  %1 = sub i32 %0, 1
  store i32 %1, i32* @chat, align 4
  %2 = load i32, i32* @chat, align 4
  %3 = add i32 %2, 1
  %4 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %3
  %5 = load i32, i32* %4, align 4
  ret i32 %5
}

define void @intadd(i32 %arg0) {
entry11:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* @intt, align 4
  %2 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %1
  %3 = load i32, i32* @intt, align 4
  %4 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %3
  %5 = load i32, i32* %4, align 4
  %6 = mul i32 %5, 10
  store i32 %6, i32* %2, align 4
  %7 = load i32, i32* @intt, align 4
  %8 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %7
  %9 = load i32, i32* @intt, align 4
  %10 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %9
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %0, align 4
  %13 = add i32 %11, %12
  store i32 %13, i32* %8, align 4
  ret void
}

define i32 @find() {
entry12:
  %0 = call i32 @chapop()
  store i32 %0, i32* @c, align 4
  %1 = load i32, i32* @ii, align 4
  %2 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %1
  store i32 32, i32* %2, align 4
  %3 = load i32, i32* @ii, align 4
  %4 = add i32 %3, 1
  %5 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %4
  %6 = load i32, i32* @c, align 4
  store i32 %6, i32* %5, align 4
  %7 = load i32, i32* @ii, align 4
  %8 = add i32 %7, 2
  store i32 %8, i32* @ii, align 4
  %9 = load i32, i32* @chat, align 4
  %10 = icmp eq i32 %9, 0
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then1, label %if.merge1
if.then1:
  ret i32 0
if.merge1:
  ret i32 1
}

define i32 @main() {
entry13:
  store i32 0, i32* @intt, align 4
  store i32 0, i32* @chat, align 4
  %0 = alloca i32, align 4
  %1 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 0
  %2 = call i32 @getstr(i32* %1)
  store i32 %2, i32* %0, align 4
  br label %while.cond.2
while.cond.2:
  %3 = load i32, i32* @i, align 4
  %4 = load i32, i32* %0, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %while.body.2, label %while.merge.2
while.body.2:
  %8 = load i32, i32* @i, align 4
  %9 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %8
  %10 = load i32, i32* %9, align 4
  %11 = call i32 @isdigit(i32 %10)
  %12 = icmp eq i32 %11, 1
  %13 = zext i1 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %if.then2, label %if.else2
if.then2:
  %15 = load i32, i32* @ii, align 4
  %16 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %15
  %17 = load i32, i32* @i, align 4
  %18 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %17
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %16, align 4
  %20 = load i32, i32* @ii, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* @ii, align 4
  br label %if.merge2
if.else2:
  %22 = load i32, i32* @i, align 4
  %23 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %22
  %24 = load i32, i32* %23, align 4
  %25 = icmp eq i32 %24, 40
  %26 = zext i1 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %if.then3, label %if.merge3
if.then3:
  call void @chapush(i32 40)
  br label %if.merge3
if.merge3:
  %28 = load i32, i32* @i, align 4
  %29 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %28
  %30 = load i32, i32* %29, align 4
  %31 = icmp eq i32 %30, 94
  %32 = zext i1 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %if.then4, label %if.merge4
if.then4:
  call void @chapush(i32 94)
  br label %if.merge4
if.merge4:
  %34 = load i32, i32* @i, align 4
  %35 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %34
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 41
  %38 = zext i1 %37 to i32
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %if.then5, label %if.merge5
if.then5:
  %40 = call i32 @chapop()
  store i32 %40, i32* @c, align 4
  br label %while.cond.3
while.cond.3:
  %41 = load i32, i32* @c, align 4
  %42 = icmp ne i32 %41, 40
  %43 = zext i1 %42 to i32
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %while.body.3, label %while.merge.3
while.body.3:
  %45 = load i32, i32* @ii, align 4
  %46 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %45
  store i32 32, i32* %46, align 4
  %47 = load i32, i32* @ii, align 4
  %48 = add i32 %47, 1
  %49 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %48
  %50 = load i32, i32* @c, align 4
  store i32 %50, i32* %49, align 4
  %51 = load i32, i32* @ii, align 4
  %52 = add i32 %51, 2
  store i32 %52, i32* @ii, align 4
  %53 = call i32 @chapop()
  store i32 %53, i32* @c, align 4
  br label %while.cond.3
while.merge.3:
  br label %if.merge5
if.merge5:
  %54 = load i32, i32* @i, align 4
  %55 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %54
  %56 = load i32, i32* %55, align 4
  %57 = icmp eq i32 %56, 43
  %58 = zext i1 %57 to i32
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %if.then6, label %if.merge6
if.then6:
  br label %while.cond.4
while.cond.4:
  %60 = load i32, i32* @chat, align 4
  %61 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %60
  %62 = load i32, i32* %61, align 4
  %63 = icmp eq i32 %62, 43
  %64 = zext i1 %63 to i32
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %lor.merge15, label %lor.rhs14
lor.rhs14:
  %66 = load i32, i32* @chat, align 4
  %67 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %66
  %68 = load i32, i32* %67, align 4
  %69 = icmp eq i32 %68, 45
  %70 = zext i1 %69 to i32
  %71 = icmp ne i32 %70, 0
  %72 = zext i1 %71 to i32
  br label %lor.merge15
lor.merge15:
  %73 = phi i32 [1, %while.cond.4], [%72, %lor.rhs14]
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %lor.merge17, label %lor.rhs16
lor.rhs16:
  %75 = load i32, i32* @chat, align 4
  %76 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %75
  %77 = load i32, i32* %76, align 4
  %78 = icmp eq i32 %77, 42
  %79 = zext i1 %78 to i32
  %80 = icmp ne i32 %79, 0
  %81 = zext i1 %80 to i32
  br label %lor.merge17
lor.merge17:
  %82 = phi i32 [1, %lor.merge15], [%81, %lor.rhs16]
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %lor.merge19, label %lor.rhs18
lor.rhs18:
  %84 = load i32, i32* @chat, align 4
  %85 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %84
  %86 = load i32, i32* %85, align 4
  %87 = icmp eq i32 %86, 47
  %88 = zext i1 %87 to i32
  %89 = icmp ne i32 %88, 0
  %90 = zext i1 %89 to i32
  br label %lor.merge19
lor.merge19:
  %91 = phi i32 [1, %lor.merge17], [%90, %lor.rhs18]
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %lor.merge21, label %lor.rhs20
lor.rhs20:
  %93 = load i32, i32* @chat, align 4
  %94 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %93
  %95 = load i32, i32* %94, align 4
  %96 = icmp eq i32 %95, 37
  %97 = zext i1 %96 to i32
  %98 = icmp ne i32 %97, 0
  %99 = zext i1 %98 to i32
  br label %lor.merge21
lor.merge21:
  %100 = phi i32 [1, %lor.merge19], [%99, %lor.rhs20]
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %lor.merge23, label %lor.rhs22
lor.rhs22:
  %102 = load i32, i32* @chat, align 4
  %103 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %102
  %104 = load i32, i32* %103, align 4
  %105 = icmp eq i32 %104, 94
  %106 = zext i1 %105 to i32
  %107 = icmp ne i32 %106, 0
  %108 = zext i1 %107 to i32
  br label %lor.merge23
lor.merge23:
  %109 = phi i32 [1, %lor.merge21], [%108, %lor.rhs22]
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %while.body.4, label %while.merge.4
while.body.4:
  %111 = call i32 @find()
  %112 = icmp eq i32 %111, 0
  %113 = zext i1 %112 to i32
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %if.then7, label %if.merge7
if.then7:
  br label %while.merge.4
break.unreachable:
  br label %if.merge7
if.merge7:
  br label %while.cond.4
while.merge.4:
  call void @chapush(i32 43)
  br label %if.merge6
if.merge6:
  %115 = load i32, i32* @i, align 4
  %116 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %115
  %117 = load i32, i32* %116, align 4
  %118 = icmp eq i32 %117, 45
  %119 = zext i1 %118 to i32
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %if.then8, label %if.merge8
if.then8:
  br label %while.cond.5
while.cond.5:
  %121 = load i32, i32* @chat, align 4
  %122 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %121
  %123 = load i32, i32* %122, align 4
  %124 = icmp eq i32 %123, 43
  %125 = zext i1 %124 to i32
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %lor.merge25, label %lor.rhs24
lor.rhs24:
  %127 = load i32, i32* @chat, align 4
  %128 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %127
  %129 = load i32, i32* %128, align 4
  %130 = icmp eq i32 %129, 45
  %131 = zext i1 %130 to i32
  %132 = icmp ne i32 %131, 0
  %133 = zext i1 %132 to i32
  br label %lor.merge25
lor.merge25:
  %134 = phi i32 [1, %while.cond.5], [%133, %lor.rhs24]
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %lor.merge27, label %lor.rhs26
lor.rhs26:
  %136 = load i32, i32* @chat, align 4
  %137 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %136
  %138 = load i32, i32* %137, align 4
  %139 = icmp eq i32 %138, 42
  %140 = zext i1 %139 to i32
  %141 = icmp ne i32 %140, 0
  %142 = zext i1 %141 to i32
  br label %lor.merge27
lor.merge27:
  %143 = phi i32 [1, %lor.merge25], [%142, %lor.rhs26]
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %lor.merge29, label %lor.rhs28
lor.rhs28:
  %145 = load i32, i32* @chat, align 4
  %146 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %145
  %147 = load i32, i32* %146, align 4
  %148 = icmp eq i32 %147, 47
  %149 = zext i1 %148 to i32
  %150 = icmp ne i32 %149, 0
  %151 = zext i1 %150 to i32
  br label %lor.merge29
lor.merge29:
  %152 = phi i32 [1, %lor.merge27], [%151, %lor.rhs28]
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %lor.merge31, label %lor.rhs30
lor.rhs30:
  %154 = load i32, i32* @chat, align 4
  %155 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %154
  %156 = load i32, i32* %155, align 4
  %157 = icmp eq i32 %156, 37
  %158 = zext i1 %157 to i32
  %159 = icmp ne i32 %158, 0
  %160 = zext i1 %159 to i32
  br label %lor.merge31
lor.merge31:
  %161 = phi i32 [1, %lor.merge29], [%160, %lor.rhs30]
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %lor.merge33, label %lor.rhs32
lor.rhs32:
  %163 = load i32, i32* @chat, align 4
  %164 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %163
  %165 = load i32, i32* %164, align 4
  %166 = icmp eq i32 %165, 94
  %167 = zext i1 %166 to i32
  %168 = icmp ne i32 %167, 0
  %169 = zext i1 %168 to i32
  br label %lor.merge33
lor.merge33:
  %170 = phi i32 [1, %lor.merge31], [%169, %lor.rhs32]
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %while.body.5, label %while.merge.5
while.body.5:
  %172 = call i32 @find()
  %173 = icmp eq i32 %172, 0
  %174 = zext i1 %173 to i32
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %if.then9, label %if.merge9
if.then9:
  br label %while.merge.5
break.unreachable:
  br label %if.merge9
if.merge9:
  br label %while.cond.5
while.merge.5:
  call void @chapush(i32 45)
  br label %if.merge8
if.merge8:
  %176 = load i32, i32* @i, align 4
  %177 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %176
  %178 = load i32, i32* %177, align 4
  %179 = icmp eq i32 %178, 42
  %180 = zext i1 %179 to i32
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %if.then10, label %if.merge10
if.then10:
  br label %while.cond.6
while.cond.6:
  %182 = load i32, i32* @chat, align 4
  %183 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %182
  %184 = load i32, i32* %183, align 4
  %185 = icmp eq i32 %184, 42
  %186 = zext i1 %185 to i32
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %lor.merge35, label %lor.rhs34
lor.rhs34:
  %188 = load i32, i32* @chat, align 4
  %189 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %188
  %190 = load i32, i32* %189, align 4
  %191 = icmp eq i32 %190, 47
  %192 = zext i1 %191 to i32
  %193 = icmp ne i32 %192, 0
  %194 = zext i1 %193 to i32
  br label %lor.merge35
lor.merge35:
  %195 = phi i32 [1, %while.cond.6], [%194, %lor.rhs34]
  %196 = icmp ne i32 %195, 0
  br i1 %196, label %lor.merge37, label %lor.rhs36
lor.rhs36:
  %197 = load i32, i32* @chat, align 4
  %198 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %197
  %199 = load i32, i32* %198, align 4
  %200 = icmp eq i32 %199, 37
  %201 = zext i1 %200 to i32
  %202 = icmp ne i32 %201, 0
  %203 = zext i1 %202 to i32
  br label %lor.merge37
lor.merge37:
  %204 = phi i32 [1, %lor.merge35], [%203, %lor.rhs36]
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %lor.merge39, label %lor.rhs38
lor.rhs38:
  %206 = load i32, i32* @chat, align 4
  %207 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %206
  %208 = load i32, i32* %207, align 4
  %209 = icmp eq i32 %208, 94
  %210 = zext i1 %209 to i32
  %211 = icmp ne i32 %210, 0
  %212 = zext i1 %211 to i32
  br label %lor.merge39
lor.merge39:
  %213 = phi i32 [1, %lor.merge37], [%212, %lor.rhs38]
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %while.body.6, label %while.merge.6
while.body.6:
  %215 = call i32 @find()
  %216 = icmp eq i32 %215, 0
  %217 = zext i1 %216 to i32
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %if.then11, label %if.merge11
if.then11:
  br label %while.merge.6
break.unreachable:
  br label %if.merge11
if.merge11:
  br label %while.cond.6
while.merge.6:
  call void @chapush(i32 42)
  br label %if.merge10
if.merge10:
  %219 = load i32, i32* @i, align 4
  %220 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %219
  %221 = load i32, i32* %220, align 4
  %222 = icmp eq i32 %221, 47
  %223 = zext i1 %222 to i32
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %if.then12, label %if.merge12
if.then12:
  br label %while.cond.7
while.cond.7:
  %225 = load i32, i32* @chat, align 4
  %226 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %225
  %227 = load i32, i32* %226, align 4
  %228 = icmp eq i32 %227, 42
  %229 = zext i1 %228 to i32
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %lor.merge41, label %lor.rhs40
lor.rhs40:
  %231 = load i32, i32* @chat, align 4
  %232 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %231
  %233 = load i32, i32* %232, align 4
  %234 = icmp eq i32 %233, 47
  %235 = zext i1 %234 to i32
  %236 = icmp ne i32 %235, 0
  %237 = zext i1 %236 to i32
  br label %lor.merge41
lor.merge41:
  %238 = phi i32 [1, %while.cond.7], [%237, %lor.rhs40]
  %239 = icmp ne i32 %238, 0
  br i1 %239, label %lor.merge43, label %lor.rhs42
lor.rhs42:
  %240 = load i32, i32* @chat, align 4
  %241 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %240
  %242 = load i32, i32* %241, align 4
  %243 = icmp eq i32 %242, 37
  %244 = zext i1 %243 to i32
  %245 = icmp ne i32 %244, 0
  %246 = zext i1 %245 to i32
  br label %lor.merge43
lor.merge43:
  %247 = phi i32 [1, %lor.merge41], [%246, %lor.rhs42]
  %248 = icmp ne i32 %247, 0
  br i1 %248, label %lor.merge45, label %lor.rhs44
lor.rhs44:
  %249 = load i32, i32* @chat, align 4
  %250 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %249
  %251 = load i32, i32* %250, align 4
  %252 = icmp eq i32 %251, 94
  %253 = zext i1 %252 to i32
  %254 = icmp ne i32 %253, 0
  %255 = zext i1 %254 to i32
  br label %lor.merge45
lor.merge45:
  %256 = phi i32 [1, %lor.merge43], [%255, %lor.rhs44]
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %while.body.7, label %while.merge.7
while.body.7:
  %258 = call i32 @find()
  %259 = icmp eq i32 %258, 0
  %260 = zext i1 %259 to i32
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %if.then13, label %if.merge13
if.then13:
  br label %while.merge.7
break.unreachable:
  br label %if.merge13
if.merge13:
  br label %while.cond.7
while.merge.7:
  call void @chapush(i32 47)
  br label %if.merge12
if.merge12:
  %262 = load i32, i32* @i, align 4
  %263 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %262
  %264 = load i32, i32* %263, align 4
  %265 = icmp eq i32 %264, 37
  %266 = zext i1 %265 to i32
  %267 = icmp ne i32 %266, 0
  br i1 %267, label %if.then14, label %if.merge14
if.then14:
  br label %while.cond.8
while.cond.8:
  %268 = load i32, i32* @chat, align 4
  %269 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %268
  %270 = load i32, i32* %269, align 4
  %271 = icmp eq i32 %270, 42
  %272 = zext i1 %271 to i32
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %lor.merge47, label %lor.rhs46
lor.rhs46:
  %274 = load i32, i32* @chat, align 4
  %275 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %274
  %276 = load i32, i32* %275, align 4
  %277 = icmp eq i32 %276, 47
  %278 = zext i1 %277 to i32
  %279 = icmp ne i32 %278, 0
  %280 = zext i1 %279 to i32
  br label %lor.merge47
lor.merge47:
  %281 = phi i32 [1, %while.cond.8], [%280, %lor.rhs46]
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %lor.merge49, label %lor.rhs48
lor.rhs48:
  %283 = load i32, i32* @chat, align 4
  %284 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %283
  %285 = load i32, i32* %284, align 4
  %286 = icmp eq i32 %285, 37
  %287 = zext i1 %286 to i32
  %288 = icmp ne i32 %287, 0
  %289 = zext i1 %288 to i32
  br label %lor.merge49
lor.merge49:
  %290 = phi i32 [1, %lor.merge47], [%289, %lor.rhs48]
  %291 = icmp ne i32 %290, 0
  br i1 %291, label %lor.merge51, label %lor.rhs50
lor.rhs50:
  %292 = load i32, i32* @chat, align 4
  %293 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %292
  %294 = load i32, i32* %293, align 4
  %295 = icmp eq i32 %294, 94
  %296 = zext i1 %295 to i32
  %297 = icmp ne i32 %296, 0
  %298 = zext i1 %297 to i32
  br label %lor.merge51
lor.merge51:
  %299 = phi i32 [1, %lor.merge49], [%298, %lor.rhs50]
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %while.body.8, label %while.merge.8
while.body.8:
  %301 = call i32 @find()
  %302 = icmp eq i32 %301, 0
  %303 = zext i1 %302 to i32
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %if.then15, label %if.merge15
if.then15:
  br label %while.merge.8
break.unreachable:
  br label %if.merge15
if.merge15:
  br label %while.cond.8
while.merge.8:
  call void @chapush(i32 37)
  br label %if.merge14
if.merge14:
  %305 = load i32, i32* @ii, align 4
  %306 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %305
  store i32 32, i32* %306, align 4
  %307 = load i32, i32* @ii, align 4
  %308 = add i32 %307, 1
  store i32 %308, i32* @ii, align 4
  br label %if.merge2
if.merge2:
  %309 = load i32, i32* @i, align 4
  %310 = add i32 %309, 1
  store i32 %310, i32* @i, align 4
  br label %while.cond.2
while.merge.2:
  br label %while.cond.9
while.cond.9:
  %311 = load i32, i32* @chat, align 4
  %312 = icmp sgt i32 %311, 0
  %313 = zext i1 %312 to i32
  %314 = icmp ne i32 %313, 0
  br i1 %314, label %while.body.9, label %while.merge.9
while.body.9:
  %315 = alloca i32, align 4
  %316 = call i32 @chapop()
  store i32 %316, i32* %315, align 4
  %317 = load i32, i32* @ii, align 4
  %318 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %317
  store i32 32, i32* %318, align 4
  %319 = load i32, i32* @ii, align 4
  %320 = add i32 %319, 1
  %321 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %320
  %322 = load i32, i32* %315, align 4
  store i32 %322, i32* %321, align 4
  %323 = load i32, i32* @ii, align 4
  %324 = add i32 %323, 2
  store i32 %324, i32* @ii, align 4
  br label %while.cond.9
while.merge.9:
  %325 = load i32, i32* @ii, align 4
  %326 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %325
  store i32 64, i32* %326, align 4
  store i32 1, i32* @i, align 4
  br label %while.cond.10
while.cond.10:
  %327 = load i32, i32* @i, align 4
  %328 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %327
  %329 = load i32, i32* %328, align 4
  %330 = icmp ne i32 %329, 64
  %331 = zext i1 %330 to i32
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %while.body.10, label %while.merge.10
while.body.10:
  %333 = load i32, i32* @i, align 4
  %334 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %333
  %335 = load i32, i32* %334, align 4
  %336 = icmp eq i32 %335, 43
  %337 = zext i1 %336 to i32
  %338 = icmp ne i32 %337, 0
  br i1 %338, label %lor.merge53, label %lor.rhs52
lor.rhs52:
  %339 = load i32, i32* @i, align 4
  %340 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %339
  %341 = load i32, i32* %340, align 4
  %342 = icmp eq i32 %341, 45
  %343 = zext i1 %342 to i32
  %344 = icmp ne i32 %343, 0
  %345 = zext i1 %344 to i32
  br label %lor.merge53
lor.merge53:
  %346 = phi i32 [1, %while.body.10], [%345, %lor.rhs52]
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %lor.merge55, label %lor.rhs54
lor.rhs54:
  %348 = load i32, i32* @i, align 4
  %349 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %348
  %350 = load i32, i32* %349, align 4
  %351 = icmp eq i32 %350, 42
  %352 = zext i1 %351 to i32
  %353 = icmp ne i32 %352, 0
  %354 = zext i1 %353 to i32
  br label %lor.merge55
lor.merge55:
  %355 = phi i32 [1, %lor.merge53], [%354, %lor.rhs54]
  %356 = icmp ne i32 %355, 0
  br i1 %356, label %lor.merge57, label %lor.rhs56
lor.rhs56:
  %357 = load i32, i32* @i, align 4
  %358 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %357
  %359 = load i32, i32* %358, align 4
  %360 = icmp eq i32 %359, 47
  %361 = zext i1 %360 to i32
  %362 = icmp ne i32 %361, 0
  %363 = zext i1 %362 to i32
  br label %lor.merge57
lor.merge57:
  %364 = phi i32 [1, %lor.merge55], [%363, %lor.rhs56]
  %365 = icmp ne i32 %364, 0
  br i1 %365, label %lor.merge59, label %lor.rhs58
lor.rhs58:
  %366 = load i32, i32* @i, align 4
  %367 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %366
  %368 = load i32, i32* %367, align 4
  %369 = icmp eq i32 %368, 37
  %370 = zext i1 %369 to i32
  %371 = icmp ne i32 %370, 0
  %372 = zext i1 %371 to i32
  br label %lor.merge59
lor.merge59:
  %373 = phi i32 [1, %lor.merge57], [%372, %lor.rhs58]
  %374 = icmp ne i32 %373, 0
  br i1 %374, label %lor.merge61, label %lor.rhs60
lor.rhs60:
  %375 = load i32, i32* @i, align 4
  %376 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %375
  %377 = load i32, i32* %376, align 4
  %378 = icmp eq i32 %377, 94
  %379 = zext i1 %378 to i32
  %380 = icmp ne i32 %379, 0
  %381 = zext i1 %380 to i32
  br label %lor.merge61
lor.merge61:
  %382 = phi i32 [1, %lor.merge59], [%381, %lor.rhs60]
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %if.then16, label %if.else16
if.then16:
  %384 = alloca i32, align 4
  %385 = call i32 @intpop()
  store i32 %385, i32* %384, align 4
  %386 = alloca i32, align 4
  %387 = call i32 @intpop()
  store i32 %387, i32* %386, align 4
  %388 = alloca i32, align 4
  %389 = load i32, i32* @i, align 4
  %390 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %389
  %391 = load i32, i32* %390, align 4
  %392 = icmp eq i32 %391, 43
  %393 = zext i1 %392 to i32
  %394 = icmp ne i32 %393, 0
  br i1 %394, label %if.then17, label %if.merge17
if.then17:
  %395 = load i32, i32* %384, align 4
  %396 = load i32, i32* %386, align 4
  %397 = add i32 %395, %396
  store i32 %397, i32* %388, align 4
  br label %if.merge17
if.merge17:
  %398 = load i32, i32* @i, align 4
  %399 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %398
  %400 = load i32, i32* %399, align 4
  %401 = icmp eq i32 %400, 45
  %402 = zext i1 %401 to i32
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %if.then18, label %if.merge18
if.then18:
  %404 = load i32, i32* %386, align 4
  %405 = load i32, i32* %384, align 4
  %406 = sub i32 %404, %405
  store i32 %406, i32* %388, align 4
  br label %if.merge18
if.merge18:
  %407 = load i32, i32* @i, align 4
  %408 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %407
  %409 = load i32, i32* %408, align 4
  %410 = icmp eq i32 %409, 42
  %411 = zext i1 %410 to i32
  %412 = icmp ne i32 %411, 0
  br i1 %412, label %if.then19, label %if.merge19
if.then19:
  %413 = load i32, i32* %384, align 4
  %414 = load i32, i32* %386, align 4
  %415 = mul i32 %413, %414
  store i32 %415, i32* %388, align 4
  br label %if.merge19
if.merge19:
  %416 = load i32, i32* @i, align 4
  %417 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %416
  %418 = load i32, i32* %417, align 4
  %419 = icmp eq i32 %418, 47
  %420 = zext i1 %419 to i32
  %421 = icmp ne i32 %420, 0
  br i1 %421, label %if.then20, label %if.merge20
if.then20:
  %422 = load i32, i32* %386, align 4
  %423 = load i32, i32* %384, align 4
  %424 = sdiv i32 %422, %423
  store i32 %424, i32* %388, align 4
  br label %if.merge20
if.merge20:
  %425 = load i32, i32* @i, align 4
  %426 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %425
  %427 = load i32, i32* %426, align 4
  %428 = icmp eq i32 %427, 37
  %429 = zext i1 %428 to i32
  %430 = icmp ne i32 %429, 0
  br i1 %430, label %if.then21, label %if.merge21
if.then21:
  %431 = load i32, i32* %386, align 4
  %432 = load i32, i32* %384, align 4
  %433 = srem i32 %431, %432
  store i32 %433, i32* %388, align 4
  br label %if.merge21
if.merge21:
  %434 = load i32, i32* @i, align 4
  %435 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %434
  %436 = load i32, i32* %435, align 4
  %437 = icmp eq i32 %436, 94
  %438 = zext i1 %437 to i32
  %439 = icmp ne i32 %438, 0
  br i1 %439, label %if.then22, label %if.merge22
if.then22:
  %440 = load i32, i32* %386, align 4
  %441 = load i32, i32* %384, align 4
  %442 = call i32 @power(i32 %440, i32 %441)
  store i32 %442, i32* %388, align 4
  br label %if.merge22
if.merge22:
  %443 = load i32, i32* %388, align 4
  call void @intpush(i32 %443)
  br label %if.merge16
if.else16:
  %444 = load i32, i32* @i, align 4
  %445 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %444
  %446 = load i32, i32* %445, align 4
  %447 = icmp ne i32 %446, 32
  %448 = zext i1 %447 to i32
  %449 = icmp ne i32 %448, 0
  br i1 %449, label %if.then23, label %if.merge23
if.then23:
  %450 = load i32, i32* @i, align 4
  %451 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %450
  %452 = load i32, i32* %451, align 4
  %453 = sub i32 %452, 48
  call void @intpush(i32 %453)
  store i32 1, i32* @ii, align 4
  br label %while.cond.11
while.cond.11:
  %454 = load i32, i32* @i, align 4
  %455 = load i32, i32* @ii, align 4
  %456 = add i32 %454, %455
  %457 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %456
  %458 = load i32, i32* %457, align 4
  %459 = icmp ne i32 %458, 32
  %460 = zext i1 %459 to i32
  %461 = icmp ne i32 %460, 0
  br i1 %461, label %while.body.11, label %while.merge.11
while.body.11:
  %462 = load i32, i32* @i, align 4
  %463 = load i32, i32* @ii, align 4
  %464 = add i32 %462, %463
  %465 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %464
  %466 = load i32, i32* %465, align 4
  %467 = sub i32 %466, 48
  call void @intadd(i32 %467)
  %468 = load i32, i32* @ii, align 4
  %469 = add i32 %468, 1
  store i32 %469, i32* @ii, align 4
  br label %while.cond.11
while.merge.11:
  %470 = load i32, i32* @i, align 4
  %471 = load i32, i32* @ii, align 4
  %472 = add i32 %470, %471
  %473 = sub i32 %472, 1
  store i32 %473, i32* @i, align 4
  br label %if.merge23
if.merge23:
  br label %if.merge16
if.merge16:
  %474 = load i32, i32* @i, align 4
  %475 = add i32 %474, 1
  store i32 %475, i32* @i, align 4
  br label %while.cond.10
while.merge.10:
  %476 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 1
  %477 = load i32, i32* %476, align 4
  call void @putint(i32 %477)
  ret i32 0
}

