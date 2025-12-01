; ModuleID = 'moudle'
source_filename = "moudle"

define void @read_program() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %len = alloca i32, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %len = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
  %3 = load i32, i32* %i = alloca i32, align 4, align 4
  %4 = load i32, i32* %i = alloca i32, align 4, align 4
}

define void @interpret() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %i = alloca i32, align 4, align 4
}

define i32 @main() {
mainEntry:
  ret i32 0
}

