; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @set_a() {
mainEntry:
  ret i32 undef
}

define i32 @set_b() {
mainEntry:
  ret i32 undef
}

define i32 @set_d() {
mainEntry:
  ret i32 undef
}

define i32 @main() {
mainEntry:
  %i0 = alloca i32, align 4
  store i32 0, i32* %i0 = alloca i32, align 4, align 4
  %i1 = alloca i32, align 4
  store i32 1, i32* %i1 = alloca i32, align 4, align 4
  %i2 = alloca i32, align 4
  store i32 2, i32* %i2 = alloca i32, align 4, align 4
  %i3 = alloca i32, align 4
  store i32 3, i32* %i3 = alloca i32, align 4, align 4
  %i4 = alloca i32, align 4
  store i32 4, i32* %i4 = alloca i32, align 4, align 4
  %0 = load i32, i32* %i0 = alloca i32, align 4, align 4
  %1 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %2 = load i32, i32* %i0 = alloca i32, align 4, align 4
  %3 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %4 = load i32, i32* %i0 = alloca i32, align 4, align 4
  %5 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %6 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %7 = load i32, i32* %i0 = alloca i32, align 4, align 4
  %8 = load i32, i32* %i2 = alloca i32, align 4, align 4
  %9 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %10 = load i32, i32* %i4 = alloca i32, align 4, align 4
  %11 = load i32, i32* %i3 = alloca i32, align 4, align 4
  %12 = load i32, i32* %i0 = alloca i32, align 4, align 4
  %13 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %14 = load i32, i32* %i3 = alloca i32, align 4, align 4
  %15 = load i32, i32* %i3 = alloca i32, align 4, align 4
  %16 = load i32, i32* %i4 = alloca i32, align 4, align 4
  %17 = load i32, i32* %i4 = alloca i32, align 4, align 4
  %18 = load i32, i32* %i0 = alloca i32, align 4, align 4
  %19 = load i32, i32* %i1 = alloca i32, align 4, align 4
  %20 = load i32, i32* %i3 = alloca i32, align 4, align 4
  %21 = load i32, i32* %i3 = alloca i32, align 4, align 4
  %22 = load i32, i32* %i4 = alloca i32, align 4, align 4
  %23 = load i32, i32* %i4 = alloca i32, align 4, align 4
  ret i32 0
}

