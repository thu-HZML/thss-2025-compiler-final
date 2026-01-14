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

@len = dso_local constant i32 20, align 4

define i32 @main() {
entry0:
  %alloc_11 = alloca [40 x i32], align 4
  %alloc_10 = alloca [25 x i32], align 4
  %alloc_9 = alloca [25 x i32], align 4
  %alloc_8 = alloca i32, align 4
  %alloc_7 = alloca i32, align 4
  %alloc_6 = alloca [20 x i32], align 4
  %alloc_5 = alloca [20 x i32], align 4
  %alloc_4 = alloca i32, align 4
  %alloc_3 = alloca i32, align 4
  %alloc_2 = alloca i32, align 4
  %alloc_1 = alloca i32, align 4
  %alloc_0 = alloca i32, align 4
  %0 = bitcast [20 x i32]* %alloc_5 to i32*
  %1 = getelementptr inbounds i32, i32* %0, i32 0
  store i32 1, i32* %1, align 4
  %2 = getelementptr inbounds i32, i32* %0, i32 1
  store i32 2, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %0, i32 2
  store i32 3, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %0, i32 3
  store i32 4, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %0, i32 4
  store i32 5, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %0, i32 5
  store i32 6, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %0, i32 6
  store i32 7, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %0, i32 7
  store i32 8, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %0, i32 8
  store i32 9, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %0, i32 9
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %0, i32 10
  store i32 1, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %0, i32 11
  store i32 2, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %0, i32 12
  store i32 3, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %0, i32 13
  store i32 4, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %0, i32 14
  store i32 5, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %0, i32 15
  store i32 6, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %0, i32 16
  store i32 7, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %0, i32 17
  store i32 8, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %0, i32 18
  store i32 9, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %0, i32 19
  store i32 0, i32* %20, align 4
  %21 = bitcast [20 x i32]* %alloc_6 to i32*
  %22 = getelementptr inbounds i32, i32* %21, i32 0
  store i32 2, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %21, i32 1
  store i32 3, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %21, i32 2
  store i32 4, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %21, i32 3
  store i32 2, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %21, i32 4
  store i32 5, i32* %26, align 4
  %27 = getelementptr inbounds i32, i32* %21, i32 5
  store i32 7, i32* %27, align 4
  %28 = getelementptr inbounds i32, i32* %21, i32 6
  store i32 9, i32* %28, align 4
  %29 = getelementptr inbounds i32, i32* %21, i32 7
  store i32 9, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %21, i32 8
  store i32 0, i32* %30, align 4
  %31 = getelementptr inbounds i32, i32* %21, i32 9
  store i32 1, i32* %31, align 4
  %32 = getelementptr inbounds i32, i32* %21, i32 10
  store i32 9, i32* %32, align 4
  %33 = getelementptr inbounds i32, i32* %21, i32 11
  store i32 8, i32* %33, align 4
  %34 = getelementptr inbounds i32, i32* %21, i32 12
  store i32 7, i32* %34, align 4
  %35 = getelementptr inbounds i32, i32* %21, i32 13
  store i32 6, i32* %35, align 4
  %36 = getelementptr inbounds i32, i32* %21, i32 14
  store i32 4, i32* %36, align 4
  %37 = getelementptr inbounds i32, i32* %21, i32 15
  store i32 3, i32* %37, align 4
  %38 = getelementptr inbounds i32, i32* %21, i32 16
  store i32 2, i32* %38, align 4
  %39 = getelementptr inbounds i32, i32* %21, i32 17
  store i32 1, i32* %39, align 4
  %40 = getelementptr inbounds i32, i32* %21, i32 18
  store i32 2, i32* %40, align 4
  %41 = getelementptr inbounds i32, i32* %21, i32 19
  store i32 2, i32* %41, align 4
  store i32 20, i32* %alloc_7, align 4
  store i32 20, i32* %alloc_8, align 4
  %42 = bitcast [40 x i32]* %alloc_11 to i32*
  %43 = getelementptr inbounds i32, i32* %42, i32 0
  store i32 0, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %42, i32 1
  store i32 0, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %42, i32 2
  store i32 0, i32* %45, align 4
  %46 = getelementptr inbounds i32, i32* %42, i32 3
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds i32, i32* %42, i32 4
  store i32 0, i32* %47, align 4
  %48 = getelementptr inbounds i32, i32* %42, i32 5
  store i32 0, i32* %48, align 4
  %49 = getelementptr inbounds i32, i32* %42, i32 6
  store i32 0, i32* %49, align 4
  %50 = getelementptr inbounds i32, i32* %42, i32 7
  store i32 0, i32* %50, align 4
  %51 = getelementptr inbounds i32, i32* %42, i32 8
  store i32 0, i32* %51, align 4
  %52 = getelementptr inbounds i32, i32* %42, i32 9
  store i32 0, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %42, i32 10
  store i32 0, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %42, i32 11
  store i32 0, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %42, i32 12
  store i32 0, i32* %55, align 4
  %56 = getelementptr inbounds i32, i32* %42, i32 13
  store i32 0, i32* %56, align 4
  %57 = getelementptr inbounds i32, i32* %42, i32 14
  store i32 0, i32* %57, align 4
  %58 = getelementptr inbounds i32, i32* %42, i32 15
  store i32 0, i32* %58, align 4
  %59 = getelementptr inbounds i32, i32* %42, i32 16
  store i32 0, i32* %59, align 4
  %60 = getelementptr inbounds i32, i32* %42, i32 17
  store i32 0, i32* %60, align 4
  %61 = getelementptr inbounds i32, i32* %42, i32 18
  store i32 0, i32* %61, align 4
  %62 = getelementptr inbounds i32, i32* %42, i32 19
  store i32 0, i32* %62, align 4
  %63 = getelementptr inbounds i32, i32* %42, i32 20
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds i32, i32* %42, i32 21
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds i32, i32* %42, i32 22
  store i32 0, i32* %65, align 4
  %66 = getelementptr inbounds i32, i32* %42, i32 23
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds i32, i32* %42, i32 24
  store i32 0, i32* %67, align 4
  %68 = getelementptr inbounds i32, i32* %42, i32 25
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds i32, i32* %42, i32 26
  store i32 0, i32* %69, align 4
  %70 = getelementptr inbounds i32, i32* %42, i32 27
  store i32 0, i32* %70, align 4
  %71 = getelementptr inbounds i32, i32* %42, i32 28
  store i32 0, i32* %71, align 4
  %72 = getelementptr inbounds i32, i32* %42, i32 29
  store i32 0, i32* %72, align 4
  %73 = getelementptr inbounds i32, i32* %42, i32 30
  store i32 0, i32* %73, align 4
  %74 = getelementptr inbounds i32, i32* %42, i32 31
  store i32 0, i32* %74, align 4
  %75 = getelementptr inbounds i32, i32* %42, i32 32
  store i32 0, i32* %75, align 4
  %76 = getelementptr inbounds i32, i32* %42, i32 33
  store i32 0, i32* %76, align 4
  %77 = getelementptr inbounds i32, i32* %42, i32 34
  store i32 0, i32* %77, align 4
  %78 = getelementptr inbounds i32, i32* %42, i32 35
  store i32 0, i32* %78, align 4
  %79 = getelementptr inbounds i32, i32* %42, i32 36
  store i32 0, i32* %79, align 4
  %80 = getelementptr inbounds i32, i32* %42, i32 37
  store i32 0, i32* %80, align 4
  %81 = getelementptr inbounds i32, i32* %42, i32 38
  store i32 0, i32* %81, align 4
  %82 = getelementptr inbounds i32, i32* %42, i32 39
  store i32 0, i32* %82, align 4
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.0
while.cond.0:
  %83 = load i32, i32* %alloc_0, align 4
  %84 = load i32, i32* %alloc_7, align 4
  %85 = icmp slt i32 %83, %84
  %86 = zext i1 %85 to i32
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %while.body.0, label %while.merge.0
while.body.0:
  %88 = load i32, i32* %alloc_0, align 4
  %89 = getelementptr inbounds [25 x i32], [25 x i32]* %alloc_9, i32 0, i32 %88
  %90 = load i32, i32* %alloc_0, align 4
  %91 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_5, i32 0, i32 %90
  %92 = load i32, i32* %91, align 4
  store i32 %92, i32* %89, align 4
  %93 = load i32, i32* %alloc_0, align 4
  %94 = add i32 %93, 1
  store i32 %94, i32* %alloc_0, align 4
  br label %while.cond.0
while.merge.0:
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.1
while.cond.1:
  %95 = load i32, i32* %alloc_0, align 4
  %96 = load i32, i32* %alloc_8, align 4
  %97 = icmp slt i32 %95, %96
  %98 = zext i1 %97 to i32
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %while.body.1, label %while.merge.1
while.body.1:
  %100 = load i32, i32* %alloc_0, align 4
  %101 = getelementptr inbounds [25 x i32], [25 x i32]* %alloc_10, i32 0, i32 %100
  %102 = load i32, i32* %alloc_0, align 4
  %103 = getelementptr inbounds [20 x i32], [20 x i32]* %alloc_6, i32 0, i32 %102
  %104 = load i32, i32* %103, align 4
  store i32 %104, i32* %101, align 4
  %105 = load i32, i32* %alloc_0, align 4
  %106 = add i32 %105, 1
  store i32 %106, i32* %alloc_0, align 4
  br label %while.cond.1
while.merge.1:
  %107 = load i32, i32* %alloc_7, align 4
  %108 = load i32, i32* %alloc_8, align 4
  %109 = add i32 %107, %108
  %110 = sub i32 %109, 1
  store i32 %110, i32* %alloc_3, align 4
  store i32 0, i32* %alloc_0, align 4
  br label %while.cond.2
while.cond.2:
  %111 = load i32, i32* %alloc_0, align 4
  %112 = load i32, i32* %alloc_3, align 4
  %113 = icmp sle i32 %111, %112
  %114 = zext i1 %113 to i32
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %while.body.2, label %while.merge.2
while.body.2:
  %116 = load i32, i32* %alloc_0, align 4
  %117 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %116
  store i32 0, i32* %117, align 4
  %118 = load i32, i32* %alloc_0, align 4
  %119 = add i32 %118, 1
  store i32 %119, i32* %alloc_0, align 4
  br label %while.cond.2
while.merge.2:
  store i32 0, i32* %alloc_4, align 4
  %120 = load i32, i32* %alloc_8, align 4
  %121 = sub i32 %120, 1
  store i32 %121, i32* %alloc_0, align 4
  br label %while.cond.3
while.cond.3:
  %122 = load i32, i32* %alloc_0, align 4
  %123 = icmp sgt i32 %122, -1
  %124 = zext i1 %123 to i32
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %while.body.3, label %while.merge.3
while.body.3:
  %126 = load i32, i32* %alloc_0, align 4
  %127 = getelementptr inbounds [25 x i32], [25 x i32]* %alloc_10, i32 0, i32 %126
  %128 = load i32, i32* %127, align 4
  store i32 %128, i32* %alloc_2, align 4
  %129 = load i32, i32* %alloc_7, align 4
  %130 = sub i32 %129, 1
  store i32 %130, i32* %alloc_1, align 4
  br label %while.cond.4
while.cond.4:
  %131 = load i32, i32* %alloc_1, align 4
  %132 = icmp sgt i32 %131, -1
  %133 = zext i1 %132 to i32
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %while.body.4, label %while.merge.4
while.body.4:
  %135 = load i32, i32* %alloc_3, align 4
  %136 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %135
  %137 = load i32, i32* %136, align 4
  %138 = load i32, i32* %alloc_2, align 4
  %139 = load i32, i32* %alloc_1, align 4
  %140 = getelementptr inbounds [25 x i32], [25 x i32]* %alloc_9, i32 0, i32 %139
  %141 = load i32, i32* %140, align 4
  %142 = mul i32 %138, %141
  %143 = add i32 %137, %142
  store i32 %143, i32* %alloc_4, align 4
  %144 = load i32, i32* %alloc_4, align 4
  %145 = icmp sge i32 %144, 10
  %146 = zext i1 %145 to i32
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %if.then0, label %if.else0
if.then0:
  %148 = load i32, i32* %alloc_3, align 4
  %149 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %148
  %150 = load i32, i32* %alloc_4, align 4
  store i32 %150, i32* %149, align 4
  %151 = load i32, i32* %alloc_3, align 4
  %152 = sub i32 %151, 1
  %153 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %152
  %154 = load i32, i32* %alloc_3, align 4
  %155 = sub i32 %154, 1
  %156 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %155
  %157 = load i32, i32* %156, align 4
  %158 = load i32, i32* %alloc_4, align 4
  %159 = sdiv i32 %158, 10
  %160 = add i32 %157, %159
  store i32 %160, i32* %153, align 4
  br label %if.merge0
if.else0:
  %161 = load i32, i32* %alloc_3, align 4
  %162 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %161
  %163 = load i32, i32* %alloc_4, align 4
  store i32 %163, i32* %162, align 4
  br label %if.merge0
if.merge0:
  %164 = load i32, i32* %alloc_1, align 4
  %165 = sub i32 %164, 1
  store i32 %165, i32* %alloc_1, align 4
  %166 = load i32, i32* %alloc_3, align 4
  %167 = sub i32 %166, 1
  store i32 %167, i32* %alloc_3, align 4
  br label %while.cond.4
while.merge.4:
  %168 = load i32, i32* %alloc_3, align 4
  %169 = load i32, i32* %alloc_7, align 4
  %170 = add i32 %168, %169
  %171 = sub i32 %170, 1
  store i32 %171, i32* %alloc_3, align 4
  %172 = load i32, i32* %alloc_0, align 4
  %173 = sub i32 %172, 1
  store i32 %173, i32* %alloc_0, align 4
  br label %while.cond.3
while.merge.3:
  %174 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 0
  %175 = load i32, i32* %174, align 4
  %176 = icmp ne i32 %175, 0
  %177 = zext i1 %176 to i32
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %if.then1, label %if.merge1
if.then1:
  %179 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 0
  %180 = load i32, i32* %179, align 4
  call void @putint(i32 %180)
  br label %if.merge1
if.merge1:
  store i32 1, i32* %alloc_0, align 4
  br label %while.cond.5
while.cond.5:
  %181 = load i32, i32* %alloc_0, align 4
  %182 = load i32, i32* %alloc_7, align 4
  %183 = load i32, i32* %alloc_8, align 4
  %184 = add i32 %182, %183
  %185 = sub i32 %184, 1
  %186 = icmp sle i32 %181, %185
  %187 = zext i1 %186 to i32
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %while.body.5, label %while.merge.5
while.body.5:
  %189 = load i32, i32* %alloc_0, align 4
  %190 = getelementptr inbounds [40 x i32], [40 x i32]* %alloc_11, i32 0, i32 %189
  %191 = load i32, i32* %190, align 4
  call void @putint(i32 %191)
  %192 = load i32, i32* %alloc_0, align 4
  %193 = add i32 %192, 1
  store i32 %193, i32* %alloc_0, align 4
  br label %while.cond.5
while.merge.5:
  ret i32 0
}

