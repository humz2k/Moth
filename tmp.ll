; ModuleID = "test.txt"

declare i16* @"bohem_malloc"(i32 %".1")

declare void @"bohem_start"()

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"strlen"(i8* %".1")

declare i8* @"strcpy"(i8* %".1", i8* %".2")

@"string0" = internal constant [3 x i8] c"%s\00"
@"string1" = internal constant [3 x i8] c"%c\00"
@"string2" = internal constant [3 x i8] c"%d\00"
@"string3" = internal constant [4 x i8] c"%ld\00"
@"string4" = internal constant [3 x i8] c"%g\00"
@"string5" = internal constant [3 x i8] c"%g\00"
@"string6" = internal constant [3 x i8] c"%g\00"
@"string7" = internal constant [3 x i8] c"%s\00"
@"string8" = internal constant [5 x i8] c"True\00"
@"string9" = internal constant [6 x i8] c"False\00"
@"string10" = internal constant [2 x i8] c"\0a\00"
@"string11" = internal constant [2 x i8] c" \00"
@"string12" = internal constant [2 x i8] c"[\00"
@"string13" = internal constant [2 x i8] c"]\00"
declare float @"powf"(float %".1")

define i32 @"len_i8*"(i8* %".1")
{
entry:
  %".3" = alloca i8*
  store i8* %".1", i8** %".3"
  %".5" = load i8*, i8** %".3"
  %".6" = call i32 @"strlen"(i8* %".5")
  ret i32 %".6"
}

define i32 @"main"()
{
entry:
  call void @"bohem_start"()
  %".3" = alloca <3 x i32>
  store <3 x i32> <i32 1, i32 2, i32 3>, <3 x i32>* %".3"
  %".5" = load <3 x i32>, <3 x i32>* %".3"
  %".6" = bitcast [3 x i8]* @"string2" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 3)
  %".8" = bitcast [2 x i8]* @"string10" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8")
  ret i32 0
}
