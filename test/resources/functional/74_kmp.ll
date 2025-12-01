; ModuleID = 'moudle'
source_filename = "moudle"

define void @get_next() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %j = alloca i32, align 4
  %0 = load i32, i32* %j = alloca i32, align 4, align 4
  %1 = load i32, i32* %j = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
  %3 = load i32, i32* %i = alloca i32, align 4, align 4
  %4 = load i32, i32* %j = alloca i32, align 4, align 4
}

define i32 @KMP() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %j = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %j = alloca i32, align 4, align 4
  %2 = load i32, i32* %j = alloca i32, align 4, align 4
  ret i32 %2 = load i32, i32* %j = alloca i32, align 4, align 4
  %3 = load i32, i32* %i = alloca i32, align 4, align 4
  %4 = load i32, i32* %i = alloca i32, align 4, align 4
  %5 = load i32, i32* %j = alloca i32, align 4, align 4
  ret i32 1
}

define i32 @read_str() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %i = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
  %3 = load i32, i32* %i = alloca i32, align 4, align 4
  ret i32 %3 = load i32, i32* %i = alloca i32, align 4, align 4
}

define i32 @main() {
mainEntry:
  ret i32 0
}

