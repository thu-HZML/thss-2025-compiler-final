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

@maxn = dso_local constant i32 18, align 4
@mod = dso_local constant i32 1000000007, align 4
@dp = dso_local global [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]] zeroinitializer, align 4
@list = dso_local global [200 x i32] zeroinitializer, align 4
@cns = dso_local global [20 x i32] zeroinitializer, align 4

define i32 @equal(i32 %arg0, i32 %arg1) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  %3 = load i32, i32* %1, align 4
  %4 = icmp eq i32 %2, %3
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %if.then0, label %if.merge0
if.then0:
  ret i32 1
if.merge0:
  ret i32 0
}

define i32 @dfs(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5) {
entry1:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  store i32 %arg2, i32* %2, align 4
  %3 = alloca i32, align 4
  store i32 %arg3, i32* %3, align 4
  %4 = alloca i32, align 4
  store i32 %arg4, i32* %4, align 4
  %5 = alloca i32, align 4
  store i32 %arg5, i32* %5, align 4
  %6 = load i32, i32* %0, align 4
  %7 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %6
  %8 = load i32, i32* %1, align 4
  %9 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %7, i32 0, i32 %8
  %10 = load i32, i32* %2, align 4
  %11 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %9, i32 0, i32 %10
  %12 = load i32, i32* %3, align 4
  %13 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %11, i32 0, i32 %12
  %14 = load i32, i32* %4, align 4
  %15 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %13, i32 0, i32 %14
  %16 = load i32, i32* %5, align 4
  %17 = getelementptr inbounds [7 x i32], [7 x i32]* %15, i32 0, i32 %16
  %18 = load i32, i32* %17, align 4
  %19 = icmp ne i32 %18, -1
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %if.then1, label %if.merge1
if.then1:
  %22 = load i32, i32* %0, align 4
  %23 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %22
  %24 = load i32, i32* %1, align 4
  %25 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %23, i32 0, i32 %24
  %26 = load i32, i32* %2, align 4
  %27 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %25, i32 0, i32 %26
  %28 = load i32, i32* %3, align 4
  %29 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %27, i32 0, i32 %28
  %30 = load i32, i32* %4, align 4
  %31 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %29, i32 0, i32 %30
  %32 = load i32, i32* %5, align 4
  %33 = getelementptr inbounds [7 x i32], [7 x i32]* %31, i32 0, i32 %32
  %34 = load i32, i32* %33, align 4
  ret i32 %34
if.merge1:
  %35 = load i32, i32* %0, align 4
  %36 = load i32, i32* %1, align 4
  %37 = add i32 %35, %36
  %38 = load i32, i32* %2, align 4
  %39 = add i32 %37, %38
  %40 = load i32, i32* %3, align 4
  %41 = add i32 %39, %40
  %42 = load i32, i32* %4, align 4
  %43 = add i32 %41, %42
  %44 = icmp eq i32 %43, 0
  %45 = zext i1 %44 to i32
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %if.then2, label %if.merge2
if.then2:
  ret i32 1
if.merge2:
  %47 = alloca i32, align 4
  store i32 0, i32* %47, align 4
  %48 = load i32, i32* %0, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %if.then3, label %if.merge3
if.then3:
  %50 = load i32, i32* %47, align 4
  %51 = load i32, i32* %0, align 4
  %52 = load i32, i32* %5, align 4
  %53 = call i32 @equal(i32 %52, i32 2)
  %54 = sub i32 %51, %53
  %55 = load i32, i32* %0, align 4
  %56 = sub i32 %55, 1
  %57 = load i32, i32* %1, align 4
  %58 = load i32, i32* %2, align 4
  %59 = load i32, i32* %3, align 4
  %60 = load i32, i32* %4, align 4
  %61 = call i32 @dfs(i32 %56, i32 %57, i32 %58, i32 %59, i32 %60, i32 1)
  %62 = mul i32 %54, %61
  %63 = add i32 %50, %62
  %64 = srem i32 %63, 1000000007
  store i32 %64, i32* %47, align 4
  br label %if.merge3
if.merge3:
  %65 = load i32, i32* %1, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %if.then4, label %if.merge4
if.then4:
  %67 = load i32, i32* %47, align 4
  %68 = load i32, i32* %1, align 4
  %69 = load i32, i32* %5, align 4
  %70 = call i32 @equal(i32 %69, i32 3)
  %71 = sub i32 %68, %70
  %72 = load i32, i32* %0, align 4
  %73 = add i32 %72, 1
  %74 = load i32, i32* %1, align 4
  %75 = sub i32 %74, 1
  %76 = load i32, i32* %2, align 4
  %77 = load i32, i32* %3, align 4
  %78 = load i32, i32* %4, align 4
  %79 = call i32 @dfs(i32 %73, i32 %75, i32 %76, i32 %77, i32 %78, i32 2)
  %80 = mul i32 %71, %79
  %81 = add i32 %67, %80
  %82 = srem i32 %81, 1000000007
  store i32 %82, i32* %47, align 4
  br label %if.merge4
if.merge4:
  %83 = load i32, i32* %2, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %if.then5, label %if.merge5
if.then5:
  %85 = load i32, i32* %47, align 4
  %86 = load i32, i32* %2, align 4
  %87 = load i32, i32* %5, align 4
  %88 = call i32 @equal(i32 %87, i32 4)
  %89 = sub i32 %86, %88
  %90 = load i32, i32* %0, align 4
  %91 = load i32, i32* %1, align 4
  %92 = add i32 %91, 1
  %93 = load i32, i32* %2, align 4
  %94 = sub i32 %93, 1
  %95 = load i32, i32* %3, align 4
  %96 = load i32, i32* %4, align 4
  %97 = call i32 @dfs(i32 %90, i32 %92, i32 %94, i32 %95, i32 %96, i32 3)
  %98 = mul i32 %89, %97
  %99 = add i32 %85, %98
  %100 = srem i32 %99, 1000000007
  store i32 %100, i32* %47, align 4
  br label %if.merge5
if.merge5:
  %101 = load i32, i32* %3, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %if.then6, label %if.merge6
if.then6:
  %103 = load i32, i32* %47, align 4
  %104 = load i32, i32* %3, align 4
  %105 = load i32, i32* %5, align 4
  %106 = call i32 @equal(i32 %105, i32 5)
  %107 = sub i32 %104, %106
  %108 = load i32, i32* %0, align 4
  %109 = load i32, i32* %1, align 4
  %110 = load i32, i32* %2, align 4
  %111 = add i32 %110, 1
  %112 = load i32, i32* %3, align 4
  %113 = sub i32 %112, 1
  %114 = load i32, i32* %4, align 4
  %115 = call i32 @dfs(i32 %108, i32 %109, i32 %111, i32 %113, i32 %114, i32 4)
  %116 = mul i32 %107, %115
  %117 = add i32 %103, %116
  %118 = srem i32 %117, 1000000007
  store i32 %118, i32* %47, align 4
  br label %if.merge6
if.merge6:
  %119 = load i32, i32* %4, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %if.then7, label %if.merge7
if.then7:
  %121 = load i32, i32* %47, align 4
  %122 = load i32, i32* %4, align 4
  %123 = load i32, i32* %0, align 4
  %124 = load i32, i32* %1, align 4
  %125 = load i32, i32* %2, align 4
  %126 = load i32, i32* %3, align 4
  %127 = add i32 %126, 1
  %128 = load i32, i32* %4, align 4
  %129 = sub i32 %128, 1
  %130 = call i32 @dfs(i32 %123, i32 %124, i32 %125, i32 %127, i32 %129, i32 5)
  %131 = mul i32 %122, %130
  %132 = add i32 %121, %131
  %133 = srem i32 %132, 1000000007
  store i32 %133, i32* %47, align 4
  br label %if.merge7
if.merge7:
  %134 = load i32, i32* %0, align 4
  %135 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %134
  %136 = load i32, i32* %1, align 4
  %137 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %135, i32 0, i32 %136
  %138 = load i32, i32* %2, align 4
  %139 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %137, i32 0, i32 %138
  %140 = load i32, i32* %3, align 4
  %141 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %139, i32 0, i32 %140
  %142 = load i32, i32* %4, align 4
  %143 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %141, i32 0, i32 %142
  %144 = load i32, i32* %5, align 4
  %145 = getelementptr inbounds [7 x i32], [7 x i32]* %143, i32 0, i32 %144
  %146 = load i32, i32* %47, align 4
  %147 = srem i32 %146, 1000000007
  store i32 %147, i32* %145, align 4
  %148 = load i32, i32* %0, align 4
  %149 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %148
  %150 = load i32, i32* %1, align 4
  %151 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %149, i32 0, i32 %150
  %152 = load i32, i32* %2, align 4
  %153 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %151, i32 0, i32 %152
  %154 = load i32, i32* %3, align 4
  %155 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %153, i32 0, i32 %154
  %156 = load i32, i32* %4, align 4
  %157 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %155, i32 0, i32 %156
  %158 = load i32, i32* %5, align 4
  %159 = getelementptr inbounds [7 x i32], [7 x i32]* %157, i32 0, i32 %158
  %160 = load i32, i32* %159, align 4
  ret i32 %160
}

define i32 @main() {
entry2:
  %0 = alloca i32, align 4
  %1 = call i32 @getint()
  store i32 %1, i32* %0, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  br label %while.cond.0
while.cond.0:
  %3 = load i32, i32* %2, align 4
  %4 = icmp slt i32 %3, 18
  %5 = zext i1 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %while.body.0, label %while.merge.0
while.body.0:
  %7 = alloca i32, align 4
  store i32 0, i32* %7, align 4
  br label %while.cond.1
while.cond.1:
  %8 = load i32, i32* %7, align 4
  %9 = icmp slt i32 %8, 18
  %10 = zext i1 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %while.body.1, label %while.merge.1
while.body.1:
  %12 = alloca i32, align 4
  store i32 0, i32* %12, align 4
  br label %while.cond.2
while.cond.2:
  %13 = load i32, i32* %12, align 4
  %14 = icmp slt i32 %13, 18
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %while.body.2, label %while.merge.2
while.body.2:
  %17 = alloca i32, align 4
  store i32 0, i32* %17, align 4
  br label %while.cond.3
while.cond.3:
  %18 = load i32, i32* %17, align 4
  %19 = icmp slt i32 %18, 18
  %20 = zext i1 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %while.body.3, label %while.merge.3
while.body.3:
  %22 = alloca i32, align 4
  store i32 0, i32* %22, align 4
  br label %while.cond.4
while.cond.4:
  %23 = load i32, i32* %22, align 4
  %24 = icmp slt i32 %23, 18
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %while.body.4, label %while.merge.4
while.body.4:
  %27 = alloca i32, align 4
  store i32 0, i32* %27, align 4
  br label %while.cond.5
while.cond.5:
  %28 = load i32, i32* %27, align 4
  %29 = icmp slt i32 %28, 7
  %30 = zext i1 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %while.body.5, label %while.merge.5
while.body.5:
  %32 = load i32, i32* %2, align 4
  %33 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %32
  %34 = load i32, i32* %7, align 4
  %35 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %33, i32 0, i32 %34
  %36 = load i32, i32* %12, align 4
  %37 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %35, i32 0, i32 %36
  %38 = load i32, i32* %17, align 4
  %39 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %37, i32 0, i32 %38
  %40 = load i32, i32* %22, align 4
  %41 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %39, i32 0, i32 %40
  %42 = load i32, i32* %27, align 4
  %43 = getelementptr inbounds [7 x i32], [7 x i32]* %41, i32 0, i32 %42
  store i32 -1, i32* %43, align 4
  %44 = load i32, i32* %27, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %27, align 4
  br label %while.cond.5
while.merge.5:
  %46 = load i32, i32* %22, align 4
  %47 = add i32 %46, 1
  store i32 %47, i32* %22, align 4
  br label %while.cond.4
while.merge.4:
  %48 = load i32, i32* %17, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %17, align 4
  br label %while.cond.3
while.merge.3:
  %50 = load i32, i32* %12, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %12, align 4
  br label %while.cond.2
while.merge.2:
  %52 = load i32, i32* %7, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %7, align 4
  br label %while.cond.1
while.merge.1:
  %54 = load i32, i32* %2, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %2, align 4
  br label %while.cond.0
while.merge.0:
  store i32 0, i32* %2, align 4
  br label %while.cond.6
while.cond.6:
  %56 = load i32, i32* %2, align 4
  %57 = load i32, i32* %0, align 4
  %58 = icmp slt i32 %56, %57
  %59 = zext i1 %58 to i32
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %while.body.6, label %while.merge.6
while.body.6:
  %61 = load i32, i32* %2, align 4
  %62 = getelementptr inbounds [200 x i32], [200 x i32]* @list, i32 0, i32 %61
  %63 = call i32 @getint()
  store i32 %63, i32* %62, align 4
  %64 = load i32, i32* %2, align 4
  %65 = getelementptr inbounds [200 x i32], [200 x i32]* @list, i32 0, i32 %64
  %66 = load i32, i32* %65, align 4
  %67 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 %66
  %68 = load i32, i32* %2, align 4
  %69 = getelementptr inbounds [200 x i32], [200 x i32]* @list, i32 0, i32 %68
  %70 = load i32, i32* %69, align 4
  %71 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 %70
  %72 = load i32, i32* %71, align 4
  %73 = add i32 %72, 1
  store i32 %73, i32* %67, align 4
  %74 = load i32, i32* %2, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %2, align 4
  br label %while.cond.6
while.merge.6:
  %76 = alloca i32, align 4
  %77 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 1
  %78 = load i32, i32* %77, align 4
  %79 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 2
  %80 = load i32, i32* %79, align 4
  %81 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 3
  %82 = load i32, i32* %81, align 4
  %83 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 4
  %84 = load i32, i32* %83, align 4
  %85 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 5
  %86 = load i32, i32* %85, align 4
  %87 = call i32 @dfs(i32 %78, i32 %80, i32 %82, i32 %84, i32 %86, i32 0)
  store i32 %87, i32* %76, align 4
  %88 = load i32, i32* %76, align 4
  call void @putint(i32 %88)
  %89 = load i32, i32* %76, align 4
  ret i32 %89
}

