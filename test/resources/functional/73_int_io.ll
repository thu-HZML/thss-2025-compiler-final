; ModuleID = 'moudle'
source_filename = "moudle"

define i32 @my_getint() {
mainEntry:
  %sum = alloca i32, align 4
  store i32 0, i32* %sum = alloca i32, align 4, align 4
  %0 = load i32, i32* %sum = alloca i32, align 4, align 4
  %1 = load i32, i32* %sum = alloca i32, align 4, align 4
  ret i32 %1 = load i32, i32* %sum = alloca i32, align 4, align 4
}

define void @my_putint() {
mainEntry:
  %i = alloca i32, align 4
  store i32 0, i32* %i = alloca i32, align 4, align 4
  %0 = load i32, i32* %i = alloca i32, align 4, align 4
  %1 = load i32, i32* %i = alloca i32, align 4, align 4
  %2 = load i32, i32* %i = alloca i32, align 4, align 4
  %3 = load i32, i32* %i = alloca i32, align 4, align 4
}

define i32 @main() {
mainEntry:
  %n = alloca i32, align 4
  %0 = load i32, i32* %n = alloca i32, align 4, align 4
  %m = alloca i32, align 4
  %1 = load i32, i32* %m = alloca i32, align 4, align 4
  %2 = load i32, i32* %n = alloca i32, align 4, align 4
  ret i32 0
}

