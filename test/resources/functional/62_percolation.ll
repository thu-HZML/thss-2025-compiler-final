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

@array = dso_local global [110 x i32] zeroinitializer, align 4
@n = dso_local global i32 zeroinitializer, align 4

define void @init(i32 %arg0) {
entry0:
  %alloc_0 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  store i32 1, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %1 = load i32, i32* %alloc_0, align 4
  %2 = load i32, i32* %0, align 4
  %3 = load i32, i32* %0, align 4
  %4 = mul i32 %2, %3
  %5 = add i32 %4, 1
  %6 = icmp sle i32 %1, %5
  %7 = zext i1 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %while.body.0, label %while.merge.0
while.body.0:
  %9 = load i32, i32* %alloc_0, align 4
  %10 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %9
  store i32 -1, i32* %10, align 4
  %11 = load i32, i32* %alloc_0, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  ret void
}

define i32 @findfa(i32 %arg0) {
entry1:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  %2 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %1
  %3 = load i32, i32* %2, align 4
  %4 = load i32, i32* %0, align 4
  %5 = icmp eq i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %if.then0, label %if.else0
if.then0:
  %8 = load i32, i32* %0, align 4
  ret i32 %8
if.else0:
  %9 = load i32, i32* %0, align 4
  %10 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %9
  %11 = load i32, i32* %0, align 4
  %12 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %11
  %13 = load i32, i32* %12, align 4
  %14 = call i32 @findfa(i32 %13)
  store i32 %14, i32* %10, align 4
  %15 = load i32, i32* %0, align 4
  %16 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %15
  %17 = load i32, i32* %16, align 4
  ret i32 %17
if.merge0:
  ret i32 0
}

define void @mmerge(i32 %arg0, i32 %arg1) {
entry2:
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = load i32, i32* %0, align 4
  %3 = call i32 @findfa(i32 %2)
  store i32 %3, i32* %alloc_1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = call i32 @findfa(i32 %4)
  store i32 %5, i32* %alloc_2, align 4
  %6 = load i32, i32* %alloc_1, align 4
  %7 = load i32, i32* %alloc_2, align 4
  %8 = icmp ne i32 %6, %7
  %9 = zext i1 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %if.then1, label %if.merge1
if.then1:
  %11 = load i32, i32* %alloc_1, align 4
  %12 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %11
  %13 = load i32, i32* %alloc_2, align 4
  store i32 %13, i32* %12, align 4
  br label %if.merge1
if.merge1:
  ret void
}

define i32 @main() {
entry3:
  %alloc_11 = alloca i32, align 4
  %alloc_10 = alloca i32, align 4
  %alloc_9 = alloca i32, align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca i32, align 4
  %alloc_5 = alloca i32, align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  store i32 1, i32* %alloc_3, align 4
  br label %while.cond.1
while.cond.1:
  %0 = load i32, i32* %alloc_3, align 4
  %1 = icmp ne i32 %0, 0
  br i1 %1, label %while.body.1, label %while.merge.1
while.body.1:
  %2 = load i32, i32* %alloc_3, align 4
  %3 = sub i32 %2, 1
  store i32 %3, i32* %alloc_3, align 4
  store i32 4, i32* @n, align 4
  store i32 10, i32* %alloc_4, align 4
  store i32 0, i32* %alloc_7, align 4
  store i32 0, i32* %alloc_8, align 4
  %4 = load i32, i32* @n, align 4
  call void @init(i32 %4)
  %5 = load i32, i32* @n, align 4
  %6 = load i32, i32* @n, align 4
  %7 = mul i32 %5, %6
  %8 = add i32 %7, 1
  store i32 %8, i32* %alloc_9, align 4
  br label %while.cond.2
while.cond.2:
  %9 = load i32, i32* %alloc_7, align 4
  %10 = load i32, i32* %alloc_4, align 4
  %11 = icmp slt i32 %9, %10
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %while.body.2, label %while.merge.2
while.body.2:
  %14 = call i32 @getint()
  store i32 %14, i32* %alloc_5, align 4
  %15 = call i32 @getint()
  store i32 %15, i32* %alloc_6, align 4
  %16 = load i32, i32* %alloc_8, align 4
  %17 = icmp eq i32 %16, 0
  %18 = zext i1 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %if.then2, label %if.merge2
if.then2:
  %20 = load i32, i32* @n, align 4
  %21 = load i32, i32* %alloc_5, align 4
  %22 = sub i32 %21, 1
  %23 = mul i32 %20, %22
  %24 = load i32, i32* %alloc_6, align 4
  %25 = add i32 %23, %24
  store i32 %25, i32* %alloc_10, align 4
  %26 = load i32, i32* %alloc_10, align 4
  %27 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %26
  %28 = load i32, i32* %alloc_10, align 4
  store i32 %28, i32* %27, align 4
  %29 = load i32, i32* %alloc_5, align 4
  %30 = icmp eq i32 %29, 1
  %31 = zext i1 %30 to i32
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %if.then3, label %if.merge3
if.then3:
  %33 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 0
  store i32 0, i32* %33, align 4
  %34 = load i32, i32* %alloc_10, align 4
  call void @mmerge(i32 %34, i32 0)
  br label %if.merge3
if.merge3:
  %35 = load i32, i32* %alloc_5, align 4
  %36 = load i32, i32* @n, align 4
  %37 = icmp eq i32 %35, %36
  %38 = zext i1 %37 to i32
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %if.then4, label %if.merge4
if.then4:
  %40 = load i32, i32* %alloc_9, align 4
  %41 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %40
  %42 = load i32, i32* %alloc_9, align 4
  store i32 %42, i32* %41, align 4
  %43 = load i32, i32* %alloc_10, align 4
  %44 = load i32, i32* %alloc_9, align 4
  call void @mmerge(i32 %43, i32 %44)
  br label %if.merge4
if.merge4:
  %45 = load i32, i32* %alloc_6, align 4
  %46 = load i32, i32* @n, align 4
  %47 = icmp slt i32 %45, %46
  %48 = zext i1 %47 to i32
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %land.rhs4, label %land.merge5
land.rhs4:
  %50 = load i32, i32* %alloc_10, align 4
  %51 = add i32 %50, 1
  %52 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %51
  %53 = load i32, i32* %52, align 4
  %54 = icmp ne i32 %53, -1
  %55 = zext i1 %54 to i32
  %56 = icmp ne i32 %55, 0
  %57 = zext i1 %56 to i32
  br label %land.merge5
land.merge5:
  %58 = phi i32 [0, %if.merge4], [%57, %land.rhs4]
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %if.then5, label %if.merge5
if.then5:
  %60 = load i32, i32* %alloc_10, align 4
  %61 = load i32, i32* %alloc_10, align 4
  %62 = add i32 %61, 1
  call void @mmerge(i32 %60, i32 %62)
  br label %if.merge5
if.merge5:
  %63 = load i32, i32* %alloc_6, align 4
  %64 = icmp sgt i32 %63, 1
  %65 = zext i1 %64 to i32
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %land.rhs6, label %land.merge7
land.rhs6:
  %67 = load i32, i32* %alloc_10, align 4
  %68 = sub i32 %67, 1
  %69 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %68
  %70 = load i32, i32* %69, align 4
  %71 = icmp ne i32 %70, -1
  %72 = zext i1 %71 to i32
  %73 = icmp ne i32 %72, 0
  %74 = zext i1 %73 to i32
  br label %land.merge7
land.merge7:
  %75 = phi i32 [0, %if.merge5], [%74, %land.rhs6]
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %if.then6, label %if.merge6
if.then6:
  %77 = load i32, i32* %alloc_10, align 4
  %78 = load i32, i32* %alloc_10, align 4
  %79 = sub i32 %78, 1
  call void @mmerge(i32 %77, i32 %79)
  br label %if.merge6
if.merge6:
  %80 = load i32, i32* %alloc_5, align 4
  %81 = load i32, i32* @n, align 4
  %82 = icmp slt i32 %80, %81
  %83 = zext i1 %82 to i32
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %land.rhs8, label %land.merge9
land.rhs8:
  %85 = load i32, i32* %alloc_10, align 4
  %86 = load i32, i32* @n, align 4
  %87 = add i32 %85, %86
  %88 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %87
  %89 = load i32, i32* %88, align 4
  %90 = icmp ne i32 %89, -1
  %91 = zext i1 %90 to i32
  %92 = icmp ne i32 %91, 0
  %93 = zext i1 %92 to i32
  br label %land.merge9
land.merge9:
  %94 = phi i32 [0, %if.merge6], [%93, %land.rhs8]
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %if.then7, label %if.merge7
if.then7:
  %96 = load i32, i32* %alloc_10, align 4
  %97 = load i32, i32* %alloc_10, align 4
  %98 = load i32, i32* @n, align 4
  %99 = add i32 %97, %98
  call void @mmerge(i32 %96, i32 %99)
  br label %if.merge7
if.merge7:
  %100 = load i32, i32* %alloc_5, align 4
  %101 = icmp sgt i32 %100, 1
  %102 = zext i1 %101 to i32
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %land.rhs10, label %land.merge11
land.rhs10:
  %104 = load i32, i32* %alloc_10, align 4
  %105 = load i32, i32* @n, align 4
  %106 = sub i32 %104, %105
  %107 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %106
  %108 = load i32, i32* %107, align 4
  %109 = icmp ne i32 %108, -1
  %110 = zext i1 %109 to i32
  %111 = icmp ne i32 %110, 0
  %112 = zext i1 %111 to i32
  br label %land.merge11
land.merge11:
  %113 = phi i32 [0, %if.merge7], [%112, %land.rhs10]
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %if.then8, label %if.merge8
if.then8:
  %115 = load i32, i32* %alloc_10, align 4
  %116 = load i32, i32* %alloc_10, align 4
  %117 = load i32, i32* @n, align 4
  %118 = sub i32 %116, %117
  call void @mmerge(i32 %115, i32 %118)
  br label %if.merge8
if.merge8:
  %119 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 0
  %120 = load i32, i32* %119, align 4
  %121 = icmp ne i32 %120, -1
  %122 = zext i1 %121 to i32
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %land.rhs12, label %land.merge13
land.rhs12:
  %124 = load i32, i32* %alloc_9, align 4
  %125 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %124
  %126 = load i32, i32* %125, align 4
  %127 = icmp ne i32 %126, -1
  %128 = zext i1 %127 to i32
  %129 = icmp ne i32 %128, 0
  %130 = zext i1 %129 to i32
  br label %land.merge13
land.merge13:
  %131 = phi i32 [0, %if.merge8], [%130, %land.rhs12]
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %land.rhs14, label %land.merge15
land.rhs14:
  %133 = call i32 @findfa(i32 0)
  %134 = load i32, i32* %alloc_9, align 4
  %135 = call i32 @findfa(i32 %134)
  %136 = icmp eq i32 %133, %135
  %137 = zext i1 %136 to i32
  %138 = icmp ne i32 %137, 0
  %139 = zext i1 %138 to i32
  br label %land.merge15
land.merge15:
  %140 = phi i32 [0, %land.merge13], [%139, %land.rhs14]
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %if.then9, label %if.merge9
if.then9:
  store i32 1, i32* %alloc_8, align 4
  %142 = load i32, i32* %alloc_7, align 4
  %143 = add i32 %142, 1
  store i32 %143, i32* %alloc_11, align 4
  %144 = load i32, i32* %alloc_11, align 4
  call void @putint(i32 %144)
  call void @putch(i32 10)
  br label %if.merge9
if.merge9:
  br label %if.merge2
if.merge2:
  %145 = load i32, i32* %alloc_7, align 4
  %146 = add i32 %145, 1
  store i32 %146, i32* %alloc_7, align 4
  br label %while.cond.2
while.merge.2:
  %147 = load i32, i32* %alloc_8, align 4
  %148 = icmp eq i32 %147, 0
  %149 = zext i1 %148 to i32
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %if.then10, label %if.merge10
if.then10:
  call void @putint(i32 -1)
  call void @putch(i32 10)
  br label %if.merge10
if.merge10:
  br label %while.cond.1
while.merge.1:
  ret i32 0
}

