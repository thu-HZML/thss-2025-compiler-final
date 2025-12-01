; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @func() {
mainEntry:
  %b = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 1, i32* %a = alloca i32, align 4, align 4
  %0 = load i32, i32* %a = alloca i32, align 4, align 4
  %1 = load i32, i32* %b = alloca i32, align 4, align 4
  %2 = load i32, i32* %a = alloca i32, align 4, align 4
  ret i32 1
  ret i32 0
}

define i32 @main() {
mainEntry:
  %result = alloca i32, align 4
  store i32 0, i32* %result = alloca i32, align 4, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %result = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
  %3 = load i32, i32* %result = alloca i32, align 4, align 4
  ret i32 0
}

