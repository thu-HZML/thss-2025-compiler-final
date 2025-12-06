; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @main() {
mainEntry:
  %k = alloca i32, align 4
  store i32 112, i32* %k = alloca i32, align 4, align 4
  %0 = load i32, i32* %k = alloca i32, align 4, align 4
  %1 = load i32, i32* %k = alloca i32, align 4, align 4
  %2 = load i32, i32* %k = alloca i32, align 4, align 4
  %g = alloca i32, align 4
  store i32 9, i32* %g = alloca i32, align 4, align 4
  %l = alloca i32, align 4
  store i32 11, i32* %l = alloca i32, align 4, align 4
  %3 = load i32, i32* %k = alloca i32, align 4, align 4
  %4 = load i32, i32* %g = alloca i32, align 4, align 4
  %g = alloca i32, align 4
  store i32 11, i32* %g = alloca i32, align 4, align 4
  %5 = load i32, i32* %k = alloca i32, align 4, align 4
  %6 = load i32, i32* %g = alloca i32, align 4, align 4
  %7 = load i32, i32* %l = alloca i32, align 4, align 4
  %8 = load i32, i32* %k = alloca i32, align 4, align 4
  ret i32 undef
}

