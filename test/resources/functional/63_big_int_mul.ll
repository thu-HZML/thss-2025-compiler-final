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
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [20 x i32], align 4
  %6 = bitcast [20 x i32]* %5 to i32*
  %7 = getelementptr inbounds i32, i32* %6, i32 0
  store i32 1, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %6, i32 1
  store i32 2, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %6, i32 2
  store i32 3, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %6, i32 3
  store i32 4, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %6, i32 4
  store i32 5, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %6, i32 5
  store i32 6, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %6, i32 6
  store i32 7, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %6, i32 7
  store i32 8, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %6, i32 8
  store i32 9, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %6, i32 9
  store i32 0, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %6, i32 10
  store i32 1, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %6, i32 11
  store i32 2, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %6, i32 12
  store i32 3, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %6, i32 13
  store i32 4, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %6, i32 14
  store i32 5, i32* %21, align 4
  %22 = getelementptr inbounds i32, i32* %6, i32 15
  store i32 6, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %6, i32 16
  store i32 7, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %6, i32 17
  store i32 8, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %6, i32 18
  store i32 9, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %6, i32 19
  store i32 0, i32* %26, align 4
  %27 = alloca [20 x i32], align 4
  %28 = bitcast [20 x i32]* %27 to i32*
  %29 = getelementptr inbounds i32, i32* %28, i32 0
  store i32 2, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %28, i32 1
  store i32 3, i32* %30, align 4
  %31 = getelementptr inbounds i32, i32* %28, i32 2
  store i32 4, i32* %31, align 4
  %32 = getelementptr inbounds i32, i32* %28, i32 3
  store i32 2, i32* %32, align 4
  %33 = getelementptr inbounds i32, i32* %28, i32 4
  store i32 5, i32* %33, align 4
  %34 = getelementptr inbounds i32, i32* %28, i32 5
  store i32 7, i32* %34, align 4
  %35 = getelementptr inbounds i32, i32* %28, i32 6
  store i32 9, i32* %35, align 4
  %36 = getelementptr inbounds i32, i32* %28, i32 7
  store i32 9, i32* %36, align 4
  %37 = getelementptr inbounds i32, i32* %28, i32 8
  store i32 0, i32* %37, align 4
  %38 = getelementptr inbounds i32, i32* %28, i32 9
  store i32 1, i32* %38, align 4
  %39 = getelementptr inbounds i32, i32* %28, i32 10
  store i32 9, i32* %39, align 4
  %40 = getelementptr inbounds i32, i32* %28, i32 11
  store i32 8, i32* %40, align 4
  %41 = getelementptr inbounds i32, i32* %28, i32 12
  store i32 7, i32* %41, align 4
  %42 = getelementptr inbounds i32, i32* %28, i32 13
  store i32 6, i32* %42, align 4
  %43 = getelementptr inbounds i32, i32* %28, i32 14
  store i32 4, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %28, i32 15
  store i32 3, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %28, i32 16
  store i32 2, i32* %45, align 4
  %46 = getelementptr inbounds i32, i32* %28, i32 17
  store i32 1, i32* %46, align 4
  %47 = getelementptr inbounds i32, i32* %28, i32 18
  store i32 2, i32* %47, align 4
  %48 = getelementptr inbounds i32, i32* %28, i32 19
  store i32 2, i32* %48, align 4
  %49 = alloca i32, align 4
  store i32 20, i32* %49, align 4
  %50 = alloca i32, align 4
  store i32 20, i32* %50, align 4
  %51 = alloca [25 x i32], align 4
  %52 = alloca [25 x i32], align 4
  %53 = alloca [40 x i32], align 4
  %54 = bitcast [40 x i32]* %53 to i32*
  %55 = getelementptr inbounds i32, i32* %54, i32 0
  store i32 0, i32* %55, align 4
  %56 = getelementptr inbounds i32, i32* %54, i32 1
  store i32 0, i32* %56, align 4
  %57 = getelementptr inbounds i32, i32* %54, i32 2
  store i32 0, i32* %57, align 4
  %58 = getelementptr inbounds i32, i32* %54, i32 3
  store i32 0, i32* %58, align 4
  %59 = getelementptr inbounds i32, i32* %54, i32 4
  store i32 0, i32* %59, align 4
  %60 = getelementptr inbounds i32, i32* %54, i32 5
  store i32 0, i32* %60, align 4
  %61 = getelementptr inbounds i32, i32* %54, i32 6
  store i32 0, i32* %61, align 4
  %62 = getelementptr inbounds i32, i32* %54, i32 7
  store i32 0, i32* %62, align 4
  %63 = getelementptr inbounds i32, i32* %54, i32 8
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds i32, i32* %54, i32 9
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds i32, i32* %54, i32 10
  store i32 0, i32* %65, align 4
  %66 = getelementptr inbounds i32, i32* %54, i32 11
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds i32, i32* %54, i32 12
  store i32 0, i32* %67, align 4
  %68 = getelementptr inbounds i32, i32* %54, i32 13
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds i32, i32* %54, i32 14
  store i32 0, i32* %69, align 4
  %70 = getelementptr inbounds i32, i32* %54, i32 15
  store i32 0, i32* %70, align 4
  %71 = getelementptr inbounds i32, i32* %54, i32 16
  store i32 0, i32* %71, align 4
  %72 = getelementptr inbounds i32, i32* %54, i32 17
  store i32 0, i32* %72, align 4
  %73 = getelementptr inbounds i32, i32* %54, i32 18
  store i32 0, i32* %73, align 4
  %74 = getelementptr inbounds i32, i32* %54, i32 19
  store i32 0, i32* %74, align 4
  %75 = getelementptr inbounds i32, i32* %54, i32 20
  store i32 0, i32* %75, align 4
  %76 = getelementptr inbounds i32, i32* %54, i32 21
  store i32 0, i32* %76, align 4
  %77 = getelementptr inbounds i32, i32* %54, i32 22
  store i32 0, i32* %77, align 4
  %78 = getelementptr inbounds i32, i32* %54, i32 23
  store i32 0, i32* %78, align 4
  %79 = getelementptr inbounds i32, i32* %54, i32 24
  store i32 0, i32* %79, align 4
  %80 = getelementptr inbounds i32, i32* %54, i32 25
  store i32 0, i32* %80, align 4
  %81 = getelementptr inbounds i32, i32* %54, i32 26
  store i32 0, i32* %81, align 4
  %82 = getelementptr inbounds i32, i32* %54, i32 27
  store i32 0, i32* %82, align 4
  %83 = getelementptr inbounds i32, i32* %54, i32 28
  store i32 0, i32* %83, align 4
  %84 = getelementptr inbounds i32, i32* %54, i32 29
  store i32 0, i32* %84, align 4
  %85 = getelementptr inbounds i32, i32* %54, i32 30
  store i32 0, i32* %85, align 4
  %86 = getelementptr inbounds i32, i32* %54, i32 31
  store i32 0, i32* %86, align 4
  %87 = getelementptr inbounds i32, i32* %54, i32 32
  store i32 0, i32* %87, align 4
  %88 = getelementptr inbounds i32, i32* %54, i32 33
  store i32 0, i32* %88, align 4
  %89 = getelementptr inbounds i32, i32* %54, i32 34
  store i32 0, i32* %89, align 4
  %90 = getelementptr inbounds i32, i32* %54, i32 35
  store i32 0, i32* %90, align 4
  %91 = getelementptr inbounds i32, i32* %54, i32 36
  store i32 0, i32* %91, align 4
  %92 = getelementptr inbounds i32, i32* %54, i32 37
  store i32 0, i32* %92, align 4
  %93 = getelementptr inbounds i32, i32* %54, i32 38
  store i32 0, i32* %93, align 4
  %94 = getelementptr inbounds i32, i32* %54, i32 39
  store i32 0, i32* %94, align 4
  store i32 0, i32* %0, align 4
  br label %while.cond.0
while.cond.0:
  %95 = load i32, i32* %0, align 4
  %96 = load i32, i32* %49, align 4
  %97 = icmp slt i32 %95, %96
  %98 = zext i1 %97 to i32
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %while.body.0, label %while.merge.0
while.body.0:
  %100 = load i32, i32* %0, align 4
  %101 = getelementptr inbounds [25 x i32], [25 x i32]* %51, i32 0, i32 %100
  %102 = load i32, i32* %0, align 4
  %103 = getelementptr inbounds [20 x i32], [20 x i32]* %5, i32 0, i32 %102
  %104 = load i32, i32* %103, align 4
  store i32 %104, i32* %101, align 4
  %105 = load i32, i32* %0, align 4
  %106 = add i32 %105, 1
  store i32 %106, i32* %0, align 4
  br label %while.cond.0
while.merge.0:
  store i32 0, i32* %0, align 4
  br label %while.cond.1
while.cond.1:
  %107 = load i32, i32* %0, align 4
  %108 = load i32, i32* %50, align 4
  %109 = icmp slt i32 %107, %108
  %110 = zext i1 %109 to i32
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %while.body.1, label %while.merge.1
while.body.1:
  %112 = load i32, i32* %0, align 4
  %113 = getelementptr inbounds [25 x i32], [25 x i32]* %52, i32 0, i32 %112
  %114 = load i32, i32* %0, align 4
  %115 = getelementptr inbounds [20 x i32], [20 x i32]* %27, i32 0, i32 %114
  %116 = load i32, i32* %115, align 4
  store i32 %116, i32* %113, align 4
  %117 = load i32, i32* %0, align 4
  %118 = add i32 %117, 1
  store i32 %118, i32* %0, align 4
  br label %while.cond.1
while.merge.1:
  %119 = load i32, i32* %49, align 4
  %120 = load i32, i32* %50, align 4
  %121 = add i32 %119, %120
  %122 = sub i32 %121, 1
  store i32 %122, i32* %3, align 4
  store i32 0, i32* %0, align 4
  br label %while.cond.2
while.cond.2:
  %123 = load i32, i32* %0, align 4
  %124 = load i32, i32* %3, align 4
  %125 = icmp sle i32 %123, %124
  %126 = zext i1 %125 to i32
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %while.body.2, label %while.merge.2
while.body.2:
  %128 = load i32, i32* %0, align 4
  %129 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %128
  store i32 0, i32* %129, align 4
  %130 = load i32, i32* %0, align 4
  %131 = add i32 %130, 1
  store i32 %131, i32* %0, align 4
  br label %while.cond.2
while.merge.2:
  store i32 0, i32* %4, align 4
  %132 = load i32, i32* %50, align 4
  %133 = sub i32 %132, 1
  store i32 %133, i32* %0, align 4
  br label %while.cond.3
while.cond.3:
  %134 = load i32, i32* %0, align 4
  %135 = icmp sgt i32 %134, -1
  %136 = zext i1 %135 to i32
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %while.body.3, label %while.merge.3
while.body.3:
  %138 = load i32, i32* %0, align 4
  %139 = getelementptr inbounds [25 x i32], [25 x i32]* %52, i32 0, i32 %138
  %140 = load i32, i32* %139, align 4
  store i32 %140, i32* %2, align 4
  %141 = load i32, i32* %49, align 4
  %142 = sub i32 %141, 1
  store i32 %142, i32* %1, align 4
  br label %while.cond.4
while.cond.4:
  %143 = load i32, i32* %1, align 4
  %144 = icmp sgt i32 %143, -1
  %145 = zext i1 %144 to i32
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %while.body.4, label %while.merge.4
while.body.4:
  %147 = load i32, i32* %3, align 4
  %148 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %147
  %149 = load i32, i32* %148, align 4
  %150 = load i32, i32* %2, align 4
  %151 = load i32, i32* %1, align 4
  %152 = getelementptr inbounds [25 x i32], [25 x i32]* %51, i32 0, i32 %151
  %153 = load i32, i32* %152, align 4
  %154 = mul i32 %150, %153
  %155 = add i32 %149, %154
  store i32 %155, i32* %4, align 4
  %156 = load i32, i32* %4, align 4
  %157 = icmp sge i32 %156, 10
  %158 = zext i1 %157 to i32
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %if.then0, label %if.else0
if.then0:
  %160 = load i32, i32* %3, align 4
  %161 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %160
  %162 = load i32, i32* %4, align 4
  store i32 %162, i32* %161, align 4
  %163 = load i32, i32* %3, align 4
  %164 = sub i32 %163, 1
  %165 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %164
  %166 = load i32, i32* %3, align 4
  %167 = sub i32 %166, 1
  %168 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %167
  %169 = load i32, i32* %168, align 4
  %170 = load i32, i32* %4, align 4
  %171 = sdiv i32 %170, 10
  %172 = add i32 %169, %171
  store i32 %172, i32* %165, align 4
  br label %if.merge0
if.else0:
  %173 = load i32, i32* %3, align 4
  %174 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %173
  %175 = load i32, i32* %4, align 4
  store i32 %175, i32* %174, align 4
  br label %if.merge0
if.merge0:
  %176 = load i32, i32* %1, align 4
  %177 = sub i32 %176, 1
  store i32 %177, i32* %1, align 4
  %178 = load i32, i32* %3, align 4
  %179 = sub i32 %178, 1
  store i32 %179, i32* %3, align 4
  br label %while.cond.4
while.merge.4:
  %180 = load i32, i32* %3, align 4
  %181 = load i32, i32* %49, align 4
  %182 = add i32 %180, %181
  %183 = sub i32 %182, 1
  store i32 %183, i32* %3, align 4
  %184 = load i32, i32* %0, align 4
  %185 = sub i32 %184, 1
  store i32 %185, i32* %0, align 4
  br label %while.cond.3
while.merge.3:
  %186 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 0
  %187 = load i32, i32* %186, align 4
  %188 = icmp ne i32 %187, 0
  %189 = zext i1 %188 to i32
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %if.then1, label %if.merge1
if.then1:
  %191 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 0
  %192 = load i32, i32* %191, align 4
  call void @putint(i32 %192)
  br label %if.merge1
if.merge1:
  store i32 1, i32* %0, align 4
  br label %while.cond.5
while.cond.5:
  %193 = load i32, i32* %0, align 4
  %194 = load i32, i32* %49, align 4
  %195 = load i32, i32* %50, align 4
  %196 = add i32 %194, %195
  %197 = sub i32 %196, 1
  %198 = icmp sle i32 %193, %197
  %199 = zext i1 %198 to i32
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %while.body.5, label %while.merge.5
while.body.5:
  %201 = load i32, i32* %0, align 4
  %202 = getelementptr inbounds [40 x i32], [40 x i32]* %53, i32 0, i32 %201
  %203 = load i32, i32* %202, align 4
  call void @putint(i32 %203)
  %204 = load i32, i32* %0, align 4
  %205 = add i32 %204, 1
  store i32 %205, i32* %0, align 4
  br label %while.cond.5
while.merge.5:
  ret i32 0
}

