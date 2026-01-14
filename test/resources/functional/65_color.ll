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
  %alloc_0 = alloca i32, align 4
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
  store i32 0, i32* %alloc_0, align 4
  %47 = load i32, i32* %0, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %if.then3, label %if.merge3
if.then3:
  %49 = load i32, i32* %alloc_0, align 4
  %50 = load i32, i32* %0, align 4
  %51 = load i32, i32* %5, align 4
  %52 = call i32 @equal(i32 %51, i32 2)
  %53 = sub i32 %50, %52
  %54 = load i32, i32* %0, align 4
  %55 = sub i32 %54, 1
  %56 = load i32, i32* %1, align 4
  %57 = load i32, i32* %2, align 4
  %58 = load i32, i32* %3, align 4
  %59 = load i32, i32* %4, align 4
  %60 = call i32 @dfs(i32 %55, i32 %56, i32 %57, i32 %58, i32 %59, i32 1)
  %61 = mul i32 %53, %60
  %62 = add i32 %49, %61
  %63 = srem i32 %62, 1000000007
  store i32 %63, i32* %alloc_0, align 4
  br label %if.merge3
if.merge3:
  %64 = load i32, i32* %1, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %if.then4, label %if.merge4
if.then4:
  %66 = load i32, i32* %alloc_0, align 4
  %67 = load i32, i32* %1, align 4
  %68 = load i32, i32* %5, align 4
  %69 = call i32 @equal(i32 %68, i32 3)
  %70 = sub i32 %67, %69
  %71 = load i32, i32* %0, align 4
  %72 = add i32 %71, 1
  %73 = load i32, i32* %1, align 4
  %74 = sub i32 %73, 1
  %75 = load i32, i32* %2, align 4
  %76 = load i32, i32* %3, align 4
  %77 = load i32, i32* %4, align 4
  %78 = call i32 @dfs(i32 %72, i32 %74, i32 %75, i32 %76, i32 %77, i32 2)
  %79 = mul i32 %70, %78
  %80 = add i32 %66, %79
  %81 = srem i32 %80, 1000000007
  store i32 %81, i32* %alloc_0, align 4
  br label %if.merge4
if.merge4:
  %82 = load i32, i32* %2, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %if.then5, label %if.merge5
if.then5:
  %84 = load i32, i32* %alloc_0, align 4
  %85 = load i32, i32* %2, align 4
  %86 = load i32, i32* %5, align 4
  %87 = call i32 @equal(i32 %86, i32 4)
  %88 = sub i32 %85, %87
  %89 = load i32, i32* %0, align 4
  %90 = load i32, i32* %1, align 4
  %91 = add i32 %90, 1
  %92 = load i32, i32* %2, align 4
  %93 = sub i32 %92, 1
  %94 = load i32, i32* %3, align 4
  %95 = load i32, i32* %4, align 4
  %96 = call i32 @dfs(i32 %89, i32 %91, i32 %93, i32 %94, i32 %95, i32 3)
  %97 = mul i32 %88, %96
  %98 = add i32 %84, %97
  %99 = srem i32 %98, 1000000007
  store i32 %99, i32* %alloc_0, align 4
  br label %if.merge5
if.merge5:
  %100 = load i32, i32* %3, align 4
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %if.then6, label %if.merge6
if.then6:
  %102 = load i32, i32* %alloc_0, align 4
  %103 = load i32, i32* %3, align 4
  %104 = load i32, i32* %5, align 4
  %105 = call i32 @equal(i32 %104, i32 5)
  %106 = sub i32 %103, %105
  %107 = load i32, i32* %0, align 4
  %108 = load i32, i32* %1, align 4
  %109 = load i32, i32* %2, align 4
  %110 = add i32 %109, 1
  %111 = load i32, i32* %3, align 4
  %112 = sub i32 %111, 1
  %113 = load i32, i32* %4, align 4
  %114 = call i32 @dfs(i32 %107, i32 %108, i32 %110, i32 %112, i32 %113, i32 4)
  %115 = mul i32 %106, %114
  %116 = add i32 %102, %115
  %117 = srem i32 %116, 1000000007
  store i32 %117, i32* %alloc_0, align 4
  br label %if.merge6
if.merge6:
  %118 = load i32, i32* %4, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %if.then7, label %if.merge7
if.then7:
  %120 = load i32, i32* %alloc_0, align 4
  %121 = load i32, i32* %4, align 4
  %122 = load i32, i32* %0, align 4
  %123 = load i32, i32* %1, align 4
  %124 = load i32, i32* %2, align 4
  %125 = load i32, i32* %3, align 4
  %126 = add i32 %125, 1
  %127 = load i32, i32* %4, align 4
  %128 = sub i32 %127, 1
  %129 = call i32 @dfs(i32 %122, i32 %123, i32 %124, i32 %126, i32 %128, i32 5)
  %130 = mul i32 %121, %129
  %131 = add i32 %120, %130
  %132 = srem i32 %131, 1000000007
  store i32 %132, i32* %alloc_0, align 4
  br label %if.merge7
if.merge7:
  %133 = load i32, i32* %0, align 4
  %134 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %133
  %135 = load i32, i32* %1, align 4
  %136 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %134, i32 0, i32 %135
  %137 = load i32, i32* %2, align 4
  %138 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %136, i32 0, i32 %137
  %139 = load i32, i32* %3, align 4
  %140 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %138, i32 0, i32 %139
  %141 = load i32, i32* %4, align 4
  %142 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %140, i32 0, i32 %141
  %143 = load i32, i32* %5, align 4
  %144 = getelementptr inbounds [7 x i32], [7 x i32]* %142, i32 0, i32 %143
  %145 = load i32, i32* %alloc_0, align 4
  %146 = srem i32 %145, 1000000007
  store i32 %146, i32* %144, align 4
  %147 = load i32, i32* %0, align 4
  %148 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %147
  %149 = load i32, i32* %1, align 4
  %150 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %148, i32 0, i32 %149
  %151 = load i32, i32* %2, align 4
  %152 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %150, i32 0, i32 %151
  %153 = load i32, i32* %3, align 4
  %154 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %152, i32 0, i32 %153
  %155 = load i32, i32* %4, align 4
  %156 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %154, i32 0, i32 %155
  %157 = load i32, i32* %5, align 4
  %158 = getelementptr inbounds [7 x i32], [7 x i32]* %156, i32 0, i32 %157
  %159 = load i32, i32* %158, align 4
  ret i32 %159
}

define i32 @main() {
entry2:
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %0 = call i32 @getint()
  store i32 %0, i32* %alloc_1, align 4
  store i32 0, i32* %alloc_2, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_2, align 4
  %2 = icmp slt i32 %1, 18
  %3 = zext i1 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %while.body.0, label %while.merge.0
while.body.0:
  store i32 0, i32* %alloc_3, align 4
  br label %while.cond.1
while.cond.1:
  %5 = load i32, i32* %alloc_3, align 4
  %6 = icmp slt i32 %5, 18
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.1, label %while.merge.1
while.body.1:
  store i32 0, i32* %alloc_4, align 4
  br label %while.cond.2
while.cond.2:
  %9 = load i32, i32* %alloc_4, align 4
  %10 = icmp slt i32 %9, 18
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %while.body.2, label %while.merge.2
while.body.2:
  store i32 0, i32* %alloc_5, align 4
  br label %while.cond.3
while.cond.3:
  %13 = load i32, i32* %alloc_5, align 4
  %14 = icmp slt i32 %13, 18
  %15 = zext i1 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %while.body.3, label %while.merge.3
while.body.3:
  store i32 0, i32* %alloc_6, align 4
  br label %while.cond.4
while.cond.4:
  %17 = load i32, i32* %alloc_6, align 4
  %18 = icmp slt i32 %17, 18
  %19 = zext i1 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %while.body.4, label %while.merge.4
while.body.4:
  store i32 0, i32* %alloc_7, align 4
  br label %while.cond.5
while.cond.5:
  %21 = load i32, i32* %alloc_7, align 4
  %22 = icmp slt i32 %21, 7
  %23 = zext i1 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %while.body.5, label %while.merge.5
while.body.5:
  %25 = load i32, i32* %alloc_2, align 4
  %26 = getelementptr inbounds [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %25
  %27 = load i32, i32* %alloc_3, align 4
  %28 = getelementptr inbounds [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %26, i32 0, i32 %27
  %29 = load i32, i32* %alloc_4, align 4
  %30 = getelementptr inbounds [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %28, i32 0, i32 %29
  %31 = load i32, i32* %alloc_5, align 4
  %32 = getelementptr inbounds [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %30, i32 0, i32 %31
  %33 = load i32, i32* %alloc_6, align 4
  %34 = getelementptr inbounds [18 x [7 x i32]], [18 x [7 x i32]]* %32, i32 0, i32 %33
  %35 = load i32, i32* %alloc_7, align 4
  %36 = getelementptr inbounds [7 x i32], [7 x i32]* %34, i32 0, i32 %35
  store i32 -1, i32* %36, align 4
  %37 = load i32, i32* %alloc_7, align 4
  %38 = add i32 %37, 1
  store i32 %38, i32* %alloc_7, align 4
  br label %while.cond.5
while.merge.5:
  %39 = load i32, i32* %alloc_6, align 4
  %40 = add i32 %39, 1
  store i32 %40, i32* %alloc_6, align 4
  br label %while.cond.4
while.merge.4:
  %41 = load i32, i32* %alloc_5, align 4
  %42 = add i32 %41, 1
  store i32 %42, i32* %alloc_5, align 4
  br label %while.cond.3
while.merge.3:
  %43 = load i32, i32* %alloc_4, align 4
  %44 = add i32 %43, 1
  store i32 %44, i32* %alloc_4, align 4
  br label %while.cond.2
while.merge.2:
  %45 = load i32, i32* %alloc_3, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %alloc_3, align 4
  br label %while.cond.1
while.merge.1:
  %47 = load i32, i32* %alloc_2, align 4
  %48 = add i32 %47, 1
  store i32 %48, i32* %alloc_2, align 4
  br label %while.cond.0
while.merge.0:
  store i32 0, i32* %alloc_2, align 4
  br label %while.cond.6
while.cond.6:
  %49 = load i32, i32* %alloc_2, align 4
  %50 = load i32, i32* %alloc_1, align 4
  %51 = icmp slt i32 %49, %50
  %52 = zext i1 %51 to i32
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %while.body.6, label %while.merge.6
while.body.6:
  %54 = load i32, i32* %alloc_2, align 4
  %55 = getelementptr inbounds [200 x i32], [200 x i32]* @list, i32 0, i32 %54
  %56 = call i32 @getint()
  store i32 %56, i32* %55, align 4
  %57 = load i32, i32* %alloc_2, align 4
  %58 = getelementptr inbounds [200 x i32], [200 x i32]* @list, i32 0, i32 %57
  %59 = load i32, i32* %58, align 4
  %60 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 %59
  %61 = load i32, i32* %alloc_2, align 4
  %62 = getelementptr inbounds [200 x i32], [200 x i32]* @list, i32 0, i32 %61
  %63 = load i32, i32* %62, align 4
  %64 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 %63
  %65 = load i32, i32* %64, align 4
  %66 = add i32 %65, 1
  store i32 %66, i32* %60, align 4
  %67 = load i32, i32* %alloc_2, align 4
  %68 = add i32 %67, 1
  store i32 %68, i32* %alloc_2, align 4
  br label %while.cond.6
while.merge.6:
  %69 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 1
  %70 = load i32, i32* %69, align 4
  %71 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 2
  %72 = load i32, i32* %71, align 4
  %73 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 3
  %74 = load i32, i32* %73, align 4
  %75 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 4
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds [20 x i32], [20 x i32]* @cns, i32 0, i32 5
  %78 = load i32, i32* %77, align 4
  %79 = call i32 @dfs(i32 %70, i32 %72, i32 %74, i32 %76, i32 %78, i32 0)
  store i32 %79, i32* %alloc_8, align 4
  %80 = load i32, i32* %alloc_8, align 4
  call void @putint(i32 %80)
  %81 = load i32, i32* %alloc_8, align 4
  ret i32 %81
}

