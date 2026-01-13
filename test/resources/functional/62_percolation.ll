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
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  br label %while.cond.0
while.cond.0:
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %0, align 4
  %5 = mul i32 %3, %4
  %6 = add i32 %5, 1
  %7 = icmp sle i32 %2, %6
  %8 = zext i1 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %while.body.0, label %while.merge.0
while.body.0:
  %10 = load i32, i32* %1, align 4
  %11 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %10
  store i32 -1, i32* %11, align 4
  %12 = load i32, i32* %1, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %1, align 4
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
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32, align 4
  %3 = load i32, i32* %0, align 4
  %4 = call i32 @findfa(i32 %3)
  store i32 %4, i32* %2, align 4
  %5 = alloca i32, align 4
  %6 = load i32, i32* %1, align 4
  %7 = call i32 @findfa(i32 %6)
  store i32 %7, i32* %5, align 4
  %8 = load i32, i32* %2, align 4
  %9 = load i32, i32* %5, align 4
  %10 = icmp ne i32 %8, %9
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then1, label %if.merge1
if.then1:
  %13 = load i32, i32* %2, align 4
  %14 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %13
  %15 = load i32, i32* %5, align 4
  store i32 %15, i32* %14, align 4
  br label %if.merge1
if.merge1:
  ret void
}

define i32 @main() {
entry3:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 1, i32* %0, align 4
  br label %while.cond.1
while.cond.1:
  %4 = load i32, i32* %0, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %while.body.1, label %while.merge.1
while.body.1:
  %6 = load i32, i32* %0, align 4
  %7 = sub i32 %6, 1
  store i32 %7, i32* %0, align 4
  store i32 4, i32* @n, align 4
  store i32 10, i32* %1, align 4
  %8 = alloca i32, align 4
  store i32 0, i32* %8, align 4
  %9 = alloca i32, align 4
  store i32 0, i32* %9, align 4
  %10 = load i32, i32* @n, align 4
  call void @init(i32 %10)
  %11 = alloca i32, align 4
  %12 = load i32, i32* @n, align 4
  %13 = load i32, i32* @n, align 4
  %14 = mul i32 %12, %13
  %15 = add i32 %14, 1
  store i32 %15, i32* %11, align 4
  br label %while.cond.2
while.cond.2:
  %16 = load i32, i32* %8, align 4
  %17 = load i32, i32* %1, align 4
  %18 = icmp slt i32 %16, %17
  %19 = zext i1 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %while.body.2, label %while.merge.2
while.body.2:
  %21 = call i32 @getint()
  store i32 %21, i32* %2, align 4
  %22 = call i32 @getint()
  store i32 %22, i32* %3, align 4
  %23 = load i32, i32* %9, align 4
  %24 = icmp eq i32 %23, 0
  %25 = zext i1 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %if.then2, label %if.merge2
if.then2:
  %27 = alloca i32, align 4
  %28 = load i32, i32* @n, align 4
  %29 = load i32, i32* %2, align 4
  %30 = sub i32 %29, 1
  %31 = mul i32 %28, %30
  %32 = load i32, i32* %3, align 4
  %33 = add i32 %31, %32
  store i32 %33, i32* %27, align 4
  %34 = load i32, i32* %27, align 4
  %35 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %34
  %36 = load i32, i32* %27, align 4
  store i32 %36, i32* %35, align 4
  %37 = load i32, i32* %2, align 4
  %38 = icmp eq i32 %37, 1
  %39 = zext i1 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %if.then3, label %if.merge3
if.then3:
  %41 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 0
  store i32 0, i32* %41, align 4
  %42 = load i32, i32* %27, align 4
  call void @mmerge(i32 %42, i32 0)
  br label %if.merge3
if.merge3:
  %43 = load i32, i32* %2, align 4
  %44 = load i32, i32* @n, align 4
  %45 = icmp eq i32 %43, %44
  %46 = zext i1 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %if.then4, label %if.merge4
if.then4:
  %48 = load i32, i32* %11, align 4
  %49 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %48
  %50 = load i32, i32* %11, align 4
  store i32 %50, i32* %49, align 4
  %51 = load i32, i32* %27, align 4
  %52 = load i32, i32* %11, align 4
  call void @mmerge(i32 %51, i32 %52)
  br label %if.merge4
if.merge4:
  %53 = load i32, i32* %3, align 4
  %54 = load i32, i32* @n, align 4
  %55 = icmp slt i32 %53, %54
  %56 = zext i1 %55 to i32
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %land.rhs4, label %land.merge5
land.rhs4:
  %58 = load i32, i32* %27, align 4
  %59 = add i32 %58, 1
  %60 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %59
  %61 = load i32, i32* %60, align 4
  %62 = icmp ne i32 %61, -1
  %63 = zext i1 %62 to i32
  %64 = icmp ne i32 %63, 0
  %65 = zext i1 %64 to i32
  br label %land.merge5
land.merge5:
  %66 = phi i32 [0, %if.merge4], [%65, %land.rhs4]
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %if.then5, label %if.merge5
if.then5:
  %68 = load i32, i32* %27, align 4
  %69 = load i32, i32* %27, align 4
  %70 = add i32 %69, 1
  call void @mmerge(i32 %68, i32 %70)
  br label %if.merge5
if.merge5:
  %71 = load i32, i32* %3, align 4
  %72 = icmp sgt i32 %71, 1
  %73 = zext i1 %72 to i32
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %land.rhs6, label %land.merge7
land.rhs6:
  %75 = load i32, i32* %27, align 4
  %76 = sub i32 %75, 1
  %77 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %76
  %78 = load i32, i32* %77, align 4
  %79 = icmp ne i32 %78, -1
  %80 = zext i1 %79 to i32
  %81 = icmp ne i32 %80, 0
  %82 = zext i1 %81 to i32
  br label %land.merge7
land.merge7:
  %83 = phi i32 [0, %if.merge5], [%82, %land.rhs6]
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %if.then6, label %if.merge6
if.then6:
  %85 = load i32, i32* %27, align 4
  %86 = load i32, i32* %27, align 4
  %87 = sub i32 %86, 1
  call void @mmerge(i32 %85, i32 %87)
  br label %if.merge6
if.merge6:
  %88 = load i32, i32* %2, align 4
  %89 = load i32, i32* @n, align 4
  %90 = icmp slt i32 %88, %89
  %91 = zext i1 %90 to i32
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %land.rhs8, label %land.merge9
land.rhs8:
  %93 = load i32, i32* %27, align 4
  %94 = load i32, i32* @n, align 4
  %95 = add i32 %93, %94
  %96 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %95
  %97 = load i32, i32* %96, align 4
  %98 = icmp ne i32 %97, -1
  %99 = zext i1 %98 to i32
  %100 = icmp ne i32 %99, 0
  %101 = zext i1 %100 to i32
  br label %land.merge9
land.merge9:
  %102 = phi i32 [0, %if.merge6], [%101, %land.rhs8]
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %if.then7, label %if.merge7
if.then7:
  %104 = load i32, i32* %27, align 4
  %105 = load i32, i32* %27, align 4
  %106 = load i32, i32* @n, align 4
  %107 = add i32 %105, %106
  call void @mmerge(i32 %104, i32 %107)
  br label %if.merge7
if.merge7:
  %108 = load i32, i32* %2, align 4
  %109 = icmp sgt i32 %108, 1
  %110 = zext i1 %109 to i32
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %land.rhs10, label %land.merge11
land.rhs10:
  %112 = load i32, i32* %27, align 4
  %113 = load i32, i32* @n, align 4
  %114 = sub i32 %112, %113
  %115 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %114
  %116 = load i32, i32* %115, align 4
  %117 = icmp ne i32 %116, -1
  %118 = zext i1 %117 to i32
  %119 = icmp ne i32 %118, 0
  %120 = zext i1 %119 to i32
  br label %land.merge11
land.merge11:
  %121 = phi i32 [0, %if.merge7], [%120, %land.rhs10]
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %if.then8, label %if.merge8
if.then8:
  %123 = load i32, i32* %27, align 4
  %124 = load i32, i32* %27, align 4
  %125 = load i32, i32* @n, align 4
  %126 = sub i32 %124, %125
  call void @mmerge(i32 %123, i32 %126)
  br label %if.merge8
if.merge8:
  %127 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 0
  %128 = load i32, i32* %127, align 4
  %129 = icmp ne i32 %128, -1
  %130 = zext i1 %129 to i32
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %land.rhs12, label %land.merge13
land.rhs12:
  %132 = load i32, i32* %11, align 4
  %133 = getelementptr inbounds [110 x i32], [110 x i32]* @array, i32 0, i32 %132
  %134 = load i32, i32* %133, align 4
  %135 = icmp ne i32 %134, -1
  %136 = zext i1 %135 to i32
  %137 = icmp ne i32 %136, 0
  %138 = zext i1 %137 to i32
  br label %land.merge13
land.merge13:
  %139 = phi i32 [0, %if.merge8], [%138, %land.rhs12]
  %140 = icmp ne i32 %139, 0
  br i1 %140, label %land.rhs14, label %land.merge15
land.rhs14:
  %141 = call i32 @findfa(i32 0)
  %142 = load i32, i32* %11, align 4
  %143 = call i32 @findfa(i32 %142)
  %144 = icmp eq i32 %141, %143
  %145 = zext i1 %144 to i32
  %146 = icmp ne i32 %145, 0
  %147 = zext i1 %146 to i32
  br label %land.merge15
land.merge15:
  %148 = phi i32 [0, %land.merge13], [%147, %land.rhs14]
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %if.then9, label %if.merge9
if.then9:
  store i32 1, i32* %9, align 4
  %150 = alloca i32, align 4
  %151 = load i32, i32* %8, align 4
  %152 = add i32 %151, 1
  store i32 %152, i32* %150, align 4
  %153 = load i32, i32* %150, align 4
  call void @putint(i32 %153)
  call void @putch(i32 10)
  br label %if.merge9
if.merge9:
  br label %if.merge2
if.merge2:
  %154 = load i32, i32* %8, align 4
  %155 = add i32 %154, 1
  store i32 %155, i32* %8, align 4
  br label %while.cond.2
while.merge.2:
  %156 = load i32, i32* %9, align 4
  %157 = icmp eq i32 %156, 0
  %158 = zext i1 %157 to i32
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %if.then10, label %if.merge10
if.then10:
  call void @putint(i32 -1)
  call void @putch(i32 10)
  br label %if.merge10
if.merge10:
  br label %while.cond.1
while.merge.1:
  ret i32 0
}

