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

@a0 = dso_local global i32 zeroinitializer, align 4
@a1 = dso_local global i32 zeroinitializer, align 4
@a2 = dso_local global i32 zeroinitializer, align 4
@a3 = dso_local global i32 zeroinitializer, align 4
@a4 = dso_local global i32 zeroinitializer, align 4
@a5 = dso_local global i32 zeroinitializer, align 4
@a6 = dso_local global i32 zeroinitializer, align 4
@a7 = dso_local global i32 zeroinitializer, align 4
@a8 = dso_local global i32 zeroinitializer, align 4
@a9 = dso_local global i32 zeroinitializer, align 4
@a10 = dso_local global i32 zeroinitializer, align 4
@a11 = dso_local global i32 zeroinitializer, align 4
@a12 = dso_local global i32 zeroinitializer, align 4
@a13 = dso_local global i32 zeroinitializer, align 4
@a14 = dso_local global i32 zeroinitializer, align 4
@a15 = dso_local global i32 zeroinitializer, align 4
@a16 = dso_local global i32 zeroinitializer, align 4
@a17 = dso_local global i32 zeroinitializer, align 4
@a18 = dso_local global i32 zeroinitializer, align 4
@a19 = dso_local global i32 zeroinitializer, align 4
@a20 = dso_local global i32 zeroinitializer, align 4
@a21 = dso_local global i32 zeroinitializer, align 4
@a22 = dso_local global i32 zeroinitializer, align 4
@a23 = dso_local global i32 zeroinitializer, align 4
@a24 = dso_local global i32 zeroinitializer, align 4
@a25 = dso_local global i32 zeroinitializer, align 4
@a26 = dso_local global i32 zeroinitializer, align 4
@a27 = dso_local global i32 zeroinitializer, align 4
@a28 = dso_local global i32 zeroinitializer, align 4
@a29 = dso_local global i32 zeroinitializer, align 4
@a30 = dso_local global i32 zeroinitializer, align 4
@a31 = dso_local global i32 zeroinitializer, align 4
@a32 = dso_local global i32 zeroinitializer, align 4
@a33 = dso_local global i32 zeroinitializer, align 4
@a34 = dso_local global i32 zeroinitializer, align 4
@a35 = dso_local global i32 zeroinitializer, align 4
@a36 = dso_local global i32 zeroinitializer, align 4
@a37 = dso_local global i32 zeroinitializer, align 4
@a38 = dso_local global i32 zeroinitializer, align 4
@a39 = dso_local global i32 zeroinitializer, align 4

define i32 @testParam8(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7) {
entry0:
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
  %6 = alloca i32, align 4
  store i32 %arg6, i32* %6, align 4
  %7 = alloca i32, align 4
  store i32 %arg7, i32* %7, align 4
  %8 = load i32, i32* %0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = add i32 %8, %9
  %11 = load i32, i32* %2, align 4
  %12 = add i32 %10, %11
  %13 = load i32, i32* %3, align 4
  %14 = add i32 %12, %13
  %15 = load i32, i32* %4, align 4
  %16 = add i32 %14, %15
  %17 = load i32, i32* %5, align 4
  %18 = add i32 %16, %17
  %19 = load i32, i32* %6, align 4
  %20 = add i32 %18, %19
  %21 = load i32, i32* %7, align 4
  %22 = add i32 %20, %21
  ret i32 %22
}

define i32 @testParam16(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15) {
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
  %6 = alloca i32, align 4
  store i32 %arg6, i32* %6, align 4
  %7 = alloca i32, align 4
  store i32 %arg7, i32* %7, align 4
  %8 = alloca i32, align 4
  store i32 %arg8, i32* %8, align 4
  %9 = alloca i32, align 4
  store i32 %arg9, i32* %9, align 4
  %10 = alloca i32, align 4
  store i32 %arg10, i32* %10, align 4
  %11 = alloca i32, align 4
  store i32 %arg11, i32* %11, align 4
  %12 = alloca i32, align 4
  store i32 %arg12, i32* %12, align 4
  %13 = alloca i32, align 4
  store i32 %arg13, i32* %13, align 4
  %14 = alloca i32, align 4
  store i32 %arg14, i32* %14, align 4
  %15 = alloca i32, align 4
  store i32 %arg15, i32* %15, align 4
  %16 = load i32, i32* %0, align 4
  %17 = load i32, i32* %1, align 4
  %18 = add i32 %16, %17
  %19 = load i32, i32* %2, align 4
  %20 = add i32 %18, %19
  %21 = load i32, i32* %3, align 4
  %22 = sub i32 %20, %21
  %23 = load i32, i32* %4, align 4
  %24 = sub i32 %22, %23
  %25 = load i32, i32* %5, align 4
  %26 = sub i32 %24, %25
  %27 = load i32, i32* %6, align 4
  %28 = sub i32 %26, %27
  %29 = load i32, i32* %7, align 4
  %30 = sub i32 %28, %29
  %31 = load i32, i32* %8, align 4
  %32 = add i32 %30, %31
  %33 = load i32, i32* %9, align 4
  %34 = add i32 %32, %33
  %35 = load i32, i32* %10, align 4
  %36 = add i32 %34, %35
  %37 = load i32, i32* %11, align 4
  %38 = add i32 %36, %37
  %39 = load i32, i32* %12, align 4
  %40 = add i32 %38, %39
  %41 = load i32, i32* %13, align 4
  %42 = add i32 %40, %41
  %43 = load i32, i32* %14, align 4
  %44 = add i32 %42, %43
  %45 = load i32, i32* %15, align 4
  %46 = add i32 %44, %45
  ret i32 %46
}

define i32 @testParam32(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15, i32 %arg16, i32 %arg17, i32 %arg18, i32 %arg19, i32 %arg20, i32 %arg21, i32 %arg22, i32 %arg23, i32 %arg24, i32 %arg25, i32 %arg26, i32 %arg27, i32 %arg28, i32 %arg29, i32 %arg30, i32 %arg31) {
entry2:
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
  %6 = alloca i32, align 4
  store i32 %arg6, i32* %6, align 4
  %7 = alloca i32, align 4
  store i32 %arg7, i32* %7, align 4
  %8 = alloca i32, align 4
  store i32 %arg8, i32* %8, align 4
  %9 = alloca i32, align 4
  store i32 %arg9, i32* %9, align 4
  %10 = alloca i32, align 4
  store i32 %arg10, i32* %10, align 4
  %11 = alloca i32, align 4
  store i32 %arg11, i32* %11, align 4
  %12 = alloca i32, align 4
  store i32 %arg12, i32* %12, align 4
  %13 = alloca i32, align 4
  store i32 %arg13, i32* %13, align 4
  %14 = alloca i32, align 4
  store i32 %arg14, i32* %14, align 4
  %15 = alloca i32, align 4
  store i32 %arg15, i32* %15, align 4
  %16 = alloca i32, align 4
  store i32 %arg16, i32* %16, align 4
  %17 = alloca i32, align 4
  store i32 %arg17, i32* %17, align 4
  %18 = alloca i32, align 4
  store i32 %arg18, i32* %18, align 4
  %19 = alloca i32, align 4
  store i32 %arg19, i32* %19, align 4
  %20 = alloca i32, align 4
  store i32 %arg20, i32* %20, align 4
  %21 = alloca i32, align 4
  store i32 %arg21, i32* %21, align 4
  %22 = alloca i32, align 4
  store i32 %arg22, i32* %22, align 4
  %23 = alloca i32, align 4
  store i32 %arg23, i32* %23, align 4
  %24 = alloca i32, align 4
  store i32 %arg24, i32* %24, align 4
  %25 = alloca i32, align 4
  store i32 %arg25, i32* %25, align 4
  %26 = alloca i32, align 4
  store i32 %arg26, i32* %26, align 4
  %27 = alloca i32, align 4
  store i32 %arg27, i32* %27, align 4
  %28 = alloca i32, align 4
  store i32 %arg28, i32* %28, align 4
  %29 = alloca i32, align 4
  store i32 %arg29, i32* %29, align 4
  %30 = alloca i32, align 4
  store i32 %arg30, i32* %30, align 4
  %31 = alloca i32, align 4
  store i32 %arg31, i32* %31, align 4
  %32 = load i32, i32* %0, align 4
  %33 = load i32, i32* %1, align 4
  %34 = add i32 %32, %33
  %35 = load i32, i32* %2, align 4
  %36 = add i32 %34, %35
  %37 = load i32, i32* %3, align 4
  %38 = add i32 %36, %37
  %39 = load i32, i32* %4, align 4
  %40 = add i32 %38, %39
  %41 = load i32, i32* %5, align 4
  %42 = add i32 %40, %41
  %43 = load i32, i32* %6, align 4
  %44 = add i32 %42, %43
  %45 = load i32, i32* %7, align 4
  %46 = add i32 %44, %45
  %47 = load i32, i32* %8, align 4
  %48 = add i32 %46, %47
  %49 = load i32, i32* %9, align 4
  %50 = add i32 %48, %49
  %51 = load i32, i32* %10, align 4
  %52 = add i32 %50, %51
  %53 = load i32, i32* %11, align 4
  %54 = add i32 %52, %53
  %55 = load i32, i32* %12, align 4
  %56 = add i32 %54, %55
  %57 = load i32, i32* %13, align 4
  %58 = add i32 %56, %57
  %59 = load i32, i32* %14, align 4
  %60 = add i32 %58, %59
  %61 = load i32, i32* %15, align 4
  %62 = add i32 %60, %61
  %63 = load i32, i32* %16, align 4
  %64 = add i32 %62, %63
  %65 = load i32, i32* %17, align 4
  %66 = add i32 %64, %65
  %67 = load i32, i32* %18, align 4
  %68 = sub i32 %66, %67
  %69 = load i32, i32* %19, align 4
  %70 = sub i32 %68, %69
  %71 = load i32, i32* %20, align 4
  %72 = sub i32 %70, %71
  %73 = load i32, i32* %21, align 4
  %74 = sub i32 %72, %73
  %75 = load i32, i32* %22, align 4
  %76 = sub i32 %74, %75
  %77 = load i32, i32* %23, align 4
  %78 = add i32 %76, %77
  %79 = load i32, i32* %24, align 4
  %80 = add i32 %78, %79
  %81 = load i32, i32* %25, align 4
  %82 = add i32 %80, %81
  %83 = load i32, i32* %26, align 4
  %84 = add i32 %82, %83
  %85 = load i32, i32* %27, align 4
  %86 = add i32 %84, %85
  %87 = load i32, i32* %28, align 4
  %88 = add i32 %86, %87
  %89 = load i32, i32* %29, align 4
  %90 = add i32 %88, %89
  %91 = load i32, i32* %30, align 4
  %92 = add i32 %90, %91
  %93 = load i32, i32* %31, align 4
  %94 = add i32 %92, %93
  ret i32 %94
}

define i32 @main() {
entry3:
  store i32 0, i32* @a0, align 4
  store i32 1, i32* @a1, align 4
  store i32 2, i32* @a2, align 4
  store i32 3, i32* @a3, align 4
  store i32 4, i32* @a4, align 4
  store i32 5, i32* @a5, align 4
  store i32 6, i32* @a6, align 4
  store i32 7, i32* @a7, align 4
  store i32 8, i32* @a8, align 4
  store i32 9, i32* @a9, align 4
  store i32 0, i32* @a10, align 4
  store i32 1, i32* @a11, align 4
  store i32 2, i32* @a12, align 4
  store i32 3, i32* @a13, align 4
  store i32 4, i32* @a14, align 4
  store i32 5, i32* @a15, align 4
  store i32 6, i32* @a16, align 4
  store i32 7, i32* @a17, align 4
  store i32 8, i32* @a18, align 4
  store i32 9, i32* @a19, align 4
  store i32 0, i32* @a20, align 4
  store i32 1, i32* @a21, align 4
  store i32 2, i32* @a22, align 4
  store i32 3, i32* @a23, align 4
  store i32 4, i32* @a24, align 4
  store i32 5, i32* @a25, align 4
  store i32 6, i32* @a26, align 4
  store i32 7, i32* @a27, align 4
  store i32 8, i32* @a28, align 4
  store i32 9, i32* @a29, align 4
  store i32 0, i32* @a30, align 4
  store i32 1, i32* @a31, align 4
  store i32 4, i32* @a32, align 4
  store i32 5, i32* @a33, align 4
  store i32 6, i32* @a34, align 4
  store i32 7, i32* @a35, align 4
  store i32 8, i32* @a36, align 4
  store i32 9, i32* @a37, align 4
  store i32 0, i32* @a38, align 4
  store i32 1, i32* @a39, align 4
  %0 = load i32, i32* @a0, align 4
  %1 = load i32, i32* @a1, align 4
  %2 = load i32, i32* @a2, align 4
  %3 = load i32, i32* @a3, align 4
  %4 = load i32, i32* @a4, align 4
  %5 = load i32, i32* @a5, align 4
  %6 = load i32, i32* @a6, align 4
  %7 = load i32, i32* @a7, align 4
  %8 = call i32 @testParam8(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7)
  store i32 %8, i32* @a0, align 4
  %9 = load i32, i32* @a0, align 4
  call void @putint(i32 %9)
  %10 = load i32, i32* @a32, align 4
  %11 = load i32, i32* @a33, align 4
  %12 = load i32, i32* @a34, align 4
  %13 = load i32, i32* @a35, align 4
  %14 = load i32, i32* @a36, align 4
  %15 = load i32, i32* @a37, align 4
  %16 = load i32, i32* @a38, align 4
  %17 = load i32, i32* @a39, align 4
  %18 = load i32, i32* @a8, align 4
  %19 = load i32, i32* @a9, align 4
  %20 = load i32, i32* @a10, align 4
  %21 = load i32, i32* @a11, align 4
  %22 = load i32, i32* @a12, align 4
  %23 = load i32, i32* @a13, align 4
  %24 = load i32, i32* @a14, align 4
  %25 = load i32, i32* @a15, align 4
  %26 = call i32 @testParam16(i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19, i32 %20, i32 %21, i32 %22, i32 %23, i32 %24, i32 %25)
  store i32 %26, i32* @a0, align 4
  %27 = load i32, i32* @a0, align 4
  call void @putint(i32 %27)
  %28 = load i32, i32* @a0, align 4
  %29 = load i32, i32* @a1, align 4
  %30 = load i32, i32* @a2, align 4
  %31 = load i32, i32* @a3, align 4
  %32 = load i32, i32* @a4, align 4
  %33 = load i32, i32* @a5, align 4
  %34 = load i32, i32* @a6, align 4
  %35 = load i32, i32* @a7, align 4
  %36 = load i32, i32* @a8, align 4
  %37 = load i32, i32* @a9, align 4
  %38 = load i32, i32* @a10, align 4
  %39 = load i32, i32* @a11, align 4
  %40 = load i32, i32* @a12, align 4
  %41 = load i32, i32* @a13, align 4
  %42 = load i32, i32* @a14, align 4
  %43 = load i32, i32* @a15, align 4
  %44 = load i32, i32* @a16, align 4
  %45 = load i32, i32* @a17, align 4
  %46 = load i32, i32* @a18, align 4
  %47 = load i32, i32* @a19, align 4
  %48 = load i32, i32* @a20, align 4
  %49 = load i32, i32* @a21, align 4
  %50 = load i32, i32* @a22, align 4
  %51 = load i32, i32* @a23, align 4
  %52 = load i32, i32* @a24, align 4
  %53 = load i32, i32* @a25, align 4
  %54 = load i32, i32* @a26, align 4
  %55 = load i32, i32* @a27, align 4
  %56 = load i32, i32* @a28, align 4
  %57 = load i32, i32* @a29, align 4
  %58 = load i32, i32* @a30, align 4
  %59 = load i32, i32* @a31, align 4
  %60 = call i32 @testParam32(i32 %28, i32 %29, i32 %30, i32 %31, i32 %32, i32 %33, i32 %34, i32 %35, i32 %36, i32 %37, i32 %38, i32 %39, i32 %40, i32 %41, i32 %42, i32 %43, i32 %44, i32 %45, i32 %46, i32 %47, i32 %48, i32 %49, i32 %50, i32 %51, i32 %52, i32 %53, i32 %54, i32 %55, i32 %56, i32 %57, i32 %58, i32 %59)
  store i32 %60, i32* @a0, align 4
  %61 = load i32, i32* @a0, align 4
  call void @putint(i32 %61)
  ret i32 0
}

