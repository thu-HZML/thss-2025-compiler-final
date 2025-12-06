; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @func() {
mainEntry:
  %index = alloca i32, align 4
  store i32 0, i32* %index = alloca i32, align 4, align 4
  %0 = load i32, i32* %index = alloca i32, align 4, align 4
  %1 = load i32, i32* %index = alloca i32, align 4, align 4
  ret i32 undef
}

define i32 @main() {
mainEntry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %0 = load i32, i32* %a = alloca i32, align 4, align 4
  %1 = load i32, i32* %b = alloca i32, align 4, align 4
  %2 = load i32, i32* %a = alloca i32, align 4, align 4
  %3 = load i32, i32* %a = alloca i32, align 4, align 4
  %4 = load i32, i32* %b = alloca i32, align 4, align 4
  %5 = load i32, i32* %b = alloca i32, align 4, align 4
  %6 = load i32, i32* %b = alloca i32, align 4, align 4
  %7 = load i32, i32* %b = alloca i32, align 4, align 4
  %8 = load i32, i32* %b = alloca i32, align 4, align 4
  %9 = load i32, i32* %b = alloca i32, align 4, align 4
  ret i32 0
}

