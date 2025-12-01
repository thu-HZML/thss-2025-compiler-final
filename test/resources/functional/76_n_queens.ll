; ModuleID = 'moudle'
source_filename = "moudle"

define void @printans() {
mainEntry:
  %i = alloca i32, align 4
  store i32 1, i32* %i = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %i = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
}

define void @f() {
mainEntry:
  %i = alloca i32, align 4
  store i32 1, i32* %i = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %i = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
  %3 = load i32, i32* %i = alloca i32, align 4, align 4
  %4 = load i32, i32* %i = alloca i32, align 4, align 4
  %5 = load i32, i32* %i = alloca i32, align 4, align 4
  %6 = load i32, i32* %i = alloca i32, align 4, align 4
  %7 = load i32, i32* %i = alloca i32, align 4, align 4
  %8 = load i32, i32* %i = alloca i32, align 4, align 4
}

define i32 @main() {
mainEntry:
  %N = alloca i32, align 4
  %0 = load i32, i32* %N = alloca i32, align 4, align 4
  %1 = load i32, i32* %N = alloca i32, align 4, align 4
  ret i32 undef
}

