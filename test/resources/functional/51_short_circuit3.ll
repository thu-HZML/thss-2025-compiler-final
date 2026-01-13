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

@a = dso_local global i32 zeroinitializer, align 4
@b = dso_local global i32 zeroinitializer, align 4
@d = dso_local global i32 zeroinitializer, align 4

define i32 @set_a(i32 %arg0) {
entry0:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* @a, align 4
  %2 = load i32, i32* @a, align 4
  ret i32 %2
}

define i32 @set_b(i32 %arg0) {
entry1:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* @b, align 4
  %2 = load i32, i32* @b, align 4
  ret i32 %2
}

define i32 @set_d(i32 %arg0) {
entry2:
  %0 = alloca i32, align 4
  store i32 %arg0, i32* %0, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* @d, align 4
  %2 = load i32, i32* @d, align 4
  ret i32 %2
}

define i32 @main() {
entry3:
  %alloc_0 = alloca i32, align 4
  store i32 2, i32* @a, align 4
  store i32 3, i32* @b, align 4
  %0 = call i32 @set_a(i32 0)
  %1 = icmp ne i32 %0, 0
  br i1 %1, label %land.rhs4, label %land.merge5
land.rhs4:
  %2 = call i32 @set_b(i32 1)
  %3 = icmp ne i32 %2, 0
  %4 = zext i1 %3 to i32
  br label %land.merge5
land.merge5:
  %5 = phi i32 [0, %entry3], [%4, %land.rhs4]
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %if.then0, label %if.merge0
if.then0:
  br label %if.merge0
if.merge0:
  %7 = load i32, i32* @a, align 4
  call void @putint(i32 %7)
  call void @putch(i32 32)
  %8 = load i32, i32* @b, align 4
  call void @putint(i32 %8)
  call void @putch(i32 32)
  store i32 2, i32* @a, align 4
  store i32 3, i32* @b, align 4
  %9 = call i32 @set_a(i32 0)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %land.rhs6, label %land.merge7
land.rhs6:
  %11 = call i32 @set_b(i32 1)
  %12 = icmp ne i32 %11, 0
  %13 = zext i1 %12 to i32
  br label %land.merge7
land.merge7:
  %14 = phi i32 [0, %if.merge0], [%13, %land.rhs6]
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %if.then1, label %if.merge1
if.then1:
  br label %if.merge1
if.merge1:
  %16 = load i32, i32* @a, align 4
  call void @putint(i32 %16)
  call void @putch(i32 32)
  %17 = load i32, i32* @b, align 4
  call void @putint(i32 %17)
  call void @putch(i32 10)
  store i32 1, i32* %alloc_0, align 4
  store i32 2, i32* @d, align 4
  %18 = icmp sge i32 1, 1
  %19 = zext i1 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %land.rhs8, label %land.merge9
land.rhs8:
  %21 = call i32 @set_d(i32 3)
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %land.merge9
land.merge9:
  %24 = phi i32 [0, %if.merge1], [%23, %land.rhs8]
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %if.then2, label %if.merge2
if.then2:
  br label %if.merge2
if.merge2:
  %26 = load i32, i32* @d, align 4
  call void @putint(i32 %26)
  call void @putch(i32 32)
  %27 = icmp sle i32 1, 1
  %28 = zext i1 %27 to i32
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %lor.merge11, label %lor.rhs10
lor.rhs10:
  %30 = call i32 @set_d(i32 4)
  %31 = icmp ne i32 %30, 0
  %32 = zext i1 %31 to i32
  br label %lor.merge11
lor.merge11:
  %33 = phi i32 [1, %if.merge2], [%32, %lor.rhs10]
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %if.then3, label %if.merge3
if.then3:
  br label %if.merge3
if.merge3:
  %35 = load i32, i32* @d, align 4
  call void @putint(i32 %35)
  call void @putch(i32 10)
  %36 = add i32 2, 1
  %37 = sub i32 3, %36
  %38 = icmp sge i32 16, %37
  %39 = zext i1 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %if.then4, label %if.merge4
if.then4:
  call void @putch(i32 65)
  br label %if.merge4
if.merge4:
  %41 = sub i32 25, 7
  %42 = sub i32 36, 18
  %43 = icmp ne i32 %41, %42
  %44 = zext i1 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %if.then5, label %if.merge5
if.then5:
  call void @putch(i32 66)
  br label %if.merge5
if.merge5:
  %46 = icmp slt i32 1, 8
  %47 = zext i1 %46 to i32
  %48 = icmp ne i32 %47, 1
  %49 = zext i1 %48 to i32
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %if.then6, label %if.merge6
if.then6:
  call void @putch(i32 67)
  br label %if.merge6
if.merge6:
  %51 = icmp sgt i32 3, 4
  %52 = zext i1 %51 to i32
  %53 = icmp eq i32 %52, 0
  %54 = zext i1 %53 to i32
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %if.then7, label %if.merge7
if.then7:
  call void @putch(i32 68)
  br label %if.merge7
if.merge7:
  %56 = icmp sle i32 102, 63
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 1, %57
  %59 = zext i1 %58 to i32
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %if.then8, label %if.merge8
if.then8:
  call void @putch(i32 69)
  br label %if.merge8
if.merge8:
  %61 = sub i32 5, 6
  %62 = icmp eq i32 %61, -1
  %63 = zext i1 %62 to i32
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %if.then9, label %if.merge9
if.then9:
  call void @putch(i32 70)
  br label %if.merge9
if.merge9:
  call void @putch(i32 10)
  %65 = alloca i32, align 4
  store i32 0, i32* %65, align 4
  %66 = alloca i32, align 4
  store i32 1, i32* %66, align 4
  %67 = alloca i32, align 4
  store i32 2, i32* %67, align 4
  %68 = alloca i32, align 4
  store i32 3, i32* %68, align 4
  %69 = alloca i32, align 4
  store i32 4, i32* %69, align 4
  br label %while.cond.0
while.cond.0:
  %70 = load i32, i32* %65, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %land.rhs12, label %land.merge13
land.rhs12:
  %72 = load i32, i32* %66, align 4
  %73 = icmp ne i32 %72, 0
  %74 = zext i1 %73 to i32
  br label %land.merge13
land.merge13:
  %75 = phi i32 [0, %while.cond.0], [%74, %land.rhs12]
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %while.body.0, label %while.merge.0
while.body.0:
  call void @putch(i32 32)
  br label %while.cond.0
while.merge.0:
  %77 = load i32, i32* %65, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %lor.merge15, label %lor.rhs14
lor.rhs14:
  %79 = load i32, i32* %66, align 4
  %80 = icmp ne i32 %79, 0
  %81 = zext i1 %80 to i32
  br label %lor.merge15
lor.merge15:
  %82 = phi i32 [1, %while.merge.0], [%81, %lor.rhs14]
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %if.then10, label %if.merge10
if.then10:
  call void @putch(i32 67)
  br label %if.merge10
if.merge10:
  %84 = load i32, i32* %65, align 4
  %85 = load i32, i32* %66, align 4
  %86 = icmp sge i32 %84, %85
  %87 = zext i1 %86 to i32
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %lor.merge17, label %lor.rhs16
lor.rhs16:
  %89 = load i32, i32* %66, align 4
  %90 = load i32, i32* %65, align 4
  %91 = icmp sle i32 %89, %90
  %92 = zext i1 %91 to i32
  %93 = icmp ne i32 %92, 0
  %94 = zext i1 %93 to i32
  br label %lor.merge17
lor.merge17:
  %95 = phi i32 [1, %if.merge10], [%94, %lor.rhs16]
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %if.then11, label %if.merge11
if.then11:
  call void @putch(i32 72)
  br label %if.merge11
if.merge11:
  %97 = load i32, i32* %67, align 4
  %98 = load i32, i32* %66, align 4
  %99 = icmp sge i32 %97, %98
  %100 = zext i1 %99 to i32
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %land.rhs18, label %land.merge19
land.rhs18:
  %102 = load i32, i32* %69, align 4
  %103 = load i32, i32* %68, align 4
  %104 = icmp ne i32 %102, %103
  %105 = zext i1 %104 to i32
  %106 = icmp ne i32 %105, 0
  %107 = zext i1 %106 to i32
  br label %land.merge19
land.merge19:
  %108 = phi i32 [0, %if.merge11], [%107, %land.rhs18]
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %if.then12, label %if.merge12
if.then12:
  call void @putch(i32 73)
  br label %if.merge12
if.merge12:
  %110 = load i32, i32* %65, align 4
  %111 = load i32, i32* %66, align 4
  %112 = icmp eq i32 %111, 0
  %113 = zext i1 %112 to i32
  %114 = icmp eq i32 %110, %113
  %115 = zext i1 %114 to i32
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %land.rhs20, label %land.merge21
land.rhs20:
  %117 = load i32, i32* %68, align 4
  %118 = load i32, i32* %68, align 4
  %119 = icmp slt i32 %117, %118
  %120 = zext i1 %119 to i32
  %121 = icmp ne i32 %120, 0
  %122 = zext i1 %121 to i32
  br label %land.merge21
land.merge21:
  %123 = phi i32 [0, %if.merge12], [%122, %land.rhs20]
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %lor.merge23, label %lor.rhs22
lor.rhs22:
  %125 = load i32, i32* %69, align 4
  %126 = load i32, i32* %69, align 4
  %127 = icmp sge i32 %125, %126
  %128 = zext i1 %127 to i32
  %129 = icmp ne i32 %128, 0
  %130 = zext i1 %129 to i32
  br label %lor.merge23
lor.merge23:
  %131 = phi i32 [1, %land.merge21], [%130, %lor.rhs22]
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %if.then13, label %if.merge13
if.then13:
  call void @putch(i32 74)
  br label %if.merge13
if.merge13:
  %133 = load i32, i32* %65, align 4
  %134 = load i32, i32* %66, align 4
  %135 = icmp eq i32 %134, 0
  %136 = zext i1 %135 to i32
  %137 = icmp eq i32 %133, %136
  %138 = zext i1 %137 to i32
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %lor.merge25, label %lor.rhs24
lor.rhs24:
  %140 = load i32, i32* %68, align 4
  %141 = load i32, i32* %68, align 4
  %142 = icmp slt i32 %140, %141
  %143 = zext i1 %142 to i32
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %land.rhs26, label %land.merge27
land.rhs26:
  %145 = load i32, i32* %69, align 4
  %146 = load i32, i32* %69, align 4
  %147 = icmp sge i32 %145, %146
  %148 = zext i1 %147 to i32
  %149 = icmp ne i32 %148, 0
  %150 = zext i1 %149 to i32
  br label %land.merge27
land.merge27:
  %151 = phi i32 [0, %lor.rhs24], [%150, %land.rhs26]
  %152 = icmp ne i32 %151, 0
  %153 = zext i1 %152 to i32
  br label %lor.merge25
lor.merge25:
  %154 = phi i32 [1, %if.merge13], [%153, %land.merge27]
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %if.then14, label %if.merge14
if.then14:
  call void @putch(i32 75)
  br label %if.merge14
if.merge14:
  call void @putch(i32 10)
  ret i32 0
}

