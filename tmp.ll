; ModuleID = "test.moth"

%"__rangeiter" = type {i32, i32, i32, i32, i32}
%"_rawArray_int_" = type {i32*, i32, i32}
%"str" = type {i8*, i32, i32}
%"_tuple_char_" = type {i8*, i32, i32}
%"_tuple_int_" = type {i32*, i32, i32}
%"_tuple_long_" = type {i64*, i32, i32}
%"_tuple_half_" = type {half*, i32, i32}
%"_tuple_float_" = type {float*, i32, i32}
%"_tuple_double_" = type {double*, i32, i32}
%"_NDArray_int_1_" = type {i32*, i32, i32, %"_tuple_int_"*}
declare i32 @"printf"(i8* %".1", ...)

declare void @"exit"(i32 %".1")

declare i32 @"strlen"(i8* %".1")

declare float @"powf"(float %".1")

declare double @"pow"(double %".1")

declare void @"bohem_start"(...)

declare i8* @"bohem_malloc"(i32 %".1")

define i1* @"i8*->i1*"(i8* %".1") alwaysinline
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to i1*
  ret i1* %".4"
}

define i32* @"i8*->i32*"(i8* %".1") alwaysinline
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to i32*
  ret i32* %".4"
}

define i64* @"i8*->i64*"(i8* %".1") alwaysinline
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to i64*
  ret i64* %".4"
}

define half* @"i8*->half*"(i8* %".1") alwaysinline
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to half*
  ret half* %".4"
}

define float* @"i8*->float*"(i8* %".1") alwaysinline
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to float*
  ret float* %".4"
}

define double* @"i8*->double*"(i8* %".1") alwaysinline
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to double*
  ret double* %".4"
}

define i1 @"i8->i1"(i8 %".1") alwaysinline
{
entry:
  %".3" = trunc i8 %".1" to i1
  ret i1 %".3"
}

define i1 @"i32->i1"(i32 %".1") alwaysinline
{
entry:
  %".3" = trunc i32 %".1" to i1
  ret i1 %".3"
}

define i1 @"i64->i1"(i64 %".1") alwaysinline
{
entry:
  %".3" = trunc i64 %".1" to i1
  ret i1 %".3"
}

define i8 @"i1->i8"(i1 %".1") alwaysinline
{
entry:
  %".3" = sext i1 %".1" to i8
  ret i8 %".3"
}

define i8 @"i32->i8"(i32 %".1") alwaysinline
{
entry:
  %".3" = trunc i32 %".1" to i8
  ret i8 %".3"
}

define i8 @"i64->i8"(i64 %".1") alwaysinline
{
entry:
  %".3" = trunc i64 %".1" to i8
  ret i8 %".3"
}

define i32 @"i1->i32"(i1 %".1") alwaysinline
{
entry:
  %".3" = sext i1 %".1" to i32
  ret i32 %".3"
}

define i32 @"i8->i32"(i8 %".1") alwaysinline
{
entry:
  %".3" = sext i8 %".1" to i32
  ret i32 %".3"
}

define i32 @"i64->i32"(i64 %".1") alwaysinline
{
entry:
  %".3" = trunc i64 %".1" to i32
  ret i32 %".3"
}

define i32 @"half->i32"(half %".1") alwaysinline
{
entry:
  %".3" = fptosi half %".1" to i32
  ret i32 %".3"
}

define i32 @"float->i32"(float %".1") alwaysinline
{
entry:
  %".3" = fptosi float %".1" to i32
  ret i32 %".3"
}

define i32 @"double->i32"(double %".1") alwaysinline
{
entry:
  %".3" = fptosi double %".1" to i32
  ret i32 %".3"
}

define i64 @"i1->i64"(i1 %".1") alwaysinline
{
entry:
  %".3" = sext i1 %".1" to i64
  ret i64 %".3"
}

define i64 @"i8->i64"(i8 %".1") alwaysinline
{
entry:
  %".3" = sext i8 %".1" to i64
  ret i64 %".3"
}

define i64 @"i32->i64"(i32 %".1") alwaysinline
{
entry:
  %".3" = sext i32 %".1" to i64
  ret i64 %".3"
}

define i64 @"half->i64"(half %".1") alwaysinline
{
entry:
  %".3" = fptosi half %".1" to i64
  ret i64 %".3"
}

define i64 @"float->i64"(float %".1") alwaysinline
{
entry:
  %".3" = fptosi float %".1" to i64
  ret i64 %".3"
}

define i64 @"double->i64"(double %".1") alwaysinline
{
entry:
  %".3" = fptosi double %".1" to i64
  ret i64 %".3"
}

define half @"i32->half"(i32 %".1") alwaysinline
{
entry:
  %".3" = sitofp i32 %".1" to half
  ret half %".3"
}

define half @"i64->half"(i64 %".1") alwaysinline
{
entry:
  %".3" = sitofp i64 %".1" to half
  ret half %".3"
}

define half @"float->half"(float %".1") alwaysinline
{
entry:
  %".3" = fptrunc float %".1" to half
  ret half %".3"
}

define half @"double->half"(double %".1") alwaysinline
{
entry:
  %".3" = fptrunc double %".1" to half
  ret half %".3"
}

define float @"i32->float"(i32 %".1") alwaysinline
{
entry:
  %".3" = sitofp i32 %".1" to float
  ret float %".3"
}

define float @"i64->float"(i64 %".1") alwaysinline
{
entry:
  %".3" = sitofp i64 %".1" to float
  ret float %".3"
}

define float @"half->float"(half %".1") alwaysinline
{
entry:
  %".3" = fpext half %".1" to float
  ret float %".3"
}

define float @"double->float"(double %".1") alwaysinline
{
entry:
  %".3" = fptrunc double %".1" to float
  ret float %".3"
}

define double @"i32->double"(i32 %".1") alwaysinline
{
entry:
  %".3" = sitofp i32 %".1" to double
  ret double %".3"
}

define double @"i64->double"(i64 %".1") alwaysinline
{
entry:
  %".3" = sitofp i64 %".1" to double
  ret double %".3"
}

define double @"half->double"(half %".1") alwaysinline
{
entry:
  %".3" = fpext half %".1" to double
  ret double %".3"
}

define double @"float->double"(float %".1") alwaysinline
{
entry:
  %".3" = fpext float %".1" to double
  ret double %".3"
}

define i8 @"__add___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = add i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__add___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = add i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__add___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = add i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__add___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = add i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__add___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = add i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__add___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = add i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__add___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = add i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__add___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = add i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__add___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = add i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__add___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = add i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__add___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = add i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__add___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = add i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__add___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = add i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__add___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = add i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__add___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = add i64 %".1", %".2"
  ret i64 %".4"
}

define i8 @"__sub___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = sub i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__sub___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = sub i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__sub___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = sub i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__sub___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = sub i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__sub___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = sub i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__sub___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = sub i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__sub___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = sub i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__sub___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = sub i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__sub___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = sub i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__sub___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = sub i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__sub___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = sub i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__sub___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = sub i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__sub___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = sub i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__sub___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = sub i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__sub___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = sub i64 %".1", %".2"
  ret i64 %".4"
}

define i8 @"__mul___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = mul i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__mul___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = mul i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__mul___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = mul i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__mul___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = mul i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__mul___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = mul i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__mul___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = mul i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__mul___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = mul i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__mul___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = mul i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__mul___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = mul i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__mul___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = mul i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__mul___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = mul i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__mul___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = mul i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__mul___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = mul i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__mul___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = mul i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__mul___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = mul i64 %".1", %".2"
  ret i64 %".4"
}

define i8 @"__div___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = sdiv i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__div___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = sdiv i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__div___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = sdiv i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__div___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = sdiv i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__div___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = sdiv i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__div___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = sdiv i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__div___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = sdiv i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__div___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = sdiv i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__div___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = sdiv i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__div___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = sdiv i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__div___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = sdiv i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__div___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = sdiv i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__div___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = sdiv i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__div___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = sdiv i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__div___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = sdiv i64 %".1", %".2"
  ret i64 %".4"
}

define i8 @"__mod___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = srem i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__mod___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = srem i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__mod___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = srem i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__mod___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = srem i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__mod___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = srem i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__mod___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = srem i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__mod___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = srem i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__mod___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = srem i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__mod___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = srem i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__mod___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = srem i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__mod___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = srem i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__mod___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = srem i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__mod___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = srem i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__mod___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = srem i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__mod___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = srem i64 %".1", %".2"
  ret i64 %".4"
}

define i1 @"__bitand___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = and i1 %".1", %".2"
  ret i1 %".4"
}

define i8 @"__bitand___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = and i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__bitand___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = and i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__bitand___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = and i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__bitand___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = and i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__bitand___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = and i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__bitand___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = and i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__bitand___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = and i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__bitand___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = and i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__bitand___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = and i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitand___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = and i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitand___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = and i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitand___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = and i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitand___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = and i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitand___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = and i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitand___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = and i64 %".1", %".2"
  ret i64 %".4"
}

define i1 @"__bitor___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = or i1 %".1", %".2"
  ret i1 %".4"
}

define i8 @"__bitor___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = or i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__bitor___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = or i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__bitor___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = or i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__bitor___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = or i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__bitor___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = or i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__bitor___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = or i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__bitor___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = or i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__bitor___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = or i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__bitor___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = or i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitor___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = or i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitor___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = or i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitor___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = or i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitor___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = or i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitor___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = or i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitor___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = or i64 %".1", %".2"
  ret i64 %".4"
}

define i1 @"__bitxor___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = xor i1 %".1", %".2"
  ret i1 %".4"
}

define i8 @"__bitxor___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = xor i8 %".1", %".4"
  ret i8 %".5"
}

define i8 @"__bitxor___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = xor i8 %".4", %".2"
  ret i8 %".5"
}

define i8 @"__bitxor___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = xor i8 %".1", %".2"
  ret i8 %".4"
}

define i32 @"__bitxor___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = xor i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__bitxor___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = xor i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__bitxor___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = xor i32 %".1", %".4"
  ret i32 %".5"
}

define i32 @"__bitxor___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = xor i32 %".4", %".2"
  ret i32 %".5"
}

define i32 @"__bitxor___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = xor i32 %".1", %".2"
  ret i32 %".4"
}

define i64 @"__bitxor___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = xor i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitxor___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = xor i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitxor___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = xor i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitxor___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = xor i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitxor___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = xor i64 %".1", %".4"
  ret i64 %".5"
}

define i64 @"__bitxor___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = xor i64 %".4", %".2"
  ret i64 %".5"
}

define i64 @"__bitxor___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = xor i64 %".1", %".2"
  ret i64 %".4"
}

define i1 @"__and___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = and i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__or___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = or i1 %".1", %".2"
  ret i1 %".4"
}

define half @"__add___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fadd half %".1", %".4"
  ret half %".5"
}

define half @"__add___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fadd half %".4", %".2"
  ret half %".5"
}

define half @"__add___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fadd half %".1", %".4"
  ret half %".5"
}

define half @"__add___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fadd half %".4", %".2"
  ret half %".5"
}

define half @"__add___half_half"(half %".1", half %".2")
{
entry:
  %".4" = fadd half %".1", %".2"
  ret half %".4"
}

define float @"__add___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fadd float %".1", %".4"
  ret float %".5"
}

define float @"__add___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fadd float %".4", %".2"
  ret float %".5"
}

define float @"__add___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fadd float %".1", %".4"
  ret float %".5"
}

define float @"__add___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fadd float %".4", %".2"
  ret float %".5"
}

define float @"__add___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fadd float %".1", %".2"
  ret float %".4"
}

define float @"__add___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fadd float %".1", %".4"
  ret float %".5"
}

define float @"__add___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fadd float %".4", %".2"
  ret float %".5"
}

define double @"__add___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fadd double %".1", %".4"
  ret double %".5"
}

define double @"__add___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fadd double %".4", %".2"
  ret double %".5"
}

define double @"__add___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fadd double %".1", %".4"
  ret double %".5"
}

define double @"__add___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fadd double %".4", %".2"
  ret double %".5"
}

define double @"__add___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fadd double %".1", %".2"
  ret double %".4"
}

define double @"__add___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fadd double %".1", %".4"
  ret double %".5"
}

define double @"__add___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fadd double %".4", %".2"
  ret double %".5"
}

define double @"__add___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fadd double %".1", %".4"
  ret double %".5"
}

define double @"__add___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fadd double %".4", %".2"
  ret double %".5"
}

define half @"__sub___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fsub half %".1", %".4"
  ret half %".5"
}

define half @"__sub___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fsub half %".4", %".2"
  ret half %".5"
}

define half @"__sub___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fsub half %".1", %".4"
  ret half %".5"
}

define half @"__sub___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fsub half %".4", %".2"
  ret half %".5"
}

define half @"__sub___half_half"(half %".1", half %".2")
{
entry:
  %".4" = fsub half %".1", %".2"
  ret half %".4"
}

define float @"__sub___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fsub float %".1", %".4"
  ret float %".5"
}

define float @"__sub___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fsub float %".4", %".2"
  ret float %".5"
}

define float @"__sub___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fsub float %".1", %".4"
  ret float %".5"
}

define float @"__sub___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fsub float %".4", %".2"
  ret float %".5"
}

define float @"__sub___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fsub float %".1", %".2"
  ret float %".4"
}

define float @"__sub___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fsub float %".1", %".4"
  ret float %".5"
}

define float @"__sub___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fsub float %".4", %".2"
  ret float %".5"
}

define double @"__sub___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fsub double %".1", %".4"
  ret double %".5"
}

define double @"__sub___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fsub double %".4", %".2"
  ret double %".5"
}

define double @"__sub___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fsub double %".1", %".4"
  ret double %".5"
}

define double @"__sub___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fsub double %".4", %".2"
  ret double %".5"
}

define double @"__sub___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fsub double %".1", %".2"
  ret double %".4"
}

define double @"__sub___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fsub double %".1", %".4"
  ret double %".5"
}

define double @"__sub___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fsub double %".4", %".2"
  ret double %".5"
}

define double @"__sub___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fsub double %".1", %".4"
  ret double %".5"
}

define double @"__sub___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fsub double %".4", %".2"
  ret double %".5"
}

define half @"__mul___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fmul half %".1", %".4"
  ret half %".5"
}

define half @"__mul___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fmul half %".4", %".2"
  ret half %".5"
}

define half @"__mul___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fmul half %".1", %".4"
  ret half %".5"
}

define half @"__mul___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fmul half %".4", %".2"
  ret half %".5"
}

define half @"__mul___half_half"(half %".1", half %".2")
{
entry:
  %".4" = fmul half %".1", %".2"
  ret half %".4"
}

define float @"__mul___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fmul float %".1", %".4"
  ret float %".5"
}

define float @"__mul___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fmul float %".4", %".2"
  ret float %".5"
}

define float @"__mul___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fmul float %".1", %".4"
  ret float %".5"
}

define float @"__mul___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fmul float %".4", %".2"
  ret float %".5"
}

define float @"__mul___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fmul float %".1", %".2"
  ret float %".4"
}

define float @"__mul___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fmul float %".1", %".4"
  ret float %".5"
}

define float @"__mul___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fmul float %".4", %".2"
  ret float %".5"
}

define double @"__mul___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fmul double %".1", %".4"
  ret double %".5"
}

define double @"__mul___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fmul double %".4", %".2"
  ret double %".5"
}

define double @"__mul___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fmul double %".1", %".4"
  ret double %".5"
}

define double @"__mul___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fmul double %".4", %".2"
  ret double %".5"
}

define double @"__mul___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fmul double %".1", %".2"
  ret double %".4"
}

define double @"__mul___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fmul double %".1", %".4"
  ret double %".5"
}

define double @"__mul___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fmul double %".4", %".2"
  ret double %".5"
}

define double @"__mul___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fmul double %".1", %".4"
  ret double %".5"
}

define double @"__mul___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fmul double %".4", %".2"
  ret double %".5"
}

define half @"__div___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fdiv half %".1", %".4"
  ret half %".5"
}

define half @"__div___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fdiv half %".4", %".2"
  ret half %".5"
}

define half @"__div___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fdiv half %".1", %".4"
  ret half %".5"
}

define half @"__div___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fdiv half %".4", %".2"
  ret half %".5"
}

define half @"__div___half_half"(half %".1", half %".2")
{
entry:
  %".4" = fdiv half %".1", %".2"
  ret half %".4"
}

define float @"__div___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fdiv float %".1", %".4"
  ret float %".5"
}

define float @"__div___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fdiv float %".4", %".2"
  ret float %".5"
}

define float @"__div___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fdiv float %".1", %".4"
  ret float %".5"
}

define float @"__div___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fdiv float %".4", %".2"
  ret float %".5"
}

define float @"__div___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fdiv float %".1", %".2"
  ret float %".4"
}

define float @"__div___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fdiv float %".1", %".4"
  ret float %".5"
}

define float @"__div___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fdiv float %".4", %".2"
  ret float %".5"
}

define double @"__div___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fdiv double %".1", %".4"
  ret double %".5"
}

define double @"__div___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fdiv double %".4", %".2"
  ret double %".5"
}

define double @"__div___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fdiv double %".1", %".4"
  ret double %".5"
}

define double @"__div___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fdiv double %".4", %".2"
  ret double %".5"
}

define double @"__div___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fdiv double %".1", %".2"
  ret double %".4"
}

define double @"__div___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fdiv double %".1", %".4"
  ret double %".5"
}

define double @"__div___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fdiv double %".4", %".2"
  ret double %".5"
}

define double @"__div___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fdiv double %".1", %".4"
  ret double %".5"
}

define double @"__div___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fdiv double %".4", %".2"
  ret double %".5"
}

define half @"__mod___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = frem half %".1", %".4"
  ret half %".5"
}

define half @"__mod___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = frem half %".4", %".2"
  ret half %".5"
}

define half @"__mod___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = frem half %".1", %".4"
  ret half %".5"
}

define half @"__mod___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = frem half %".4", %".2"
  ret half %".5"
}

define half @"__mod___half_half"(half %".1", half %".2")
{
entry:
  %".4" = frem half %".1", %".2"
  ret half %".4"
}

define float @"__mod___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = frem float %".1", %".4"
  ret float %".5"
}

define float @"__mod___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = frem float %".4", %".2"
  ret float %".5"
}

define float @"__mod___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = frem float %".1", %".4"
  ret float %".5"
}

define float @"__mod___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = frem float %".4", %".2"
  ret float %".5"
}

define float @"__mod___float_float"(float %".1", float %".2")
{
entry:
  %".4" = frem float %".1", %".2"
  ret float %".4"
}

define float @"__mod___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = frem float %".1", %".4"
  ret float %".5"
}

define float @"__mod___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = frem float %".4", %".2"
  ret float %".5"
}

define double @"__mod___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = frem double %".1", %".4"
  ret double %".5"
}

define double @"__mod___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = frem double %".4", %".2"
  ret double %".5"
}

define double @"__mod___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = frem double %".1", %".4"
  ret double %".5"
}

define double @"__mod___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = frem double %".4", %".2"
  ret double %".5"
}

define double @"__mod___double_double"(double %".1", double %".2")
{
entry:
  %".4" = frem double %".1", %".2"
  ret double %".4"
}

define double @"__mod___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = frem double %".1", %".4"
  ret double %".5"
}

define double @"__mod___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = frem double %".4", %".2"
  ret double %".5"
}

define double @"__mod___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = frem double %".1", %".4"
  ret double %".5"
}

define double @"__mod___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = frem double %".4", %".2"
  ret double %".5"
}

define i8 @"__neg___i8"(i8 %".1")
{
entry:
  %".3" = sub i8 0, %".1"
  ret i8 %".3"
}

define i32 @"__neg___i32"(i32 %".1")
{
entry:
  %".3" = sub i32 0, %".1"
  ret i32 %".3"
}

define i64 @"__neg___i64"(i64 %".1")
{
entry:
  %".3" = sub i64 0, %".1"
  ret i64 %".3"
}

define half @"__neg___half"(half %".1")
{
entry:
  %".3" = fneg half %".1"
  ret half %".3"
}

define float @"__neg___float"(float %".1")
{
entry:
  %".3" = fneg float %".1"
  ret float %".3"
}

define double @"__neg___double"(double %".1")
{
entry:
  %".3" = fneg double %".1"
  ret double %".3"
}

define i1 @"__bitnot___i1"(i1 %".1")
{
entry:
  %".3" = xor i1 %".1", -1
  ret i1 %".3"
}

define i8 @"__bitnot___i8"(i8 %".1")
{
entry:
  %".3" = xor i8 %".1", -1
  ret i8 %".3"
}

define i32 @"__bitnot___i32"(i32 %".1")
{
entry:
  %".3" = xor i32 %".1", -1
  ret i32 %".3"
}

define i64 @"__bitnot___i64"(i64 %".1")
{
entry:
  %".3" = xor i64 %".1", -1
  ret i64 %".3"
}

define i1 @"__not___i1"(i1 %".1")
{
entry:
  %".3" = xor i1 %".1", -1
  ret i1 %".3"
}

define i1 @"__eq___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = icmp eq i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__eq___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = icmp eq i8 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = icmp eq i8 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = icmp eq i8 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__eq___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = icmp eq i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = icmp eq i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = icmp eq i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = icmp eq i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = icmp eq i32 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__eq___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = icmp eq i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = icmp eq i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = icmp eq i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = icmp eq i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = icmp eq i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = icmp eq i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = icmp eq i64 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__eq___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fcmp oeq half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fcmp oeq half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fcmp oeq half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fcmp oeq half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fcmp oeq float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fcmp oeq float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fcmp oeq float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fcmp oeq float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fcmp oeq float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fcmp oeq float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fcmp oeq float %".1", %".2"
  ret i1 %".4"
}

define i1 @"__eq___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fcmp oeq double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fcmp oeq double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fcmp oeq double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fcmp oeq double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fcmp oeq double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fcmp oeq double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fcmp oeq double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__eq___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fcmp oeq double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__eq___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fcmp oeq double %".1", %".2"
  ret i1 %".4"
}

define i1 @"__neq___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = icmp ne i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__neq___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = icmp ne i8 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = icmp ne i8 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = icmp ne i8 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__neq___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = icmp ne i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = icmp ne i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = icmp ne i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = icmp ne i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = icmp ne i32 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__neq___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = icmp ne i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = icmp ne i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = icmp ne i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = icmp ne i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = icmp ne i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = icmp ne i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = icmp ne i64 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__neq___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fcmp one half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fcmp one half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fcmp one half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fcmp one half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fcmp one float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fcmp one float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fcmp one float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fcmp one float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fcmp one float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fcmp one float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fcmp one float %".1", %".2"
  ret i1 %".4"
}

define i1 @"__neq___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fcmp one double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fcmp one double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fcmp one double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fcmp one double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fcmp one double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fcmp one double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fcmp one double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__neq___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fcmp one double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__neq___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fcmp one double %".1", %".2"
  ret i1 %".4"
}

define i1 @"__gr___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = icmp sgt i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__gr___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = icmp sgt i8 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = icmp sgt i8 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = icmp sgt i8 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__gr___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = icmp sgt i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = icmp sgt i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = icmp sgt i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = icmp sgt i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = icmp sgt i32 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__gr___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = icmp sgt i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = icmp sgt i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = icmp sgt i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = icmp sgt i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = icmp sgt i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = icmp sgt i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = icmp sgt i64 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__gr___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fcmp ogt half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fcmp ogt half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fcmp ogt half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fcmp ogt half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fcmp ogt float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fcmp ogt float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fcmp ogt float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fcmp ogt float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fcmp ogt float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fcmp ogt float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fcmp ogt float %".1", %".2"
  ret i1 %".4"
}

define i1 @"__gr___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fcmp ogt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fcmp ogt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fcmp ogt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fcmp ogt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fcmp ogt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fcmp ogt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fcmp ogt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__gr___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fcmp ogt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__gr___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fcmp ogt double %".1", %".2"
  ret i1 %".4"
}

define i1 @"__ls___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = icmp slt i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__ls___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = icmp slt i8 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = icmp slt i8 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = icmp slt i8 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__ls___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = icmp slt i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = icmp slt i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = icmp slt i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = icmp slt i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = icmp slt i32 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__ls___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = icmp slt i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = icmp slt i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = icmp slt i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = icmp slt i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = icmp slt i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = icmp slt i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = icmp slt i64 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__ls___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fcmp olt half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fcmp olt half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fcmp olt half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fcmp olt half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fcmp olt float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fcmp olt float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fcmp olt float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fcmp olt float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fcmp olt float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fcmp olt float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fcmp olt float %".1", %".2"
  ret i1 %".4"
}

define i1 @"__ls___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fcmp olt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fcmp olt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fcmp olt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fcmp olt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fcmp olt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fcmp olt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fcmp olt double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__ls___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fcmp olt double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__ls___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fcmp olt double %".1", %".2"
  ret i1 %".4"
}

define i1 @"__geq___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = icmp sge i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__geq___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = icmp sge i8 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = icmp sge i8 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = icmp sge i8 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__geq___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = icmp sge i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = icmp sge i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = icmp sge i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = icmp sge i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = icmp sge i32 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__geq___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = icmp sge i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = icmp sge i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = icmp sge i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = icmp sge i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = icmp sge i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = icmp sge i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = icmp sge i64 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__geq___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fcmp oge half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fcmp oge half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fcmp oge half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fcmp oge half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fcmp oge float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fcmp oge float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fcmp oge float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fcmp oge float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fcmp oge float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fcmp oge float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fcmp oge float %".1", %".2"
  ret i1 %".4"
}

define i1 @"__geq___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fcmp oge double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fcmp oge double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fcmp oge double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fcmp oge double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fcmp oge double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fcmp oge double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fcmp oge double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__geq___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fcmp oge double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__geq___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fcmp oge double %".1", %".2"
  ret i1 %".4"
}

define i1 @"__leq___i1_i1"(i1 %".1", i1 %".2")
{
entry:
  %".4" = icmp sle i1 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__leq___i8_i1"(i8 %".1", i1 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".2")
  %".5" = icmp sle i8 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i1_i8"(i1 %".1", i8 %".2")
{
entry:
  %".4" = call i8 @"i1->i8"(i1 %".1")
  %".5" = icmp sle i8 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = icmp sle i8 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__leq___i32_i1"(i32 %".1", i1 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".2")
  %".5" = icmp sle i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i1_i32"(i1 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i1->i32"(i1 %".1")
  %".5" = icmp sle i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".2")
  %".5" = icmp sle i32 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"i8->i32"(i8 %".1")
  %".5" = icmp sle i32 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = icmp sle i32 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__leq___i64_i1"(i64 %".1", i1 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".2")
  %".5" = icmp sle i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i1_i64"(i1 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i1->i64"(i1 %".1")
  %".5" = icmp sle i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".2")
  %".5" = icmp sle i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i8->i64"(i8 %".1")
  %".5" = icmp sle i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".2")
  %".5" = icmp sle i64 %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = call i64 @"i32->i64"(i32 %".1")
  %".5" = icmp sle i64 %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = icmp sle i64 %".1", %".2"
  ret i1 %".4"
}

define i1 @"__leq___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".2")
  %".5" = fcmp ole half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call half @"i32->half"(i32 %".1")
  %".5" = fcmp ole half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".2")
  %".5" = fcmp ole half %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call half @"i64->half"(i64 %".1")
  %".5" = fcmp ole half %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = fcmp ole float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = fcmp ole float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = fcmp ole float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = fcmp ole float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = fcmp ole float %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = fcmp ole float %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___float_float"(float %".1", float %".2")
{
entry:
  %".4" = fcmp ole float %".1", %".2"
  ret i1 %".4"
}

define i1 @"__leq___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = fcmp ole double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = fcmp ole double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = fcmp ole double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = fcmp ole double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = fcmp ole double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = fcmp ole double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = fcmp ole double %".1", %".4"
  ret i1 %".5"
}

define i1 @"__leq___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = fcmp ole double %".4", %".2"
  ret i1 %".5"
}

define i1 @"__leq___double_double"(double %".1", double %".2")
{
entry:
  %".4" = fcmp ole double %".1", %".2"
  ret i1 %".4"
}

define void @"__print___i1"(i1 %".1")
{
entry:
  %".3" = call i1 @"__eq___i1_i1"(i1 %".1", i1 1)
  br i1 %".3", label %".4", label %".5"
.4:
  %".8" = bitcast [5 x i8]* @"formatter0" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8")
  br label %".6"
.5:
  %".11" = bitcast [6 x i8]* @"formatter1" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  br label %".6"
.6:
  ret void
}

@"formatter0" = internal constant [5 x i8] c"True\00"
@"formatter1" = internal constant [6 x i8] c"False\00"
define void @"__print___i8"(i8 %".1")
{
entry:
  %".3" = bitcast [3 x i8]* @"formatter2" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %".1")
  ret void
}

@"formatter2" = internal constant [3 x i8] c"%c\00"
define void @"__print___i32"(i32 %".1")
{
entry:
  %".3" = bitcast [3 x i8]* @"formatter3" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".1")
  ret void
}

@"formatter3" = internal constant [3 x i8] c"%d\00"
define void @"__print___i64"(i64 %".1")
{
entry:
  %".3" = bitcast [4 x i8]* @"formatter4" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i64 %".1")
  ret void
}

@"formatter4" = internal constant [4 x i8] c"%ld\00"
define void @"__print___half"(half %".1")
{
entry:
  %".3" = call float @"half->float"(half %".1")
  %".4" = bitcast [3 x i8]* @"formatter5" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", float %".3")
  ret void
}

@"formatter5" = internal constant [3 x i8] c"%f\00"
define void @"__print___float"(float %".1")
{
entry:
  %".3" = bitcast [3 x i8]* @"formatter5" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", float %".1")
  ret void
}

define void @"__print___double"(double %".1")
{
entry:
  %".3" = bitcast [3 x i8]* @"formatter5" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", double %".1")
  ret void
}

define i8 @"__postincr___i8"(i8 %".1")
{
entry:
  %".3" = call i8 @"i32->i8"(i32 1)
  %".4" = add i8 %".1", %".3"
  ret i8 %".4"
}

define i32 @"__postincr___i32"(i32 %".1")
{
entry:
  %".3" = add i32 %".1", 1
  ret i32 %".3"
}

define i64 @"__postincr___i64"(i64 %".1")
{
entry:
  %".3" = call i64 @"i32->i64"(i32 1)
  %".4" = add i64 %".1", %".3"
  ret i64 %".4"
}

define half @"__postincr___half"(half %".1")
{
entry:
  %".3" = call half @"i32->half"(i32 1)
  %".4" = fadd half %".1", %".3"
  ret half %".4"
}

define float @"__postincr___float"(float %".1")
{
entry:
  %".3" = call float @"i32->float"(i32 1)
  %".4" = fadd float %".1", %".3"
  ret float %".4"
}

define double @"__postincr___double"(double %".1")
{
entry:
  %".3" = call double @"i32->double"(i32 1)
  %".4" = fadd double %".1", %".3"
  ret double %".4"
}

define i8 @"__postdecr___i8"(i8 %".1")
{
entry:
  %".3" = call i8 @"i32->i8"(i32 1)
  %".4" = sub i8 %".1", %".3"
  ret i8 %".4"
}

define i32 @"__postdecr___i32"(i32 %".1")
{
entry:
  %".3" = sub i32 %".1", 1
  ret i32 %".3"
}

define i64 @"__postdecr___i64"(i64 %".1")
{
entry:
  %".3" = call i64 @"i32->i64"(i32 1)
  %".4" = sub i64 %".1", %".3"
  ret i64 %".4"
}

define half @"__postdecr___half"(half %".1")
{
entry:
  %".3" = call half @"i32->half"(i32 1)
  %".4" = fsub half %".1", %".3"
  ret half %".4"
}

define float @"__postdecr___float"(float %".1")
{
entry:
  %".3" = call float @"i32->float"(i32 1)
  %".4" = fsub float %".1", %".3"
  ret float %".4"
}

define double @"__postdecr___double"(double %".1")
{
entry:
  %".3" = call double @"i32->double"(i32 1)
  %".4" = fsub double %".1", %".3"
  ret double %".4"
}

define i8 @"__pow___i8_i8"(i8 %".1", i8 %".2")
{
entry:
  %".4" = alloca i8
  %".5" = call i8 @"i32->i8"(i32 1)
  store i8 %".5", i8* %".4"
  %".7" = alloca i8
  store i8 %".1", i8* %".7"
  br label %".9"
.9:
  %".13" = load i8, i8* %".4"
  %".14" = call i1 @"__ls___i8_i8"(i8 %".13", i8 %".2")
  br i1 %".14", label %".10", label %".11"
.10:
  %".16" = load i8, i8* %".7"
  %".17" = mul i8 %".16", %".1"
  store i8 %".17", i8* %".7"
  %".19" = call i8 @"i32->i8"(i32 1)
  %".20" = load i8, i8* %".4"
  %".21" = add i8 %".20", %".19"
  store i8 %".21", i8* %".4"
  br label %".9"
.11:
  %".24" = load i8, i8* %".7"
  ret i8 %".24"
}

define i32 @"__pow___i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = alloca i32
  store i32 1, i32* %".4"
  %".6" = alloca i32
  store i32 %".1", i32* %".6"
  br label %".8"
.8:
  %".12" = load i32, i32* %".4"
  %".13" = call i1 @"__ls___i32_i32"(i32 %".12", i32 %".2")
  br i1 %".13", label %".9", label %".10"
.9:
  %".15" = load i32, i32* %".6"
  %".16" = mul i32 %".15", %".1"
  store i32 %".16", i32* %".6"
  %".18" = load i32, i32* %".4"
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %".4"
  br label %".8"
.10:
  %".22" = load i32, i32* %".6"
  ret i32 %".22"
}

define i32 @"__pow___i32_i8"(i32 %".1", i8 %".2")
{
entry:
  %".4" = alloca i8
  %".5" = call i8 @"i32->i8"(i32 1)
  store i8 %".5", i8* %".4"
  %".7" = alloca i32
  store i32 %".1", i32* %".7"
  br label %".9"
.9:
  %".13" = load i8, i8* %".4"
  %".14" = call i1 @"__ls___i8_i8"(i8 %".13", i8 %".2")
  br i1 %".14", label %".10", label %".11"
.10:
  %".16" = load i32, i32* %".7"
  %".17" = mul i32 %".16", %".1"
  store i32 %".17", i32* %".7"
  %".19" = call i8 @"i32->i8"(i32 1)
  %".20" = load i8, i8* %".4"
  %".21" = add i8 %".20", %".19"
  store i8 %".21", i8* %".4"
  br label %".9"
.11:
  %".24" = load i32, i32* %".7"
  ret i32 %".24"
}

define i32 @"__pow___i8_i32"(i8 %".1", i32 %".2")
{
entry:
  %".4" = alloca i32
  store i32 1, i32* %".4"
  %".6" = alloca i32
  %".7" = call i32 @"i8->i32"(i8 %".1")
  store i32 %".7", i32* %".6"
  br label %".9"
.9:
  %".13" = load i32, i32* %".4"
  %".14" = call i1 @"__ls___i32_i32"(i32 %".13", i32 %".2")
  br i1 %".14", label %".10", label %".11"
.10:
  %".16" = call i32 @"i8->i32"(i8 %".1")
  %".17" = load i32, i32* %".6"
  %".18" = mul i32 %".17", %".16"
  store i32 %".18", i32* %".6"
  %".20" = load i32, i32* %".4"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %".4"
  br label %".9"
.11:
  %".24" = load i32, i32* %".6"
  ret i32 %".24"
}

define i64 @"__pow___i64_i8"(i64 %".1", i8 %".2")
{
entry:
  %".4" = alloca i8
  %".5" = call i8 @"i32->i8"(i32 1)
  store i8 %".5", i8* %".4"
  %".7" = alloca i64
  store i64 %".1", i64* %".7"
  br label %".9"
.9:
  %".13" = load i8, i8* %".4"
  %".14" = call i1 @"__ls___i8_i8"(i8 %".13", i8 %".2")
  br i1 %".14", label %".10", label %".11"
.10:
  %".16" = load i64, i64* %".7"
  %".17" = mul i64 %".16", %".1"
  store i64 %".17", i64* %".7"
  %".19" = call i8 @"i32->i8"(i32 1)
  %".20" = load i8, i8* %".4"
  %".21" = add i8 %".20", %".19"
  store i8 %".21", i8* %".4"
  br label %".9"
.11:
  %".24" = load i64, i64* %".7"
  ret i64 %".24"
}

define i64 @"__pow___i8_i64"(i8 %".1", i64 %".2")
{
entry:
  %".4" = alloca i64
  %".5" = call i64 @"i32->i64"(i32 1)
  store i64 %".5", i64* %".4"
  %".7" = alloca i64
  %".8" = call i64 @"i8->i64"(i8 %".1")
  store i64 %".8", i64* %".7"
  br label %".10"
.10:
  %".14" = load i64, i64* %".4"
  %".15" = call i1 @"__ls___i64_i64"(i64 %".14", i64 %".2")
  br i1 %".15", label %".11", label %".12"
.11:
  %".17" = call i64 @"i8->i64"(i8 %".1")
  %".18" = load i64, i64* %".7"
  %".19" = mul i64 %".18", %".17"
  store i64 %".19", i64* %".7"
  %".21" = call i64 @"i32->i64"(i32 1)
  %".22" = load i64, i64* %".4"
  %".23" = add i64 %".22", %".21"
  store i64 %".23", i64* %".4"
  br label %".10"
.12:
  %".26" = load i64, i64* %".7"
  ret i64 %".26"
}

define i64 @"__pow___i64_i32"(i64 %".1", i32 %".2")
{
entry:
  %".4" = alloca i32
  store i32 1, i32* %".4"
  %".6" = alloca i64
  store i64 %".1", i64* %".6"
  br label %".8"
.8:
  %".12" = load i32, i32* %".4"
  %".13" = call i1 @"__ls___i32_i32"(i32 %".12", i32 %".2")
  br i1 %".13", label %".9", label %".10"
.9:
  %".15" = load i64, i64* %".6"
  %".16" = mul i64 %".15", %".1"
  store i64 %".16", i64* %".6"
  %".18" = load i32, i32* %".4"
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %".4"
  br label %".8"
.10:
  %".22" = load i64, i64* %".6"
  ret i64 %".22"
}

define i64 @"__pow___i32_i64"(i32 %".1", i64 %".2")
{
entry:
  %".4" = alloca i64
  %".5" = call i64 @"i32->i64"(i32 1)
  store i64 %".5", i64* %".4"
  %".7" = alloca i64
  %".8" = call i64 @"i32->i64"(i32 %".1")
  store i64 %".8", i64* %".7"
  br label %".10"
.10:
  %".14" = load i64, i64* %".4"
  %".15" = call i1 @"__ls___i64_i64"(i64 %".14", i64 %".2")
  br i1 %".15", label %".11", label %".12"
.11:
  %".17" = call i64 @"i32->i64"(i32 %".1")
  %".18" = load i64, i64* %".7"
  %".19" = mul i64 %".18", %".17"
  store i64 %".19", i64* %".7"
  %".21" = call i64 @"i32->i64"(i32 1)
  %".22" = load i64, i64* %".4"
  %".23" = add i64 %".22", %".21"
  store i64 %".23", i64* %".4"
  br label %".10"
.12:
  %".26" = load i64, i64* %".7"
  ret i64 %".26"
}

define i64 @"__pow___i64_i64"(i64 %".1", i64 %".2")
{
entry:
  %".4" = alloca i64
  %".5" = call i64 @"i32->i64"(i32 1)
  store i64 %".5", i64* %".4"
  %".7" = alloca i64
  store i64 %".1", i64* %".7"
  br label %".9"
.9:
  %".13" = load i64, i64* %".4"
  %".14" = call i1 @"__ls___i64_i64"(i64 %".13", i64 %".2")
  br i1 %".14", label %".10", label %".11"
.10:
  %".16" = load i64, i64* %".7"
  %".17" = mul i64 %".16", %".1"
  store i64 %".17", i64* %".7"
  %".19" = call i64 @"i32->i64"(i32 1)
  %".20" = load i64, i64* %".4"
  %".21" = add i64 %".20", %".19"
  store i64 %".21", i64* %".4"
  br label %".9"
.11:
  %".24" = load i64, i64* %".7"
  ret i64 %".24"
}

define half @"__pow___half_i32"(half %".1", i32 %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = call float @"i32->float"(i32 %".2")
  %".6" = call float @"powf"(float %".4", float %".5")
  %".7" = call half @"float->half"(float %".6")
  ret half %".7"
}

define half @"__pow___i32_half"(i32 %".1", half %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = call float @"half->float"(half %".2")
  %".6" = call float @"powf"(float %".4", float %".5")
  %".7" = call half @"float->half"(float %".6")
  ret half %".7"
}

define half @"__pow___half_i64"(half %".1", i64 %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = call float @"i64->float"(i64 %".2")
  %".6" = call float @"powf"(float %".4", float %".5")
  %".7" = call half @"float->half"(float %".6")
  ret half %".7"
}

define half @"__pow___i64_half"(i64 %".1", half %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = call float @"half->float"(half %".2")
  %".6" = call float @"powf"(float %".4", float %".5")
  %".7" = call half @"float->half"(float %".6")
  ret half %".7"
}

define half @"__pow___half_half"(half %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = call float @"half->float"(half %".2")
  %".6" = call float @"powf"(float %".4", float %".5")
  %".7" = call half @"float->half"(float %".6")
  ret half %".7"
}

define float @"__pow___i32_float"(i32 %".1", float %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".1")
  %".5" = call float @"powf"(float %".4", float %".2")
  ret float %".5"
}

define float @"__pow___float_i32"(float %".1", i32 %".2")
{
entry:
  %".4" = call float @"i32->float"(i32 %".2")
  %".5" = call float @"powf"(float %".1", float %".4")
  ret float %".5"
}

define float @"__pow___i64_float"(i64 %".1", float %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".1")
  %".5" = call float @"powf"(float %".4", float %".2")
  ret float %".5"
}

define float @"__pow___float_i64"(float %".1", i64 %".2")
{
entry:
  %".4" = call float @"i64->float"(i64 %".2")
  %".5" = call float @"powf"(float %".1", float %".4")
  ret float %".5"
}

define float @"__pow___half_float"(half %".1", float %".2")
{
entry:
  %".4" = call float @"half->float"(half %".1")
  %".5" = call float @"powf"(float %".4", float %".2")
  ret float %".5"
}

define float @"__pow___float_half"(float %".1", half %".2")
{
entry:
  %".4" = call float @"half->float"(half %".2")
  %".5" = call float @"powf"(float %".1", float %".4")
  ret float %".5"
}

define float @"__pow___float_float"(float %".1", float %".2")
{
entry:
  %".4" = call float @"powf"(float %".1", float %".2")
  ret float %".4"
}

define double @"__pow___i32_double"(i32 %".1", double %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".1")
  %".5" = call double @"pow"(double %".4", double %".2")
  ret double %".5"
}

define double @"__pow___double_i32"(double %".1", i32 %".2")
{
entry:
  %".4" = call double @"i32->double"(i32 %".2")
  %".5" = call double @"pow"(double %".1", double %".4")
  ret double %".5"
}

define double @"__pow___i64_double"(i64 %".1", double %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".1")
  %".5" = call double @"pow"(double %".4", double %".2")
  ret double %".5"
}

define double @"__pow___double_i64"(double %".1", i64 %".2")
{
entry:
  %".4" = call double @"i64->double"(i64 %".2")
  %".5" = call double @"pow"(double %".1", double %".4")
  ret double %".5"
}

define double @"__pow___half_double"(half %".1", double %".2")
{
entry:
  %".4" = call double @"half->double"(half %".1")
  %".5" = call double @"pow"(double %".4", double %".2")
  ret double %".5"
}

define double @"__pow___double_half"(double %".1", half %".2")
{
entry:
  %".4" = call double @"half->double"(half %".2")
  %".5" = call double @"pow"(double %".1", double %".4")
  ret double %".5"
}

define double @"__pow___float_double"(float %".1", double %".2")
{
entry:
  %".4" = call double @"float->double"(float %".1")
  %".5" = call double @"pow"(double %".4", double %".2")
  ret double %".5"
}

define double @"__pow___double_float"(double %".1", float %".2")
{
entry:
  %".4" = call double @"float->double"(float %".2")
  %".5" = call double @"pow"(double %".1", double %".4")
  ret double %".5"
}

define double @"__pow___double_double"(double %".1", double %".2")
{
entry:
  %".4" = call double @"pow"(double %".1", double %".2")
  ret double %".4"
}

define void @"%\22__rangeiter\22.__init___%\22__rangeiter\22*_i32_i32_i32"(%"__rangeiter"* %".1", i32 %".2", i32 %".3", i32 %".4")
{
entry:
  %".6" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 0
  store i32 %".2", i32* %".6"
  %".8" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".8"
  %".10" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 2
  store i32 %".4", i32* %".10"
  %".12" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 3
  %".13" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 1
  %".14" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 0
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 @"__sub___i32_i32"(i32 %".15", i32 %".16")
  %".18" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__div___i32_i32"(i32 %".17", i32 %".19")
  store i32 %".20", i32* %".12"
  ret void
}

define void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
{
entry:
  %".3" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 4
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
{
entry:
  %".3" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 4
  %".4" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
{
entry:
  %".3" = alloca i32
  %".4" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 4
  %".5" = load i32, i32* %".4"
  store i32 %".5", i32* %".3"
  %".7" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 4
  %".8" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 4
  %".9" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 2
  %".10" = load i32, i32* %".8"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 @"__add___i32_i32"(i32 %".10", i32 %".11")
  store i32 %".12", i32* %".7"
  %".14" = load i32, i32* %".3"
  ret i32 %".14"
}

define void @"%\22__rangeiter\22.__print___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
{
entry:
  %".3" = bitcast [7 x i8]* @"formatter6" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3")
  %".5" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 0
  %".6" = load i32, i32* %".5"
  call void @"__print___i32"(i32 %".6")
  %".8" = bitcast [2 x i8]* @"formatter7" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8")
  %".10" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 1
  %".11" = load i32, i32* %".10"
  call void @"__print___i32"(i32 %".11")
  %".13" = bitcast [2 x i8]* @"formatter7" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13")
  %".15" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 2
  %".16" = load i32, i32* %".15"
  call void @"__print___i32"(i32 %".16")
  %".18" = bitcast [2 x i8]* @"formatter8" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  ret void
}

@"formatter6" = internal constant [7 x i8] c"range(\00"
@"formatter7" = internal constant [2 x i8] c",\00"
@"formatter8" = internal constant [2 x i8] c")\00"
define %"__rangeiter"* @"range_i32"(i32 %".1")
{
entry:
  %".3" = getelementptr %"__rangeiter", %"__rangeiter"* null, i32 1
  %".4" = ptrtoint %"__rangeiter"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"__rangeiter"*
  call void @"%\22__rangeiter\22.__init___%\22__rangeiter\22*_i32_i32_i32"(%"__rangeiter"* %".7", i32 0, i32 %".1", i32 1)
  ret %"__rangeiter"* %".7"
}

define %"__rangeiter"* @"range_i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = getelementptr %"__rangeiter", %"__rangeiter"* null, i32 1
  %".5" = ptrtoint %"__rangeiter"* %".4" to i32
  %".6" = call i8* @"bohem_malloc"(i32 %".5")
  %".7" = ptrtoint i8* %".6" to i64
  %".8" = inttoptr i64 %".7" to %"__rangeiter"*
  call void @"%\22__rangeiter\22.__init___%\22__rangeiter\22*_i32_i32_i32"(%"__rangeiter"* %".8", i32 %".1", i32 %".2", i32 1)
  ret %"__rangeiter"* %".8"
}

define %"__rangeiter"* @"range_i32_i32_i32"(i32 %".1", i32 %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"__rangeiter", %"__rangeiter"* null, i32 1
  %".6" = ptrtoint %"__rangeiter"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"__rangeiter"*
  call void @"%\22__rangeiter\22.__init___%\22__rangeiter\22*_i32_i32_i32"(%"__rangeiter"* %".9", i32 %".1", i32 %".2", i32 %".3")
  ret %"__rangeiter"* %".9"
}

define i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 0
  %".6" = load i32*, i32** %".5"
  %".7" = ptrtoint i32* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr i32, i32* null, i32 1
  %".10" = ptrtoint i32* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to i32*
  ret i32* %".15"
}

define void @"%\22_rawArray_int_\22.__print___%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".1")
{
entry:
  %".3" = bitcast [2 x i8]* @"formatter9" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3")
  %".5" = alloca i32
  store i32 0, i32* %".5"
  br label %".7"
.7:
  %".11" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  %".12" = load i32, i32* %".11"
  %".13" = call i32 @"__sub___i32_i32"(i32 %".12", i32 2)
  %".14" = load i32, i32* %".5"
  %".15" = call i1 @"__ls___i32_i32"(i32 %".14", i32 %".13")
  br i1 %".15", label %".8", label %".9"
.8:
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".5"
  store i32 %".24", i32* %".23"
  %".26" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".22", i32 1)
  %".27" = load i32, i32* %".26"
  call void @"__print___i32"(i32 %".27")
  %".29" = bitcast [2 x i8]* @"formatter7" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29")
  %".31" = load i32, i32* %".5"
  %".32" = call i32 @"__add___i32_i32"(i32 %".31", i32 1)
  store i32 %".32", i32* %".5"
  br label %".7"
.9:
  %".35" = load i32, i32* %".5"
  %".36" = call i32 @"__add___i32_i32"(i32 %".35", i32 1)
  store i32 %".36", i32* %".5"
  %".38" = getelementptr i32, i32* null, i32 1
  %".39" = ptrtoint i32* %".38" to i32
  %".40" = mul i32 %".39", 1
  %".41" = call i8* @"bohem_malloc"(i32 %".40")
  %".42" = ptrtoint i8* %".41" to i64
  %".43" = inttoptr i64 %".42" to i32*
  %".44" = getelementptr i32, i32* %".43", i32 0
  %".45" = load i32, i32* %".5"
  store i32 %".45", i32* %".44"
  %".47" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".43", i32 1)
  %".48" = load i32, i32* %".47"
  call void @"__print___i32"(i32 %".48")
  %".50" = bitcast [2 x i8]* @"formatter10" to i8*
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".50")
  ret void
}

@"formatter9" = internal constant [2 x i8] c"[\00"
@"formatter10" = internal constant [2 x i8] c"]\00"
define void @"%\22_rawArray_int_\22.__iterget___%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_rawArray_int_\22.__itercheck___%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define i32 @"%\22_rawArray_int_\22.__iternext___%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".1")
{
entry:
  %".3" = alloca i32
  %".4" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".10", i32 1)
  %".15" = load i32, i32* %".14"
  store i32 %".15", i32* %".3"
  %".17" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load i32, i32* %".3"
  ret i32 %".22"
}

define void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".1", i32 %".2")
{
entry:
  %".4" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 0
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = call i32 @"__mul___i32_i32"(i32 %".6", i32 %".2")
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = call i32* @"i8*->i32*"(i8* %".8")
  store i32* %".9", i32** %".4"
  %".11" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  store i32 %".2", i32* %".11"
  ret void
}

define %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".1")
{
entry:
  %".3" = alloca i32
  store i32 0, i32* %".3"
  br label %".5"
.5:
  %".9" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  %".10" = load i32, i32* %".3"
  %".11" = load i32, i32* %".9"
  %".12" = call i1 @"__ls___i32_i32"(i32 %".10", i32 %".11")
  br i1 %".12", label %".6", label %".7"
.6:
  %".14" = getelementptr i32, i32* null, i32 1
  %".15" = ptrtoint i32* %".14" to i32
  %".16" = mul i32 %".15", 1
  %".17" = call i8* @"bohem_malloc"(i32 %".16")
  %".18" = ptrtoint i8* %".17" to i64
  %".19" = inttoptr i64 %".18" to i32*
  %".20" = getelementptr i32, i32* %".19", i32 0
  %".21" = load i32, i32* %".3"
  store i32 %".21", i32* %".20"
  %".23" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".19", i32 1)
  store i32 0, i32* %".23"
  %".25" = load i32, i32* %".3"
  %".26" = call i32 @"__add___i32_i32"(i32 %".25", i32 1)
  store i32 %".26", i32* %".3"
  br label %".5"
.7:
  ret %"_rawArray_int_"* %".1"
}

define %"_rawArray_int_"* @"%\22_rawArray_int_\22.set_all_%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".1", i32 %".2")
{
entry:
  %".4" = alloca i32
  store i32 0, i32* %".4"
  br label %".6"
.6:
  %".10" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  %".11" = load i32, i32* %".4"
  %".12" = load i32, i32* %".10"
  %".13" = call i1 @"__ls___i32_i32"(i32 %".11", i32 %".12")
  br i1 %".13", label %".7", label %".8"
.7:
  %".15" = getelementptr i32, i32* null, i32 1
  %".16" = ptrtoint i32* %".15" to i32
  %".17" = mul i32 %".16", 1
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to i32*
  %".21" = getelementptr i32, i32* %".20", i32 0
  %".22" = load i32, i32* %".4"
  store i32 %".22", i32* %".21"
  %".24" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".20", i32 1)
  store i32 %".2", i32* %".24"
  %".26" = load i32, i32* %".4"
  %".27" = call i32 @"__add___i32_i32"(i32 %".26", i32 1)
  store i32 %".27", i32* %".4"
  br label %".6"
.8:
  ret %"_rawArray_int_"* %".1"
}

define i32 @"%\22_rawArray_int_\22.len_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  ret i32 %".4"
}

define %"_rawArray_int_"* @"%\22__rangeiter\22*->%\22_rawArray_int_\22*"(%"__rangeiter"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  store %"_rawArray_int_"* %".9", %"_rawArray_int_"** %".3"
  %".13" = alloca i32
  store i32 0, i32* %".13"
  %".18" = alloca i32
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
  br label %".15"
.15:
  %".21" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
  br i1 %".21", label %".16", label %".17"
.16:
  %".23" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".1")
  store i32 %".23", i32* %".18"
  %".25" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".26" = getelementptr i32, i32* null, i32 1
  %".27" = ptrtoint i32* %".26" to i32
  %".28" = mul i32 %".27", 1
  %".29" = call i8* @"bohem_malloc"(i32 %".28")
  %".30" = ptrtoint i8* %".29" to i64
  %".31" = inttoptr i64 %".30" to i32*
  %".32" = getelementptr i32, i32* %".31", i32 0
  %".33" = load i32, i32* %".13"
  store i32 %".33", i32* %".32"
  %".35" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".25", i32* %".31", i32 1)
  %".36" = load i32, i32* %".18"
  store i32 %".36", i32* %".35"
  %".38" = load i32, i32* %".13"
  %".39" = call i32 @"__add___i32_i32"(i32 %".38", i32 1)
  store i32 %".39", i32* %".13"
  br label %".15"
.17:
  %".42" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  ret %"_rawArray_int_"* %".42"
}

define void @"%\22str\22.__print___%\22str\22*"(%"str"* %".1")
{
entry:
  %".3" = getelementptr %"str", %"str"* %".1", i32 0, i32 0
  %".4" = bitcast [3 x i8]* @"formatter11" to i8*
  %".5" = load i8*, i8** %".3"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %".5")
  ret void
}

@"formatter11" = internal constant [3 x i8] c"%s\00"
define i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
{
entry:
  %".3" = getelementptr %"str", %"str"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  ret i32 %".4"
}

define i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"str", %"str"* %".1", i32 0, i32 0
  %".6" = load i8*, i8** %".5"
  %".7" = ptrtoint i8* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr i8, i8* null, i32 1
  %".10" = ptrtoint i8* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to i8*
  ret i8* %".15"
}

define void @"%\22str\22.__iterget___%\22str\22*"(%"str"* %".1")
{
entry:
  %".3" = getelementptr %"str", %"str"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22str\22.__itercheck___%\22str\22*"(%"str"* %".1")
{
entry:
  %".3" = getelementptr %"str", %"str"* %".1", i32 0, i32 2
  %".4" = getelementptr %"str", %"str"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define i8 @"%\22str\22.__iternext___%\22str\22*"(%"str"* %".1")
{
entry:
  %".3" = alloca i8
  %".4" = getelementptr %"str", %"str"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".1", i32* %".10", i32 1)
  %".15" = load i8, i8* %".14"
  store i8 %".15", i8* %".3"
  %".17" = getelementptr %"str", %"str"* %".1", i32 0, i32 2
  %".18" = getelementptr %"str", %"str"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load i8, i8* %".3"
  ret i8 %".22"
}

define void @"%\22str\22.__init___%\22str\22*_i8*"(%"str"* %".1", i8* %".2")
{
entry:
  %".4" = getelementptr %"str", %"str"* %".1", i32 0, i32 0
  store i8* %".2", i8** %".4"
  %".6" = getelementptr %"str", %"str"* %".1", i32 0, i32 1
  %".7" = call i32 @"strlen"(i8* %".2")
  store i32 %".7", i32* %".6"
  ret void
}

define i32 @"len_%\22str\22*"(%"str"* %".1")
{
entry:
  %".3" = getelementptr %"str", %"str"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  ret i32 %".4"
}

define %"str"* @"__add___%\22str\22*_%\22str\22*"(%"str"* %".1", %"str"* %".2")
{
entry:
  %".4" = alloca i32
  %".5" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".6" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".2")
  %".7" = call i32 @"__add___i32_i32"(i32 %".5", i32 %".6")
  %".8" = call i32 @"__add___i32_i32"(i32 %".7", i32 1)
  store i32 %".8", i32* %".4"
  %".10" = alloca i8*
  %".11" = getelementptr i8, i8* null, i32 1
  %".12" = ptrtoint i8* %".11" to i32
  %".13" = load i32, i32* %".4"
  %".14" = call i32 @"__mul___i32_i32"(i32 %".12", i32 %".13")
  %".15" = call i8* @"bohem_malloc"(i32 %".14")
  store i8* %".15", i8** %".10"
  %".17" = alloca i32
  store i32 0, i32* %".17"
  %".22" = alloca i8
  call void @"%\22str\22.__iterget___%\22str\22*"(%"str"* %".1")
  br label %".19"
.19:
  %".25" = call i1 @"%\22str\22.__itercheck___%\22str\22*"(%"str"* %".1")
  br i1 %".25", label %".20", label %".21"
.20:
  %".27" = call i8 @"%\22str\22.__iternext___%\22str\22*"(%"str"* %".1")
  store i8 %".27", i8* %".22"
  %".29" = load i8*, i8** %".10"
  %".30" = load i32, i32* %".17"
  %".31" = getelementptr i8, i8* %".29", i32 %".30"
  %".32" = load i8, i8* %".22"
  store i8 %".32", i8* %".31"
  %".34" = load i32, i32* %".17"
  %".35" = call i32 @"__add___i32_i32"(i32 %".34", i32 1)
  store i32 %".35", i32* %".17"
  br label %".19"
.21:
  %".41" = alloca i8
  call void @"%\22str\22.__iterget___%\22str\22*"(%"str"* %".2")
  br label %".38"
.38:
  %".44" = call i1 @"%\22str\22.__itercheck___%\22str\22*"(%"str"* %".2")
  br i1 %".44", label %".39", label %".40"
.39:
  %".46" = call i8 @"%\22str\22.__iternext___%\22str\22*"(%"str"* %".2")
  store i8 %".46", i8* %".41"
  %".48" = load i8*, i8** %".10"
  %".49" = load i32, i32* %".17"
  %".50" = getelementptr i8, i8* %".48", i32 %".49"
  %".51" = load i8, i8* %".41"
  store i8 %".51", i8* %".50"
  %".53" = load i32, i32* %".17"
  %".54" = call i32 @"__add___i32_i32"(i32 %".53", i32 1)
  store i32 %".54", i32* %".17"
  br label %".38"
.40:
  %".57" = load i8*, i8** %".10"
  %".58" = load i32, i32* %".17"
  %".59" = getelementptr i8, i8* %".57", i32 %".58"
  %".60" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".2")
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  store i32 %".60", i32* %".67"
  %".69" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".2", i32* %".66", i32 1)
  %".70" = load i8, i8* %".69"
  store i8 %".70", i8* %".59"
  %".72" = getelementptr %"str", %"str"* null, i32 1
  %".73" = ptrtoint %"str"* %".72" to i32
  %".74" = call i8* @"bohem_malloc"(i32 %".73")
  %".75" = ptrtoint i8* %".74" to i64
  %".76" = inttoptr i64 %".75" to %"str"*
  %".77" = load i8*, i8** %".10"
  call void @"%\22str\22.__init___%\22str\22*_i8*"(%"str"* %".76", i8* %".77")
  ret %"str"* %".76"
}

define %"str"* @"i8*->%\22str\22*"(i8* %".1")
{
entry:
  %".3" = alloca i32
  %".4" = call i32 @"strlen"(i8* %".1")
  store i32 %".4", i32* %".3"
  %".6" = alloca i8*
  %".7" = load i32, i32* %".3"
  %".8" = call i32 @"__add___i32_i32"(i32 %".7", i32 1)
  %".9" = getelementptr i8, i8* null, i32 1
  %".10" = ptrtoint i8* %".9" to i32
  %".11" = call i32 @"__mul___i32_i32"(i32 %".8", i32 %".10")
  %".12" = call i8* @"bohem_malloc"(i32 %".11")
  store i8* %".12", i8** %".6"
  %".17" = alloca i32
  %".18" = load i32, i32* %".3"
  %".19" = call i32 @"__add___i32_i32"(i32 %".18", i32 1)
  %".20" = call %"__rangeiter"* @"range_i32"(i32 %".19")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".20")
  br label %".14"
.14:
  %".23" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".20")
  br i1 %".23", label %".15", label %".16"
.15:
  %".25" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".20")
  store i32 %".25", i32* %".17"
  %".27" = load i8*, i8** %".6"
  %".28" = load i32, i32* %".17"
  %".29" = getelementptr i8, i8* %".27", i32 %".28"
  %".30" = load i32, i32* %".17"
  %".31" = getelementptr i8, i8* %".1", i32 %".30"
  %".32" = load i8, i8* %".31"
  %".33" = load i8, i8* %".31"
  store i8 %".33", i8* %".29"
  br label %".14"
.16:
  %".36" = alloca %"str"*
  %".37" = getelementptr %"str", %"str"* null, i32 1
  %".38" = ptrtoint %"str"* %".37" to i32
  %".39" = call i8* @"bohem_malloc"(i32 %".38")
  %".40" = ptrtoint i8* %".39" to i64
  %".41" = inttoptr i64 %".40" to %"str"*
  %".42" = load i8*, i8** %".6"
  call void @"%\22str\22.__init___%\22str\22*_i8*"(%"str"* %".41", i8* %".42")
  store %"str"* %".41", %"str"** %".36"
  %".45" = load %"str"*, %"str"** %".36"
  ret %"str"* %".45"
}

define %"str"* @"i8->%\22str\22*"(i8 %".1")
{
entry:
  %".3" = alloca i8*
  %".4" = getelementptr i8, i8* null, i32 1
  %".5" = ptrtoint i8* %".4" to i32
  %".6" = call i32 @"__mul___i32_i32"(i32 2, i32 %".5")
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  store i8* %".7", i8** %".3"
  %".9" = load i8*, i8** %".3"
  %".10" = getelementptr i8, i8* %".9", i32 0
  store i8 %".1", i8* %".10"
  %".12" = load i8*, i8** %".3"
  %".13" = getelementptr i8, i8* %".12", i32 1
  store i8 0, i8* %".13"
  %".15" = getelementptr %"str", %"str"* null, i32 1
  %".16" = ptrtoint %"str"* %".15" to i32
  %".17" = call i8* @"bohem_malloc"(i32 %".16")
  %".18" = ptrtoint i8* %".17" to i64
  %".19" = inttoptr i64 %".18" to %"str"*
  %".20" = load i8*, i8** %".3"
  call void @"%\22str\22.__init___%\22str\22*_i8*"(%"str"* %".19", i8* %".20")
  ret %"str"* %".19"
}

define void @"__print___i8*"(i8* %".1")
{
entry:
  %".3" = bitcast [3 x i8]* @"formatter11" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i8* %".1")
  ret void
}

define i1 @"__eq___%\22str\22*_%\22str\22*"(%"str"* %".1", %"str"* %".2")
{
entry:
  %".4" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".5" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".2")
  %".6" = call i1 @"__neq___i32_i32"(i32 %".4", i32 %".5")
  br i1 %".6", label %".7", label %".8"
.7:
  ret i1 0
.8:
  br label %".9"
.9:
  %".16" = alloca i32
  %".17" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".18" = call %"__rangeiter"* @"range_i32"(i32 %".17")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".18")
  br label %".13"
.13:
  %".21" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".18")
  br i1 %".21", label %".14", label %".15"
.14:
  %".23" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".18")
  store i32 %".23", i32* %".16"
  %".25" = getelementptr i32, i32* null, i32 1
  %".26" = ptrtoint i32* %".25" to i32
  %".27" = mul i32 %".26", 1
  %".28" = call i8* @"bohem_malloc"(i32 %".27")
  %".29" = ptrtoint i8* %".28" to i64
  %".30" = inttoptr i64 %".29" to i32*
  %".31" = getelementptr i32, i32* %".30", i32 0
  %".32" = load i32, i32* %".16"
  store i32 %".32", i32* %".31"
  %".34" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".1", i32* %".30", i32 1)
  %".35" = getelementptr i32, i32* null, i32 1
  %".36" = ptrtoint i32* %".35" to i32
  %".37" = mul i32 %".36", 1
  %".38" = call i8* @"bohem_malloc"(i32 %".37")
  %".39" = ptrtoint i8* %".38" to i64
  %".40" = inttoptr i64 %".39" to i32*
  %".41" = getelementptr i32, i32* %".40", i32 0
  %".42" = load i32, i32* %".16"
  store i32 %".42", i32* %".41"
  %".44" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".2", i32* %".40", i32 1)
  %".45" = load i8, i8* %".34"
  %".46" = load i8, i8* %".44"
  %".47" = call i1 @"__neq___i8_i8"(i8 %".45", i8 %".46")
  br i1 %".47", label %".48", label %".49"
.15:
  ret i1 1
.48:
  ret i1 0
.49:
  br label %".50"
.50:
  br label %".13"
}

define i1 @"__eq___%\22str\22*_i8*"(%"str"* %".1", i8* %".2")
{
entry:
  %".4" = alloca %"str"*
  %".5" = call %"str"* @"i8*->%\22str\22*"(i8* %".2")
  store %"str"* %".5", %"str"** %".4"
  %".7" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".8" = load %"str"*, %"str"** %".4"
  %".9" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".8")
  %".10" = call i1 @"__neq___i32_i32"(i32 %".7", i32 %".9")
  br i1 %".10", label %".11", label %".12"
.11:
  ret i1 0
.12:
  br label %".13"
.13:
  %".20" = alloca i32
  %".21" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".22" = call %"__rangeiter"* @"range_i32"(i32 %".21")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".22")
  br label %".17"
.17:
  %".25" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".22")
  br i1 %".25", label %".18", label %".19"
.18:
  %".27" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".22")
  store i32 %".27", i32* %".20"
  %".29" = getelementptr i32, i32* null, i32 1
  %".30" = ptrtoint i32* %".29" to i32
  %".31" = mul i32 %".30", 1
  %".32" = call i8* @"bohem_malloc"(i32 %".31")
  %".33" = ptrtoint i8* %".32" to i64
  %".34" = inttoptr i64 %".33" to i32*
  %".35" = getelementptr i32, i32* %".34", i32 0
  %".36" = load i32, i32* %".20"
  store i32 %".36", i32* %".35"
  %".38" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".1", i32* %".34", i32 1)
  %".39" = load %"str"*, %"str"** %".4"
  %".40" = getelementptr i32, i32* null, i32 1
  %".41" = ptrtoint i32* %".40" to i32
  %".42" = mul i32 %".41", 1
  %".43" = call i8* @"bohem_malloc"(i32 %".42")
  %".44" = ptrtoint i8* %".43" to i64
  %".45" = inttoptr i64 %".44" to i32*
  %".46" = getelementptr i32, i32* %".45", i32 0
  %".47" = load i32, i32* %".20"
  store i32 %".47", i32* %".46"
  %".49" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".39", i32* %".45", i32 1)
  %".50" = load i8, i8* %".38"
  %".51" = load i8, i8* %".49"
  %".52" = call i1 @"__neq___i8_i8"(i8 %".50", i8 %".51")
  br i1 %".52", label %".53", label %".54"
.19:
  ret i1 1
.53:
  ret i1 0
.54:
  br label %".55"
.55:
  br label %".17"
}

define i1 @"__eq___i8*_%\22str\22*"(i8* %".1", %"str"* %".2")
{
entry:
  %".4" = alloca %"str"*
  %".5" = call %"str"* @"i8*->%\22str\22*"(i8* %".1")
  store %"str"* %".5", %"str"** %".4"
  %".7" = load %"str"*, %"str"** %".4"
  %".8" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".7")
  %".9" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".2")
  %".10" = call i1 @"__neq___i32_i32"(i32 %".8", i32 %".9")
  br i1 %".10", label %".11", label %".12"
.11:
  ret i1 0
.12:
  br label %".13"
.13:
  %".20" = alloca i32
  %".21" = load %"str"*, %"str"** %".4"
  %".22" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".21")
  %".23" = call %"__rangeiter"* @"range_i32"(i32 %".22")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".23")
  br label %".17"
.17:
  %".26" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".23")
  br i1 %".26", label %".18", label %".19"
.18:
  %".28" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".23")
  store i32 %".28", i32* %".20"
  %".30" = load %"str"*, %"str"** %".4"
  %".31" = getelementptr i32, i32* null, i32 1
  %".32" = ptrtoint i32* %".31" to i32
  %".33" = mul i32 %".32", 1
  %".34" = call i8* @"bohem_malloc"(i32 %".33")
  %".35" = ptrtoint i8* %".34" to i64
  %".36" = inttoptr i64 %".35" to i32*
  %".37" = getelementptr i32, i32* %".36", i32 0
  %".38" = load i32, i32* %".20"
  store i32 %".38", i32* %".37"
  %".40" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".30", i32* %".36", i32 1)
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".20"
  store i32 %".48", i32* %".47"
  %".50" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".2", i32* %".46", i32 1)
  %".51" = load i8, i8* %".40"
  %".52" = load i8, i8* %".50"
  %".53" = call i1 @"__neq___i8_i8"(i8 %".51", i8 %".52")
  br i1 %".53", label %".54", label %".55"
.19:
  ret i1 1
.54:
  ret i1 0
.55:
  br label %".56"
.56:
  br label %".17"
}

define i1 @"__eq___i8*_i8*"(i8* %".1", i8* %".2")
{
entry:
  %".4" = alloca %"str"*
  %".5" = call %"str"* @"i8*->%\22str\22*"(i8* %".1")
  store %"str"* %".5", %"str"** %".4"
  %".7" = alloca %"str"*
  %".8" = call %"str"* @"i8*->%\22str\22*"(i8* %".2")
  store %"str"* %".8", %"str"** %".7"
  %".10" = load %"str"*, %"str"** %".4"
  %".11" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".10")
  %".12" = load %"str"*, %"str"** %".7"
  %".13" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".12")
  %".14" = call i1 @"__neq___i32_i32"(i32 %".11", i32 %".13")
  br i1 %".14", label %".15", label %".16"
.15:
  ret i1 0
.16:
  br label %".17"
.17:
  %".24" = alloca i32
  %".25" = load %"str"*, %"str"** %".4"
  %".26" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".25")
  %".27" = call %"__rangeiter"* @"range_i32"(i32 %".26")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".27")
  br label %".21"
.21:
  %".30" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".27")
  br i1 %".30", label %".22", label %".23"
.22:
  %".32" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".27")
  store i32 %".32", i32* %".24"
  %".34" = load %"str"*, %"str"** %".4"
  %".35" = getelementptr i32, i32* null, i32 1
  %".36" = ptrtoint i32* %".35" to i32
  %".37" = mul i32 %".36", 1
  %".38" = call i8* @"bohem_malloc"(i32 %".37")
  %".39" = ptrtoint i8* %".38" to i64
  %".40" = inttoptr i64 %".39" to i32*
  %".41" = getelementptr i32, i32* %".40", i32 0
  %".42" = load i32, i32* %".24"
  store i32 %".42", i32* %".41"
  %".44" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".34", i32* %".40", i32 1)
  %".45" = load %"str"*, %"str"** %".7"
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".24"
  store i32 %".53", i32* %".52"
  %".55" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".45", i32* %".51", i32 1)
  %".56" = load i8, i8* %".44"
  %".57" = load i8, i8* %".55"
  %".58" = call i1 @"__neq___i8_i8"(i8 %".56", i8 %".57")
  br i1 %".58", label %".59", label %".60"
.23:
  ret i1 1
.59:
  ret i1 0
.60:
  br label %".61"
.61:
  br label %".21"
}

define i1 @"__neq___%\22str\22*_%\22str\22*"(%"str"* %".1", %"str"* %".2")
{
entry:
  %".4" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".5" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".2")
  %".6" = call i1 @"__neq___i32_i32"(i32 %".4", i32 %".5")
  br i1 %".6", label %".7", label %".8"
.7:
  ret i1 1
.8:
  br label %".9"
.9:
  %".16" = alloca i32
  %".17" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".18" = call %"__rangeiter"* @"range_i32"(i32 %".17")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".18")
  br label %".13"
.13:
  %".21" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".18")
  br i1 %".21", label %".14", label %".15"
.14:
  %".23" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".18")
  store i32 %".23", i32* %".16"
  %".25" = getelementptr i32, i32* null, i32 1
  %".26" = ptrtoint i32* %".25" to i32
  %".27" = mul i32 %".26", 1
  %".28" = call i8* @"bohem_malloc"(i32 %".27")
  %".29" = ptrtoint i8* %".28" to i64
  %".30" = inttoptr i64 %".29" to i32*
  %".31" = getelementptr i32, i32* %".30", i32 0
  %".32" = load i32, i32* %".16"
  store i32 %".32", i32* %".31"
  %".34" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".1", i32* %".30", i32 1)
  %".35" = getelementptr i32, i32* null, i32 1
  %".36" = ptrtoint i32* %".35" to i32
  %".37" = mul i32 %".36", 1
  %".38" = call i8* @"bohem_malloc"(i32 %".37")
  %".39" = ptrtoint i8* %".38" to i64
  %".40" = inttoptr i64 %".39" to i32*
  %".41" = getelementptr i32, i32* %".40", i32 0
  %".42" = load i32, i32* %".16"
  store i32 %".42", i32* %".41"
  %".44" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".2", i32* %".40", i32 1)
  %".45" = load i8, i8* %".34"
  %".46" = load i8, i8* %".44"
  %".47" = call i1 @"__neq___i8_i8"(i8 %".45", i8 %".46")
  br i1 %".47", label %".48", label %".49"
.15:
  ret i1 0
.48:
  ret i1 1
.49:
  br label %".50"
.50:
  br label %".13"
}

define i1 @"__neq___%\22str\22*_i8*"(%"str"* %".1", i8* %".2")
{
entry:
  %".4" = alloca %"str"*
  %".5" = call %"str"* @"i8*->%\22str\22*"(i8* %".2")
  store %"str"* %".5", %"str"** %".4"
  %".7" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".8" = load %"str"*, %"str"** %".4"
  %".9" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".8")
  %".10" = call i1 @"__neq___i32_i32"(i32 %".7", i32 %".9")
  br i1 %".10", label %".11", label %".12"
.11:
  ret i1 1
.12:
  br label %".13"
.13:
  %".20" = alloca i32
  %".21" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".1")
  %".22" = call %"__rangeiter"* @"range_i32"(i32 %".21")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".22")
  br label %".17"
.17:
  %".25" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".22")
  br i1 %".25", label %".18", label %".19"
.18:
  %".27" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".22")
  store i32 %".27", i32* %".20"
  %".29" = getelementptr i32, i32* null, i32 1
  %".30" = ptrtoint i32* %".29" to i32
  %".31" = mul i32 %".30", 1
  %".32" = call i8* @"bohem_malloc"(i32 %".31")
  %".33" = ptrtoint i8* %".32" to i64
  %".34" = inttoptr i64 %".33" to i32*
  %".35" = getelementptr i32, i32* %".34", i32 0
  %".36" = load i32, i32* %".20"
  store i32 %".36", i32* %".35"
  %".38" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".1", i32* %".34", i32 1)
  %".39" = load %"str"*, %"str"** %".4"
  %".40" = getelementptr i32, i32* null, i32 1
  %".41" = ptrtoint i32* %".40" to i32
  %".42" = mul i32 %".41", 1
  %".43" = call i8* @"bohem_malloc"(i32 %".42")
  %".44" = ptrtoint i8* %".43" to i64
  %".45" = inttoptr i64 %".44" to i32*
  %".46" = getelementptr i32, i32* %".45", i32 0
  %".47" = load i32, i32* %".20"
  store i32 %".47", i32* %".46"
  %".49" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".39", i32* %".45", i32 1)
  %".50" = load i8, i8* %".38"
  %".51" = load i8, i8* %".49"
  %".52" = call i1 @"__neq___i8_i8"(i8 %".50", i8 %".51")
  br i1 %".52", label %".53", label %".54"
.19:
  ret i1 0
.53:
  ret i1 1
.54:
  br label %".55"
.55:
  br label %".17"
}

define i1 @"__neq___i8*_%\22str\22*"(i8* %".1", %"str"* %".2")
{
entry:
  %".4" = alloca %"str"*
  %".5" = call %"str"* @"i8*->%\22str\22*"(i8* %".1")
  store %"str"* %".5", %"str"** %".4"
  %".7" = load %"str"*, %"str"** %".4"
  %".8" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".7")
  %".9" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".2")
  %".10" = call i1 @"__neq___i32_i32"(i32 %".8", i32 %".9")
  br i1 %".10", label %".11", label %".12"
.11:
  ret i1 1
.12:
  br label %".13"
.13:
  %".20" = alloca i32
  %".21" = load %"str"*, %"str"** %".4"
  %".22" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".21")
  %".23" = call %"__rangeiter"* @"range_i32"(i32 %".22")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".23")
  br label %".17"
.17:
  %".26" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".23")
  br i1 %".26", label %".18", label %".19"
.18:
  %".28" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".23")
  store i32 %".28", i32* %".20"
  %".30" = load %"str"*, %"str"** %".4"
  %".31" = getelementptr i32, i32* null, i32 1
  %".32" = ptrtoint i32* %".31" to i32
  %".33" = mul i32 %".32", 1
  %".34" = call i8* @"bohem_malloc"(i32 %".33")
  %".35" = ptrtoint i8* %".34" to i64
  %".36" = inttoptr i64 %".35" to i32*
  %".37" = getelementptr i32, i32* %".36", i32 0
  %".38" = load i32, i32* %".20"
  store i32 %".38", i32* %".37"
  %".40" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".30", i32* %".36", i32 1)
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".20"
  store i32 %".48", i32* %".47"
  %".50" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".2", i32* %".46", i32 1)
  %".51" = load i8, i8* %".40"
  %".52" = load i8, i8* %".50"
  %".53" = call i1 @"__neq___i8_i8"(i8 %".51", i8 %".52")
  br i1 %".53", label %".54", label %".55"
.19:
  ret i1 0
.54:
  ret i1 1
.55:
  br label %".56"
.56:
  br label %".17"
}

define i1 @"__neq___i8*_i8*"(i8* %".1", i8* %".2")
{
entry:
  %".4" = alloca %"str"*
  %".5" = call %"str"* @"i8*->%\22str\22*"(i8* %".1")
  store %"str"* %".5", %"str"** %".4"
  %".7" = alloca %"str"*
  %".8" = call %"str"* @"i8*->%\22str\22*"(i8* %".2")
  store %"str"* %".8", %"str"** %".7"
  %".10" = load %"str"*, %"str"** %".4"
  %".11" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".10")
  %".12" = load %"str"*, %"str"** %".7"
  %".13" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".12")
  %".14" = call i1 @"__neq___i32_i32"(i32 %".11", i32 %".13")
  br i1 %".14", label %".15", label %".16"
.15:
  ret i1 1
.16:
  br label %".17"
.17:
  %".24" = alloca i32
  %".25" = load %"str"*, %"str"** %".4"
  %".26" = call i32 @"%\22str\22.len_%\22str\22*"(%"str"* %".25")
  %".27" = call %"__rangeiter"* @"range_i32"(i32 %".26")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".27")
  br label %".21"
.21:
  %".30" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".27")
  br i1 %".30", label %".22", label %".23"
.22:
  %".32" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".27")
  store i32 %".32", i32* %".24"
  %".34" = load %"str"*, %"str"** %".4"
  %".35" = getelementptr i32, i32* null, i32 1
  %".36" = ptrtoint i32* %".35" to i32
  %".37" = mul i32 %".36", 1
  %".38" = call i8* @"bohem_malloc"(i32 %".37")
  %".39" = ptrtoint i8* %".38" to i64
  %".40" = inttoptr i64 %".39" to i32*
  %".41" = getelementptr i32, i32* %".40", i32 0
  %".42" = load i32, i32* %".24"
  store i32 %".42", i32* %".41"
  %".44" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".34", i32* %".40", i32 1)
  %".45" = load %"str"*, %"str"** %".7"
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".24"
  store i32 %".53", i32* %".52"
  %".55" = call i8* @"%\22str\22.__index___%\22str\22*_i32*_i32"(%"str"* %".45", i32* %".51", i32 1)
  %".56" = load i8, i8* %".44"
  %".57" = load i8, i8* %".55"
  %".58" = call i1 @"__neq___i8_i8"(i8 %".56", i8 %".57")
  br i1 %".58", label %".59", label %".60"
.23:
  ret i1 0
.59:
  ret i1 1
.60:
  br label %".61"
.61:
  br label %".21"
}

define void @"%\22_tuple_char_\22.__init___%\22_tuple_char_\22*"(%"_tuple_char_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 1
  store i32 0, i32* %".3"
  ret void
}

define void @"%\22_tuple_char_\22.__init___%\22_tuple_char_\22*_i8*_i32"(%"_tuple_char_"* %".1", i8* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 0
  store i8* %".2", i8** %".5"
  %".7" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".7"
  ret void
}

define i8* @"%\22_tuple_char_\22.__index___%\22_tuple_char_\22*_i32*_i32"(%"_tuple_char_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 0
  %".6" = load i8*, i8** %".5"
  %".7" = ptrtoint i8* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr i8, i8* null, i32 1
  %".10" = ptrtoint i8* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to i8*
  ret i8* %".15"
}

define void @"%\22_tuple_char_\22.__print___%\22_tuple_char_\22*"(%"_tuple_char_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__eq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [4 x i8]* @"formatter12" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter13" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = alloca i32
  store i32 0, i32* %".16"
  br label %".18"
.18:
  %".22" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 1
  %".23" = load i32, i32* %".22"
  %".24" = call i32 @"__sub___i32_i32"(i32 %".23", i32 1)
  %".25" = load i32, i32* %".16"
  %".26" = call i1 @"__ls___i32_i32"(i32 %".25", i32 %".24")
  br i1 %".26", label %".19", label %".20"
.19:
  %".28" = getelementptr i32, i32* null, i32 1
  %".29" = ptrtoint i32* %".28" to i32
  %".30" = mul i32 %".29", 1
  %".31" = call i8* @"bohem_malloc"(i32 %".30")
  %".32" = ptrtoint i8* %".31" to i64
  %".33" = inttoptr i64 %".32" to i32*
  %".34" = getelementptr i32, i32* %".33", i32 0
  %".35" = load i32, i32* %".16"
  store i32 %".35", i32* %".34"
  %".37" = call i8* @"%\22_tuple_char_\22.__index___%\22_tuple_char_\22*_i32*_i32"(%"_tuple_char_"* %".1", i32* %".33", i32 1)
  %".38" = load i8, i8* %".37"
  call void @"__print___i8"(i8 %".38")
  %".40" = bitcast [2 x i8]* @"formatter7" to i8*
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %".42" = load i32, i32* %".16"
  %".43" = call i32 @"__postincr___i32"(i32 %".42")
  store i32 %".43", i32* %".16"
  br label %".18"
.20:
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".16"
  store i32 %".53", i32* %".52"
  %".55" = call i8* @"%\22_tuple_char_\22.__index___%\22_tuple_char_\22*_i32*_i32"(%"_tuple_char_"* %".1", i32* %".51", i32 1)
  %".56" = load i8, i8* %".55"
  call void @"__print___i8"(i8 %".56")
  %".58" = bitcast [2 x i8]* @"formatter8" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

@"formatter12" = internal constant [4 x i8] c"(,)\00"
@"formatter13" = internal constant [2 x i8] c"(\00"
define void @"%\22_tuple_char_\22.__iterget___%\22_tuple_char_\22*"(%"_tuple_char_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_tuple_char_\22.__itercheck___%\22_tuple_char_\22*"(%"_tuple_char_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define i8 @"%\22_tuple_char_\22.__iternext___%\22_tuple_char_\22*"(%"_tuple_char_"* %".1")
{
entry:
  %".3" = alloca i8
  %".4" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call i8* @"%\22_tuple_char_\22.__index___%\22_tuple_char_\22*_i32*_i32"(%"_tuple_char_"* %".1", i32* %".10", i32 1)
  %".15" = load i8, i8* %".14"
  store i8 %".15", i8* %".3"
  %".17" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_tuple_char_", %"_tuple_char_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load i8, i8* %".3"
  ret i8 %".22"
}

define void @"%\22_tuple_int_\22.__init___%\22_tuple_int_\22*"(%"_tuple_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 1
  store i32 0, i32* %".3"
  ret void
}

define void @"%\22_tuple_int_\22.__init___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 0
  store i32* %".2", i32** %".5"
  %".7" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".7"
  ret void
}

define i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 0
  %".6" = load i32*, i32** %".5"
  %".7" = ptrtoint i32* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr i32, i32* null, i32 1
  %".10" = ptrtoint i32* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to i32*
  ret i32* %".15"
}

define void @"%\22_tuple_int_\22.__print___%\22_tuple_int_\22*"(%"_tuple_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__eq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [4 x i8]* @"formatter12" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter13" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = alloca i32
  store i32 0, i32* %".16"
  br label %".18"
.18:
  %".22" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 1
  %".23" = load i32, i32* %".22"
  %".24" = call i32 @"__sub___i32_i32"(i32 %".23", i32 1)
  %".25" = load i32, i32* %".16"
  %".26" = call i1 @"__ls___i32_i32"(i32 %".25", i32 %".24")
  br i1 %".26", label %".19", label %".20"
.19:
  %".28" = getelementptr i32, i32* null, i32 1
  %".29" = ptrtoint i32* %".28" to i32
  %".30" = mul i32 %".29", 1
  %".31" = call i8* @"bohem_malloc"(i32 %".30")
  %".32" = ptrtoint i8* %".31" to i64
  %".33" = inttoptr i64 %".32" to i32*
  %".34" = getelementptr i32, i32* %".33", i32 0
  %".35" = load i32, i32* %".16"
  store i32 %".35", i32* %".34"
  %".37" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".1", i32* %".33", i32 1)
  %".38" = load i32, i32* %".37"
  call void @"__print___i32"(i32 %".38")
  %".40" = bitcast [2 x i8]* @"formatter7" to i8*
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %".42" = load i32, i32* %".16"
  %".43" = call i32 @"__postincr___i32"(i32 %".42")
  store i32 %".43", i32* %".16"
  br label %".18"
.20:
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".16"
  store i32 %".53", i32* %".52"
  %".55" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".1", i32* %".51", i32 1)
  %".56" = load i32, i32* %".55"
  call void @"__print___i32"(i32 %".56")
  %".58" = bitcast [2 x i8]* @"formatter8" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

define void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".1")
{
entry:
  %".3" = alloca i32
  %".4" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".1", i32* %".10", i32 1)
  %".15" = load i32, i32* %".14"
  store i32 %".15", i32* %".3"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load i32, i32* %".3"
  ret i32 %".22"
}

define void @"%\22_tuple_long_\22.__init___%\22_tuple_long_\22*"(%"_tuple_long_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 1
  store i32 0, i32* %".3"
  ret void
}

define void @"%\22_tuple_long_\22.__init___%\22_tuple_long_\22*_i64*_i32"(%"_tuple_long_"* %".1", i64* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 0
  store i64* %".2", i64** %".5"
  %".7" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".7"
  ret void
}

define i64* @"%\22_tuple_long_\22.__index___%\22_tuple_long_\22*_i32*_i32"(%"_tuple_long_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 0
  %".6" = load i64*, i64** %".5"
  %".7" = ptrtoint i64* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr i64, i64* null, i32 1
  %".10" = ptrtoint i64* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to i64*
  ret i64* %".15"
}

define void @"%\22_tuple_long_\22.__print___%\22_tuple_long_\22*"(%"_tuple_long_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__eq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [4 x i8]* @"formatter12" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter13" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = alloca i32
  store i32 0, i32* %".16"
  br label %".18"
.18:
  %".22" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 1
  %".23" = load i32, i32* %".22"
  %".24" = call i32 @"__sub___i32_i32"(i32 %".23", i32 1)
  %".25" = load i32, i32* %".16"
  %".26" = call i1 @"__ls___i32_i32"(i32 %".25", i32 %".24")
  br i1 %".26", label %".19", label %".20"
.19:
  %".28" = getelementptr i32, i32* null, i32 1
  %".29" = ptrtoint i32* %".28" to i32
  %".30" = mul i32 %".29", 1
  %".31" = call i8* @"bohem_malloc"(i32 %".30")
  %".32" = ptrtoint i8* %".31" to i64
  %".33" = inttoptr i64 %".32" to i32*
  %".34" = getelementptr i32, i32* %".33", i32 0
  %".35" = load i32, i32* %".16"
  store i32 %".35", i32* %".34"
  %".37" = call i64* @"%\22_tuple_long_\22.__index___%\22_tuple_long_\22*_i32*_i32"(%"_tuple_long_"* %".1", i32* %".33", i32 1)
  %".38" = load i64, i64* %".37"
  call void @"__print___i64"(i64 %".38")
  %".40" = bitcast [2 x i8]* @"formatter7" to i8*
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %".42" = load i32, i32* %".16"
  %".43" = call i32 @"__postincr___i32"(i32 %".42")
  store i32 %".43", i32* %".16"
  br label %".18"
.20:
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".16"
  store i32 %".53", i32* %".52"
  %".55" = call i64* @"%\22_tuple_long_\22.__index___%\22_tuple_long_\22*_i32*_i32"(%"_tuple_long_"* %".1", i32* %".51", i32 1)
  %".56" = load i64, i64* %".55"
  call void @"__print___i64"(i64 %".56")
  %".58" = bitcast [2 x i8]* @"formatter8" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

define void @"%\22_tuple_long_\22.__iterget___%\22_tuple_long_\22*"(%"_tuple_long_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_tuple_long_\22.__itercheck___%\22_tuple_long_\22*"(%"_tuple_long_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define i64 @"%\22_tuple_long_\22.__iternext___%\22_tuple_long_\22*"(%"_tuple_long_"* %".1")
{
entry:
  %".3" = alloca i64
  %".4" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call i64* @"%\22_tuple_long_\22.__index___%\22_tuple_long_\22*_i32*_i32"(%"_tuple_long_"* %".1", i32* %".10", i32 1)
  %".15" = load i64, i64* %".14"
  store i64 %".15", i64* %".3"
  %".17" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_tuple_long_", %"_tuple_long_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load i64, i64* %".3"
  ret i64 %".22"
}

define void @"%\22_tuple_half_\22.__init___%\22_tuple_half_\22*"(%"_tuple_half_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 1
  store i32 0, i32* %".3"
  ret void
}

define void @"%\22_tuple_half_\22.__init___%\22_tuple_half_\22*_half*_i32"(%"_tuple_half_"* %".1", half* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 0
  store half* %".2", half** %".5"
  %".7" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".7"
  ret void
}

define half* @"%\22_tuple_half_\22.__index___%\22_tuple_half_\22*_i32*_i32"(%"_tuple_half_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 0
  %".6" = load half*, half** %".5"
  %".7" = ptrtoint half* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr half, half* null, i32 1
  %".10" = ptrtoint half* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to half*
  ret half* %".15"
}

define void @"%\22_tuple_half_\22.__print___%\22_tuple_half_\22*"(%"_tuple_half_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__eq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [4 x i8]* @"formatter12" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter13" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = alloca i32
  store i32 0, i32* %".16"
  br label %".18"
.18:
  %".22" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 1
  %".23" = load i32, i32* %".22"
  %".24" = call i32 @"__sub___i32_i32"(i32 %".23", i32 1)
  %".25" = load i32, i32* %".16"
  %".26" = call i1 @"__ls___i32_i32"(i32 %".25", i32 %".24")
  br i1 %".26", label %".19", label %".20"
.19:
  %".28" = getelementptr i32, i32* null, i32 1
  %".29" = ptrtoint i32* %".28" to i32
  %".30" = mul i32 %".29", 1
  %".31" = call i8* @"bohem_malloc"(i32 %".30")
  %".32" = ptrtoint i8* %".31" to i64
  %".33" = inttoptr i64 %".32" to i32*
  %".34" = getelementptr i32, i32* %".33", i32 0
  %".35" = load i32, i32* %".16"
  store i32 %".35", i32* %".34"
  %".37" = call half* @"%\22_tuple_half_\22.__index___%\22_tuple_half_\22*_i32*_i32"(%"_tuple_half_"* %".1", i32* %".33", i32 1)
  %".38" = load half, half* %".37"
  call void @"__print___half"(half %".38")
  %".40" = bitcast [2 x i8]* @"formatter7" to i8*
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %".42" = load i32, i32* %".16"
  %".43" = call i32 @"__postincr___i32"(i32 %".42")
  store i32 %".43", i32* %".16"
  br label %".18"
.20:
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".16"
  store i32 %".53", i32* %".52"
  %".55" = call half* @"%\22_tuple_half_\22.__index___%\22_tuple_half_\22*_i32*_i32"(%"_tuple_half_"* %".1", i32* %".51", i32 1)
  %".56" = load half, half* %".55"
  call void @"__print___half"(half %".56")
  %".58" = bitcast [2 x i8]* @"formatter8" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

define void @"%\22_tuple_half_\22.__iterget___%\22_tuple_half_\22*"(%"_tuple_half_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_tuple_half_\22.__itercheck___%\22_tuple_half_\22*"(%"_tuple_half_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define half @"%\22_tuple_half_\22.__iternext___%\22_tuple_half_\22*"(%"_tuple_half_"* %".1")
{
entry:
  %".3" = alloca half
  %".4" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call half* @"%\22_tuple_half_\22.__index___%\22_tuple_half_\22*_i32*_i32"(%"_tuple_half_"* %".1", i32* %".10", i32 1)
  %".15" = load half, half* %".14"
  store half %".15", half* %".3"
  %".17" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_tuple_half_", %"_tuple_half_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load half, half* %".3"
  ret half %".22"
}

define void @"%\22_tuple_float_\22.__init___%\22_tuple_float_\22*"(%"_tuple_float_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 1
  store i32 0, i32* %".3"
  ret void
}

define void @"%\22_tuple_float_\22.__init___%\22_tuple_float_\22*_float*_i32"(%"_tuple_float_"* %".1", float* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 0
  store float* %".2", float** %".5"
  %".7" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".7"
  ret void
}

define float* @"%\22_tuple_float_\22.__index___%\22_tuple_float_\22*_i32*_i32"(%"_tuple_float_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 0
  %".6" = load float*, float** %".5"
  %".7" = ptrtoint float* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr float, float* null, i32 1
  %".10" = ptrtoint float* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to float*
  ret float* %".15"
}

define void @"%\22_tuple_float_\22.__print___%\22_tuple_float_\22*"(%"_tuple_float_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__eq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [4 x i8]* @"formatter12" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter13" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = alloca i32
  store i32 0, i32* %".16"
  br label %".18"
.18:
  %".22" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 1
  %".23" = load i32, i32* %".22"
  %".24" = call i32 @"__sub___i32_i32"(i32 %".23", i32 1)
  %".25" = load i32, i32* %".16"
  %".26" = call i1 @"__ls___i32_i32"(i32 %".25", i32 %".24")
  br i1 %".26", label %".19", label %".20"
.19:
  %".28" = getelementptr i32, i32* null, i32 1
  %".29" = ptrtoint i32* %".28" to i32
  %".30" = mul i32 %".29", 1
  %".31" = call i8* @"bohem_malloc"(i32 %".30")
  %".32" = ptrtoint i8* %".31" to i64
  %".33" = inttoptr i64 %".32" to i32*
  %".34" = getelementptr i32, i32* %".33", i32 0
  %".35" = load i32, i32* %".16"
  store i32 %".35", i32* %".34"
  %".37" = call float* @"%\22_tuple_float_\22.__index___%\22_tuple_float_\22*_i32*_i32"(%"_tuple_float_"* %".1", i32* %".33", i32 1)
  %".38" = load float, float* %".37"
  call void @"__print___float"(float %".38")
  %".40" = bitcast [2 x i8]* @"formatter7" to i8*
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %".42" = load i32, i32* %".16"
  %".43" = call i32 @"__postincr___i32"(i32 %".42")
  store i32 %".43", i32* %".16"
  br label %".18"
.20:
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".16"
  store i32 %".53", i32* %".52"
  %".55" = call float* @"%\22_tuple_float_\22.__index___%\22_tuple_float_\22*_i32*_i32"(%"_tuple_float_"* %".1", i32* %".51", i32 1)
  %".56" = load float, float* %".55"
  call void @"__print___float"(float %".56")
  %".58" = bitcast [2 x i8]* @"formatter8" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

define void @"%\22_tuple_float_\22.__iterget___%\22_tuple_float_\22*"(%"_tuple_float_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_tuple_float_\22.__itercheck___%\22_tuple_float_\22*"(%"_tuple_float_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define float @"%\22_tuple_float_\22.__iternext___%\22_tuple_float_\22*"(%"_tuple_float_"* %".1")
{
entry:
  %".3" = alloca float
  %".4" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call float* @"%\22_tuple_float_\22.__index___%\22_tuple_float_\22*_i32*_i32"(%"_tuple_float_"* %".1", i32* %".10", i32 1)
  %".15" = load float, float* %".14"
  store float %".15", float* %".3"
  %".17" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_tuple_float_", %"_tuple_float_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load float, float* %".3"
  ret float %".22"
}

define void @"%\22_tuple_double_\22.__init___%\22_tuple_double_\22*"(%"_tuple_double_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 1
  store i32 0, i32* %".3"
  ret void
}

define void @"%\22_tuple_double_\22.__init___%\22_tuple_double_\22*_double*_i32"(%"_tuple_double_"* %".1", double* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 0
  store double* %".2", double** %".5"
  %".7" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 1
  store i32 %".3", i32* %".7"
  ret void
}

define double* @"%\22_tuple_double_\22.__index___%\22_tuple_double_\22*_i32*_i32"(%"_tuple_double_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 0
  %".6" = load double*, double** %".5"
  %".7" = ptrtoint double* %".6" to i64
  %".8" = getelementptr i32, i32* %".2", i32 0
  %".9" = getelementptr double, double* null, i32 1
  %".10" = ptrtoint double* %".9" to i32
  %".11" = load i32, i32* %".8"
  %".12" = call i32 @"__mul___i32_i32"(i32 %".11", i32 %".10")
  %".13" = call i64 @"i32->i64"(i32 %".12")
  %".14" = call i64 @"__add___i64_i64"(i64 %".7", i64 %".13")
  %".15" = inttoptr i64 %".14" to double*
  ret double* %".15"
}

define void @"%\22_tuple_double_\22.__print___%\22_tuple_double_\22*"(%"_tuple_double_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__eq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [4 x i8]* @"formatter12" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter13" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14")
  %".16" = alloca i32
  store i32 0, i32* %".16"
  br label %".18"
.18:
  %".22" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 1
  %".23" = load i32, i32* %".22"
  %".24" = call i32 @"__sub___i32_i32"(i32 %".23", i32 1)
  %".25" = load i32, i32* %".16"
  %".26" = call i1 @"__ls___i32_i32"(i32 %".25", i32 %".24")
  br i1 %".26", label %".19", label %".20"
.19:
  %".28" = getelementptr i32, i32* null, i32 1
  %".29" = ptrtoint i32* %".28" to i32
  %".30" = mul i32 %".29", 1
  %".31" = call i8* @"bohem_malloc"(i32 %".30")
  %".32" = ptrtoint i8* %".31" to i64
  %".33" = inttoptr i64 %".32" to i32*
  %".34" = getelementptr i32, i32* %".33", i32 0
  %".35" = load i32, i32* %".16"
  store i32 %".35", i32* %".34"
  %".37" = call double* @"%\22_tuple_double_\22.__index___%\22_tuple_double_\22*_i32*_i32"(%"_tuple_double_"* %".1", i32* %".33", i32 1)
  %".38" = load double, double* %".37"
  call void @"__print___double"(double %".38")
  %".40" = bitcast [2 x i8]* @"formatter7" to i8*
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".40")
  %".42" = load i32, i32* %".16"
  %".43" = call i32 @"__postincr___i32"(i32 %".42")
  store i32 %".43", i32* %".16"
  br label %".18"
.20:
  %".46" = getelementptr i32, i32* null, i32 1
  %".47" = ptrtoint i32* %".46" to i32
  %".48" = mul i32 %".47", 1
  %".49" = call i8* @"bohem_malloc"(i32 %".48")
  %".50" = ptrtoint i8* %".49" to i64
  %".51" = inttoptr i64 %".50" to i32*
  %".52" = getelementptr i32, i32* %".51", i32 0
  %".53" = load i32, i32* %".16"
  store i32 %".53", i32* %".52"
  %".55" = call double* @"%\22_tuple_double_\22.__index___%\22_tuple_double_\22*_i32*_i32"(%"_tuple_double_"* %".1", i32* %".51", i32 1)
  %".56" = load double, double* %".55"
  call void @"__print___double"(double %".56")
  %".58" = bitcast [2 x i8]* @"formatter8" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

define void @"%\22_tuple_double_\22.__iterget___%\22_tuple_double_\22*"(%"_tuple_double_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 2
  store i32 0, i32* %".3"
  ret void
}

define i1 @"%\22_tuple_double_\22.__itercheck___%\22_tuple_double_\22*"(%"_tuple_double_"* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 2
  %".4" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 1
  %".5" = load i32, i32* %".3"
  %".6" = load i32, i32* %".4"
  %".7" = call i1 @"__ls___i32_i32"(i32 %".5", i32 %".6")
  ret i1 %".7"
}

define double @"%\22_tuple_double_\22.__iternext___%\22_tuple_double_\22*"(%"_tuple_double_"* %".1")
{
entry:
  %".3" = alloca double
  %".4" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 2
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  %".12" = load i32, i32* %".4"
  store i32 %".12", i32* %".11"
  %".14" = call double* @"%\22_tuple_double_\22.__index___%\22_tuple_double_\22*_i32*_i32"(%"_tuple_double_"* %".1", i32* %".10", i32 1)
  %".15" = load double, double* %".14"
  store double %".15", double* %".3"
  %".17" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 2
  %".18" = getelementptr %"_tuple_double_", %"_tuple_double_"* %".1", i32 0, i32 2
  %".19" = load i32, i32* %".18"
  %".20" = call i32 @"__add___i32_i32"(i32 %".19", i32 1)
  store i32 %".20", i32* %".17"
  %".22" = load double, double* %".3"
  ret double %".22"
}

define %"_tuple_char_"* @"i8*->%\22_tuple_char_\22*"(i8* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_char_", %"_tuple_char_"* null, i32 1
  %".4" = ptrtoint %"_tuple_char_"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"_tuple_char_"*
  call void @"%\22_tuple_char_\22.__init___%\22_tuple_char_\22*"(%"_tuple_char_"* %".7")
  ret %"_tuple_char_"* %".7"
}

define %"_tuple_int_"* @"i8*->%\22_tuple_int_\22*"(i8* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_int_", %"_tuple_int_"* null, i32 1
  %".4" = ptrtoint %"_tuple_int_"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"_tuple_int_"*
  call void @"%\22_tuple_int_\22.__init___%\22_tuple_int_\22*"(%"_tuple_int_"* %".7")
  ret %"_tuple_int_"* %".7"
}

define %"_tuple_long_"* @"i8*->%\22_tuple_long_\22*"(i8* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_long_", %"_tuple_long_"* null, i32 1
  %".4" = ptrtoint %"_tuple_long_"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"_tuple_long_"*
  call void @"%\22_tuple_long_\22.__init___%\22_tuple_long_\22*"(%"_tuple_long_"* %".7")
  ret %"_tuple_long_"* %".7"
}

define %"_tuple_half_"* @"i8*->%\22_tuple_half_\22*"(i8* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_half_", %"_tuple_half_"* null, i32 1
  %".4" = ptrtoint %"_tuple_half_"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"_tuple_half_"*
  call void @"%\22_tuple_half_\22.__init___%\22_tuple_half_\22*"(%"_tuple_half_"* %".7")
  ret %"_tuple_half_"* %".7"
}

define %"_tuple_float_"* @"i8*->%\22_tuple_float_\22*"(i8* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_float_", %"_tuple_float_"* null, i32 1
  %".4" = ptrtoint %"_tuple_float_"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"_tuple_float_"*
  call void @"%\22_tuple_float_\22.__init___%\22_tuple_float_\22*"(%"_tuple_float_"* %".7")
  ret %"_tuple_float_"* %".7"
}

define %"_tuple_double_"* @"i8*->%\22_tuple_double_\22*"(i8* %".1")
{
entry:
  %".3" = getelementptr %"_tuple_double_", %"_tuple_double_"* null, i32 1
  %".4" = ptrtoint %"_tuple_double_"* %".3" to i32
  %".5" = call i8* @"bohem_malloc"(i32 %".4")
  %".6" = ptrtoint i8* %".5" to i64
  %".7" = inttoptr i64 %".6" to %"_tuple_double_"*
  call void @"%\22_tuple_double_\22.__init___%\22_tuple_double_\22*"(%"_tuple_double_"* %".7")
  ret %"_tuple_double_"* %".7"
}

define void @"%\22_NDArray_int_1_\22.__init___%\22_NDArray_int_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  store i32 1, i32* %".4"
  %".6" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".6"
  %".8" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".9" = load i32, i32* %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 %".9", i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".17" = load %"_tuple_int_"*, %"_tuple_int_"** %".16"
  %".18" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".17", i32 0, i32 1
  %".19" = load i32, i32* %".15"
  %".20" = load i32, i32* %".18"
  %".21" = call i1 @"__neq___i32_i32"(i32 %".19", i32 %".20")
  br i1 %".21", label %".22", label %".23"
.12:
  br label %".13"
.13:
  %".35" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".35"
  ret void
.22:
  %".26" = bitcast [21 x i8]* @"formatter14" to i8*
  call void @"__print___i8*"(i8* %".26")
  %".28" = bitcast [2 x i8]* @"formatter15" to i8*
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".28")
  call void @"exit"(i32 1)
  br label %".24"
.23:
  br label %".24"
.24:
  br label %".13"
}

@"formatter14" = internal constant [21 x i8] c"Incorrect Dimensions\00"
@"formatter15" = internal constant [2 x i8] c"\0a\00"
define i32 @"main"()
{
entry:
  call void (...) @"bohem_start"()
  %".3" = alloca %"_NDArray_int_1_"*
  %".4" = getelementptr i32, i32* null, i32 1
  %".5" = ptrtoint i32* %".4" to i32
  %".6" = mul i32 %".5", 1
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to i32*
  %".10" = getelementptr i32, i32* %".9", i32 0
  store i32 1, i32* %".10"
  %".12" = getelementptr %"_tuple_int_", %"_tuple_int_"* null, i32 1
  %".13" = ptrtoint %"_tuple_int_"* %".12" to i32
  %".14" = call i8* @"bohem_malloc"(i32 %".13")
  %".15" = ptrtoint i8* %".14" to i64
  %".16" = inttoptr i64 %".15" to %"_tuple_int_"*
  call void @"%\22_tuple_int_\22.__init___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".16", i32* %".9", i32 1)
  %".18" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* null, i32 1
  %".19" = ptrtoint %"_NDArray_int_1_"* %".18" to i32
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to %"_NDArray_int_1_"*
  call void @"%\22_NDArray_int_1_\22.__init___%\22_NDArray_int_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_1_"* %".22", %"_tuple_int_"* %".16")
  store %"_NDArray_int_1_"* %".22", %"_NDArray_int_1_"** %".3"
  ret i32 0
}
