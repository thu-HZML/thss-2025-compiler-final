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
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  store i32 1, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.0, label %while.merge.0
while.body.0:
  %6 = load i32, i32* %alloc_0, align 4
  %7 = load i32, i32* %0, align 4
  %8 = mul i32 %6, %7
  store i32 %8, i32* %alloc_0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = sub i32 %9, 1
  store i32 %10, i32* %1, align 4
  br label %while.cond.0
while.merge.0:
  %11 = load i32, i32* %alloc_0, align 4
  ret i32 %11
}

define i32 @getstr(i32* %arg0) {
entry4:
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = call i32 @getch()
  store i32 %1, i32* %alloc_1, align 4
  store i32 0, i32* %alloc_2, align 4
  br label %while.cond.1
while.cond.1:
  %2 = load i32, i32* %alloc_1, align 4
  %3 = icmp ne i32 %2, 13
  %4 = zext i1 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %land.rhs5, label %land.merge6
land.rhs5:
  %6 = load i32, i32* %alloc_1, align 4
  %7 = icmp ne i32 %6, 10
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  %10 = zext i1 %9 to i32
  br label %land.merge6
land.merge6:
  %11 = phi i32 [0, %while.cond.1], [%10, %land.rhs5]
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %while.body.1, label %while.merge.1
while.body.1:
  %13 = load i32, i32* %alloc_2, align 4
  %14 = load i32*, i32** %0, align 8
  %15 = getelementptr inbounds i32, i32* %14, i32 %13
  %16 = load i32, i32* %alloc_1, align 4
  store i32 %16, i32* %15, align 4
  %17 = load i32, i32* %alloc_2, align 4
  %18 = add i32 %17, 1
  store i32 %18, i32* %alloc_2, align 4
  %19 = call i32 @getch()
  store i32 %19, i32* %alloc_1, align 4
  br label %while.cond.1
while.merge.1:
  %20 = load i32, i32* %alloc_2, align 4
  ret i32 %20
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
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  store i32 0, i32* @intt, align 4
  store i32 0, i32* @chat, align 4
  %0 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 0
  %1 = call i32 @getstr(i32* %0)
  store i32 %1, i32* %alloc_3, align 4
  br label %while.cond.2
while.cond.2:
  %2 = load i32, i32* @i, align 4
  %3 = load i32, i32* %alloc_3, align 4
  %4 = icmp slt i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.2, label %while.merge.2
while.body.2:
  %7 = load i32, i32* @i, align 4
  %8 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %7
  %9 = load i32, i32* %8, align 4
  %10 = call i32 @isdigit(i32 %9)
  %11 = icmp eq i32 %10, 1
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %if.then2, label %if.else2
if.then2:
  %14 = load i32, i32* @ii, align 4
  %15 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %14
  %16 = load i32, i32* @i, align 4
  %17 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %16
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %15, align 4
  %19 = load i32, i32* @ii, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* @ii, align 4
  br label %if.merge2
if.else2:
  %21 = load i32, i32* @i, align 4
  %22 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %21
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %23, 40
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then3, label %if.merge3
if.then3:
  call void @chapush(i32 40)
  br label %if.merge3
if.merge3:
  %27 = load i32, i32* @i, align 4
  %28 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %27
  %29 = load i32, i32* %28, align 4
  %30 = icmp eq i32 %29, 94
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %if.then4, label %if.merge4
if.then4:
  call void @chapush(i32 94)
  br label %if.merge4
if.merge4:
  %33 = load i32, i32* @i, align 4
  %34 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %33
  %35 = load i32, i32* %34, align 4
  %36 = icmp eq i32 %35, 41
  %37 = zext i1 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %if.then5, label %if.merge5
if.then5:
  %39 = call i32 @chapop()
  store i32 %39, i32* @c, align 4
  br label %while.cond.3
while.cond.3:
  %40 = load i32, i32* @c, align 4
  %41 = icmp ne i32 %40, 40
  %42 = zext i1 %41 to i32
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %while.body.3, label %while.merge.3
while.body.3:
  %44 = load i32, i32* @ii, align 4
  %45 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %44
  store i32 32, i32* %45, align 4
  %46 = load i32, i32* @ii, align 4
  %47 = add i32 %46, 1
  %48 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %47
  %49 = load i32, i32* @c, align 4
  store i32 %49, i32* %48, align 4
  %50 = load i32, i32* @ii, align 4
  %51 = add i32 %50, 2
  store i32 %51, i32* @ii, align 4
  %52 = call i32 @chapop()
  store i32 %52, i32* @c, align 4
  br label %while.cond.3
while.merge.3:
  br label %if.merge5
if.merge5:
  %53 = load i32, i32* @i, align 4
  %54 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %53
  %55 = load i32, i32* %54, align 4
  %56 = icmp eq i32 %55, 43
  %57 = zext i1 %56 to i32
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %if.then6, label %if.merge6
if.then6:
  br label %while.cond.4
while.cond.4:
  %59 = load i32, i32* @chat, align 4
  %60 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %59
  %61 = load i32, i32* %60, align 4
  %62 = icmp eq i32 %61, 43
  %63 = zext i1 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %lor.merge15, label %lor.rhs14
lor.rhs14:
  %65 = load i32, i32* @chat, align 4
  %66 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %65
  %67 = load i32, i32* %66, align 4
  %68 = icmp eq i32 %67, 45
  %69 = zext i1 %68 to i32
  %70 = icmp ne i32 %69, 0
  %71 = zext i1 %70 to i32
  br label %lor.merge15
lor.merge15:
  %72 = phi i32 [1, %while.cond.4], [%71, %lor.rhs14]
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %lor.merge17, label %lor.rhs16
lor.rhs16:
  %74 = load i32, i32* @chat, align 4
  %75 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %74
  %76 = load i32, i32* %75, align 4
  %77 = icmp eq i32 %76, 42
  %78 = zext i1 %77 to i32
  %79 = icmp ne i32 %78, 0
  %80 = zext i1 %79 to i32
  br label %lor.merge17
lor.merge17:
  %81 = phi i32 [1, %lor.merge15], [%80, %lor.rhs16]
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %lor.merge19, label %lor.rhs18
lor.rhs18:
  %83 = load i32, i32* @chat, align 4
  %84 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %83
  %85 = load i32, i32* %84, align 4
  %86 = icmp eq i32 %85, 47
  %87 = zext i1 %86 to i32
  %88 = icmp ne i32 %87, 0
  %89 = zext i1 %88 to i32
  br label %lor.merge19
lor.merge19:
  %90 = phi i32 [1, %lor.merge17], [%89, %lor.rhs18]
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %lor.merge21, label %lor.rhs20
lor.rhs20:
  %92 = load i32, i32* @chat, align 4
  %93 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %92
  %94 = load i32, i32* %93, align 4
  %95 = icmp eq i32 %94, 37
  %96 = zext i1 %95 to i32
  %97 = icmp ne i32 %96, 0
  %98 = zext i1 %97 to i32
  br label %lor.merge21
lor.merge21:
  %99 = phi i32 [1, %lor.merge19], [%98, %lor.rhs20]
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %lor.merge23, label %lor.rhs22
lor.rhs22:
  %101 = load i32, i32* @chat, align 4
  %102 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %101
  %103 = load i32, i32* %102, align 4
  %104 = icmp eq i32 %103, 94
  %105 = zext i1 %104 to i32
  %106 = icmp ne i32 %105, 0
  %107 = zext i1 %106 to i32
  br label %lor.merge23
lor.merge23:
  %108 = phi i32 [1, %lor.merge21], [%107, %lor.rhs22]
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %while.body.4, label %while.merge.4
while.body.4:
  %110 = call i32 @find()
  %111 = icmp eq i32 %110, 0
  %112 = zext i1 %111 to i32
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %if.then7, label %if.merge7
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
  %114 = load i32, i32* @i, align 4
  %115 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %114
  %116 = load i32, i32* %115, align 4
  %117 = icmp eq i32 %116, 45
  %118 = zext i1 %117 to i32
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %if.then8, label %if.merge8
if.then8:
  br label %while.cond.5
while.cond.5:
  %120 = load i32, i32* @chat, align 4
  %121 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %120
  %122 = load i32, i32* %121, align 4
  %123 = icmp eq i32 %122, 43
  %124 = zext i1 %123 to i32
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %lor.merge25, label %lor.rhs24
lor.rhs24:
  %126 = load i32, i32* @chat, align 4
  %127 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %126
  %128 = load i32, i32* %127, align 4
  %129 = icmp eq i32 %128, 45
  %130 = zext i1 %129 to i32
  %131 = icmp ne i32 %130, 0
  %132 = zext i1 %131 to i32
  br label %lor.merge25
lor.merge25:
  %133 = phi i32 [1, %while.cond.5], [%132, %lor.rhs24]
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %lor.merge27, label %lor.rhs26
lor.rhs26:
  %135 = load i32, i32* @chat, align 4
  %136 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %135
  %137 = load i32, i32* %136, align 4
  %138 = icmp eq i32 %137, 42
  %139 = zext i1 %138 to i32
  %140 = icmp ne i32 %139, 0
  %141 = zext i1 %140 to i32
  br label %lor.merge27
lor.merge27:
  %142 = phi i32 [1, %lor.merge25], [%141, %lor.rhs26]
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %lor.merge29, label %lor.rhs28
lor.rhs28:
  %144 = load i32, i32* @chat, align 4
  %145 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %144
  %146 = load i32, i32* %145, align 4
  %147 = icmp eq i32 %146, 47
  %148 = zext i1 %147 to i32
  %149 = icmp ne i32 %148, 0
  %150 = zext i1 %149 to i32
  br label %lor.merge29
lor.merge29:
  %151 = phi i32 [1, %lor.merge27], [%150, %lor.rhs28]
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %lor.merge31, label %lor.rhs30
lor.rhs30:
  %153 = load i32, i32* @chat, align 4
  %154 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %153
  %155 = load i32, i32* %154, align 4
  %156 = icmp eq i32 %155, 37
  %157 = zext i1 %156 to i32
  %158 = icmp ne i32 %157, 0
  %159 = zext i1 %158 to i32
  br label %lor.merge31
lor.merge31:
  %160 = phi i32 [1, %lor.merge29], [%159, %lor.rhs30]
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %lor.merge33, label %lor.rhs32
lor.rhs32:
  %162 = load i32, i32* @chat, align 4
  %163 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %162
  %164 = load i32, i32* %163, align 4
  %165 = icmp eq i32 %164, 94
  %166 = zext i1 %165 to i32
  %167 = icmp ne i32 %166, 0
  %168 = zext i1 %167 to i32
  br label %lor.merge33
lor.merge33:
  %169 = phi i32 [1, %lor.merge31], [%168, %lor.rhs32]
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %while.body.5, label %while.merge.5
while.body.5:
  %171 = call i32 @find()
  %172 = icmp eq i32 %171, 0
  %173 = zext i1 %172 to i32
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %if.then9, label %if.merge9
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
  %175 = load i32, i32* @i, align 4
  %176 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %175
  %177 = load i32, i32* %176, align 4
  %178 = icmp eq i32 %177, 42
  %179 = zext i1 %178 to i32
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %if.then10, label %if.merge10
if.then10:
  br label %while.cond.6
while.cond.6:
  %181 = load i32, i32* @chat, align 4
  %182 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %181
  %183 = load i32, i32* %182, align 4
  %184 = icmp eq i32 %183, 42
  %185 = zext i1 %184 to i32
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %lor.merge35, label %lor.rhs34
lor.rhs34:
  %187 = load i32, i32* @chat, align 4
  %188 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %187
  %189 = load i32, i32* %188, align 4
  %190 = icmp eq i32 %189, 47
  %191 = zext i1 %190 to i32
  %192 = icmp ne i32 %191, 0
  %193 = zext i1 %192 to i32
  br label %lor.merge35
lor.merge35:
  %194 = phi i32 [1, %while.cond.6], [%193, %lor.rhs34]
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %lor.merge37, label %lor.rhs36
lor.rhs36:
  %196 = load i32, i32* @chat, align 4
  %197 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %196
  %198 = load i32, i32* %197, align 4
  %199 = icmp eq i32 %198, 37
  %200 = zext i1 %199 to i32
  %201 = icmp ne i32 %200, 0
  %202 = zext i1 %201 to i32
  br label %lor.merge37
lor.merge37:
  %203 = phi i32 [1, %lor.merge35], [%202, %lor.rhs36]
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %lor.merge39, label %lor.rhs38
lor.rhs38:
  %205 = load i32, i32* @chat, align 4
  %206 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %205
  %207 = load i32, i32* %206, align 4
  %208 = icmp eq i32 %207, 94
  %209 = zext i1 %208 to i32
  %210 = icmp ne i32 %209, 0
  %211 = zext i1 %210 to i32
  br label %lor.merge39
lor.merge39:
  %212 = phi i32 [1, %lor.merge37], [%211, %lor.rhs38]
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %while.body.6, label %while.merge.6
while.body.6:
  %214 = call i32 @find()
  %215 = icmp eq i32 %214, 0
  %216 = zext i1 %215 to i32
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %if.then11, label %if.merge11
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
  %218 = load i32, i32* @i, align 4
  %219 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %218
  %220 = load i32, i32* %219, align 4
  %221 = icmp eq i32 %220, 47
  %222 = zext i1 %221 to i32
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %if.then12, label %if.merge12
if.then12:
  br label %while.cond.7
while.cond.7:
  %224 = load i32, i32* @chat, align 4
  %225 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %224
  %226 = load i32, i32* %225, align 4
  %227 = icmp eq i32 %226, 42
  %228 = zext i1 %227 to i32
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %lor.merge41, label %lor.rhs40
lor.rhs40:
  %230 = load i32, i32* @chat, align 4
  %231 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %230
  %232 = load i32, i32* %231, align 4
  %233 = icmp eq i32 %232, 47
  %234 = zext i1 %233 to i32
  %235 = icmp ne i32 %234, 0
  %236 = zext i1 %235 to i32
  br label %lor.merge41
lor.merge41:
  %237 = phi i32 [1, %while.cond.7], [%236, %lor.rhs40]
  %238 = icmp ne i32 %237, 0
  br i1 %238, label %lor.merge43, label %lor.rhs42
lor.rhs42:
  %239 = load i32, i32* @chat, align 4
  %240 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %239
  %241 = load i32, i32* %240, align 4
  %242 = icmp eq i32 %241, 37
  %243 = zext i1 %242 to i32
  %244 = icmp ne i32 %243, 0
  %245 = zext i1 %244 to i32
  br label %lor.merge43
lor.merge43:
  %246 = phi i32 [1, %lor.merge41], [%245, %lor.rhs42]
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %lor.merge45, label %lor.rhs44
lor.rhs44:
  %248 = load i32, i32* @chat, align 4
  %249 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %248
  %250 = load i32, i32* %249, align 4
  %251 = icmp eq i32 %250, 94
  %252 = zext i1 %251 to i32
  %253 = icmp ne i32 %252, 0
  %254 = zext i1 %253 to i32
  br label %lor.merge45
lor.merge45:
  %255 = phi i32 [1, %lor.merge43], [%254, %lor.rhs44]
  %256 = icmp ne i32 %255, 0
  br i1 %256, label %while.body.7, label %while.merge.7
while.body.7:
  %257 = call i32 @find()
  %258 = icmp eq i32 %257, 0
  %259 = zext i1 %258 to i32
  %260 = icmp ne i32 %259, 0
  br i1 %260, label %if.then13, label %if.merge13
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
  %261 = load i32, i32* @i, align 4
  %262 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get, i32 0, i32 %261
  %263 = load i32, i32* %262, align 4
  %264 = icmp eq i32 %263, 37
  %265 = zext i1 %264 to i32
  %266 = icmp ne i32 %265, 0
  br i1 %266, label %if.then14, label %if.merge14
if.then14:
  br label %while.cond.8
while.cond.8:
  %267 = load i32, i32* @chat, align 4
  %268 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %267
  %269 = load i32, i32* %268, align 4
  %270 = icmp eq i32 %269, 42
  %271 = zext i1 %270 to i32
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %lor.merge47, label %lor.rhs46
lor.rhs46:
  %273 = load i32, i32* @chat, align 4
  %274 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %273
  %275 = load i32, i32* %274, align 4
  %276 = icmp eq i32 %275, 47
  %277 = zext i1 %276 to i32
  %278 = icmp ne i32 %277, 0
  %279 = zext i1 %278 to i32
  br label %lor.merge47
lor.merge47:
  %280 = phi i32 [1, %while.cond.8], [%279, %lor.rhs46]
  %281 = icmp ne i32 %280, 0
  br i1 %281, label %lor.merge49, label %lor.rhs48
lor.rhs48:
  %282 = load i32, i32* @chat, align 4
  %283 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %282
  %284 = load i32, i32* %283, align 4
  %285 = icmp eq i32 %284, 37
  %286 = zext i1 %285 to i32
  %287 = icmp ne i32 %286, 0
  %288 = zext i1 %287 to i32
  br label %lor.merge49
lor.merge49:
  %289 = phi i32 [1, %lor.merge47], [%288, %lor.rhs48]
  %290 = icmp ne i32 %289, 0
  br i1 %290, label %lor.merge51, label %lor.rhs50
lor.rhs50:
  %291 = load i32, i32* @chat, align 4
  %292 = getelementptr inbounds [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %291
  %293 = load i32, i32* %292, align 4
  %294 = icmp eq i32 %293, 94
  %295 = zext i1 %294 to i32
  %296 = icmp ne i32 %295, 0
  %297 = zext i1 %296 to i32
  br label %lor.merge51
lor.merge51:
  %298 = phi i32 [1, %lor.merge49], [%297, %lor.rhs50]
  %299 = icmp ne i32 %298, 0
  br i1 %299, label %while.body.8, label %while.merge.8
while.body.8:
  %300 = call i32 @find()
  %301 = icmp eq i32 %300, 0
  %302 = zext i1 %301 to i32
  %303 = icmp ne i32 %302, 0
  br i1 %303, label %if.then15, label %if.merge15
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
  %304 = load i32, i32* @ii, align 4
  %305 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %304
  store i32 32, i32* %305, align 4
  %306 = load i32, i32* @ii, align 4
  %307 = add i32 %306, 1
  store i32 %307, i32* @ii, align 4
  br label %if.merge2
if.merge2:
  %308 = load i32, i32* @i, align 4
  %309 = add i32 %308, 1
  store i32 %309, i32* @i, align 4
  br label %while.cond.2
while.merge.2:
  br label %while.cond.9
while.cond.9:
  %310 = load i32, i32* @chat, align 4
  %311 = icmp sgt i32 %310, 0
  %312 = zext i1 %311 to i32
  %313 = icmp ne i32 %312, 0
  br i1 %313, label %while.body.9, label %while.merge.9
while.body.9:
  %314 = call i32 @chapop()
  store i32 %314, i32* %alloc_4, align 4
  %315 = load i32, i32* @ii, align 4
  %316 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %315
  store i32 32, i32* %316, align 4
  %317 = load i32, i32* @ii, align 4
  %318 = add i32 %317, 1
  %319 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %318
  %320 = load i32, i32* %alloc_4, align 4
  store i32 %320, i32* %319, align 4
  %321 = load i32, i32* @ii, align 4
  %322 = add i32 %321, 2
  store i32 %322, i32* @ii, align 4
  br label %while.cond.9
while.merge.9:
  %323 = load i32, i32* @ii, align 4
  %324 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %323
  store i32 64, i32* %324, align 4
  store i32 1, i32* @i, align 4
  br label %while.cond.10
while.cond.10:
  %325 = load i32, i32* @i, align 4
  %326 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %325
  %327 = load i32, i32* %326, align 4
  %328 = icmp ne i32 %327, 64
  %329 = zext i1 %328 to i32
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %while.body.10, label %while.merge.10
while.body.10:
  %331 = load i32, i32* @i, align 4
  %332 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %331
  %333 = load i32, i32* %332, align 4
  %334 = icmp eq i32 %333, 43
  %335 = zext i1 %334 to i32
  %336 = icmp ne i32 %335, 0
  br i1 %336, label %lor.merge53, label %lor.rhs52
lor.rhs52:
  %337 = load i32, i32* @i, align 4
  %338 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %337
  %339 = load i32, i32* %338, align 4
  %340 = icmp eq i32 %339, 45
  %341 = zext i1 %340 to i32
  %342 = icmp ne i32 %341, 0
  %343 = zext i1 %342 to i32
  br label %lor.merge53
lor.merge53:
  %344 = phi i32 [1, %while.body.10], [%343, %lor.rhs52]
  %345 = icmp ne i32 %344, 0
  br i1 %345, label %lor.merge55, label %lor.rhs54
lor.rhs54:
  %346 = load i32, i32* @i, align 4
  %347 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %346
  %348 = load i32, i32* %347, align 4
  %349 = icmp eq i32 %348, 42
  %350 = zext i1 %349 to i32
  %351 = icmp ne i32 %350, 0
  %352 = zext i1 %351 to i32
  br label %lor.merge55
lor.merge55:
  %353 = phi i32 [1, %lor.merge53], [%352, %lor.rhs54]
  %354 = icmp ne i32 %353, 0
  br i1 %354, label %lor.merge57, label %lor.rhs56
lor.rhs56:
  %355 = load i32, i32* @i, align 4
  %356 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %355
  %357 = load i32, i32* %356, align 4
  %358 = icmp eq i32 %357, 47
  %359 = zext i1 %358 to i32
  %360 = icmp ne i32 %359, 0
  %361 = zext i1 %360 to i32
  br label %lor.merge57
lor.merge57:
  %362 = phi i32 [1, %lor.merge55], [%361, %lor.rhs56]
  %363 = icmp ne i32 %362, 0
  br i1 %363, label %lor.merge59, label %lor.rhs58
lor.rhs58:
  %364 = load i32, i32* @i, align 4
  %365 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %364
  %366 = load i32, i32* %365, align 4
  %367 = icmp eq i32 %366, 37
  %368 = zext i1 %367 to i32
  %369 = icmp ne i32 %368, 0
  %370 = zext i1 %369 to i32
  br label %lor.merge59
lor.merge59:
  %371 = phi i32 [1, %lor.merge57], [%370, %lor.rhs58]
  %372 = icmp ne i32 %371, 0
  br i1 %372, label %lor.merge61, label %lor.rhs60
lor.rhs60:
  %373 = load i32, i32* @i, align 4
  %374 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %373
  %375 = load i32, i32* %374, align 4
  %376 = icmp eq i32 %375, 94
  %377 = zext i1 %376 to i32
  %378 = icmp ne i32 %377, 0
  %379 = zext i1 %378 to i32
  br label %lor.merge61
lor.merge61:
  %380 = phi i32 [1, %lor.merge59], [%379, %lor.rhs60]
  %381 = icmp ne i32 %380, 0
  br i1 %381, label %if.then16, label %if.else16
if.then16:
  %382 = call i32 @intpop()
  store i32 %382, i32* %alloc_5, align 4
  %383 = call i32 @intpop()
  store i32 %383, i32* %alloc_6, align 4
  %384 = load i32, i32* @i, align 4
  %385 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %384
  %386 = load i32, i32* %385, align 4
  %387 = icmp eq i32 %386, 43
  %388 = zext i1 %387 to i32
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %if.then17, label %if.merge17
if.then17:
  %390 = load i32, i32* %alloc_5, align 4
  %391 = load i32, i32* %alloc_6, align 4
  %392 = add i32 %390, %391
  store i32 %392, i32* %alloc_7, align 4
  br label %if.merge17
if.merge17:
  %393 = load i32, i32* @i, align 4
  %394 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %393
  %395 = load i32, i32* %394, align 4
  %396 = icmp eq i32 %395, 45
  %397 = zext i1 %396 to i32
  %398 = icmp ne i32 %397, 0
  br i1 %398, label %if.then18, label %if.merge18
if.then18:
  %399 = load i32, i32* %alloc_6, align 4
  %400 = load i32, i32* %alloc_5, align 4
  %401 = sub i32 %399, %400
  store i32 %401, i32* %alloc_7, align 4
  br label %if.merge18
if.merge18:
  %402 = load i32, i32* @i, align 4
  %403 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %402
  %404 = load i32, i32* %403, align 4
  %405 = icmp eq i32 %404, 42
  %406 = zext i1 %405 to i32
  %407 = icmp ne i32 %406, 0
  br i1 %407, label %if.then19, label %if.merge19
if.then19:
  %408 = load i32, i32* %alloc_5, align 4
  %409 = load i32, i32* %alloc_6, align 4
  %410 = mul i32 %408, %409
  store i32 %410, i32* %alloc_7, align 4
  br label %if.merge19
if.merge19:
  %411 = load i32, i32* @i, align 4
  %412 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %411
  %413 = load i32, i32* %412, align 4
  %414 = icmp eq i32 %413, 47
  %415 = zext i1 %414 to i32
  %416 = icmp ne i32 %415, 0
  br i1 %416, label %if.then20, label %if.merge20
if.then20:
  %417 = load i32, i32* %alloc_6, align 4
  %418 = load i32, i32* %alloc_5, align 4
  %419 = sdiv i32 %417, %418
  store i32 %419, i32* %alloc_7, align 4
  br label %if.merge20
if.merge20:
  %420 = load i32, i32* @i, align 4
  %421 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %420
  %422 = load i32, i32* %421, align 4
  %423 = icmp eq i32 %422, 37
  %424 = zext i1 %423 to i32
  %425 = icmp ne i32 %424, 0
  br i1 %425, label %if.then21, label %if.merge21
if.then21:
  %426 = load i32, i32* %alloc_6, align 4
  %427 = load i32, i32* %alloc_5, align 4
  %428 = srem i32 %426, %427
  store i32 %428, i32* %alloc_7, align 4
  br label %if.merge21
if.merge21:
  %429 = load i32, i32* @i, align 4
  %430 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %429
  %431 = load i32, i32* %430, align 4
  %432 = icmp eq i32 %431, 94
  %433 = zext i1 %432 to i32
  %434 = icmp ne i32 %433, 0
  br i1 %434, label %if.then22, label %if.merge22
if.then22:
  %435 = load i32, i32* %alloc_6, align 4
  %436 = load i32, i32* %alloc_5, align 4
  %437 = call i32 @power(i32 %435, i32 %436)
  store i32 %437, i32* %alloc_7, align 4
  br label %if.merge22
if.merge22:
  %438 = load i32, i32* %alloc_7, align 4
  call void @intpush(i32 %438)
  br label %if.merge16
if.else16:
  %439 = load i32, i32* @i, align 4
  %440 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %439
  %441 = load i32, i32* %440, align 4
  %442 = icmp ne i32 %441, 32
  %443 = zext i1 %442 to i32
  %444 = icmp ne i32 %443, 0
  br i1 %444, label %if.then23, label %if.merge23
if.then23:
  %445 = load i32, i32* @i, align 4
  %446 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %445
  %447 = load i32, i32* %446, align 4
  %448 = sub i32 %447, 48
  call void @intpush(i32 %448)
  store i32 1, i32* @ii, align 4
  br label %while.cond.11
while.cond.11:
  %449 = load i32, i32* @i, align 4
  %450 = load i32, i32* @ii, align 4
  %451 = add i32 %449, %450
  %452 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %451
  %453 = load i32, i32* %452, align 4
  %454 = icmp ne i32 %453, 32
  %455 = zext i1 %454 to i32
  %456 = icmp ne i32 %455, 0
  br i1 %456, label %while.body.11, label %while.merge.11
while.body.11:
  %457 = load i32, i32* @i, align 4
  %458 = load i32, i32* @ii, align 4
  %459 = add i32 %457, %458
  %460 = getelementptr inbounds [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %459
  %461 = load i32, i32* %460, align 4
  %462 = sub i32 %461, 48
  call void @intadd(i32 %462)
  %463 = load i32, i32* @ii, align 4
  %464 = add i32 %463, 1
  store i32 %464, i32* @ii, align 4
  br label %while.cond.11
while.merge.11:
  %465 = load i32, i32* @i, align 4
  %466 = load i32, i32* @ii, align 4
  %467 = add i32 %465, %466
  %468 = sub i32 %467, 1
  store i32 %468, i32* @i, align 4
  br label %if.merge23
if.merge23:
  br label %if.merge16
if.merge16:
  %469 = load i32, i32* @i, align 4
  %470 = add i32 %469, 1
  store i32 %470, i32* @i, align 4
  br label %while.cond.10
while.merge.10:
  %471 = getelementptr inbounds [10000 x i32], [10000 x i32]* @ints, i32 0, i32 1
  %472 = load i32, i32* %471, align 4
  call void @putint(i32 %472)
  ret i32 0
}

