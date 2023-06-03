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
@"string4" = internal constant [3 x i8] c"%f\00"
@"string5" = internal constant [3 x i8] c"%f\00"
@"string6" = internal constant [3 x i8] c"%f\00"
@"string7" = internal constant [3 x i8] c"%s\00"
@"string8" = internal constant [5 x i8] c"True\00"
@"string9" = internal constant [6 x i8] c"False\00"
@"string10" = internal constant [2 x i8] c"\0a\00"
@"string11" = internal constant [2 x i8] c" \00"
declare float @"powf"(float %".1")

define i32 @"main"()
{
entry:
  call void @"bohem_start"()
  %".3" = bitcast [6 x i8]* @"string12" to i8*
  %".4" = alloca i8*
  store i8* %".3", i8** %".4"
  %".6" = bitcast [7 x i8]* @"string13" to i8*
  %".7" = alloca i8*
  store i8* %".6", i8** %".7"
  %".9" = load i8*, i8** %".4"
  %".10" = load i8*, i8** %".7"
  %".11" = call i32 @"strlen"(i8* %".9")
  %".12" = call i32 @"strlen"(i8* %".10")
  %".13" = add i32 %".11", %".12"
  %".14" = add i32 %".13", 1
  %".15" = getelementptr i8, i8* null, i32 1
  %".16" = ptrtoint i8* %".15" to i32
  %".17" = mul i32 %".14", %".16"
  %".18" = call i16* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i16* %".18" to i64
  %".20" = inttoptr i64 %".19" to i8*
  %".21" = getelementptr i8, i8* %".20", i32 %".11"
  %".22" = call i8* @"strcpy"(i8* %".20", i8* %".9")
  %".23" = call i8* @"strcpy"(i8* %".21", i8* %".10")
  %".24" = alloca i8*
  store i8* %".20", i8** %".24"
  %".26" = load i8*, i8** %".24"
  %".27" = getelementptr i8, i8* %".26", i32 0
  store i8 102, i8* %".27"
  %".29" = load i8*, i8** %".24"
  %".30" = bitcast [3 x i8]* @"string7" to i8*
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".30", i8* %".29")
  %".32" = bitcast [2 x i8]* @"string10" to i8*
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".32")
  ret i32 0
}

@"string12" = internal constant [6 x i8] c"First\00"
@"string13" = internal constant [7 x i8] c"Second\00"