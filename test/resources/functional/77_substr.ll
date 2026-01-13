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


define i32 @MAX(i32 %arg0, i32 %arg1) {
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
  br i1 %6, label %if.then0, label %if.else0
if.then0:
  %7 = load i32, i32* %0, align 4
  ret i32 %7
if.else0:
  %8 = load i32, i32* %0, align 4
  %9 = load i32, i32* %1, align 4
  %10 = icmp sgt i32 %8, %9
  %11 = zext i1 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %if.then1, label %if.else1
if.then1:
  %13 = load i32, i32* %0, align 4
  ret i32 %13
if.else1:
  %14 = load i32, i32* %1, align 4
  ret i32 %14
if.merge1:
  br label %if.merge0
if.merge0:
  ret i32 0
}

define i32 @max_sum_nonadjacent(i32* %arg0, i32 %arg1) {
entry1:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca [16 x i32], align 4
  %3 = bitcast [16 x i32]* %2 to i32*
  %4 = getelementptr inbounds i32, i32* %3, i32 0
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %3, i32 1
  store i32 0, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %3, i32 2
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %3, i32 3
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %3, i32 4
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %3, i32 5
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %3, i32 6
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %3, i32 7
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %3, i32 8
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %3, i32 9
  store i32 0, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %3, i32 10
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %3, i32 11
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %3, i32 12
  store i32 0, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %3, i32 13
  store i32 0, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %3, i32 14
  store i32 0, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %3, i32 15
  store i32 0, i32* %19, align 4
  %20 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i32 0, i32 0
  %21 = load i32*, i32** %0, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 0
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %20, align 4
  %24 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i32 0, i32 1
  %25 = load i32*, i32** %0, align 8
  %26 = getelementptr inbounds i32, i32* %25, i32 0
  %27 = load i32, i32* %26, align 4
  %28 = load i32*, i32** %0, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 1
  %30 = load i32, i32* %29, align 4
  %31 = call i32 @MAX(i32 %27, i32 %30)
  store i32 %31, i32* %24, align 4
  %32 = alloca i32, align 4
  store i32 2, i32* %32, align 4
  br label %while.cond.0
while.cond.0:
  %33 = load i32, i32* %32, align 4
  %34 = load i32, i32* %1, align 4
  %35 = icmp slt i32 %33, %34
  %36 = zext i1 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %while.body.0, label %while.merge.0
while.body.0:
  %38 = load i32, i32* %32, align 4
  %39 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i32 0, i32 %38
  %40 = load i32, i32* %32, align 4
  %41 = sub i32 %40, 2
  %42 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i32 0, i32 %41
  %43 = load i32, i32* %42, align 4
  %44 = load i32, i32* %32, align 4
  %45 = load i32*, i32** %0, align 8
  %46 = getelementptr inbounds i32, i32* %45, i32 %44
  %47 = load i32, i32* %46, align 4
  %48 = add i32 %43, %47
  %49 = load i32, i32* %32, align 4
  %50 = sub i32 %49, 1
  %51 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i32 0, i32 %50
  %52 = load i32, i32* %51, align 4
  %53 = call i32 @MAX(i32 %48, i32 %52)
  store i32 %53, i32* %39, align 4
  %54 = load i32, i32* %32, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %32, align 4
  br label %while.cond.0
while.merge.0:
  %56 = load i32, i32* %1, align 4
  %57 = sub i32 %56, 1
  %58 = getelementptr inbounds [16 x i32], [16 x i32]* %2, i32 0, i32 %57
  %59 = load i32, i32* %58, align 4
  ret i32 %59
}

define i32 @longest_common_subseq(i32* %arg0, i32 %arg1, i32* %arg2, i32 %arg3) {
entry2:
  %0 = alloca i32*, align 4
  store i32* %arg0, i32** %0, align 8
  %1 = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = alloca i32*, align 4
  store i32* %arg2, i32** %2, align 8
  %3 = alloca i32, align 4
  store i32 %arg3, i32* %3, align 4
  %4 = alloca [16 x [16 x i32]], align 4
  %5 = bitcast [16 x [16 x i32]]* %4 to i32*
  %6 = getelementptr inbounds i32, i32* %5, i32 0
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %5, i32 1
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %5, i32 2
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %5, i32 3
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %5, i32 4
  store i32 0, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %5, i32 5
  store i32 0, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %5, i32 6
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %5, i32 7
  store i32 0, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %5, i32 8
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %5, i32 9
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %5, i32 10
  store i32 0, i32* %16, align 4
  %17 = getelementptr inbounds i32, i32* %5, i32 11
  store i32 0, i32* %17, align 4
  %18 = getelementptr inbounds i32, i32* %5, i32 12
  store i32 0, i32* %18, align 4
  %19 = getelementptr inbounds i32, i32* %5, i32 13
  store i32 0, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %5, i32 14
  store i32 0, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %5, i32 15
  store i32 0, i32* %21, align 4
  %22 = getelementptr inbounds i32, i32* %5, i32 16
  store i32 0, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %5, i32 17
  store i32 0, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %5, i32 18
  store i32 0, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %5, i32 19
  store i32 0, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %5, i32 20
  store i32 0, i32* %26, align 4
  %27 = getelementptr inbounds i32, i32* %5, i32 21
  store i32 0, i32* %27, align 4
  %28 = getelementptr inbounds i32, i32* %5, i32 22
  store i32 0, i32* %28, align 4
  %29 = getelementptr inbounds i32, i32* %5, i32 23
  store i32 0, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %5, i32 24
  store i32 0, i32* %30, align 4
  %31 = getelementptr inbounds i32, i32* %5, i32 25
  store i32 0, i32* %31, align 4
  %32 = getelementptr inbounds i32, i32* %5, i32 26
  store i32 0, i32* %32, align 4
  %33 = getelementptr inbounds i32, i32* %5, i32 27
  store i32 0, i32* %33, align 4
  %34 = getelementptr inbounds i32, i32* %5, i32 28
  store i32 0, i32* %34, align 4
  %35 = getelementptr inbounds i32, i32* %5, i32 29
  store i32 0, i32* %35, align 4
  %36 = getelementptr inbounds i32, i32* %5, i32 30
  store i32 0, i32* %36, align 4
  %37 = getelementptr inbounds i32, i32* %5, i32 31
  store i32 0, i32* %37, align 4
  %38 = getelementptr inbounds i32, i32* %5, i32 32
  store i32 0, i32* %38, align 4
  %39 = getelementptr inbounds i32, i32* %5, i32 33
  store i32 0, i32* %39, align 4
  %40 = getelementptr inbounds i32, i32* %5, i32 34
  store i32 0, i32* %40, align 4
  %41 = getelementptr inbounds i32, i32* %5, i32 35
  store i32 0, i32* %41, align 4
  %42 = getelementptr inbounds i32, i32* %5, i32 36
  store i32 0, i32* %42, align 4
  %43 = getelementptr inbounds i32, i32* %5, i32 37
  store i32 0, i32* %43, align 4
  %44 = getelementptr inbounds i32, i32* %5, i32 38
  store i32 0, i32* %44, align 4
  %45 = getelementptr inbounds i32, i32* %5, i32 39
  store i32 0, i32* %45, align 4
  %46 = getelementptr inbounds i32, i32* %5, i32 40
  store i32 0, i32* %46, align 4
  %47 = getelementptr inbounds i32, i32* %5, i32 41
  store i32 0, i32* %47, align 4
  %48 = getelementptr inbounds i32, i32* %5, i32 42
  store i32 0, i32* %48, align 4
  %49 = getelementptr inbounds i32, i32* %5, i32 43
  store i32 0, i32* %49, align 4
  %50 = getelementptr inbounds i32, i32* %5, i32 44
  store i32 0, i32* %50, align 4
  %51 = getelementptr inbounds i32, i32* %5, i32 45
  store i32 0, i32* %51, align 4
  %52 = getelementptr inbounds i32, i32* %5, i32 46
  store i32 0, i32* %52, align 4
  %53 = getelementptr inbounds i32, i32* %5, i32 47
  store i32 0, i32* %53, align 4
  %54 = getelementptr inbounds i32, i32* %5, i32 48
  store i32 0, i32* %54, align 4
  %55 = getelementptr inbounds i32, i32* %5, i32 49
  store i32 0, i32* %55, align 4
  %56 = getelementptr inbounds i32, i32* %5, i32 50
  store i32 0, i32* %56, align 4
  %57 = getelementptr inbounds i32, i32* %5, i32 51
  store i32 0, i32* %57, align 4
  %58 = getelementptr inbounds i32, i32* %5, i32 52
  store i32 0, i32* %58, align 4
  %59 = getelementptr inbounds i32, i32* %5, i32 53
  store i32 0, i32* %59, align 4
  %60 = getelementptr inbounds i32, i32* %5, i32 54
  store i32 0, i32* %60, align 4
  %61 = getelementptr inbounds i32, i32* %5, i32 55
  store i32 0, i32* %61, align 4
  %62 = getelementptr inbounds i32, i32* %5, i32 56
  store i32 0, i32* %62, align 4
  %63 = getelementptr inbounds i32, i32* %5, i32 57
  store i32 0, i32* %63, align 4
  %64 = getelementptr inbounds i32, i32* %5, i32 58
  store i32 0, i32* %64, align 4
  %65 = getelementptr inbounds i32, i32* %5, i32 59
  store i32 0, i32* %65, align 4
  %66 = getelementptr inbounds i32, i32* %5, i32 60
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds i32, i32* %5, i32 61
  store i32 0, i32* %67, align 4
  %68 = getelementptr inbounds i32, i32* %5, i32 62
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds i32, i32* %5, i32 63
  store i32 0, i32* %69, align 4
  %70 = getelementptr inbounds i32, i32* %5, i32 64
  store i32 0, i32* %70, align 4
  %71 = getelementptr inbounds i32, i32* %5, i32 65
  store i32 0, i32* %71, align 4
  %72 = getelementptr inbounds i32, i32* %5, i32 66
  store i32 0, i32* %72, align 4
  %73 = getelementptr inbounds i32, i32* %5, i32 67
  store i32 0, i32* %73, align 4
  %74 = getelementptr inbounds i32, i32* %5, i32 68
  store i32 0, i32* %74, align 4
  %75 = getelementptr inbounds i32, i32* %5, i32 69
  store i32 0, i32* %75, align 4
  %76 = getelementptr inbounds i32, i32* %5, i32 70
  store i32 0, i32* %76, align 4
  %77 = getelementptr inbounds i32, i32* %5, i32 71
  store i32 0, i32* %77, align 4
  %78 = getelementptr inbounds i32, i32* %5, i32 72
  store i32 0, i32* %78, align 4
  %79 = getelementptr inbounds i32, i32* %5, i32 73
  store i32 0, i32* %79, align 4
  %80 = getelementptr inbounds i32, i32* %5, i32 74
  store i32 0, i32* %80, align 4
  %81 = getelementptr inbounds i32, i32* %5, i32 75
  store i32 0, i32* %81, align 4
  %82 = getelementptr inbounds i32, i32* %5, i32 76
  store i32 0, i32* %82, align 4
  %83 = getelementptr inbounds i32, i32* %5, i32 77
  store i32 0, i32* %83, align 4
  %84 = getelementptr inbounds i32, i32* %5, i32 78
  store i32 0, i32* %84, align 4
  %85 = getelementptr inbounds i32, i32* %5, i32 79
  store i32 0, i32* %85, align 4
  %86 = getelementptr inbounds i32, i32* %5, i32 80
  store i32 0, i32* %86, align 4
  %87 = getelementptr inbounds i32, i32* %5, i32 81
  store i32 0, i32* %87, align 4
  %88 = getelementptr inbounds i32, i32* %5, i32 82
  store i32 0, i32* %88, align 4
  %89 = getelementptr inbounds i32, i32* %5, i32 83
  store i32 0, i32* %89, align 4
  %90 = getelementptr inbounds i32, i32* %5, i32 84
  store i32 0, i32* %90, align 4
  %91 = getelementptr inbounds i32, i32* %5, i32 85
  store i32 0, i32* %91, align 4
  %92 = getelementptr inbounds i32, i32* %5, i32 86
  store i32 0, i32* %92, align 4
  %93 = getelementptr inbounds i32, i32* %5, i32 87
  store i32 0, i32* %93, align 4
  %94 = getelementptr inbounds i32, i32* %5, i32 88
  store i32 0, i32* %94, align 4
  %95 = getelementptr inbounds i32, i32* %5, i32 89
  store i32 0, i32* %95, align 4
  %96 = getelementptr inbounds i32, i32* %5, i32 90
  store i32 0, i32* %96, align 4
  %97 = getelementptr inbounds i32, i32* %5, i32 91
  store i32 0, i32* %97, align 4
  %98 = getelementptr inbounds i32, i32* %5, i32 92
  store i32 0, i32* %98, align 4
  %99 = getelementptr inbounds i32, i32* %5, i32 93
  store i32 0, i32* %99, align 4
  %100 = getelementptr inbounds i32, i32* %5, i32 94
  store i32 0, i32* %100, align 4
  %101 = getelementptr inbounds i32, i32* %5, i32 95
  store i32 0, i32* %101, align 4
  %102 = getelementptr inbounds i32, i32* %5, i32 96
  store i32 0, i32* %102, align 4
  %103 = getelementptr inbounds i32, i32* %5, i32 97
  store i32 0, i32* %103, align 4
  %104 = getelementptr inbounds i32, i32* %5, i32 98
  store i32 0, i32* %104, align 4
  %105 = getelementptr inbounds i32, i32* %5, i32 99
  store i32 0, i32* %105, align 4
  %106 = getelementptr inbounds i32, i32* %5, i32 100
  store i32 0, i32* %106, align 4
  %107 = getelementptr inbounds i32, i32* %5, i32 101
  store i32 0, i32* %107, align 4
  %108 = getelementptr inbounds i32, i32* %5, i32 102
  store i32 0, i32* %108, align 4
  %109 = getelementptr inbounds i32, i32* %5, i32 103
  store i32 0, i32* %109, align 4
  %110 = getelementptr inbounds i32, i32* %5, i32 104
  store i32 0, i32* %110, align 4
  %111 = getelementptr inbounds i32, i32* %5, i32 105
  store i32 0, i32* %111, align 4
  %112 = getelementptr inbounds i32, i32* %5, i32 106
  store i32 0, i32* %112, align 4
  %113 = getelementptr inbounds i32, i32* %5, i32 107
  store i32 0, i32* %113, align 4
  %114 = getelementptr inbounds i32, i32* %5, i32 108
  store i32 0, i32* %114, align 4
  %115 = getelementptr inbounds i32, i32* %5, i32 109
  store i32 0, i32* %115, align 4
  %116 = getelementptr inbounds i32, i32* %5, i32 110
  store i32 0, i32* %116, align 4
  %117 = getelementptr inbounds i32, i32* %5, i32 111
  store i32 0, i32* %117, align 4
  %118 = getelementptr inbounds i32, i32* %5, i32 112
  store i32 0, i32* %118, align 4
  %119 = getelementptr inbounds i32, i32* %5, i32 113
  store i32 0, i32* %119, align 4
  %120 = getelementptr inbounds i32, i32* %5, i32 114
  store i32 0, i32* %120, align 4
  %121 = getelementptr inbounds i32, i32* %5, i32 115
  store i32 0, i32* %121, align 4
  %122 = getelementptr inbounds i32, i32* %5, i32 116
  store i32 0, i32* %122, align 4
  %123 = getelementptr inbounds i32, i32* %5, i32 117
  store i32 0, i32* %123, align 4
  %124 = getelementptr inbounds i32, i32* %5, i32 118
  store i32 0, i32* %124, align 4
  %125 = getelementptr inbounds i32, i32* %5, i32 119
  store i32 0, i32* %125, align 4
  %126 = getelementptr inbounds i32, i32* %5, i32 120
  store i32 0, i32* %126, align 4
  %127 = getelementptr inbounds i32, i32* %5, i32 121
  store i32 0, i32* %127, align 4
  %128 = getelementptr inbounds i32, i32* %5, i32 122
  store i32 0, i32* %128, align 4
  %129 = getelementptr inbounds i32, i32* %5, i32 123
  store i32 0, i32* %129, align 4
  %130 = getelementptr inbounds i32, i32* %5, i32 124
  store i32 0, i32* %130, align 4
  %131 = getelementptr inbounds i32, i32* %5, i32 125
  store i32 0, i32* %131, align 4
  %132 = getelementptr inbounds i32, i32* %5, i32 126
  store i32 0, i32* %132, align 4
  %133 = getelementptr inbounds i32, i32* %5, i32 127
  store i32 0, i32* %133, align 4
  %134 = getelementptr inbounds i32, i32* %5, i32 128
  store i32 0, i32* %134, align 4
  %135 = getelementptr inbounds i32, i32* %5, i32 129
  store i32 0, i32* %135, align 4
  %136 = getelementptr inbounds i32, i32* %5, i32 130
  store i32 0, i32* %136, align 4
  %137 = getelementptr inbounds i32, i32* %5, i32 131
  store i32 0, i32* %137, align 4
  %138 = getelementptr inbounds i32, i32* %5, i32 132
  store i32 0, i32* %138, align 4
  %139 = getelementptr inbounds i32, i32* %5, i32 133
  store i32 0, i32* %139, align 4
  %140 = getelementptr inbounds i32, i32* %5, i32 134
  store i32 0, i32* %140, align 4
  %141 = getelementptr inbounds i32, i32* %5, i32 135
  store i32 0, i32* %141, align 4
  %142 = getelementptr inbounds i32, i32* %5, i32 136
  store i32 0, i32* %142, align 4
  %143 = getelementptr inbounds i32, i32* %5, i32 137
  store i32 0, i32* %143, align 4
  %144 = getelementptr inbounds i32, i32* %5, i32 138
  store i32 0, i32* %144, align 4
  %145 = getelementptr inbounds i32, i32* %5, i32 139
  store i32 0, i32* %145, align 4
  %146 = getelementptr inbounds i32, i32* %5, i32 140
  store i32 0, i32* %146, align 4
  %147 = getelementptr inbounds i32, i32* %5, i32 141
  store i32 0, i32* %147, align 4
  %148 = getelementptr inbounds i32, i32* %5, i32 142
  store i32 0, i32* %148, align 4
  %149 = getelementptr inbounds i32, i32* %5, i32 143
  store i32 0, i32* %149, align 4
  %150 = getelementptr inbounds i32, i32* %5, i32 144
  store i32 0, i32* %150, align 4
  %151 = getelementptr inbounds i32, i32* %5, i32 145
  store i32 0, i32* %151, align 4
  %152 = getelementptr inbounds i32, i32* %5, i32 146
  store i32 0, i32* %152, align 4
  %153 = getelementptr inbounds i32, i32* %5, i32 147
  store i32 0, i32* %153, align 4
  %154 = getelementptr inbounds i32, i32* %5, i32 148
  store i32 0, i32* %154, align 4
  %155 = getelementptr inbounds i32, i32* %5, i32 149
  store i32 0, i32* %155, align 4
  %156 = getelementptr inbounds i32, i32* %5, i32 150
  store i32 0, i32* %156, align 4
  %157 = getelementptr inbounds i32, i32* %5, i32 151
  store i32 0, i32* %157, align 4
  %158 = getelementptr inbounds i32, i32* %5, i32 152
  store i32 0, i32* %158, align 4
  %159 = getelementptr inbounds i32, i32* %5, i32 153
  store i32 0, i32* %159, align 4
  %160 = getelementptr inbounds i32, i32* %5, i32 154
  store i32 0, i32* %160, align 4
  %161 = getelementptr inbounds i32, i32* %5, i32 155
  store i32 0, i32* %161, align 4
  %162 = getelementptr inbounds i32, i32* %5, i32 156
  store i32 0, i32* %162, align 4
  %163 = getelementptr inbounds i32, i32* %5, i32 157
  store i32 0, i32* %163, align 4
  %164 = getelementptr inbounds i32, i32* %5, i32 158
  store i32 0, i32* %164, align 4
  %165 = getelementptr inbounds i32, i32* %5, i32 159
  store i32 0, i32* %165, align 4
  %166 = getelementptr inbounds i32, i32* %5, i32 160
  store i32 0, i32* %166, align 4
  %167 = getelementptr inbounds i32, i32* %5, i32 161
  store i32 0, i32* %167, align 4
  %168 = getelementptr inbounds i32, i32* %5, i32 162
  store i32 0, i32* %168, align 4
  %169 = getelementptr inbounds i32, i32* %5, i32 163
  store i32 0, i32* %169, align 4
  %170 = getelementptr inbounds i32, i32* %5, i32 164
  store i32 0, i32* %170, align 4
  %171 = getelementptr inbounds i32, i32* %5, i32 165
  store i32 0, i32* %171, align 4
  %172 = getelementptr inbounds i32, i32* %5, i32 166
  store i32 0, i32* %172, align 4
  %173 = getelementptr inbounds i32, i32* %5, i32 167
  store i32 0, i32* %173, align 4
  %174 = getelementptr inbounds i32, i32* %5, i32 168
  store i32 0, i32* %174, align 4
  %175 = getelementptr inbounds i32, i32* %5, i32 169
  store i32 0, i32* %175, align 4
  %176 = getelementptr inbounds i32, i32* %5, i32 170
  store i32 0, i32* %176, align 4
  %177 = getelementptr inbounds i32, i32* %5, i32 171
  store i32 0, i32* %177, align 4
  %178 = getelementptr inbounds i32, i32* %5, i32 172
  store i32 0, i32* %178, align 4
  %179 = getelementptr inbounds i32, i32* %5, i32 173
  store i32 0, i32* %179, align 4
  %180 = getelementptr inbounds i32, i32* %5, i32 174
  store i32 0, i32* %180, align 4
  %181 = getelementptr inbounds i32, i32* %5, i32 175
  store i32 0, i32* %181, align 4
  %182 = getelementptr inbounds i32, i32* %5, i32 176
  store i32 0, i32* %182, align 4
  %183 = getelementptr inbounds i32, i32* %5, i32 177
  store i32 0, i32* %183, align 4
  %184 = getelementptr inbounds i32, i32* %5, i32 178
  store i32 0, i32* %184, align 4
  %185 = getelementptr inbounds i32, i32* %5, i32 179
  store i32 0, i32* %185, align 4
  %186 = getelementptr inbounds i32, i32* %5, i32 180
  store i32 0, i32* %186, align 4
  %187 = getelementptr inbounds i32, i32* %5, i32 181
  store i32 0, i32* %187, align 4
  %188 = getelementptr inbounds i32, i32* %5, i32 182
  store i32 0, i32* %188, align 4
  %189 = getelementptr inbounds i32, i32* %5, i32 183
  store i32 0, i32* %189, align 4
  %190 = getelementptr inbounds i32, i32* %5, i32 184
  store i32 0, i32* %190, align 4
  %191 = getelementptr inbounds i32, i32* %5, i32 185
  store i32 0, i32* %191, align 4
  %192 = getelementptr inbounds i32, i32* %5, i32 186
  store i32 0, i32* %192, align 4
  %193 = getelementptr inbounds i32, i32* %5, i32 187
  store i32 0, i32* %193, align 4
  %194 = getelementptr inbounds i32, i32* %5, i32 188
  store i32 0, i32* %194, align 4
  %195 = getelementptr inbounds i32, i32* %5, i32 189
  store i32 0, i32* %195, align 4
  %196 = getelementptr inbounds i32, i32* %5, i32 190
  store i32 0, i32* %196, align 4
  %197 = getelementptr inbounds i32, i32* %5, i32 191
  store i32 0, i32* %197, align 4
  %198 = getelementptr inbounds i32, i32* %5, i32 192
  store i32 0, i32* %198, align 4
  %199 = getelementptr inbounds i32, i32* %5, i32 193
  store i32 0, i32* %199, align 4
  %200 = getelementptr inbounds i32, i32* %5, i32 194
  store i32 0, i32* %200, align 4
  %201 = getelementptr inbounds i32, i32* %5, i32 195
  store i32 0, i32* %201, align 4
  %202 = getelementptr inbounds i32, i32* %5, i32 196
  store i32 0, i32* %202, align 4
  %203 = getelementptr inbounds i32, i32* %5, i32 197
  store i32 0, i32* %203, align 4
  %204 = getelementptr inbounds i32, i32* %5, i32 198
  store i32 0, i32* %204, align 4
  %205 = getelementptr inbounds i32, i32* %5, i32 199
  store i32 0, i32* %205, align 4
  %206 = getelementptr inbounds i32, i32* %5, i32 200
  store i32 0, i32* %206, align 4
  %207 = getelementptr inbounds i32, i32* %5, i32 201
  store i32 0, i32* %207, align 4
  %208 = getelementptr inbounds i32, i32* %5, i32 202
  store i32 0, i32* %208, align 4
  %209 = getelementptr inbounds i32, i32* %5, i32 203
  store i32 0, i32* %209, align 4
  %210 = getelementptr inbounds i32, i32* %5, i32 204
  store i32 0, i32* %210, align 4
  %211 = getelementptr inbounds i32, i32* %5, i32 205
  store i32 0, i32* %211, align 4
  %212 = getelementptr inbounds i32, i32* %5, i32 206
  store i32 0, i32* %212, align 4
  %213 = getelementptr inbounds i32, i32* %5, i32 207
  store i32 0, i32* %213, align 4
  %214 = getelementptr inbounds i32, i32* %5, i32 208
  store i32 0, i32* %214, align 4
  %215 = getelementptr inbounds i32, i32* %5, i32 209
  store i32 0, i32* %215, align 4
  %216 = getelementptr inbounds i32, i32* %5, i32 210
  store i32 0, i32* %216, align 4
  %217 = getelementptr inbounds i32, i32* %5, i32 211
  store i32 0, i32* %217, align 4
  %218 = getelementptr inbounds i32, i32* %5, i32 212
  store i32 0, i32* %218, align 4
  %219 = getelementptr inbounds i32, i32* %5, i32 213
  store i32 0, i32* %219, align 4
  %220 = getelementptr inbounds i32, i32* %5, i32 214
  store i32 0, i32* %220, align 4
  %221 = getelementptr inbounds i32, i32* %5, i32 215
  store i32 0, i32* %221, align 4
  %222 = getelementptr inbounds i32, i32* %5, i32 216
  store i32 0, i32* %222, align 4
  %223 = getelementptr inbounds i32, i32* %5, i32 217
  store i32 0, i32* %223, align 4
  %224 = getelementptr inbounds i32, i32* %5, i32 218
  store i32 0, i32* %224, align 4
  %225 = getelementptr inbounds i32, i32* %5, i32 219
  store i32 0, i32* %225, align 4
  %226 = getelementptr inbounds i32, i32* %5, i32 220
  store i32 0, i32* %226, align 4
  %227 = getelementptr inbounds i32, i32* %5, i32 221
  store i32 0, i32* %227, align 4
  %228 = getelementptr inbounds i32, i32* %5, i32 222
  store i32 0, i32* %228, align 4
  %229 = getelementptr inbounds i32, i32* %5, i32 223
  store i32 0, i32* %229, align 4
  %230 = getelementptr inbounds i32, i32* %5, i32 224
  store i32 0, i32* %230, align 4
  %231 = getelementptr inbounds i32, i32* %5, i32 225
  store i32 0, i32* %231, align 4
  %232 = getelementptr inbounds i32, i32* %5, i32 226
  store i32 0, i32* %232, align 4
  %233 = getelementptr inbounds i32, i32* %5, i32 227
  store i32 0, i32* %233, align 4
  %234 = getelementptr inbounds i32, i32* %5, i32 228
  store i32 0, i32* %234, align 4
  %235 = getelementptr inbounds i32, i32* %5, i32 229
  store i32 0, i32* %235, align 4
  %236 = getelementptr inbounds i32, i32* %5, i32 230
  store i32 0, i32* %236, align 4
  %237 = getelementptr inbounds i32, i32* %5, i32 231
  store i32 0, i32* %237, align 4
  %238 = getelementptr inbounds i32, i32* %5, i32 232
  store i32 0, i32* %238, align 4
  %239 = getelementptr inbounds i32, i32* %5, i32 233
  store i32 0, i32* %239, align 4
  %240 = getelementptr inbounds i32, i32* %5, i32 234
  store i32 0, i32* %240, align 4
  %241 = getelementptr inbounds i32, i32* %5, i32 235
  store i32 0, i32* %241, align 4
  %242 = getelementptr inbounds i32, i32* %5, i32 236
  store i32 0, i32* %242, align 4
  %243 = getelementptr inbounds i32, i32* %5, i32 237
  store i32 0, i32* %243, align 4
  %244 = getelementptr inbounds i32, i32* %5, i32 238
  store i32 0, i32* %244, align 4
  %245 = getelementptr inbounds i32, i32* %5, i32 239
  store i32 0, i32* %245, align 4
  %246 = getelementptr inbounds i32, i32* %5, i32 240
  store i32 0, i32* %246, align 4
  %247 = getelementptr inbounds i32, i32* %5, i32 241
  store i32 0, i32* %247, align 4
  %248 = getelementptr inbounds i32, i32* %5, i32 242
  store i32 0, i32* %248, align 4
  %249 = getelementptr inbounds i32, i32* %5, i32 243
  store i32 0, i32* %249, align 4
  %250 = getelementptr inbounds i32, i32* %5, i32 244
  store i32 0, i32* %250, align 4
  %251 = getelementptr inbounds i32, i32* %5, i32 245
  store i32 0, i32* %251, align 4
  %252 = getelementptr inbounds i32, i32* %5, i32 246
  store i32 0, i32* %252, align 4
  %253 = getelementptr inbounds i32, i32* %5, i32 247
  store i32 0, i32* %253, align 4
  %254 = getelementptr inbounds i32, i32* %5, i32 248
  store i32 0, i32* %254, align 4
  %255 = getelementptr inbounds i32, i32* %5, i32 249
  store i32 0, i32* %255, align 4
  %256 = getelementptr inbounds i32, i32* %5, i32 250
  store i32 0, i32* %256, align 4
  %257 = getelementptr inbounds i32, i32* %5, i32 251
  store i32 0, i32* %257, align 4
  %258 = getelementptr inbounds i32, i32* %5, i32 252
  store i32 0, i32* %258, align 4
  %259 = getelementptr inbounds i32, i32* %5, i32 253
  store i32 0, i32* %259, align 4
  %260 = getelementptr inbounds i32, i32* %5, i32 254
  store i32 0, i32* %260, align 4
  %261 = getelementptr inbounds i32, i32* %5, i32 255
  store i32 0, i32* %261, align 4
  %262 = alloca i32, align 4
  %263 = alloca i32, align 4
  store i32 1, i32* %262, align 4
  br label %while.cond.1
while.cond.1:
  %264 = load i32, i32* %262, align 4
  %265 = load i32, i32* %1, align 4
  %266 = icmp sle i32 %264, %265
  %267 = zext i1 %266 to i32
  %268 = icmp ne i32 %267, 0
  br i1 %268, label %while.body.1, label %while.merge.1
while.body.1:
  store i32 1, i32* %263, align 4
  br label %while.cond.2
while.cond.2:
  %269 = load i32, i32* %263, align 4
  %270 = load i32, i32* %3, align 4
  %271 = icmp sle i32 %269, %270
  %272 = zext i1 %271 to i32
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %while.body.2, label %while.merge.2
while.body.2:
  %274 = load i32, i32* %262, align 4
  %275 = sub i32 %274, 1
  %276 = load i32*, i32** %0, align 8
  %277 = getelementptr inbounds i32, i32* %276, i32 %275
  %278 = load i32, i32* %277, align 4
  %279 = load i32, i32* %263, align 4
  %280 = sub i32 %279, 1
  %281 = load i32*, i32** %2, align 8
  %282 = getelementptr inbounds i32, i32* %281, i32 %280
  %283 = load i32, i32* %282, align 4
  %284 = icmp eq i32 %278, %283
  %285 = zext i1 %284 to i32
  %286 = icmp ne i32 %285, 0
  br i1 %286, label %if.then2, label %if.else2
if.then2:
  %287 = load i32, i32* %262, align 4
  %288 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %4, i32 0, i32 %287
  %289 = load i32, i32* %263, align 4
  %290 = getelementptr inbounds [16 x i32], [16 x i32]* %288, i32 0, i32 %289
  %291 = load i32, i32* %262, align 4
  %292 = sub i32 %291, 1
  %293 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %4, i32 0, i32 %292
  %294 = load i32, i32* %263, align 4
  %295 = sub i32 %294, 1
  %296 = getelementptr inbounds [16 x i32], [16 x i32]* %293, i32 0, i32 %295
  %297 = load i32, i32* %296, align 4
  %298 = add i32 %297, 1
  store i32 %298, i32* %290, align 4
  br label %if.merge2
if.else2:
  %299 = load i32, i32* %262, align 4
  %300 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %4, i32 0, i32 %299
  %301 = load i32, i32* %263, align 4
  %302 = getelementptr inbounds [16 x i32], [16 x i32]* %300, i32 0, i32 %301
  %303 = load i32, i32* %262, align 4
  %304 = sub i32 %303, 1
  %305 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %4, i32 0, i32 %304
  %306 = load i32, i32* %263, align 4
  %307 = getelementptr inbounds [16 x i32], [16 x i32]* %305, i32 0, i32 %306
  %308 = load i32, i32* %307, align 4
  %309 = load i32, i32* %262, align 4
  %310 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %4, i32 0, i32 %309
  %311 = load i32, i32* %263, align 4
  %312 = sub i32 %311, 1
  %313 = getelementptr inbounds [16 x i32], [16 x i32]* %310, i32 0, i32 %312
  %314 = load i32, i32* %313, align 4
  %315 = call i32 @MAX(i32 %308, i32 %314)
  store i32 %315, i32* %302, align 4
  br label %if.merge2
if.merge2:
  %316 = load i32, i32* %263, align 4
  %317 = add i32 %316, 1
  store i32 %317, i32* %263, align 4
  br label %while.cond.2
while.merge.2:
  %318 = load i32, i32* %262, align 4
  %319 = add i32 %318, 1
  store i32 %319, i32* %262, align 4
  br label %while.cond.1
while.merge.1:
  %320 = load i32, i32* %1, align 4
  %321 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* %4, i32 0, i32 %320
  %322 = load i32, i32* %3, align 4
  %323 = getelementptr inbounds [16 x i32], [16 x i32]* %321, i32 0, i32 %322
  %324 = load i32, i32* %323, align 4
  ret i32 %324
}

define i32 @main() {
entry3:
  %0 = alloca [15 x i32], align 4
  %1 = bitcast [15 x i32]* %0 to i32*
  %2 = getelementptr inbounds i32, i32* %1, i32 0
  store i32 8, i32* %2, align 4
  %3 = getelementptr inbounds i32, i32* %1, i32 1
  store i32 7, i32* %3, align 4
  %4 = getelementptr inbounds i32, i32* %1, i32 2
  store i32 4, i32* %4, align 4
  %5 = getelementptr inbounds i32, i32* %1, i32 3
  store i32 1, i32* %5, align 4
  %6 = getelementptr inbounds i32, i32* %1, i32 4
  store i32 2, i32* %6, align 4
  %7 = getelementptr inbounds i32, i32* %1, i32 5
  store i32 7, i32* %7, align 4
  %8 = getelementptr inbounds i32, i32* %1, i32 6
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds i32, i32* %1, i32 7
  store i32 1, i32* %9, align 4
  %10 = getelementptr inbounds i32, i32* %1, i32 8
  store i32 9, i32* %10, align 4
  %11 = getelementptr inbounds i32, i32* %1, i32 9
  store i32 3, i32* %11, align 4
  %12 = getelementptr inbounds i32, i32* %1, i32 10
  store i32 4, i32* %12, align 4
  %13 = getelementptr inbounds i32, i32* %1, i32 11
  store i32 8, i32* %13, align 4
  %14 = getelementptr inbounds i32, i32* %1, i32 12
  store i32 3, i32* %14, align 4
  %15 = getelementptr inbounds i32, i32* %1, i32 13
  store i32 7, i32* %15, align 4
  %16 = getelementptr inbounds i32, i32* %1, i32 14
  store i32 0, i32* %16, align 4
  %17 = alloca [13 x i32], align 4
  %18 = bitcast [13 x i32]* %17 to i32*
  %19 = getelementptr inbounds i32, i32* %18, i32 0
  store i32 3, i32* %19, align 4
  %20 = getelementptr inbounds i32, i32* %18, i32 1
  store i32 9, i32* %20, align 4
  %21 = getelementptr inbounds i32, i32* %18, i32 2
  store i32 7, i32* %21, align 4
  %22 = getelementptr inbounds i32, i32* %18, i32 3
  store i32 1, i32* %22, align 4
  %23 = getelementptr inbounds i32, i32* %18, i32 4
  store i32 4, i32* %23, align 4
  %24 = getelementptr inbounds i32, i32* %18, i32 5
  store i32 2, i32* %24, align 4
  %25 = getelementptr inbounds i32, i32* %18, i32 6
  store i32 4, i32* %25, align 4
  %26 = getelementptr inbounds i32, i32* %18, i32 7
  store i32 3, i32* %26, align 4
  %27 = getelementptr inbounds i32, i32* %18, i32 8
  store i32 6, i32* %27, align 4
  %28 = getelementptr inbounds i32, i32* %18, i32 9
  store i32 8, i32* %28, align 4
  %29 = getelementptr inbounds i32, i32* %18, i32 10
  store i32 0, i32* %29, align 4
  %30 = getelementptr inbounds i32, i32* %18, i32 11
  store i32 1, i32* %30, align 4
  %31 = getelementptr inbounds i32, i32* %18, i32 12
  store i32 5, i32* %31, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = getelementptr inbounds [15 x i32], [15 x i32]* %0, i32 0, i32 0
  %35 = call i32 @max_sum_nonadjacent(i32* %34, i32 15)
  call void @putint(i32 %35)
  call void @putch(i32 10)
  %36 = getelementptr inbounds [15 x i32], [15 x i32]* %0, i32 0, i32 0
  %37 = getelementptr inbounds [13 x i32], [13 x i32]* %17, i32 0, i32 0
  %38 = call i32 @longest_common_subseq(i32* %36, i32 15, i32* %37, i32 13)
  call void @putint(i32 %38)
  call void @putch(i32 10)
  ret i32 0
}

