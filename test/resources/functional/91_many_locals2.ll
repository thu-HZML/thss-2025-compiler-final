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

@n = dso_local global i32 zeroinitializer, align 4

define i32 @main() {
entry0:
  %0 = alloca i32, align 4
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = call i32 @getint()
  store i32 %31, i32* %30, align 4
  br label %while.cond.0
while.cond.0:
  %32 = load i32, i32* %30, align 4
  %33 = icmp eq i32 %32, 5
  %34 = zext i1 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %while.body.0, label %while.merge.0
while.body.0:
  %36 = load i32, i32* %30, align 4
  %37 = add i32 %36, 1
  store i32 %37, i32* %30, align 4
  br label %while.cond.0
while.merge.0:
  store i32 0, i32* %0, align 4
  %38 = load i32, i32* %0, align 4
  %39 = add i32 %38, 1
  store i32 %39, i32* %1, align 4
  %40 = load i32, i32* %1, align 4
  %41 = add i32 %40, 1
  store i32 %41, i32* %2, align 4
  %42 = load i32, i32* %2, align 4
  %43 = add i32 %42, 1
  store i32 %43, i32* %3, align 4
  %44 = load i32, i32* %3, align 4
  %45 = add i32 %44, 1
  store i32 %45, i32* %4, align 4
  %46 = load i32, i32* %4, align 4
  %47 = add i32 %46, 1
  store i32 %47, i32* %5, align 4
  %48 = load i32, i32* %5, align 4
  %49 = add i32 %48, 1
  store i32 %49, i32* %6, align 4
  %50 = load i32, i32* %6, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %7, align 4
  %52 = load i32, i32* %7, align 4
  %53 = add i32 %52, 1
  store i32 %53, i32* %8, align 4
  %54 = load i32, i32* %8, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %9, align 4
  %56 = load i32, i32* %9, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %10, align 4
  %58 = load i32, i32* %10, align 4
  %59 = add i32 %58, 1
  store i32 %59, i32* %11, align 4
  %60 = load i32, i32* %11, align 4
  %61 = add i32 %60, 1
  store i32 %61, i32* %12, align 4
  %62 = load i32, i32* %12, align 4
  %63 = add i32 %62, 1
  store i32 %63, i32* %13, align 4
  %64 = load i32, i32* %13, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %14, align 4
  %66 = load i32, i32* %14, align 4
  %67 = add i32 %66, 1
  store i32 %67, i32* %15, align 4
  %68 = load i32, i32* %15, align 4
  %69 = add i32 %68, 1
  store i32 %69, i32* %16, align 4
  %70 = load i32, i32* %16, align 4
  %71 = add i32 %70, 1
  store i32 %71, i32* %17, align 4
  %72 = load i32, i32* %17, align 4
  %73 = add i32 %72, 1
  store i32 %73, i32* %18, align 4
  %74 = load i32, i32* %18, align 4
  %75 = add i32 %74, 1
  store i32 %75, i32* %19, align 4
  %76 = load i32, i32* %19, align 4
  %77 = add i32 %76, 1
  store i32 %77, i32* %20, align 4
  %78 = load i32, i32* %20, align 4
  %79 = add i32 %78, 1
  store i32 %79, i32* %21, align 4
  %80 = load i32, i32* %21, align 4
  %81 = add i32 %80, 1
  store i32 %81, i32* %22, align 4
  %82 = load i32, i32* %22, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %23, align 4
  %84 = load i32, i32* %23, align 4
  %85 = add i32 %84, 1
  store i32 %85, i32* %24, align 4
  %86 = load i32, i32* %24, align 4
  %87 = add i32 %86, 1
  store i32 %87, i32* %25, align 4
  %88 = load i32, i32* %25, align 4
  %89 = add i32 %88, 1
  store i32 %89, i32* %26, align 4
  %90 = load i32, i32* %26, align 4
  %91 = add i32 %90, 1
  store i32 %91, i32* %27, align 4
  %92 = load i32, i32* %27, align 4
  %93 = add i32 %92, 1
  store i32 %93, i32* %28, align 4
  %94 = load i32, i32* %28, align 4
  %95 = add i32 %94, 1
  store i32 %95, i32* %29, align 4
  %96 = alloca i32, align 4
  %97 = load i32, i32* %0, align 4
  call void @putint(i32 %97)
  %98 = load i32, i32* %1, align 4
  call void @putint(i32 %98)
  %99 = load i32, i32* %2, align 4
  call void @putint(i32 %99)
  %100 = load i32, i32* %3, align 4
  call void @putint(i32 %100)
  %101 = load i32, i32* %4, align 4
  call void @putint(i32 %101)
  %102 = load i32, i32* %5, align 4
  call void @putint(i32 %102)
  %103 = load i32, i32* %6, align 4
  call void @putint(i32 %103)
  %104 = load i32, i32* %7, align 4
  call void @putint(i32 %104)
  %105 = load i32, i32* %8, align 4
  call void @putint(i32 %105)
  %106 = load i32, i32* %9, align 4
  call void @putint(i32 %106)
  %107 = load i32, i32* %10, align 4
  call void @putint(i32 %107)
  %108 = load i32, i32* %11, align 4
  call void @putint(i32 %108)
  %109 = load i32, i32* %12, align 4
  call void @putint(i32 %109)
  %110 = load i32, i32* %13, align 4
  call void @putint(i32 %110)
  %111 = load i32, i32* %14, align 4
  call void @putint(i32 %111)
  %112 = load i32, i32* %15, align 4
  call void @putint(i32 %112)
  %113 = load i32, i32* %16, align 4
  call void @putint(i32 %113)
  %114 = load i32, i32* %17, align 4
  call void @putint(i32 %114)
  %115 = load i32, i32* %18, align 4
  call void @putint(i32 %115)
  %116 = load i32, i32* %19, align 4
  call void @putint(i32 %116)
  %117 = load i32, i32* %20, align 4
  call void @putint(i32 %117)
  %118 = load i32, i32* %21, align 4
  call void @putint(i32 %118)
  %119 = load i32, i32* %22, align 4
  call void @putint(i32 %119)
  %120 = load i32, i32* %23, align 4
  call void @putint(i32 %120)
  %121 = load i32, i32* %24, align 4
  call void @putint(i32 %121)
  %122 = load i32, i32* %25, align 4
  call void @putint(i32 %122)
  %123 = load i32, i32* %26, align 4
  call void @putint(i32 %123)
  %124 = load i32, i32* %27, align 4
  call void @putint(i32 %124)
  %125 = load i32, i32* %28, align 4
  call void @putint(i32 %125)
  %126 = load i32, i32* %29, align 4
  call void @putint(i32 %126)
  %127 = alloca i32, align 4
  store i32 10, i32* %127, align 4
  %128 = load i32, i32* %127, align 4
  call void @putch(i32 %128)
  %129 = load i32, i32* %30, align 4
  call void @putint(i32 %129)
  %130 = load i32, i32* %127, align 4
  call void @putch(i32 %130)
  %131 = load i32, i32* %25, align 4
  ret i32 %131
}

