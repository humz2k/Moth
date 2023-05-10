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
%"_NDArray_char_0_" = type {i8*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_int_0_" = type {i32*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_long_0_" = type {i64*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_half_0_" = type {half*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_float_0_" = type {float*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_double_0_" = type {double*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_char_2_" = type {i8*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_int_2_" = type {i32*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_long_2_" = type {i64*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_half_2_" = type {half*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_float_2_" = type {float*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_double_2_" = type {double*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_char_1_" = type {i8*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_int_1_" = type {i32*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_long_1_" = type {i64*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_half_1_" = type {half*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_float_1_" = type {float*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
%"_NDArray_double_1_" = type {double*, i32, i32, %"_tuple_int_"*, %"_rawArray_int_"*}
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
  %".3" = bitcast [4 x i8]* @"formatter3" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".1")
  ret void
}

@"formatter3" = internal constant [4 x i8] c"%5d\00"
define void @"__print___i64"(i64 %".1")
{
entry:
  %".3" = bitcast [5 x i8]* @"formatter4" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i64 %".1")
  ret void
}

@"formatter4" = internal constant [5 x i8] c"%5ld\00"
define void @"__print___half"(half %".1")
{
entry:
  %".3" = call float @"half->float"(half %".1")
  %".4" = bitcast [6 x i8]* @"formatter5" to i8*
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".4", float %".3")
  ret void
}

@"formatter5" = internal constant [6 x i8] c"%5.4f\00"
define void @"__print___float"(float %".1")
{
entry:
  %".3" = bitcast [6 x i8]* @"formatter6" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", float %".1")
  ret void
}

@"formatter6" = internal constant [6 x i8] c"%5.4g\00"
define void @"__print___double"(double %".1")
{
entry:
  %".3" = bitcast [6 x i8]* @"formatter5" to i8*
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
  %".4" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 0
  %".5" = load i32, i32* %".4"
  store i32 %".5", i32* %".3"
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
  %".3" = bitcast [7 x i8]* @"formatter7" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3")
  %".5" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 0
  %".6" = load i32, i32* %".5"
  call void @"__print___i32"(i32 %".6")
  %".8" = bitcast [2 x i8]* @"formatter8" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8")
  %".10" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 1
  %".11" = load i32, i32* %".10"
  call void @"__print___i32"(i32 %".11")
  %".13" = bitcast [2 x i8]* @"formatter8" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13")
  %".15" = getelementptr %"__rangeiter", %"__rangeiter"* %".1", i32 0, i32 2
  %".16" = load i32, i32* %".15"
  call void @"__print___i32"(i32 %".16")
  %".18" = bitcast [2 x i8]* @"formatter9" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  ret void
}

@"formatter7" = internal constant [7 x i8] c"range(\00"
@"formatter8" = internal constant [2 x i8] c",\00"
@"formatter9" = internal constant [2 x i8] c")\00"
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
  %".3" = bitcast [2 x i8]* @"formatter10" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3")
  %".5" = alloca i32
  store i32 0, i32* %".5"
  br label %".7"
.7:
  %".11" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* %".1", i32 0, i32 1
  %".12" = load i32, i32* %".11"
  %".13" = call i32 @"__sub___i32_i32"(i32 %".12", i32 1)
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
  %".29" = bitcast [2 x i8]* @"formatter8" to i8*
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".29")
  %".31" = load i32, i32* %".5"
  %".32" = call i32 @"__add___i32_i32"(i32 %".31", i32 1)
  store i32 %".32", i32* %".5"
  br label %".7"
.9:
  %".35" = getelementptr i32, i32* null, i32 1
  %".36" = ptrtoint i32* %".35" to i32
  %".37" = mul i32 %".36", 1
  %".38" = call i8* @"bohem_malloc"(i32 %".37")
  %".39" = ptrtoint i8* %".38" to i64
  %".40" = inttoptr i64 %".39" to i32*
  %".41" = getelementptr i32, i32* %".40", i32 0
  %".42" = load i32, i32* %".5"
  store i32 %".42", i32* %".41"
  %".44" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".1", i32* %".40", i32 1)
  %".45" = load i32, i32* %".44"
  call void @"__print___i32"(i32 %".45")
  %".47" = bitcast [2 x i8]* @"formatter11" to i8*
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".47")
  ret void
}

@"formatter10" = internal constant [2 x i8] c"[\00"
@"formatter11" = internal constant [2 x i8] c"]\00"
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
  %".4" = bitcast [3 x i8]* @"formatter12" to i8*
  %".5" = load i8*, i8** %".3"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".4", i8* %".5")
  ret void
}

@"formatter12" = internal constant [3 x i8] c"%s\00"
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
  %".3" = bitcast [3 x i8]* @"formatter12" to i8*
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
  %".10" = bitcast [4 x i8]* @"formatter13" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter14" to i8*
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
  %".40" = bitcast [2 x i8]* @"formatter8" to i8*
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
  %".58" = bitcast [2 x i8]* @"formatter9" to i8*
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".58")
  ret void
}

@"formatter13" = internal constant [4 x i8] c"(,)\00"
@"formatter14" = internal constant [2 x i8] c"(\00"
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
  %".10" = bitcast [4 x i8]* @"formatter13" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter14" to i8*
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
  %".40" = bitcast [2 x i8]* @"formatter8" to i8*
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
  %".58" = bitcast [2 x i8]* @"formatter9" to i8*
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
  %".10" = bitcast [4 x i8]* @"formatter13" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter14" to i8*
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
  %".40" = bitcast [2 x i8]* @"formatter8" to i8*
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
  %".58" = bitcast [2 x i8]* @"formatter9" to i8*
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
  %".10" = bitcast [4 x i8]* @"formatter13" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter14" to i8*
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
  %".40" = bitcast [2 x i8]* @"formatter8" to i8*
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
  %".58" = bitcast [2 x i8]* @"formatter9" to i8*
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
  %".10" = bitcast [4 x i8]* @"formatter13" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter14" to i8*
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
  %".40" = bitcast [2 x i8]* @"formatter8" to i8*
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
  %".58" = bitcast [2 x i8]* @"formatter9" to i8*
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
  %".10" = bitcast [4 x i8]* @"formatter13" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ret void
.7:
  br label %".8"
.8:
  %".14" = bitcast [2 x i8]* @"formatter14" to i8*
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
  %".40" = bitcast [2 x i8]* @"formatter8" to i8*
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
  %".58" = bitcast [2 x i8]* @"formatter9" to i8*
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

define void @"%\22_NDArray_char_0_\22.throwErr_%\22_NDArray_char_0_\22*_%\22str\22*"(%"_NDArray_char_0_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [3 x i8]* @"formatter18" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

@"formatter15" = internal constant [15 x i8] c"NDArray Error:\00"
@"formatter16" = internal constant [2 x i8] c"\0a\00"
@"formatter17" = internal constant [12 x i8] c"   Error in\00"
@"formatter18" = internal constant [3 x i8] c"i8\00"
@"formatter19" = internal constant [2 x i8] c" \00"
@"formatter20" = internal constant [6 x i8] c"array\00"
@"formatter21" = internal constant [4 x i8] c"   \00"
define i32 @"%\22_NDArray_char_0_\22.len_%\22_NDArray_char_0_\22*"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 0, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 0, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_char_0_\22.throwErr_%\22_NDArray_char_0_\22*_%\22str\22*"(%"_NDArray_char_0_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".134" = getelementptr i8, i8* null, i32 1
  %".135" = ptrtoint i8* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  store i8* %".138", i8** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

@"formatter22" = internal constant [21 x i8] c"Incorrect Dimensions\00"
define i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_char_0_\22.throwErr_%\22_NDArray_char_0_\22*_%\22str\22*"(%"_NDArray_char_0_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".22" = load i8*, i8** %".21"
  %".23" = ptrtoint i8* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i8, i8* null, i32 1
  %".26" = ptrtoint i8* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i8*
  ret i8* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".97" = load i8*, i8** %".96"
  %".98" = ptrtoint i8* %".97" to i64
  %".99" = getelementptr i8, i8* null, i32 1
  %".100" = ptrtoint i8* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i8*
  ret i8* %".105"
.55:
  %".59" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

@"formatter23" = internal constant [39 x i8] c"Incorrect number of dimensions indexed\00"
define %"_NDArray_char_0_"* @"%\22_NDArray_char_0_\22.reshape_%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_char_0_"*
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_char_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_char_0_"*
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_char_0_"* %".9", %"_NDArray_char_0_"** %".4"
  %".12" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  %".13" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_char_0_\22.throwErr_%\22_NDArray_char_0_\22*_%\22str\22*"(%"_NDArray_char_0_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".1", i32* %".56", i32 1)
  %".61" = load i8, i8* %".60"
  store i8 %".61", i8* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  ret %"_NDArray_char_0_"* %".64"
}

@"formatter24" = internal constant [16 x i8] c"Invalid reshape\00"
define void @"%\22_NDArray_char_0_\22.set_all_%\22_NDArray_char_0_\22*_i8"(%"_NDArray_char_0_"* %".1", i8 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".1", i32* %".22", i32 1)
  store i8 %".2", i8* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_char_0_\22.zero_%\22_NDArray_char_0_\22*"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".1", i32* %".21", i32 1)
  %".26" = call i8 @"i32->i8"(i32 0)
  store i8 %".26", i8* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_char_0_\22.__print___%\22_NDArray_char_0_\22*"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".355" = load i8*, i8** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i8, i8* %".355", i32 %".356"
  %".358" = load i8, i8* %".357"
  call void @"__print___i8"(i8 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_char_0_"* @"%\22_NDArray_char_0_\22*->%\22_NDArray_char_0_\22*"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_char_0_"*
  %".18" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_char_0_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_char_0_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_char_0_"* %".23", %"_NDArray_char_0_"** %".17"
  %".27" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".17"
  %".28" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".30" = load i8*, i8** %".29"
  store i8* %".30", i8** %".28"
  %".32" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".17"
  ret %"_NDArray_char_0_"* %".32"
}

@"formatter25" = internal constant [21 x i8] c"Invalid NDArray Cast\00"
define %"_NDArray_char_0_"* @"%\22_NDArray_char_0_\22*->%\22_NDArray_char_0_\22*0"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_char_0_"*
  %".4" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_char_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_char_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_char_0_"* %".9", %"_NDArray_char_0_"** %".3"
  %".13" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".3"
  %".14" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".16" = load i8*, i8** %".15"
  store i8* %".16", i8** %".14"
  %".18" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".3"
  ret %"_NDArray_char_0_"* %".18"
}

define void @"%\22_NDArray_int_0_\22.throwErr_%\22_NDArray_int_0_\22*_%\22str\22*"(%"_NDArray_int_0_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [4 x i8]* @"formatter26" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

@"formatter26" = internal constant [4 x i8] c"i32\00"
define i32 @"%\22_NDArray_int_0_\22.len_%\22_NDArray_int_0_\22*"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 0, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 0, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_int_0_\22.throwErr_%\22_NDArray_int_0_\22*_%\22str\22*"(%"_NDArray_int_0_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".134" = getelementptr i32, i32* null, i32 1
  %".135" = ptrtoint i32* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call i32* @"i8*->i32*"(i8* %".138")
  store i32* %".139", i32** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_int_0_\22.throwErr_%\22_NDArray_int_0_\22*_%\22str\22*"(%"_NDArray_int_0_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".22" = load i32*, i32** %".21"
  %".23" = ptrtoint i32* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i32, i32* null, i32 1
  %".26" = ptrtoint i32* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i32*
  ret i32* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".97" = load i32*, i32** %".96"
  %".98" = ptrtoint i32* %".97" to i64
  %".99" = getelementptr i32, i32* null, i32 1
  %".100" = ptrtoint i32* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i32*
  ret i32* %".105"
.55:
  %".59" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_0_\22.reshape_%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_int_0_"*
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_int_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_int_0_"*
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_int_0_"* %".9", %"_NDArray_int_0_"** %".4"
  %".12" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  %".13" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_int_0_\22.throwErr_%\22_NDArray_int_0_\22*_%\22str\22*"(%"_NDArray_int_0_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".1", i32* %".56", i32 1)
  %".61" = load i32, i32* %".60"
  store i32 %".61", i32* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  ret %"_NDArray_int_0_"* %".64"
}

define void @"%\22_NDArray_int_0_\22.set_all_%\22_NDArray_int_0_\22*_i32"(%"_NDArray_int_0_"* %".1", i32 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".1", i32* %".22", i32 1)
  store i32 %".2", i32* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_int_0_\22.zero_%\22_NDArray_int_0_\22*"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".1", i32* %".21", i32 1)
  store i32 0, i32* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_int_0_\22.__print___%\22_NDArray_int_0_\22*"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".355" = load i32*, i32** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i32, i32* %".355", i32 %".356"
  %".358" = load i32, i32* %".357"
  call void @"__print___i32"(i32 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_0_\22*->%\22_NDArray_int_0_\22*"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_int_0_"*
  %".18" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_int_0_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_int_0_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_int_0_"* %".23", %"_NDArray_int_0_"** %".17"
  %".27" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".17"
  %".28" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".30" = load i32*, i32** %".29"
  store i32* %".30", i32** %".28"
  %".32" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".17"
  ret %"_NDArray_int_0_"* %".32"
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_0_\22*->%\22_NDArray_int_0_\22*1"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_int_0_"*
  %".4" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_int_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_int_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_int_0_"* %".9", %"_NDArray_int_0_"** %".3"
  %".13" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".3"
  %".14" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".16" = load i32*, i32** %".15"
  store i32* %".16", i32** %".14"
  %".18" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".3"
  ret %"_NDArray_int_0_"* %".18"
}

define void @"%\22_NDArray_long_0_\22.throwErr_%\22_NDArray_long_0_\22*_%\22str\22*"(%"_NDArray_long_0_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [4 x i8]* @"formatter27" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

@"formatter27" = internal constant [4 x i8] c"i64\00"
define i32 @"%\22_NDArray_long_0_\22.len_%\22_NDArray_long_0_\22*"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 0, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 0, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_long_0_\22.throwErr_%\22_NDArray_long_0_\22*_%\22str\22*"(%"_NDArray_long_0_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".134" = getelementptr i64, i64* null, i32 1
  %".135" = ptrtoint i64* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call i64* @"i8*->i64*"(i8* %".138")
  store i64* %".139", i64** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_long_0_\22.throwErr_%\22_NDArray_long_0_\22*_%\22str\22*"(%"_NDArray_long_0_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".22" = load i64*, i64** %".21"
  %".23" = ptrtoint i64* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i64, i64* null, i32 1
  %".26" = ptrtoint i64* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i64*
  ret i64* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".97" = load i64*, i64** %".96"
  %".98" = ptrtoint i64* %".97" to i64
  %".99" = getelementptr i64, i64* null, i32 1
  %".100" = ptrtoint i64* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i64*
  ret i64* %".105"
.55:
  %".59" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_0_\22.reshape_%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_long_0_"*
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_long_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_long_0_"*
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_long_0_"* %".9", %"_NDArray_long_0_"** %".4"
  %".12" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  %".13" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_long_0_\22.throwErr_%\22_NDArray_long_0_\22*_%\22str\22*"(%"_NDArray_long_0_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".1", i32* %".56", i32 1)
  %".61" = load i64, i64* %".60"
  store i64 %".61", i64* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  ret %"_NDArray_long_0_"* %".64"
}

define void @"%\22_NDArray_long_0_\22.set_all_%\22_NDArray_long_0_\22*_i64"(%"_NDArray_long_0_"* %".1", i64 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".1", i32* %".22", i32 1)
  store i64 %".2", i64* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_long_0_\22.zero_%\22_NDArray_long_0_\22*"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".1", i32* %".21", i32 1)
  %".26" = call i64 @"i32->i64"(i32 0)
  store i64 %".26", i64* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_long_0_\22.__print___%\22_NDArray_long_0_\22*"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".355" = load i64*, i64** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i64, i64* %".355", i32 %".356"
  %".358" = load i64, i64* %".357"
  call void @"__print___i64"(i64 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_0_\22*->%\22_NDArray_long_0_\22*"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_long_0_"*
  %".18" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_long_0_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_long_0_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_long_0_"* %".23", %"_NDArray_long_0_"** %".17"
  %".27" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".17"
  %".28" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".30" = load i64*, i64** %".29"
  store i64* %".30", i64** %".28"
  %".32" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".17"
  ret %"_NDArray_long_0_"* %".32"
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_0_\22*->%\22_NDArray_long_0_\22*2"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_long_0_"*
  %".4" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_long_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_long_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_long_0_"* %".9", %"_NDArray_long_0_"** %".3"
  %".13" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".3"
  %".14" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".16" = load i64*, i64** %".15"
  store i64* %".16", i64** %".14"
  %".18" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".3"
  ret %"_NDArray_long_0_"* %".18"
}

define void @"%\22_NDArray_half_0_\22.throwErr_%\22_NDArray_half_0_\22*_%\22str\22*"(%"_NDArray_half_0_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [5 x i8]* @"formatter28" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

@"formatter28" = internal constant [5 x i8] c"half\00"
define i32 @"%\22_NDArray_half_0_\22.len_%\22_NDArray_half_0_\22*"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 0, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 0, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_half_0_\22.throwErr_%\22_NDArray_half_0_\22*_%\22str\22*"(%"_NDArray_half_0_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".134" = getelementptr half, half* null, i32 1
  %".135" = ptrtoint half* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call half* @"i8*->half*"(i8* %".138")
  store half* %".139", half** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_half_0_\22.throwErr_%\22_NDArray_half_0_\22*_%\22str\22*"(%"_NDArray_half_0_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".22" = load half*, half** %".21"
  %".23" = ptrtoint half* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr half, half* null, i32 1
  %".26" = ptrtoint half* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to half*
  ret half* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".97" = load half*, half** %".96"
  %".98" = ptrtoint half* %".97" to i64
  %".99" = getelementptr half, half* null, i32 1
  %".100" = ptrtoint half* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to half*
  ret half* %".105"
.55:
  %".59" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_0_\22.reshape_%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_half_0_"*
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_half_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_half_0_"*
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_half_0_"* %".9", %"_NDArray_half_0_"** %".4"
  %".12" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  %".13" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_half_0_\22.throwErr_%\22_NDArray_half_0_\22*_%\22str\22*"(%"_NDArray_half_0_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".1", i32* %".56", i32 1)
  %".61" = load half, half* %".60"
  store half %".61", half* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  ret %"_NDArray_half_0_"* %".64"
}

define void @"%\22_NDArray_half_0_\22.set_all_%\22_NDArray_half_0_\22*_half"(%"_NDArray_half_0_"* %".1", half %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".1", i32* %".22", i32 1)
  store half %".2", half* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_half_0_\22.zero_%\22_NDArray_half_0_\22*"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".1", i32* %".21", i32 1)
  %".26" = call half @"i32->half"(i32 0)
  store half %".26", half* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_half_0_\22.__print___%\22_NDArray_half_0_\22*"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".355" = load half*, half** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr half, half* %".355", i32 %".356"
  %".358" = load half, half* %".357"
  call void @"__print___half"(half %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_0_\22*->%\22_NDArray_half_0_\22*"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_half_0_"*
  %".18" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_half_0_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_half_0_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_half_0_"* %".23", %"_NDArray_half_0_"** %".17"
  %".27" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".17"
  %".28" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".30" = load half*, half** %".29"
  store half* %".30", half** %".28"
  %".32" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".17"
  ret %"_NDArray_half_0_"* %".32"
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_0_\22*->%\22_NDArray_half_0_\22*3"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_half_0_"*
  %".4" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_half_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_half_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_half_0_"* %".9", %"_NDArray_half_0_"** %".3"
  %".13" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".3"
  %".14" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".16" = load half*, half** %".15"
  store half* %".16", half** %".14"
  %".18" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".3"
  ret %"_NDArray_half_0_"* %".18"
}

define void @"%\22_NDArray_float_0_\22.throwErr_%\22_NDArray_float_0_\22*_%\22str\22*"(%"_NDArray_float_0_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [6 x i8]* @"formatter29" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

@"formatter29" = internal constant [6 x i8] c"float\00"
define i32 @"%\22_NDArray_float_0_\22.len_%\22_NDArray_float_0_\22*"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 0, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 0, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_float_0_\22.throwErr_%\22_NDArray_float_0_\22*_%\22str\22*"(%"_NDArray_float_0_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".134" = getelementptr float, float* null, i32 1
  %".135" = ptrtoint float* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call float* @"i8*->float*"(i8* %".138")
  store float* %".139", float** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_float_0_\22.throwErr_%\22_NDArray_float_0_\22*_%\22str\22*"(%"_NDArray_float_0_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".22" = load float*, float** %".21"
  %".23" = ptrtoint float* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr float, float* null, i32 1
  %".26" = ptrtoint float* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to float*
  ret float* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".97" = load float*, float** %".96"
  %".98" = ptrtoint float* %".97" to i64
  %".99" = getelementptr float, float* null, i32 1
  %".100" = ptrtoint float* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to float*
  ret float* %".105"
.55:
  %".59" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_0_\22.reshape_%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_float_0_"*
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_float_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_float_0_"*
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_float_0_"* %".9", %"_NDArray_float_0_"** %".4"
  %".12" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  %".13" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_float_0_\22.throwErr_%\22_NDArray_float_0_\22*_%\22str\22*"(%"_NDArray_float_0_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".1", i32* %".56", i32 1)
  %".61" = load float, float* %".60"
  store float %".61", float* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  ret %"_NDArray_float_0_"* %".64"
}

define void @"%\22_NDArray_float_0_\22.set_all_%\22_NDArray_float_0_\22*_float"(%"_NDArray_float_0_"* %".1", float %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".1", i32* %".22", i32 1)
  store float %".2", float* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_float_0_\22.zero_%\22_NDArray_float_0_\22*"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".1", i32* %".21", i32 1)
  %".26" = call float @"i32->float"(i32 0)
  store float %".26", float* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_float_0_\22.__print___%\22_NDArray_float_0_\22*"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".355" = load float*, float** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr float, float* %".355", i32 %".356"
  %".358" = load float, float* %".357"
  call void @"__print___float"(float %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_0_\22*->%\22_NDArray_float_0_\22*"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_float_0_"*
  %".18" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_float_0_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_float_0_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_float_0_"* %".23", %"_NDArray_float_0_"** %".17"
  %".27" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".17"
  %".28" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".30" = load float*, float** %".29"
  store float* %".30", float** %".28"
  %".32" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".17"
  ret %"_NDArray_float_0_"* %".32"
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_0_\22*->%\22_NDArray_float_0_\22*4"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_float_0_"*
  %".4" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_float_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_float_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_float_0_"* %".9", %"_NDArray_float_0_"** %".3"
  %".13" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  %".14" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".16" = load float*, float** %".15"
  store float* %".16", float** %".14"
  %".18" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  ret %"_NDArray_float_0_"* %".18"
}

define void @"%\22_NDArray_double_0_\22.throwErr_%\22_NDArray_double_0_\22*_%\22str\22*"(%"_NDArray_double_0_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [7 x i8]* @"formatter30" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

@"formatter30" = internal constant [7 x i8] c"double\00"
define i32 @"%\22_NDArray_double_0_\22.len_%\22_NDArray_double_0_\22*"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 0, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 0, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_double_0_\22.throwErr_%\22_NDArray_double_0_\22*_%\22str\22*"(%"_NDArray_double_0_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".134" = getelementptr double, double* null, i32 1
  %".135" = ptrtoint double* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call double* @"i8*->double*"(i8* %".138")
  store double* %".139", double** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_double_0_\22.throwErr_%\22_NDArray_double_0_\22*_%\22str\22*"(%"_NDArray_double_0_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".22" = load double*, double** %".21"
  %".23" = ptrtoint double* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr double, double* null, i32 1
  %".26" = ptrtoint double* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to double*
  ret double* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".97" = load double*, double** %".96"
  %".98" = ptrtoint double* %".97" to i64
  %".99" = getelementptr double, double* null, i32 1
  %".100" = ptrtoint double* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to double*
  ret double* %".105"
.55:
  %".59" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_0_\22.reshape_%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_double_0_"*
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_double_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_double_0_"*
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_double_0_"* %".9", %"_NDArray_double_0_"** %".4"
  %".12" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  %".13" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_double_0_\22.throwErr_%\22_NDArray_double_0_\22*_%\22str\22*"(%"_NDArray_double_0_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".1", i32* %".56", i32 1)
  %".61" = load double, double* %".60"
  store double %".61", double* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  ret %"_NDArray_double_0_"* %".64"
}

define void @"%\22_NDArray_double_0_\22.set_all_%\22_NDArray_double_0_\22*_double"(%"_NDArray_double_0_"* %".1", double %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".1", i32* %".22", i32 1)
  store double %".2", double* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_double_0_\22.zero_%\22_NDArray_double_0_\22*"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".1", i32* %".21", i32 1)
  %".26" = call double @"i32->double"(i32 0)
  store double %".26", double* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_double_0_\22.__print___%\22_NDArray_double_0_\22*"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".355" = load double*, double** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr double, double* %".355", i32 %".356"
  %".358" = load double, double* %".357"
  call void @"__print___double"(double %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_0_\22*->%\22_NDArray_double_0_\22*"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 0)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_double_0_"*
  %".18" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_double_0_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_double_0_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_double_0_"* %".23", %"_NDArray_double_0_"** %".17"
  %".27" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".17"
  %".28" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".30" = load double*, double** %".29"
  store double* %".30", double** %".28"
  %".32" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".17"
  ret %"_NDArray_double_0_"* %".32"
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_0_\22*->%\22_NDArray_double_0_\22*5"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_double_0_"*
  %".4" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_double_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_double_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_double_0_"* %".9", %"_NDArray_double_0_"** %".3"
  %".13" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".3"
  %".14" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".16" = load double*, double** %".15"
  store double* %".16", double** %".14"
  %".18" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".3"
  ret %"_NDArray_double_0_"* %".18"
}

define void @"%\22_NDArray_char_2_\22.throwErr_%\22_NDArray_char_2_\22*_%\22str\22*"(%"_NDArray_char_2_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [3 x i8]* @"formatter18" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_char_2_\22.len_%\22_NDArray_char_2_\22*"(%"_NDArray_char_2_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_char_2_\22.__init___%\22_NDArray_char_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 2, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 2, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_char_2_\22.throwErr_%\22_NDArray_char_2_\22*_%\22str\22*"(%"_NDArray_char_2_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".134" = getelementptr i8, i8* null, i32 1
  %".135" = ptrtoint i8* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  store i8* %".138", i8** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i8* @"%\22_NDArray_char_2_\22.__index___%\22_NDArray_char_2_\22*_i32*_i32"(%"_NDArray_char_2_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_char_2_\22.throwErr_%\22_NDArray_char_2_\22*_%\22str\22*"(%"_NDArray_char_2_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 0
  %".22" = load i8*, i8** %".21"
  %".23" = ptrtoint i8* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i8, i8* null, i32 1
  %".26" = ptrtoint i8* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i8*
  ret i8* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 0
  %".97" = load i8*, i8** %".96"
  %".98" = ptrtoint i8* %".97" to i64
  %".99" = getelementptr i8, i8* null, i32 1
  %".100" = ptrtoint i8* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i8*
  ret i8* %".105"
.55:
  %".59" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_char_0_"* @"%\22_NDArray_char_2_\22.reshape_%\22_NDArray_char_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_char_0_"*
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_char_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_char_0_"*
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_char_0_"* %".9", %"_NDArray_char_0_"** %".4"
  %".12" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  %".13" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_char_2_\22.throwErr_%\22_NDArray_char_2_\22*_%\22str\22*"(%"_NDArray_char_2_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i8* @"%\22_NDArray_char_2_\22.__index___%\22_NDArray_char_2_\22*_i32*_i32"(%"_NDArray_char_2_"* %".1", i32* %".56", i32 1)
  %".61" = load i8, i8* %".60"
  store i8 %".61", i8* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  ret %"_NDArray_char_0_"* %".64"
}

define void @"%\22_NDArray_char_2_\22.set_all_%\22_NDArray_char_2_\22*_i8"(%"_NDArray_char_2_"* %".1", i8 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i8* @"%\22_NDArray_char_2_\22.__index___%\22_NDArray_char_2_\22*_i32*_i32"(%"_NDArray_char_2_"* %".1", i32* %".22", i32 1)
  store i8 %".2", i8* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_char_2_\22.zero_%\22_NDArray_char_2_\22*"(%"_NDArray_char_2_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i8* @"%\22_NDArray_char_2_\22.__index___%\22_NDArray_char_2_\22*_i32*_i32"(%"_NDArray_char_2_"* %".1", i32* %".21", i32 1)
  %".26" = call i8 @"i32->i8"(i32 0)
  store i8 %".26", i8* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_char_2_\22.__print___%\22_NDArray_char_2_\22*"(%"_NDArray_char_2_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 0
  %".355" = load i8*, i8** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i8, i8* %".355", i32 %".356"
  %".358" = load i8, i8* %".357"
  call void @"__print___i8"(i8 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_char_2_"* @"%\22_NDArray_char_0_\22*->%\22_NDArray_char_2_\22*"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 2)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_char_2_"*
  %".18" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_char_2_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_char_2_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_char_2_\22.__init___%\22_NDArray_char_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_2_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_char_2_"* %".23", %"_NDArray_char_2_"** %".17"
  %".27" = load %"_NDArray_char_2_"*, %"_NDArray_char_2_"** %".17"
  %".28" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".30" = load i8*, i8** %".29"
  store i8* %".30", i8** %".28"
  %".32" = load %"_NDArray_char_2_"*, %"_NDArray_char_2_"** %".17"
  ret %"_NDArray_char_2_"* %".32"
}

define %"_NDArray_char_0_"* @"%\22_NDArray_char_2_\22*->%\22_NDArray_char_0_\22*"(%"_NDArray_char_2_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_char_0_"*
  %".4" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_char_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_char_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_char_0_"* %".9", %"_NDArray_char_0_"** %".3"
  %".13" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".3"
  %".14" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_char_2_", %"_NDArray_char_2_"* %".1", i32 0, i32 0
  %".16" = load i8*, i8** %".15"
  store i8* %".16", i8** %".14"
  %".18" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".3"
  ret %"_NDArray_char_0_"* %".18"
}

define void @"%\22_NDArray_int_2_\22.throwErr_%\22_NDArray_int_2_\22*_%\22str\22*"(%"_NDArray_int_2_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [4 x i8]* @"formatter26" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_int_2_\22.len_%\22_NDArray_int_2_\22*"(%"_NDArray_int_2_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_int_2_\22.__init___%\22_NDArray_int_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 2, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 2, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_int_2_\22.throwErr_%\22_NDArray_int_2_\22*_%\22str\22*"(%"_NDArray_int_2_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".134" = getelementptr i32, i32* null, i32 1
  %".135" = ptrtoint i32* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call i32* @"i8*->i32*"(i8* %".138")
  store i32* %".139", i32** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i32* @"%\22_NDArray_int_2_\22.__index___%\22_NDArray_int_2_\22*_i32*_i32"(%"_NDArray_int_2_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_int_2_\22.throwErr_%\22_NDArray_int_2_\22*_%\22str\22*"(%"_NDArray_int_2_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 0
  %".22" = load i32*, i32** %".21"
  %".23" = ptrtoint i32* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i32, i32* null, i32 1
  %".26" = ptrtoint i32* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i32*
  ret i32* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 0
  %".97" = load i32*, i32** %".96"
  %".98" = ptrtoint i32* %".97" to i64
  %".99" = getelementptr i32, i32* null, i32 1
  %".100" = ptrtoint i32* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i32*
  ret i32* %".105"
.55:
  %".59" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_2_\22.reshape_%\22_NDArray_int_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_int_0_"*
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_int_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_int_0_"*
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_int_0_"* %".9", %"_NDArray_int_0_"** %".4"
  %".12" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  %".13" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_int_2_\22.throwErr_%\22_NDArray_int_2_\22*_%\22str\22*"(%"_NDArray_int_2_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i32* @"%\22_NDArray_int_2_\22.__index___%\22_NDArray_int_2_\22*_i32*_i32"(%"_NDArray_int_2_"* %".1", i32* %".56", i32 1)
  %".61" = load i32, i32* %".60"
  store i32 %".61", i32* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  ret %"_NDArray_int_0_"* %".64"
}

define void @"%\22_NDArray_int_2_\22.set_all_%\22_NDArray_int_2_\22*_i32"(%"_NDArray_int_2_"* %".1", i32 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i32* @"%\22_NDArray_int_2_\22.__index___%\22_NDArray_int_2_\22*_i32*_i32"(%"_NDArray_int_2_"* %".1", i32* %".22", i32 1)
  store i32 %".2", i32* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_int_2_\22.zero_%\22_NDArray_int_2_\22*"(%"_NDArray_int_2_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i32* @"%\22_NDArray_int_2_\22.__index___%\22_NDArray_int_2_\22*_i32*_i32"(%"_NDArray_int_2_"* %".1", i32* %".21", i32 1)
  store i32 0, i32* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_int_2_\22.__print___%\22_NDArray_int_2_\22*"(%"_NDArray_int_2_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 0
  %".355" = load i32*, i32** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i32, i32* %".355", i32 %".356"
  %".358" = load i32, i32* %".357"
  call void @"__print___i32"(i32 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_int_2_"* @"%\22_NDArray_int_0_\22*->%\22_NDArray_int_2_\22*"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 2)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_int_2_"*
  %".18" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_int_2_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_int_2_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_int_2_\22.__init___%\22_NDArray_int_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_2_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_int_2_"* %".23", %"_NDArray_int_2_"** %".17"
  %".27" = load %"_NDArray_int_2_"*, %"_NDArray_int_2_"** %".17"
  %".28" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".30" = load i32*, i32** %".29"
  store i32* %".30", i32** %".28"
  %".32" = load %"_NDArray_int_2_"*, %"_NDArray_int_2_"** %".17"
  ret %"_NDArray_int_2_"* %".32"
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_2_\22*->%\22_NDArray_int_0_\22*"(%"_NDArray_int_2_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_int_0_"*
  %".4" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_int_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_int_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_int_0_"* %".9", %"_NDArray_int_0_"** %".3"
  %".13" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".3"
  %".14" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_int_2_", %"_NDArray_int_2_"* %".1", i32 0, i32 0
  %".16" = load i32*, i32** %".15"
  store i32* %".16", i32** %".14"
  %".18" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".3"
  ret %"_NDArray_int_0_"* %".18"
}

define void @"%\22_NDArray_long_2_\22.throwErr_%\22_NDArray_long_2_\22*_%\22str\22*"(%"_NDArray_long_2_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [4 x i8]* @"formatter27" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_long_2_\22.len_%\22_NDArray_long_2_\22*"(%"_NDArray_long_2_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_long_2_\22.__init___%\22_NDArray_long_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 2, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 2, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_long_2_\22.throwErr_%\22_NDArray_long_2_\22*_%\22str\22*"(%"_NDArray_long_2_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".134" = getelementptr i64, i64* null, i32 1
  %".135" = ptrtoint i64* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call i64* @"i8*->i64*"(i8* %".138")
  store i64* %".139", i64** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i64* @"%\22_NDArray_long_2_\22.__index___%\22_NDArray_long_2_\22*_i32*_i32"(%"_NDArray_long_2_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_long_2_\22.throwErr_%\22_NDArray_long_2_\22*_%\22str\22*"(%"_NDArray_long_2_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 0
  %".22" = load i64*, i64** %".21"
  %".23" = ptrtoint i64* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i64, i64* null, i32 1
  %".26" = ptrtoint i64* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i64*
  ret i64* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 0
  %".97" = load i64*, i64** %".96"
  %".98" = ptrtoint i64* %".97" to i64
  %".99" = getelementptr i64, i64* null, i32 1
  %".100" = ptrtoint i64* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i64*
  ret i64* %".105"
.55:
  %".59" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_2_\22.reshape_%\22_NDArray_long_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_long_0_"*
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_long_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_long_0_"*
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_long_0_"* %".9", %"_NDArray_long_0_"** %".4"
  %".12" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  %".13" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_long_2_\22.throwErr_%\22_NDArray_long_2_\22*_%\22str\22*"(%"_NDArray_long_2_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i64* @"%\22_NDArray_long_2_\22.__index___%\22_NDArray_long_2_\22*_i32*_i32"(%"_NDArray_long_2_"* %".1", i32* %".56", i32 1)
  %".61" = load i64, i64* %".60"
  store i64 %".61", i64* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  ret %"_NDArray_long_0_"* %".64"
}

define void @"%\22_NDArray_long_2_\22.set_all_%\22_NDArray_long_2_\22*_i64"(%"_NDArray_long_2_"* %".1", i64 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i64* @"%\22_NDArray_long_2_\22.__index___%\22_NDArray_long_2_\22*_i32*_i32"(%"_NDArray_long_2_"* %".1", i32* %".22", i32 1)
  store i64 %".2", i64* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_long_2_\22.zero_%\22_NDArray_long_2_\22*"(%"_NDArray_long_2_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i64* @"%\22_NDArray_long_2_\22.__index___%\22_NDArray_long_2_\22*_i32*_i32"(%"_NDArray_long_2_"* %".1", i32* %".21", i32 1)
  %".26" = call i64 @"i32->i64"(i32 0)
  store i64 %".26", i64* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_long_2_\22.__print___%\22_NDArray_long_2_\22*"(%"_NDArray_long_2_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 0
  %".355" = load i64*, i64** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i64, i64* %".355", i32 %".356"
  %".358" = load i64, i64* %".357"
  call void @"__print___i64"(i64 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_long_2_"* @"%\22_NDArray_long_0_\22*->%\22_NDArray_long_2_\22*"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 2)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_long_2_"*
  %".18" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_long_2_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_long_2_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_long_2_\22.__init___%\22_NDArray_long_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_2_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_long_2_"* %".23", %"_NDArray_long_2_"** %".17"
  %".27" = load %"_NDArray_long_2_"*, %"_NDArray_long_2_"** %".17"
  %".28" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".30" = load i64*, i64** %".29"
  store i64* %".30", i64** %".28"
  %".32" = load %"_NDArray_long_2_"*, %"_NDArray_long_2_"** %".17"
  ret %"_NDArray_long_2_"* %".32"
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_2_\22*->%\22_NDArray_long_0_\22*"(%"_NDArray_long_2_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_long_0_"*
  %".4" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_long_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_long_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_long_0_"* %".9", %"_NDArray_long_0_"** %".3"
  %".13" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".3"
  %".14" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_long_2_", %"_NDArray_long_2_"* %".1", i32 0, i32 0
  %".16" = load i64*, i64** %".15"
  store i64* %".16", i64** %".14"
  %".18" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".3"
  ret %"_NDArray_long_0_"* %".18"
}

define void @"%\22_NDArray_half_2_\22.throwErr_%\22_NDArray_half_2_\22*_%\22str\22*"(%"_NDArray_half_2_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [5 x i8]* @"formatter28" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_half_2_\22.len_%\22_NDArray_half_2_\22*"(%"_NDArray_half_2_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_half_2_\22.__init___%\22_NDArray_half_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 2, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 2, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_half_2_\22.throwErr_%\22_NDArray_half_2_\22*_%\22str\22*"(%"_NDArray_half_2_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".134" = getelementptr half, half* null, i32 1
  %".135" = ptrtoint half* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call half* @"i8*->half*"(i8* %".138")
  store half* %".139", half** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define half* @"%\22_NDArray_half_2_\22.__index___%\22_NDArray_half_2_\22*_i32*_i32"(%"_NDArray_half_2_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_half_2_\22.throwErr_%\22_NDArray_half_2_\22*_%\22str\22*"(%"_NDArray_half_2_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 0
  %".22" = load half*, half** %".21"
  %".23" = ptrtoint half* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr half, half* null, i32 1
  %".26" = ptrtoint half* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to half*
  ret half* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 0
  %".97" = load half*, half** %".96"
  %".98" = ptrtoint half* %".97" to i64
  %".99" = getelementptr half, half* null, i32 1
  %".100" = ptrtoint half* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to half*
  ret half* %".105"
.55:
  %".59" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_2_\22.reshape_%\22_NDArray_half_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_half_0_"*
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_half_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_half_0_"*
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_half_0_"* %".9", %"_NDArray_half_0_"** %".4"
  %".12" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  %".13" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_half_2_\22.throwErr_%\22_NDArray_half_2_\22*_%\22str\22*"(%"_NDArray_half_2_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call half* @"%\22_NDArray_half_2_\22.__index___%\22_NDArray_half_2_\22*_i32*_i32"(%"_NDArray_half_2_"* %".1", i32* %".56", i32 1)
  %".61" = load half, half* %".60"
  store half %".61", half* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  ret %"_NDArray_half_0_"* %".64"
}

define void @"%\22_NDArray_half_2_\22.set_all_%\22_NDArray_half_2_\22*_half"(%"_NDArray_half_2_"* %".1", half %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call half* @"%\22_NDArray_half_2_\22.__index___%\22_NDArray_half_2_\22*_i32*_i32"(%"_NDArray_half_2_"* %".1", i32* %".22", i32 1)
  store half %".2", half* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_half_2_\22.zero_%\22_NDArray_half_2_\22*"(%"_NDArray_half_2_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call half* @"%\22_NDArray_half_2_\22.__index___%\22_NDArray_half_2_\22*_i32*_i32"(%"_NDArray_half_2_"* %".1", i32* %".21", i32 1)
  %".26" = call half @"i32->half"(i32 0)
  store half %".26", half* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_half_2_\22.__print___%\22_NDArray_half_2_\22*"(%"_NDArray_half_2_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 0
  %".355" = load half*, half** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr half, half* %".355", i32 %".356"
  %".358" = load half, half* %".357"
  call void @"__print___half"(half %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_half_2_"* @"%\22_NDArray_half_0_\22*->%\22_NDArray_half_2_\22*"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 2)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_half_2_"*
  %".18" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_half_2_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_half_2_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_half_2_\22.__init___%\22_NDArray_half_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_2_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_half_2_"* %".23", %"_NDArray_half_2_"** %".17"
  %".27" = load %"_NDArray_half_2_"*, %"_NDArray_half_2_"** %".17"
  %".28" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".30" = load half*, half** %".29"
  store half* %".30", half** %".28"
  %".32" = load %"_NDArray_half_2_"*, %"_NDArray_half_2_"** %".17"
  ret %"_NDArray_half_2_"* %".32"
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_2_\22*->%\22_NDArray_half_0_\22*"(%"_NDArray_half_2_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_half_0_"*
  %".4" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_half_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_half_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_half_0_"* %".9", %"_NDArray_half_0_"** %".3"
  %".13" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".3"
  %".14" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_half_2_", %"_NDArray_half_2_"* %".1", i32 0, i32 0
  %".16" = load half*, half** %".15"
  store half* %".16", half** %".14"
  %".18" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".3"
  ret %"_NDArray_half_0_"* %".18"
}

define void @"%\22_NDArray_float_2_\22.throwErr_%\22_NDArray_float_2_\22*_%\22str\22*"(%"_NDArray_float_2_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [6 x i8]* @"formatter29" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_float_2_\22.len_%\22_NDArray_float_2_\22*"(%"_NDArray_float_2_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_float_2_\22.__init___%\22_NDArray_float_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 2, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 2, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_float_2_\22.throwErr_%\22_NDArray_float_2_\22*_%\22str\22*"(%"_NDArray_float_2_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".134" = getelementptr float, float* null, i32 1
  %".135" = ptrtoint float* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call float* @"i8*->float*"(i8* %".138")
  store float* %".139", float** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define float* @"%\22_NDArray_float_2_\22.__index___%\22_NDArray_float_2_\22*_i32*_i32"(%"_NDArray_float_2_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_float_2_\22.throwErr_%\22_NDArray_float_2_\22*_%\22str\22*"(%"_NDArray_float_2_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 0
  %".22" = load float*, float** %".21"
  %".23" = ptrtoint float* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr float, float* null, i32 1
  %".26" = ptrtoint float* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to float*
  ret float* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 0
  %".97" = load float*, float** %".96"
  %".98" = ptrtoint float* %".97" to i64
  %".99" = getelementptr float, float* null, i32 1
  %".100" = ptrtoint float* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to float*
  ret float* %".105"
.55:
  %".59" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_2_\22.reshape_%\22_NDArray_float_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_float_0_"*
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_float_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_float_0_"*
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_float_0_"* %".9", %"_NDArray_float_0_"** %".4"
  %".12" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  %".13" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_float_2_\22.throwErr_%\22_NDArray_float_2_\22*_%\22str\22*"(%"_NDArray_float_2_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call float* @"%\22_NDArray_float_2_\22.__index___%\22_NDArray_float_2_\22*_i32*_i32"(%"_NDArray_float_2_"* %".1", i32* %".56", i32 1)
  %".61" = load float, float* %".60"
  store float %".61", float* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  ret %"_NDArray_float_0_"* %".64"
}

define void @"%\22_NDArray_float_2_\22.set_all_%\22_NDArray_float_2_\22*_float"(%"_NDArray_float_2_"* %".1", float %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call float* @"%\22_NDArray_float_2_\22.__index___%\22_NDArray_float_2_\22*_i32*_i32"(%"_NDArray_float_2_"* %".1", i32* %".22", i32 1)
  store float %".2", float* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_float_2_\22.zero_%\22_NDArray_float_2_\22*"(%"_NDArray_float_2_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call float* @"%\22_NDArray_float_2_\22.__index___%\22_NDArray_float_2_\22*_i32*_i32"(%"_NDArray_float_2_"* %".1", i32* %".21", i32 1)
  %".26" = call float @"i32->float"(i32 0)
  store float %".26", float* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_float_2_\22.__print___%\22_NDArray_float_2_\22*"(%"_NDArray_float_2_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 0
  %".355" = load float*, float** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr float, float* %".355", i32 %".356"
  %".358" = load float, float* %".357"
  call void @"__print___float"(float %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_float_2_"* @"%\22_NDArray_float_0_\22*->%\22_NDArray_float_2_\22*"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 2)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_float_2_"*
  %".18" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_float_2_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_float_2_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_float_2_\22.__init___%\22_NDArray_float_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_2_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_float_2_"* %".23", %"_NDArray_float_2_"** %".17"
  %".27" = load %"_NDArray_float_2_"*, %"_NDArray_float_2_"** %".17"
  %".28" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".30" = load float*, float** %".29"
  store float* %".30", float** %".28"
  %".32" = load %"_NDArray_float_2_"*, %"_NDArray_float_2_"** %".17"
  ret %"_NDArray_float_2_"* %".32"
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_2_\22*->%\22_NDArray_float_0_\22*"(%"_NDArray_float_2_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_float_0_"*
  %".4" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_float_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_float_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_float_0_"* %".9", %"_NDArray_float_0_"** %".3"
  %".13" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  %".14" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_float_2_", %"_NDArray_float_2_"* %".1", i32 0, i32 0
  %".16" = load float*, float** %".15"
  store float* %".16", float** %".14"
  %".18" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  ret %"_NDArray_float_0_"* %".18"
}

define void @"%\22_NDArray_double_2_\22.throwErr_%\22_NDArray_double_2_\22*_%\22str\22*"(%"_NDArray_double_2_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [7 x i8]* @"formatter30" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_double_2_\22.len_%\22_NDArray_double_2_\22*"(%"_NDArray_double_2_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_double_2_\22.__init___%\22_NDArray_double_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 2, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 2, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_double_2_\22.throwErr_%\22_NDArray_double_2_\22*_%\22str\22*"(%"_NDArray_double_2_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".134" = getelementptr double, double* null, i32 1
  %".135" = ptrtoint double* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call double* @"i8*->double*"(i8* %".138")
  store double* %".139", double** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define double* @"%\22_NDArray_double_2_\22.__index___%\22_NDArray_double_2_\22*_i32*_i32"(%"_NDArray_double_2_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_double_2_\22.throwErr_%\22_NDArray_double_2_\22*_%\22str\22*"(%"_NDArray_double_2_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 0
  %".22" = load double*, double** %".21"
  %".23" = ptrtoint double* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr double, double* null, i32 1
  %".26" = ptrtoint double* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to double*
  ret double* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 0
  %".97" = load double*, double** %".96"
  %".98" = ptrtoint double* %".97" to i64
  %".99" = getelementptr double, double* null, i32 1
  %".100" = ptrtoint double* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to double*
  ret double* %".105"
.55:
  %".59" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_2_\22.reshape_%\22_NDArray_double_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_2_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_double_0_"*
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_double_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_double_0_"*
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_double_0_"* %".9", %"_NDArray_double_0_"** %".4"
  %".12" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  %".13" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_double_2_\22.throwErr_%\22_NDArray_double_2_\22*_%\22str\22*"(%"_NDArray_double_2_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call double* @"%\22_NDArray_double_2_\22.__index___%\22_NDArray_double_2_\22*_i32*_i32"(%"_NDArray_double_2_"* %".1", i32* %".56", i32 1)
  %".61" = load double, double* %".60"
  store double %".61", double* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  ret %"_NDArray_double_0_"* %".64"
}

define void @"%\22_NDArray_double_2_\22.set_all_%\22_NDArray_double_2_\22*_double"(%"_NDArray_double_2_"* %".1", double %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call double* @"%\22_NDArray_double_2_\22.__index___%\22_NDArray_double_2_\22*_i32*_i32"(%"_NDArray_double_2_"* %".1", i32* %".22", i32 1)
  store double %".2", double* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_double_2_\22.zero_%\22_NDArray_double_2_\22*"(%"_NDArray_double_2_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call double* @"%\22_NDArray_double_2_\22.__index___%\22_NDArray_double_2_\22*_i32*_i32"(%"_NDArray_double_2_"* %".1", i32* %".21", i32 1)
  %".26" = call double @"i32->double"(i32 0)
  store double %".26", double* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_double_2_\22.__print___%\22_NDArray_double_2_\22*"(%"_NDArray_double_2_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 0
  %".355" = load double*, double** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr double, double* %".355", i32 %".356"
  %".358" = load double, double* %".357"
  call void @"__print___double"(double %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_double_2_"* @"%\22_NDArray_double_0_\22*->%\22_NDArray_double_2_\22*"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 2)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_double_2_"*
  %".18" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_double_2_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_double_2_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_double_2_\22.__init___%\22_NDArray_double_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_2_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_double_2_"* %".23", %"_NDArray_double_2_"** %".17"
  %".27" = load %"_NDArray_double_2_"*, %"_NDArray_double_2_"** %".17"
  %".28" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".30" = load double*, double** %".29"
  store double* %".30", double** %".28"
  %".32" = load %"_NDArray_double_2_"*, %"_NDArray_double_2_"** %".17"
  ret %"_NDArray_double_2_"* %".32"
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_2_\22*->%\22_NDArray_double_0_\22*"(%"_NDArray_double_2_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_double_0_"*
  %".4" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_double_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_double_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_double_0_"* %".9", %"_NDArray_double_0_"** %".3"
  %".13" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".3"
  %".14" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_double_2_", %"_NDArray_double_2_"* %".1", i32 0, i32 0
  %".16" = load double*, double** %".15"
  store double* %".16", double** %".14"
  %".18" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".3"
  ret %"_NDArray_double_0_"* %".18"
}

define void @"%\22_NDArray_char_1_\22.throwErr_%\22_NDArray_char_1_\22*_%\22str\22*"(%"_NDArray_char_1_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [3 x i8]* @"formatter18" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_char_1_\22.len_%\22_NDArray_char_1_\22*"(%"_NDArray_char_1_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_char_1_\22.__init___%\22_NDArray_char_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 1, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_char_1_\22.throwErr_%\22_NDArray_char_1_\22*_%\22str\22*"(%"_NDArray_char_1_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".134" = getelementptr i8, i8* null, i32 1
  %".135" = ptrtoint i8* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  store i8* %".138", i8** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i8* @"%\22_NDArray_char_1_\22.__index___%\22_NDArray_char_1_\22*_i32*_i32"(%"_NDArray_char_1_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_char_1_\22.throwErr_%\22_NDArray_char_1_\22*_%\22str\22*"(%"_NDArray_char_1_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 0
  %".22" = load i8*, i8** %".21"
  %".23" = ptrtoint i8* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i8, i8* null, i32 1
  %".26" = ptrtoint i8* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i8*
  ret i8* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 0
  %".97" = load i8*, i8** %".96"
  %".98" = ptrtoint i8* %".97" to i64
  %".99" = getelementptr i8, i8* null, i32 1
  %".100" = ptrtoint i8* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i8*
  ret i8* %".105"
.55:
  %".59" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_char_0_"* @"%\22_NDArray_char_1_\22.reshape_%\22_NDArray_char_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_char_0_"*
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_char_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_char_0_"*
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_char_0_"* %".9", %"_NDArray_char_0_"** %".4"
  %".12" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  %".13" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_char_1_\22.throwErr_%\22_NDArray_char_1_\22*_%\22str\22*"(%"_NDArray_char_1_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i8* @"%\22_NDArray_char_0_\22.__index___%\22_NDArray_char_0_\22*_i32*_i32"(%"_NDArray_char_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i8* @"%\22_NDArray_char_1_\22.__index___%\22_NDArray_char_1_\22*_i32*_i32"(%"_NDArray_char_1_"* %".1", i32* %".56", i32 1)
  %".61" = load i8, i8* %".60"
  store i8 %".61", i8* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".4"
  ret %"_NDArray_char_0_"* %".64"
}

define void @"%\22_NDArray_char_1_\22.set_all_%\22_NDArray_char_1_\22*_i8"(%"_NDArray_char_1_"* %".1", i8 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i8* @"%\22_NDArray_char_1_\22.__index___%\22_NDArray_char_1_\22*_i32*_i32"(%"_NDArray_char_1_"* %".1", i32* %".22", i32 1)
  store i8 %".2", i8* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_char_1_\22.zero_%\22_NDArray_char_1_\22*"(%"_NDArray_char_1_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i8* @"%\22_NDArray_char_1_\22.__index___%\22_NDArray_char_1_\22*_i32*_i32"(%"_NDArray_char_1_"* %".1", i32* %".21", i32 1)
  %".26" = call i8 @"i32->i8"(i32 0)
  store i8 %".26", i8* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_char_1_\22.__print___%\22_NDArray_char_1_\22*"(%"_NDArray_char_1_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 0
  %".355" = load i8*, i8** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i8, i8* %".355", i32 %".356"
  %".358" = load i8, i8* %".357"
  call void @"__print___i8"(i8 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_char_1_"* @"%\22_NDArray_char_0_\22*->%\22_NDArray_char_1_\22*"(%"_NDArray_char_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 1)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_char_1_"*
  %".18" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_char_1_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_char_1_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_char_1_\22.__init___%\22_NDArray_char_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_1_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_char_1_"* %".23", %"_NDArray_char_1_"** %".17"
  %".27" = load %"_NDArray_char_1_"*, %"_NDArray_char_1_"** %".17"
  %".28" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".1", i32 0, i32 0
  %".30" = load i8*, i8** %".29"
  store i8* %".30", i8** %".28"
  %".32" = load %"_NDArray_char_1_"*, %"_NDArray_char_1_"** %".17"
  ret %"_NDArray_char_1_"* %".32"
}

define %"_NDArray_char_0_"* @"%\22_NDArray_char_1_\22*->%\22_NDArray_char_0_\22*"(%"_NDArray_char_1_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_char_0_"*
  %".4" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_char_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_char_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_char_0_\22.__init___%\22_NDArray_char_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_char_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_char_0_"* %".9", %"_NDArray_char_0_"** %".3"
  %".13" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".3"
  %".14" = getelementptr %"_NDArray_char_0_", %"_NDArray_char_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_char_1_", %"_NDArray_char_1_"* %".1", i32 0, i32 0
  %".16" = load i8*, i8** %".15"
  store i8* %".16", i8** %".14"
  %".18" = load %"_NDArray_char_0_"*, %"_NDArray_char_0_"** %".3"
  ret %"_NDArray_char_0_"* %".18"
}

define void @"%\22_NDArray_int_1_\22.throwErr_%\22_NDArray_int_1_\22*_%\22str\22*"(%"_NDArray_int_1_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [4 x i8]* @"formatter26" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_int_1_\22.len_%\22_NDArray_int_1_\22*"(%"_NDArray_int_1_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_int_1_\22.__init___%\22_NDArray_int_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 1, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_int_1_\22.throwErr_%\22_NDArray_int_1_\22*_%\22str\22*"(%"_NDArray_int_1_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".134" = getelementptr i32, i32* null, i32 1
  %".135" = ptrtoint i32* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call i32* @"i8*->i32*"(i8* %".138")
  store i32* %".139", i32** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i32* @"%\22_NDArray_int_1_\22.__index___%\22_NDArray_int_1_\22*_i32*_i32"(%"_NDArray_int_1_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_int_1_\22.throwErr_%\22_NDArray_int_1_\22*_%\22str\22*"(%"_NDArray_int_1_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 0
  %".22" = load i32*, i32** %".21"
  %".23" = ptrtoint i32* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i32, i32* null, i32 1
  %".26" = ptrtoint i32* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i32*
  ret i32* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 0
  %".97" = load i32*, i32** %".96"
  %".98" = ptrtoint i32* %".97" to i64
  %".99" = getelementptr i32, i32* null, i32 1
  %".100" = ptrtoint i32* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i32*
  ret i32* %".105"
.55:
  %".59" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_1_\22.reshape_%\22_NDArray_int_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_int_0_"*
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_int_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_int_0_"*
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_int_0_"* %".9", %"_NDArray_int_0_"** %".4"
  %".12" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  %".13" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_int_1_\22.throwErr_%\22_NDArray_int_1_\22*_%\22str\22*"(%"_NDArray_int_1_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i32* @"%\22_NDArray_int_0_\22.__index___%\22_NDArray_int_0_\22*_i32*_i32"(%"_NDArray_int_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i32* @"%\22_NDArray_int_1_\22.__index___%\22_NDArray_int_1_\22*_i32*_i32"(%"_NDArray_int_1_"* %".1", i32* %".56", i32 1)
  %".61" = load i32, i32* %".60"
  store i32 %".61", i32* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".4"
  ret %"_NDArray_int_0_"* %".64"
}

define void @"%\22_NDArray_int_1_\22.set_all_%\22_NDArray_int_1_\22*_i32"(%"_NDArray_int_1_"* %".1", i32 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i32* @"%\22_NDArray_int_1_\22.__index___%\22_NDArray_int_1_\22*_i32*_i32"(%"_NDArray_int_1_"* %".1", i32* %".22", i32 1)
  store i32 %".2", i32* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_int_1_\22.zero_%\22_NDArray_int_1_\22*"(%"_NDArray_int_1_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i32* @"%\22_NDArray_int_1_\22.__index___%\22_NDArray_int_1_\22*_i32*_i32"(%"_NDArray_int_1_"* %".1", i32* %".21", i32 1)
  store i32 0, i32* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_int_1_\22.__print___%\22_NDArray_int_1_\22*"(%"_NDArray_int_1_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 0
  %".355" = load i32*, i32** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i32, i32* %".355", i32 %".356"
  %".358" = load i32, i32* %".357"
  call void @"__print___i32"(i32 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_int_1_"* @"%\22_NDArray_int_0_\22*->%\22_NDArray_int_1_\22*"(%"_NDArray_int_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 1)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_int_1_"*
  %".18" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_int_1_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_int_1_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_int_1_\22.__init___%\22_NDArray_int_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_1_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_int_1_"* %".23", %"_NDArray_int_1_"** %".17"
  %".27" = load %"_NDArray_int_1_"*, %"_NDArray_int_1_"** %".17"
  %".28" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".1", i32 0, i32 0
  %".30" = load i32*, i32** %".29"
  store i32* %".30", i32** %".28"
  %".32" = load %"_NDArray_int_1_"*, %"_NDArray_int_1_"** %".17"
  ret %"_NDArray_int_1_"* %".32"
}

define %"_NDArray_int_0_"* @"%\22_NDArray_int_1_\22*->%\22_NDArray_int_0_\22*"(%"_NDArray_int_1_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_int_0_"*
  %".4" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_int_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_int_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_int_0_\22.__init___%\22_NDArray_int_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_int_0_"* %".9", %"_NDArray_int_0_"** %".3"
  %".13" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".3"
  %".14" = getelementptr %"_NDArray_int_0_", %"_NDArray_int_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* %".1", i32 0, i32 0
  %".16" = load i32*, i32** %".15"
  store i32* %".16", i32** %".14"
  %".18" = load %"_NDArray_int_0_"*, %"_NDArray_int_0_"** %".3"
  ret %"_NDArray_int_0_"* %".18"
}

define void @"%\22_NDArray_long_1_\22.throwErr_%\22_NDArray_long_1_\22*_%\22str\22*"(%"_NDArray_long_1_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [4 x i8]* @"formatter27" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_long_1_\22.len_%\22_NDArray_long_1_\22*"(%"_NDArray_long_1_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_long_1_\22.__init___%\22_NDArray_long_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 1, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_long_1_\22.throwErr_%\22_NDArray_long_1_\22*_%\22str\22*"(%"_NDArray_long_1_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".134" = getelementptr i64, i64* null, i32 1
  %".135" = ptrtoint i64* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call i64* @"i8*->i64*"(i8* %".138")
  store i64* %".139", i64** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define i64* @"%\22_NDArray_long_1_\22.__index___%\22_NDArray_long_1_\22*_i32*_i32"(%"_NDArray_long_1_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_long_1_\22.throwErr_%\22_NDArray_long_1_\22*_%\22str\22*"(%"_NDArray_long_1_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 0
  %".22" = load i64*, i64** %".21"
  %".23" = ptrtoint i64* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr i64, i64* null, i32 1
  %".26" = ptrtoint i64* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to i64*
  ret i64* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 0
  %".97" = load i64*, i64** %".96"
  %".98" = ptrtoint i64* %".97" to i64
  %".99" = getelementptr i64, i64* null, i32 1
  %".100" = ptrtoint i64* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to i64*
  ret i64* %".105"
.55:
  %".59" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_1_\22.reshape_%\22_NDArray_long_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_long_0_"*
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_long_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_long_0_"*
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_long_0_"* %".9", %"_NDArray_long_0_"** %".4"
  %".12" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  %".13" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_long_1_\22.throwErr_%\22_NDArray_long_1_\22*_%\22str\22*"(%"_NDArray_long_1_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call i64* @"%\22_NDArray_long_0_\22.__index___%\22_NDArray_long_0_\22*_i32*_i32"(%"_NDArray_long_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call i64* @"%\22_NDArray_long_1_\22.__index___%\22_NDArray_long_1_\22*_i32*_i32"(%"_NDArray_long_1_"* %".1", i32* %".56", i32 1)
  %".61" = load i64, i64* %".60"
  store i64 %".61", i64* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".4"
  ret %"_NDArray_long_0_"* %".64"
}

define void @"%\22_NDArray_long_1_\22.set_all_%\22_NDArray_long_1_\22*_i64"(%"_NDArray_long_1_"* %".1", i64 %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call i64* @"%\22_NDArray_long_1_\22.__index___%\22_NDArray_long_1_\22*_i32*_i32"(%"_NDArray_long_1_"* %".1", i32* %".22", i32 1)
  store i64 %".2", i64* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_long_1_\22.zero_%\22_NDArray_long_1_\22*"(%"_NDArray_long_1_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call i64* @"%\22_NDArray_long_1_\22.__index___%\22_NDArray_long_1_\22*_i32*_i32"(%"_NDArray_long_1_"* %".1", i32* %".21", i32 1)
  %".26" = call i64 @"i32->i64"(i32 0)
  store i64 %".26", i64* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_long_1_\22.__print___%\22_NDArray_long_1_\22*"(%"_NDArray_long_1_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 0
  %".355" = load i64*, i64** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr i64, i64* %".355", i32 %".356"
  %".358" = load i64, i64* %".357"
  call void @"__print___i64"(i64 %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_long_1_"* @"%\22_NDArray_long_0_\22*->%\22_NDArray_long_1_\22*"(%"_NDArray_long_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 1)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_long_1_"*
  %".18" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_long_1_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_long_1_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_long_1_\22.__init___%\22_NDArray_long_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_1_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_long_1_"* %".23", %"_NDArray_long_1_"** %".17"
  %".27" = load %"_NDArray_long_1_"*, %"_NDArray_long_1_"** %".17"
  %".28" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".1", i32 0, i32 0
  %".30" = load i64*, i64** %".29"
  store i64* %".30", i64** %".28"
  %".32" = load %"_NDArray_long_1_"*, %"_NDArray_long_1_"** %".17"
  ret %"_NDArray_long_1_"* %".32"
}

define %"_NDArray_long_0_"* @"%\22_NDArray_long_1_\22*->%\22_NDArray_long_0_\22*"(%"_NDArray_long_1_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_long_0_"*
  %".4" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_long_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_long_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_long_0_\22.__init___%\22_NDArray_long_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_long_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_long_0_"* %".9", %"_NDArray_long_0_"** %".3"
  %".13" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".3"
  %".14" = getelementptr %"_NDArray_long_0_", %"_NDArray_long_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_long_1_", %"_NDArray_long_1_"* %".1", i32 0, i32 0
  %".16" = load i64*, i64** %".15"
  store i64* %".16", i64** %".14"
  %".18" = load %"_NDArray_long_0_"*, %"_NDArray_long_0_"** %".3"
  ret %"_NDArray_long_0_"* %".18"
}

define void @"%\22_NDArray_half_1_\22.throwErr_%\22_NDArray_half_1_\22*_%\22str\22*"(%"_NDArray_half_1_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [5 x i8]* @"formatter28" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_half_1_\22.len_%\22_NDArray_half_1_\22*"(%"_NDArray_half_1_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_half_1_\22.__init___%\22_NDArray_half_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 1, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_half_1_\22.throwErr_%\22_NDArray_half_1_\22*_%\22str\22*"(%"_NDArray_half_1_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".134" = getelementptr half, half* null, i32 1
  %".135" = ptrtoint half* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call half* @"i8*->half*"(i8* %".138")
  store half* %".139", half** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define half* @"%\22_NDArray_half_1_\22.__index___%\22_NDArray_half_1_\22*_i32*_i32"(%"_NDArray_half_1_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_half_1_\22.throwErr_%\22_NDArray_half_1_\22*_%\22str\22*"(%"_NDArray_half_1_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 0
  %".22" = load half*, half** %".21"
  %".23" = ptrtoint half* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr half, half* null, i32 1
  %".26" = ptrtoint half* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to half*
  ret half* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 0
  %".97" = load half*, half** %".96"
  %".98" = ptrtoint half* %".97" to i64
  %".99" = getelementptr half, half* null, i32 1
  %".100" = ptrtoint half* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to half*
  ret half* %".105"
.55:
  %".59" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_1_\22.reshape_%\22_NDArray_half_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_half_0_"*
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_half_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_half_0_"*
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_half_0_"* %".9", %"_NDArray_half_0_"** %".4"
  %".12" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  %".13" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_half_1_\22.throwErr_%\22_NDArray_half_1_\22*_%\22str\22*"(%"_NDArray_half_1_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call half* @"%\22_NDArray_half_0_\22.__index___%\22_NDArray_half_0_\22*_i32*_i32"(%"_NDArray_half_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call half* @"%\22_NDArray_half_1_\22.__index___%\22_NDArray_half_1_\22*_i32*_i32"(%"_NDArray_half_1_"* %".1", i32* %".56", i32 1)
  %".61" = load half, half* %".60"
  store half %".61", half* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".4"
  ret %"_NDArray_half_0_"* %".64"
}

define void @"%\22_NDArray_half_1_\22.set_all_%\22_NDArray_half_1_\22*_half"(%"_NDArray_half_1_"* %".1", half %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call half* @"%\22_NDArray_half_1_\22.__index___%\22_NDArray_half_1_\22*_i32*_i32"(%"_NDArray_half_1_"* %".1", i32* %".22", i32 1)
  store half %".2", half* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_half_1_\22.zero_%\22_NDArray_half_1_\22*"(%"_NDArray_half_1_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call half* @"%\22_NDArray_half_1_\22.__index___%\22_NDArray_half_1_\22*_i32*_i32"(%"_NDArray_half_1_"* %".1", i32* %".21", i32 1)
  %".26" = call half @"i32->half"(i32 0)
  store half %".26", half* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_half_1_\22.__print___%\22_NDArray_half_1_\22*"(%"_NDArray_half_1_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 0
  %".355" = load half*, half** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr half, half* %".355", i32 %".356"
  %".358" = load half, half* %".357"
  call void @"__print___half"(half %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_half_1_"* @"%\22_NDArray_half_0_\22*->%\22_NDArray_half_1_\22*"(%"_NDArray_half_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 1)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_half_1_"*
  %".18" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_half_1_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_half_1_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_half_1_\22.__init___%\22_NDArray_half_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_1_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_half_1_"* %".23", %"_NDArray_half_1_"** %".17"
  %".27" = load %"_NDArray_half_1_"*, %"_NDArray_half_1_"** %".17"
  %".28" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".1", i32 0, i32 0
  %".30" = load half*, half** %".29"
  store half* %".30", half** %".28"
  %".32" = load %"_NDArray_half_1_"*, %"_NDArray_half_1_"** %".17"
  ret %"_NDArray_half_1_"* %".32"
}

define %"_NDArray_half_0_"* @"%\22_NDArray_half_1_\22*->%\22_NDArray_half_0_\22*"(%"_NDArray_half_1_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_half_0_"*
  %".4" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_half_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_half_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_half_0_\22.__init___%\22_NDArray_half_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_half_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_half_0_"* %".9", %"_NDArray_half_0_"** %".3"
  %".13" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".3"
  %".14" = getelementptr %"_NDArray_half_0_", %"_NDArray_half_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_half_1_", %"_NDArray_half_1_"* %".1", i32 0, i32 0
  %".16" = load half*, half** %".15"
  store half* %".16", half** %".14"
  %".18" = load %"_NDArray_half_0_"*, %"_NDArray_half_0_"** %".3"
  ret %"_NDArray_half_0_"* %".18"
}

define void @"%\22_NDArray_float_1_\22.throwErr_%\22_NDArray_float_1_\22*_%\22str\22*"(%"_NDArray_float_1_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [6 x i8]* @"formatter29" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_float_1_\22.len_%\22_NDArray_float_1_\22*"(%"_NDArray_float_1_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_float_1_\22.__init___%\22_NDArray_float_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 1, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_float_1_\22.throwErr_%\22_NDArray_float_1_\22*_%\22str\22*"(%"_NDArray_float_1_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".134" = getelementptr float, float* null, i32 1
  %".135" = ptrtoint float* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call float* @"i8*->float*"(i8* %".138")
  store float* %".139", float** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define float* @"%\22_NDArray_float_1_\22.__index___%\22_NDArray_float_1_\22*_i32*_i32"(%"_NDArray_float_1_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_float_1_\22.throwErr_%\22_NDArray_float_1_\22*_%\22str\22*"(%"_NDArray_float_1_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 0
  %".22" = load float*, float** %".21"
  %".23" = ptrtoint float* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr float, float* null, i32 1
  %".26" = ptrtoint float* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to float*
  ret float* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 0
  %".97" = load float*, float** %".96"
  %".98" = ptrtoint float* %".97" to i64
  %".99" = getelementptr float, float* null, i32 1
  %".100" = ptrtoint float* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to float*
  ret float* %".105"
.55:
  %".59" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_1_\22.reshape_%\22_NDArray_float_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_float_0_"*
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_float_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_float_0_"*
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_float_0_"* %".9", %"_NDArray_float_0_"** %".4"
  %".12" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  %".13" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_float_1_\22.throwErr_%\22_NDArray_float_1_\22*_%\22str\22*"(%"_NDArray_float_1_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call float* @"%\22_NDArray_float_0_\22.__index___%\22_NDArray_float_0_\22*_i32*_i32"(%"_NDArray_float_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call float* @"%\22_NDArray_float_1_\22.__index___%\22_NDArray_float_1_\22*_i32*_i32"(%"_NDArray_float_1_"* %".1", i32* %".56", i32 1)
  %".61" = load float, float* %".60"
  store float %".61", float* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".4"
  ret %"_NDArray_float_0_"* %".64"
}

define void @"%\22_NDArray_float_1_\22.set_all_%\22_NDArray_float_1_\22*_float"(%"_NDArray_float_1_"* %".1", float %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call float* @"%\22_NDArray_float_1_\22.__index___%\22_NDArray_float_1_\22*_i32*_i32"(%"_NDArray_float_1_"* %".1", i32* %".22", i32 1)
  store float %".2", float* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_float_1_\22.zero_%\22_NDArray_float_1_\22*"(%"_NDArray_float_1_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call float* @"%\22_NDArray_float_1_\22.__index___%\22_NDArray_float_1_\22*_i32*_i32"(%"_NDArray_float_1_"* %".1", i32* %".21", i32 1)
  %".26" = call float @"i32->float"(i32 0)
  store float %".26", float* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_float_1_\22.__print___%\22_NDArray_float_1_\22*"(%"_NDArray_float_1_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 0
  %".355" = load float*, float** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr float, float* %".355", i32 %".356"
  %".358" = load float, float* %".357"
  call void @"__print___float"(float %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_float_1_"* @"%\22_NDArray_float_0_\22*->%\22_NDArray_float_1_\22*"(%"_NDArray_float_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 1)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_float_1_"*
  %".18" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_float_1_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_float_1_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_float_1_\22.__init___%\22_NDArray_float_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_1_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_float_1_"* %".23", %"_NDArray_float_1_"** %".17"
  %".27" = load %"_NDArray_float_1_"*, %"_NDArray_float_1_"** %".17"
  %".28" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".1", i32 0, i32 0
  %".30" = load float*, float** %".29"
  store float* %".30", float** %".28"
  %".32" = load %"_NDArray_float_1_"*, %"_NDArray_float_1_"** %".17"
  ret %"_NDArray_float_1_"* %".32"
}

define %"_NDArray_float_0_"* @"%\22_NDArray_float_1_\22*->%\22_NDArray_float_0_\22*"(%"_NDArray_float_1_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_float_0_"*
  %".4" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_float_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_float_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_float_0_"* %".9", %"_NDArray_float_0_"** %".3"
  %".13" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  %".14" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 0
  %".16" = load float*, float** %".15"
  store float* %".16", float** %".14"
  %".18" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  ret %"_NDArray_float_0_"* %".18"
}

define void @"%\22_NDArray_double_1_\22.throwErr_%\22_NDArray_double_1_\22*_%\22str\22*"(%"_NDArray_double_1_"* %".1", %"str"* %".2")
{
entry:
  %".4" = bitcast [15 x i8]* @"formatter15" to i8*
  call void @"__print___i8*"(i8* %".4")
  %".6" = bitcast [2 x i8]* @"formatter16" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  %".8" = bitcast [12 x i8]* @"formatter17" to i8*
  call void @"__print___i8*"(i8* %".8")
  %".10" = bitcast [7 x i8]* @"formatter30" to i8*
  %".11" = bitcast [2 x i8]* @"formatter19" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11")
  call void @"__print___i8*"(i8* %".10")
  %".14" = bitcast [6 x i8]* @"formatter20" to i8*
  %".15" = bitcast [2 x i8]* @"formatter19" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15")
  call void @"__print___i8*"(i8* %".14")
  %".18" = bitcast [2 x i8]* @"formatter16" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  %".20" = bitcast [4 x i8]* @"formatter21" to i8*
  call void @"__print___i8*"(i8* %".20")
  call void @"%\22str\22.__print___%\22str\22*"(%"str"* %".2")
  %".23" = bitcast [2 x i8]* @"formatter16" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23")
  call void @"exit"(i32 1)
  ret void
}

define i32 @"%\22_NDArray_double_1_\22.len_%\22_NDArray_double_1_\22*"(%"_NDArray_double_1_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  %".4" = load %"_tuple_int_"*, %"_tuple_int_"** %".3"
  %".5" = getelementptr i32, i32* null, i32 1
  %".6" = ptrtoint i32* %".5" to i32
  %".7" = mul i32 %".6", 1
  %".8" = call i8* @"bohem_malloc"(i32 %".7")
  %".9" = ptrtoint i8* %".8" to i64
  %".10" = inttoptr i64 %".9" to i32*
  %".11" = getelementptr i32, i32* %".10", i32 0
  store i32 0, i32* %".11"
  %".13" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".4", i32* %".10", i32 1)
  %".14" = load i32, i32* %".13"
  ret i32 %".14"
}

define void @"%\22_NDArray_double_1_\22.__init___%\22_NDArray_double_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".2", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  store i32 %".6", i32* %".4"
  %".8" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  store %"_tuple_int_"* %".2", %"_tuple_int_"** %".8"
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  br i1 %".10", label %".11", label %".12"
.11:
  %".15" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  %".16" = load %"_tuple_int_"*, %"_tuple_int_"** %".15"
  %".17" = getelementptr %"_tuple_int_", %"_tuple_int_"* %".16", i32 0, i32 1
  %".18" = load i32, i32* %".17"
  %".19" = call i1 @"__neq___i32_i32"(i32 1, i32 %".18")
  br i1 %".19", label %".20", label %".21"
.12:
  br label %".13"
.13:
  %".31" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  store i32 1, i32* %".31"
  %".36" = alloca i32
  %".37" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  %".38" = load %"_tuple_int_"*, %"_tuple_int_"** %".37"
  call void @"%\22_tuple_int_\22.__iterget___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br label %".33"
.20:
  %".24" = bitcast [21 x i8]* @"formatter22" to i8*
  %".25" = call %"str"* @"i8*->%\22str\22*"(i8* %".24")
  call void @"%\22_NDArray_double_1_\22.throwErr_%\22_NDArray_double_1_\22*_%\22str\22*"(%"_NDArray_double_1_"* %".1", %"str"* %".25")
  br label %".22"
.21:
  br label %".22"
.22:
  br label %".13"
.33:
  %".41" = call i1 @"%\22_tuple_int_\22.__itercheck___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  br i1 %".41", label %".34", label %".35"
.34:
  %".43" = call i32 @"%\22_tuple_int_\22.__iternext___%\22_tuple_int_\22*"(%"_tuple_int_"* %".38")
  store i32 %".43", i32* %".36"
  %".45" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = load i32, i32* %".36"
  %".48" = call i32 @"__mul___i32_i32"(i32 %".46", i32 %".47")
  store i32 %".48", i32* %".45"
  br label %".33"
.35:
  %".51" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 4
  %".52" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".53" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".54" = ptrtoint %"_rawArray_int_"* %".53" to i32
  %".55" = call i8* @"bohem_malloc"(i32 %".54")
  %".56" = ptrtoint i8* %".55" to i64
  %".57" = inttoptr i64 %".56" to %"_rawArray_int_"*
  %".58" = load i32, i32* %".52"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".57", i32 %".58")
  store %"_rawArray_int_"* %".57", %"_rawArray_int_"** %".51"
  %".64" = alloca i32
  %".65" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".66" = load i32, i32* %".65"
  %".67" = call %"__rangeiter"* @"range_i32"(i32 %".66")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br label %".61"
.61:
  %".70" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  br i1 %".70", label %".62", label %".63"
.62:
  %".72" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".67")
  store i32 %".72", i32* %".64"
  %".74" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 4
  %".75" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".74"
  %".76" = getelementptr i32, i32* null, i32 1
  %".77" = ptrtoint i32* %".76" to i32
  %".78" = mul i32 %".77", 1
  %".79" = call i8* @"bohem_malloc"(i32 %".78")
  %".80" = ptrtoint i8* %".79" to i64
  %".81" = inttoptr i64 %".80" to i32*
  %".82" = getelementptr i32, i32* %".81", i32 0
  %".83" = load i32, i32* %".64"
  store i32 %".83", i32* %".82"
  %".85" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".75", i32* %".81", i32 1)
  store i32 1, i32* %".85"
  %".90" = alloca i32
  %".91" = load i32, i32* %".64"
  %".92" = call i32 @"__add___i32_i32"(i32 %".91", i32 1)
  %".93" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".94" = load i32, i32* %".93"
  %".95" = call %"__rangeiter"* @"range_i32_i32"(i32 %".92", i32 %".94")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br label %".87"
.63:
  %".132" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 0
  %".133" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".134" = getelementptr double, double* null, i32 1
  %".135" = ptrtoint double* %".134" to i32
  %".136" = load i32, i32* %".133"
  %".137" = call i32 @"__mul___i32_i32"(i32 %".136", i32 %".135")
  %".138" = call i8* @"bohem_malloc"(i32 %".137")
  %".139" = call double* @"i8*->double*"(i8* %".138")
  store double* %".139", double** %".132"
  ret void
.87:
  %".98" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  br i1 %".98", label %".88", label %".89"
.88:
  %".100" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".95")
  store i32 %".100", i32* %".90"
  %".102" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 4
  %".103" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".102"
  %".104" = getelementptr i32, i32* null, i32 1
  %".105" = ptrtoint i32* %".104" to i32
  %".106" = mul i32 %".105", 1
  %".107" = call i8* @"bohem_malloc"(i32 %".106")
  %".108" = ptrtoint i8* %".107" to i64
  %".109" = inttoptr i64 %".108" to i32*
  %".110" = getelementptr i32, i32* %".109", i32 0
  %".111" = load i32, i32* %".64"
  store i32 %".111", i32* %".110"
  %".113" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".103", i32* %".109", i32 1)
  %".114" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  %".115" = load %"_tuple_int_"*, %"_tuple_int_"** %".114"
  %".116" = getelementptr i32, i32* null, i32 1
  %".117" = ptrtoint i32* %".116" to i32
  %".118" = mul i32 %".117", 1
  %".119" = call i8* @"bohem_malloc"(i32 %".118")
  %".120" = ptrtoint i8* %".119" to i64
  %".121" = inttoptr i64 %".120" to i32*
  %".122" = getelementptr i32, i32* %".121", i32 0
  %".123" = load i32, i32* %".90"
  store i32 %".123", i32* %".122"
  %".125" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".115", i32* %".121", i32 1)
  %".126" = load i32, i32* %".113"
  %".127" = load i32, i32* %".125"
  %".128" = call i32 @"__mul___i32_i32"(i32 %".126", i32 %".127")
  store i32 %".128", i32* %".113"
  br label %".87"
.89:
  br label %".61"
}

define double* @"%\22_NDArray_double_1_\22.__index___%\22_NDArray_double_1_\22*_i32*_i32"(%"_NDArray_double_1_"* %".1", i32* %".2", i32 %".3")
{
entry:
  %".5" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".6" = load i32, i32* %".5"
  %".7" = call i1 @"__neq___i32_i32"(i32 %".3", i32 %".6")
  br i1 %".7", label %".8", label %".9"
.8:
  %".12" = call i1 @"__neq___i32_i32"(i32 %".3", i32 1)
  br i1 %".12", label %".13", label %".14"
.9:
  br label %".10"
.10:
  %".35" = alloca i32
  store i32 0, i32* %".35"
  %".40" = alloca i32
  %".41" = call %"__rangeiter"* @"range_i32"(i32 %".3")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br label %".37"
.13:
  %".17" = bitcast [39 x i8]* @"formatter23" to i8*
  %".18" = call %"str"* @"i8*->%\22str\22*"(i8* %".17")
  call void @"%\22_NDArray_double_1_\22.throwErr_%\22_NDArray_double_1_\22*_%\22str\22*"(%"_NDArray_double_1_"* %".1", %"str"* %".18")
  br label %".15"
.14:
  %".21" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 0
  %".22" = load double*, double** %".21"
  %".23" = ptrtoint double* %".22" to i64
  %".24" = getelementptr i32, i32* %".2", i32 0
  %".25" = getelementptr double, double* null, i32 1
  %".26" = ptrtoint double* %".25" to i32
  %".27" = load i32, i32* %".24"
  %".28" = call i32 @"__mul___i32_i32"(i32 %".27", i32 %".26")
  %".29" = call i64 @"i32->i64"(i32 %".28")
  %".30" = call i64 @"__add___i64_i64"(i64 %".23", i64 %".29")
  %".31" = inttoptr i64 %".30" to double*
  ret double* %".31"
.15:
  br label %".10"
.37:
  %".44" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  br i1 %".44", label %".38", label %".39"
.38:
  %".46" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".41")
  store i32 %".46", i32* %".40"
  %".48" = alloca i32
  %".49" = load i32, i32* %".40"
  %".50" = getelementptr i32, i32* %".2", i32 %".49"
  %".51" = load i32, i32* %".50"
  store i32 %".51", i32* %".48"
  %".53" = load i32, i32* %".48"
  %".54" = call i1 @"__ls___i32_i32"(i32 %".53", i32 0)
  br i1 %".54", label %".55", label %".56"
.39:
  %".96" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 0
  %".97" = load double*, double** %".96"
  %".98" = ptrtoint double* %".97" to i64
  %".99" = getelementptr double, double* null, i32 1
  %".100" = ptrtoint double* %".99" to i32
  %".101" = load i32, i32* %".35"
  %".102" = call i32 @"__mul___i32_i32"(i32 %".101", i32 %".100")
  %".103" = call i64 @"i32->i64"(i32 %".102")
  %".104" = call i64 @"__add___i64_i64"(i64 %".98", i64 %".103")
  %".105" = inttoptr i64 %".104" to double*
  ret double* %".105"
.55:
  %".59" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  %".60" = load %"_tuple_int_"*, %"_tuple_int_"** %".59"
  %".61" = getelementptr i32, i32* null, i32 1
  %".62" = ptrtoint i32* %".61" to i32
  %".63" = mul i32 %".62", 1
  %".64" = call i8* @"bohem_malloc"(i32 %".63")
  %".65" = ptrtoint i8* %".64" to i64
  %".66" = inttoptr i64 %".65" to i32*
  %".67" = getelementptr i32, i32* %".66", i32 0
  %".68" = load i32, i32* %".40"
  store i32 %".68", i32* %".67"
  %".70" = call i32* @"%\22_tuple_int_\22.__index___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".60", i32* %".66", i32 1)
  %".71" = load i32, i32* %".48"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 @"__add___i32_i32"(i32 %".71", i32 %".72")
  store i32 %".73", i32* %".48"
  br label %".57"
.56:
  br label %".57"
.57:
  %".77" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 4
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".77"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".40"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".48"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 @"__mul___i32_i32"(i32 %".89", i32 %".90")
  %".92" = load i32, i32* %".35"
  %".93" = call i32 @"__add___i32_i32"(i32 %".92", i32 %".91")
  store i32 %".93", i32* %".35"
  br label %".37"
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_1_\22.reshape_%\22_NDArray_double_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_1_"* %".1", %"_tuple_int_"* %".2")
{
entry:
  %".4" = alloca %"_NDArray_double_0_"*
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_double_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_double_0_"*
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".9", %"_tuple_int_"* %".2")
  store %"_NDArray_double_0_"* %".9", %"_NDArray_double_0_"** %".4"
  %".12" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  %".13" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".12", i32 0, i32 2
  %".14" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".15" = load i32, i32* %".13"
  %".16" = load i32, i32* %".14"
  %".17" = call i1 @"__neq___i32_i32"(i32 %".15", i32 %".16")
  br i1 %".17", label %".18", label %".19"
.18:
  %".22" = bitcast [16 x i8]* @"formatter24" to i8*
  %".23" = call %"str"* @"i8*->%\22str\22*"(i8* %".22")
  call void @"%\22_NDArray_double_1_\22.throwErr_%\22_NDArray_double_1_\22*_%\22str\22*"(%"_NDArray_double_1_"* %".1", %"str"* %".23")
  br label %".20"
.19:
  br label %".20"
.20:
  %".30" = alloca i32
  %".31" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".32" = load i32, i32* %".31"
  %".33" = call %"__rangeiter"* @"range_i32"(i32 %".32")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br label %".27"
.27:
  %".36" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  br i1 %".36", label %".28", label %".29"
.28:
  %".38" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".33")
  store i32 %".38", i32* %".30"
  %".40" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  %".48" = load i32, i32* %".30"
  store i32 %".48", i32* %".47"
  %".50" = call double* @"%\22_NDArray_double_0_\22.__index___%\22_NDArray_double_0_\22*_i32*_i32"(%"_NDArray_double_0_"* %".40", i32* %".46", i32 1)
  %".51" = getelementptr i32, i32* null, i32 1
  %".52" = ptrtoint i32* %".51" to i32
  %".53" = mul i32 %".52", 1
  %".54" = call i8* @"bohem_malloc"(i32 %".53")
  %".55" = ptrtoint i8* %".54" to i64
  %".56" = inttoptr i64 %".55" to i32*
  %".57" = getelementptr i32, i32* %".56", i32 0
  %".58" = load i32, i32* %".30"
  store i32 %".58", i32* %".57"
  %".60" = call double* @"%\22_NDArray_double_1_\22.__index___%\22_NDArray_double_1_\22*_i32*_i32"(%"_NDArray_double_1_"* %".1", i32* %".56", i32 1)
  %".61" = load double, double* %".60"
  store double %".61", double* %".50"
  br label %".27"
.29:
  %".64" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".4"
  ret %"_NDArray_double_0_"* %".64"
}

define void @"%\22_NDArray_double_1_\22.set_all_%\22_NDArray_double_1_\22*_double"(%"_NDArray_double_1_"* %".1", double %".2")
{
entry:
  %".7" = alloca i32
  %".8" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".9" = load i32, i32* %".8"
  %".10" = call %"__rangeiter"* @"range_i32"(i32 %".9")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br label %".4"
.4:
  %".13" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  br i1 %".13", label %".5", label %".6"
.5:
  %".15" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".10")
  store i32 %".15", i32* %".7"
  %".17" = getelementptr i32, i32* null, i32 1
  %".18" = ptrtoint i32* %".17" to i32
  %".19" = mul i32 %".18", 1
  %".20" = call i8* @"bohem_malloc"(i32 %".19")
  %".21" = ptrtoint i8* %".20" to i64
  %".22" = inttoptr i64 %".21" to i32*
  %".23" = getelementptr i32, i32* %".22", i32 0
  %".24" = load i32, i32* %".7"
  store i32 %".24", i32* %".23"
  %".26" = call double* @"%\22_NDArray_double_1_\22.__index___%\22_NDArray_double_1_\22*_i32*_i32"(%"_NDArray_double_1_"* %".1", i32* %".22", i32 1)
  store double %".2", double* %".26"
  br label %".4"
.6:
  ret void
}

define void @"%\22_NDArray_double_1_\22.zero_%\22_NDArray_double_1_\22*"(%"_NDArray_double_1_"* %".1")
{
entry:
  %".6" = alloca i32
  %".7" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".8" = load i32, i32* %".7"
  %".9" = call %"__rangeiter"* @"range_i32"(i32 %".8")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br label %".3"
.3:
  %".12" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  br i1 %".12", label %".4", label %".5"
.4:
  %".14" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".9")
  store i32 %".14", i32* %".6"
  %".16" = getelementptr i32, i32* null, i32 1
  %".17" = ptrtoint i32* %".16" to i32
  %".18" = mul i32 %".17", 1
  %".19" = call i8* @"bohem_malloc"(i32 %".18")
  %".20" = ptrtoint i8* %".19" to i64
  %".21" = inttoptr i64 %".20" to i32*
  %".22" = getelementptr i32, i32* %".21", i32 0
  %".23" = load i32, i32* %".6"
  store i32 %".23", i32* %".22"
  %".25" = call double* @"%\22_NDArray_double_1_\22.__index___%\22_NDArray_double_1_\22*_i32*_i32"(%"_NDArray_double_1_"* %".1", i32* %".21", i32 1)
  %".26" = call double @"i32->double"(i32 0)
  store double %".26", double* %".25"
  br label %".3"
.5:
  ret void
}

define void @"%\22_NDArray_double_1_\22.__print___%\22_NDArray_double_1_\22*"(%"_NDArray_double_1_"* %".1")
{
entry:
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".5" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".6" = ptrtoint %"_rawArray_int_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_rawArray_int_"*
  %".10" = load i32, i32* %".4"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".9", i32 %".10")
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".9")
  store %"_rawArray_int_"* %".12", %"_rawArray_int_"** %".3"
  %".14" = alloca %"_rawArray_int_"*
  %".15" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".16" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".17" = ptrtoint %"_rawArray_int_"* %".16" to i32
  %".18" = call i8* @"bohem_malloc"(i32 %".17")
  %".19" = ptrtoint i8* %".18" to i64
  %".20" = inttoptr i64 %".19" to %"_rawArray_int_"*
  %".21" = load i32, i32* %".15"
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".20", i32 %".21")
  %".23" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.zero_%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".20")
  store %"_rawArray_int_"* %".23", %"_rawArray_int_"** %".14"
  %".28" = alloca i32
  %".29" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".30" = load i32, i32* %".29"
  %".31" = call %"__rangeiter"* @"range_i32"(i32 %".30")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br label %".25"
.25:
  %".34" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  br i1 %".34", label %".26", label %".27"
.26:
  %".36" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".31")
  store i32 %".36", i32* %".28"
  %".38" = bitcast [2 x i8]* @"formatter10" to i8*
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".38")
  br label %".25"
.27:
  %".44" = alloca i32
  %".45" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 2
  %".46" = load i32, i32* %".45"
  %".47" = call %"__rangeiter"* @"range_i32"(i32 %".46")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br label %".41"
.41:
  %".50" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  br i1 %".50", label %".42", label %".43"
.42:
  %".52" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".47")
  store i32 %".52", i32* %".44"
  %".57" = alloca i32
  %".58" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".59" = load i32, i32* %".58"
  %".60" = call %"__rangeiter"* @"range_i32"(i32 %".59")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br label %".54"
.43:
  %".364" = alloca i32
  %".365" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".366" = load i32, i32* %".365"
  %".367" = call %"__rangeiter"* @"range_i32"(i32 %".366")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br label %".361"
.54:
  %".63" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  br i1 %".63", label %".55", label %".56"
.55:
  %".65" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".60")
  store i32 %".65", i32* %".57"
  %".67" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".68" = getelementptr i32, i32* null, i32 1
  %".69" = ptrtoint i32* %".68" to i32
  %".70" = mul i32 %".69", 1
  %".71" = call i8* @"bohem_malloc"(i32 %".70")
  %".72" = ptrtoint i8* %".71" to i64
  %".73" = inttoptr i64 %".72" to i32*
  %".74" = getelementptr i32, i32* %".73", i32 0
  %".75" = load i32, i32* %".57"
  store i32 %".75", i32* %".74"
  %".77" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".67", i32* %".73", i32 1)
  %".78" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".79" = getelementptr i32, i32* null, i32 1
  %".80" = ptrtoint i32* %".79" to i32
  %".81" = mul i32 %".80", 1
  %".82" = call i8* @"bohem_malloc"(i32 %".81")
  %".83" = ptrtoint i8* %".82" to i64
  %".84" = inttoptr i64 %".83" to i32*
  %".85" = getelementptr i32, i32* %".84", i32 0
  %".86" = load i32, i32* %".57"
  store i32 %".86", i32* %".85"
  %".88" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".78", i32* %".84", i32 1)
  %".89" = load i32, i32* %".88"
  store i32 %".89", i32* %".77"
  br label %".54"
.56:
  %".95" = alloca i32
  %".96" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".97" = load i32, i32* %".96"
  %".98" = call %"__rangeiter"* @"range_i32"(i32 %".97")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br label %".92"
.92:
  %".101" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  br i1 %".101", label %".93", label %".94"
.93:
  %".103" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".98")
  store i32 %".103", i32* %".95"
  %".105" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".106" = getelementptr i32, i32* null, i32 1
  %".107" = ptrtoint i32* %".106" to i32
  %".108" = mul i32 %".107", 1
  %".109" = call i8* @"bohem_malloc"(i32 %".108")
  %".110" = ptrtoint i8* %".109" to i64
  %".111" = inttoptr i64 %".110" to i32*
  %".112" = getelementptr i32, i32* %".111", i32 0
  %".113" = load i32, i32* %".95"
  store i32 %".113", i32* %".112"
  %".115" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".105", i32* %".111", i32 1)
  %".116" = load i32, i32* %".44"
  store i32 %".116", i32* %".115"
  %".121" = alloca i32
  %".122" = load i32, i32* %".95"
  %".123" = call %"__rangeiter"* @"range_i32"(i32 %".122")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br label %".118"
.94:
  %".202" = alloca i32
  %".203" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".204" = load i32, i32* %".203"
  %".205" = call i32 @"__sub___i32_i32"(i32 %".204", i32 1)
  %".206" = call %"__rangeiter"* @"range_i32"(i32 %".205")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br label %".199"
.118:
  %".126" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  br i1 %".126", label %".119", label %".120"
.119:
  %".128" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".123")
  store i32 %".128", i32* %".121"
  %".130" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".131" = getelementptr i32, i32* null, i32 1
  %".132" = ptrtoint i32* %".131" to i32
  %".133" = mul i32 %".132", 1
  %".134" = call i8* @"bohem_malloc"(i32 %".133")
  %".135" = ptrtoint i8* %".134" to i64
  %".136" = inttoptr i64 %".135" to i32*
  %".137" = getelementptr i32, i32* %".136", i32 0
  %".138" = load i32, i32* %".95"
  store i32 %".138", i32* %".137"
  %".140" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".130", i32* %".136", i32 1)
  %".141" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".142" = getelementptr i32, i32* null, i32 1
  %".143" = ptrtoint i32* %".142" to i32
  %".144" = mul i32 %".143", 1
  %".145" = call i8* @"bohem_malloc"(i32 %".144")
  %".146" = ptrtoint i8* %".145" to i64
  %".147" = inttoptr i64 %".146" to i32*
  %".148" = getelementptr i32, i32* %".147", i32 0
  %".149" = load i32, i32* %".121"
  store i32 %".149", i32* %".148"
  %".151" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".141", i32* %".147", i32 1)
  %".152" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 4
  %".153" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".152"
  %".154" = getelementptr i32, i32* null, i32 1
  %".155" = ptrtoint i32* %".154" to i32
  %".156" = mul i32 %".155", 1
  %".157" = call i8* @"bohem_malloc"(i32 %".156")
  %".158" = ptrtoint i8* %".157" to i64
  %".159" = inttoptr i64 %".158" to i32*
  %".160" = getelementptr i32, i32* %".159", i32 0
  %".161" = load i32, i32* %".121"
  store i32 %".161", i32* %".160"
  %".163" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".153", i32* %".159", i32 1)
  %".164" = load i32, i32* %".151"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 @"__mul___i32_i32"(i32 %".164", i32 %".165")
  %".167" = load i32, i32* %".140"
  %".168" = call i32 @"__sub___i32_i32"(i32 %".167", i32 %".166")
  store i32 %".168", i32* %".140"
  br label %".118"
.120:
  %".171" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".172" = getelementptr i32, i32* null, i32 1
  %".173" = ptrtoint i32* %".172" to i32
  %".174" = mul i32 %".173", 1
  %".175" = call i8* @"bohem_malloc"(i32 %".174")
  %".176" = ptrtoint i8* %".175" to i64
  %".177" = inttoptr i64 %".176" to i32*
  %".178" = getelementptr i32, i32* %".177", i32 0
  %".179" = load i32, i32* %".95"
  store i32 %".179", i32* %".178"
  %".181" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".171", i32* %".177", i32 1)
  %".182" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 4
  %".183" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".182"
  %".184" = getelementptr i32, i32* null, i32 1
  %".185" = ptrtoint i32* %".184" to i32
  %".186" = mul i32 %".185", 1
  %".187" = call i8* @"bohem_malloc"(i32 %".186")
  %".188" = ptrtoint i8* %".187" to i64
  %".189" = inttoptr i64 %".188" to i32*
  %".190" = getelementptr i32, i32* %".189", i32 0
  %".191" = load i32, i32* %".95"
  store i32 %".191", i32* %".190"
  %".193" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".183", i32* %".189", i32 1)
  %".194" = load i32, i32* %".181"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 @"__div___i32_i32"(i32 %".194", i32 %".195")
  store i32 %".196", i32* %".181"
  br label %".92"
.199:
  %".209" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  br i1 %".209", label %".200", label %".201"
.200:
  %".211" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".206")
  store i32 %".211", i32* %".202"
  %".213" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".214" = getelementptr i32, i32* null, i32 1
  %".215" = ptrtoint i32* %".214" to i32
  %".216" = mul i32 %".215", 1
  %".217" = call i8* @"bohem_malloc"(i32 %".216")
  %".218" = ptrtoint i8* %".217" to i64
  %".219" = inttoptr i64 %".218" to i32*
  %".220" = getelementptr i32, i32* %".219", i32 0
  %".221" = load i32, i32* %".202"
  store i32 %".221", i32* %".220"
  %".223" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".213", i32* %".219", i32 1)
  %".224" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".225" = getelementptr i32, i32* null, i32 1
  %".226" = ptrtoint i32* %".225" to i32
  %".227" = mul i32 %".226", 1
  %".228" = call i8* @"bohem_malloc"(i32 %".227")
  %".229" = ptrtoint i8* %".228" to i64
  %".230" = inttoptr i64 %".229" to i32*
  %".231" = getelementptr i32, i32* %".230", i32 0
  %".232" = load i32, i32* %".202"
  store i32 %".232", i32* %".231"
  %".234" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".224", i32* %".230", i32 1)
  %".235" = load i32, i32* %".223"
  %".236" = load i32, i32* %".234"
  %".237" = call i1 @"__neq___i32_i32"(i32 %".235", i32 %".236")
  br i1 %".237", label %".238", label %".239"
.201:
  %".247" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".248" = load i32, i32* %".247"
  %".249" = call i1 @"__neq___i32_i32"(i32 %".248", i32 1)
  br i1 %".249", label %".250", label %".251"
.238:
  %".242" = bitcast [2 x i8]* @"formatter11" to i8*
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".242")
  br label %".240"
.239:
  br label %".240"
.240:
  br label %".199"
.250:
  %".254" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".255" = getelementptr i32, i32* null, i32 1
  %".256" = ptrtoint i32* %".255" to i32
  %".257" = mul i32 %".256", 1
  %".258" = call i8* @"bohem_malloc"(i32 %".257")
  %".259" = ptrtoint i8* %".258" to i64
  %".260" = inttoptr i64 %".259" to i32*
  %".261" = getelementptr i32, i32* %".260", i32 0
  store i32 0, i32* %".261"
  %".263" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".254", i32* %".260", i32 1)
  %".264" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".265" = getelementptr i32, i32* null, i32 1
  %".266" = ptrtoint i32* %".265" to i32
  %".267" = mul i32 %".266", 1
  %".268" = call i8* @"bohem_malloc"(i32 %".267")
  %".269" = ptrtoint i8* %".268" to i64
  %".270" = inttoptr i64 %".269" to i32*
  %".271" = getelementptr i32, i32* %".270", i32 0
  store i32 0, i32* %".271"
  %".273" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".264", i32* %".270", i32 1)
  %".274" = load i32, i32* %".263"
  %".275" = load i32, i32* %".273"
  %".276" = call i1 @"__neq___i32_i32"(i32 %".274", i32 %".275")
  br i1 %".276", label %".277", label %".278"
.251:
  br label %".252"
.252:
  %".307" = alloca i32
  %".308" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".309" = load i32, i32* %".308"
  %".310" = call i32 @"__sub___i32_i32"(i32 %".309", i32 1)
  %".311" = call %"__rangeiter"* @"range_i32"(i32 %".310")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br label %".304"
.277:
  %".281" = bitcast [2 x i8]* @"formatter16" to i8*
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".281")
  %".286" = alloca i32
  %".287" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 1
  %".288" = load i32, i32* %".287"
  %".289" = call i32 @"__sub___i32_i32"(i32 %".288", i32 1)
  %".290" = call %"__rangeiter"* @"range_i32"(i32 %".289")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br label %".283"
.278:
  br label %".279"
.279:
  br label %".252"
.283:
  %".293" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  br i1 %".293", label %".284", label %".285"
.284:
  %".295" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".290")
  store i32 %".295", i32* %".286"
  %".297" = bitcast [2 x i8]* @"formatter19" to i8*
  %".298" = call i32 (i8*, ...) @"printf"(i8* %".297")
  br label %".283"
.285:
  br label %".279"
.304:
  %".314" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  br i1 %".314", label %".305", label %".306"
.305:
  %".316" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".311")
  store i32 %".316", i32* %".307"
  %".318" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".319" = getelementptr i32, i32* null, i32 1
  %".320" = ptrtoint i32* %".319" to i32
  %".321" = mul i32 %".320", 1
  %".322" = call i8* @"bohem_malloc"(i32 %".321")
  %".323" = ptrtoint i8* %".322" to i64
  %".324" = inttoptr i64 %".323" to i32*
  %".325" = getelementptr i32, i32* %".324", i32 0
  %".326" = load i32, i32* %".307"
  store i32 %".326", i32* %".325"
  %".328" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".318", i32* %".324", i32 1)
  %".329" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".14"
  %".330" = getelementptr i32, i32* null, i32 1
  %".331" = ptrtoint i32* %".330" to i32
  %".332" = mul i32 %".331", 1
  %".333" = call i8* @"bohem_malloc"(i32 %".332")
  %".334" = ptrtoint i8* %".333" to i64
  %".335" = inttoptr i64 %".334" to i32*
  %".336" = getelementptr i32, i32* %".335", i32 0
  %".337" = load i32, i32* %".307"
  store i32 %".337", i32* %".336"
  %".339" = call i32* @"%\22_rawArray_int_\22.__index___%\22_rawArray_int_\22*_i32*_i32"(%"_rawArray_int_"* %".329", i32* %".335", i32 1)
  %".340" = load i32, i32* %".328"
  %".341" = load i32, i32* %".339"
  %".342" = call i1 @"__neq___i32_i32"(i32 %".340", i32 %".341")
  br i1 %".342", label %".343", label %".344"
.306:
  %".352" = bitcast [2 x i8]* @"formatter19" to i8*
  %".353" = call i32 (i8*, ...) @"printf"(i8* %".352")
  %".354" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 0
  %".355" = load double*, double** %".354"
  %".356" = load i32, i32* %".44"
  %".357" = getelementptr double, double* %".355", i32 %".356"
  %".358" = load double, double* %".357"
  call void @"__print___double"(double %".358")
  br label %".41"
.343:
  %".347" = bitcast [2 x i8]* @"formatter10" to i8*
  %".348" = call i32 (i8*, ...) @"printf"(i8* %".347")
  br label %".345"
.344:
  br label %".345"
.345:
  br label %".304"
.361:
  %".370" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  br i1 %".370", label %".362", label %".363"
.362:
  %".372" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".367")
  store i32 %".372", i32* %".364"
  %".374" = bitcast [2 x i8]* @"formatter11" to i8*
  %".375" = call i32 (i8*, ...) @"printf"(i8* %".374")
  br label %".361"
.363:
  ret void
}

define %"_NDArray_double_1_"* @"%\22_NDArray_double_0_\22*->%\22_NDArray_double_1_\22*"(%"_NDArray_double_0_"* %".1")
{
entry:
  %".3" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 1
  %".4" = load i32, i32* %".3"
  %".5" = call i1 @"__neq___i32_i32"(i32 %".4", i32 1)
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = bitcast [21 x i8]* @"formatter25" to i8*
  call void @"__print___i8*"(i8* %".10")
  %".12" = bitcast [2 x i8]* @"formatter16" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12")
  call void @"exit"(i32 1)
  br label %".8"
.7:
  br label %".8"
.8:
  %".17" = alloca %"_NDArray_double_1_"*
  %".18" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 3
  %".19" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* null, i32 1
  %".20" = ptrtoint %"_NDArray_double_1_"* %".19" to i32
  %".21" = call i8* @"bohem_malloc"(i32 %".20")
  %".22" = ptrtoint i8* %".21" to i64
  %".23" = inttoptr i64 %".22" to %"_NDArray_double_1_"*
  %".24" = load %"_tuple_int_"*, %"_tuple_int_"** %".18"
  call void @"%\22_NDArray_double_1_\22.__init___%\22_NDArray_double_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_1_"* %".23", %"_tuple_int_"* %".24")
  store %"_NDArray_double_1_"* %".23", %"_NDArray_double_1_"** %".17"
  %".27" = load %"_NDArray_double_1_"*, %"_NDArray_double_1_"** %".17"
  %".28" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".27", i32 0, i32 0
  %".29" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".1", i32 0, i32 0
  %".30" = load double*, double** %".29"
  store double* %".30", double** %".28"
  %".32" = load %"_NDArray_double_1_"*, %"_NDArray_double_1_"** %".17"
  ret %"_NDArray_double_1_"* %".32"
}

define %"_NDArray_double_0_"* @"%\22_NDArray_double_1_\22*->%\22_NDArray_double_0_\22*"(%"_NDArray_double_1_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_double_0_"*
  %".4" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 3
  %".5" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* null, i32 1
  %".6" = ptrtoint %"_NDArray_double_0_"* %".5" to i32
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to %"_NDArray_double_0_"*
  %".10" = load %"_tuple_int_"*, %"_tuple_int_"** %".4"
  call void @"%\22_NDArray_double_0_\22.__init___%\22_NDArray_double_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_double_0_"* %".9", %"_tuple_int_"* %".10")
  store %"_NDArray_double_0_"* %".9", %"_NDArray_double_0_"** %".3"
  %".13" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".3"
  %".14" = getelementptr %"_NDArray_double_0_", %"_NDArray_double_0_"* %".13", i32 0, i32 0
  %".15" = getelementptr %"_NDArray_double_1_", %"_NDArray_double_1_"* %".1", i32 0, i32 0
  %".16" = load double*, double** %".15"
  store double* %".16", double** %".14"
  %".18" = load %"_NDArray_double_0_"*, %"_NDArray_double_0_"** %".3"
  ret %"_NDArray_double_0_"* %".18"
}

define %"_NDArray_float_0_"* @"nm._ones_float__%\22_tuple_int_\22*"(%"_tuple_int_"* %".1")
{
entry:
  %".3" = alloca %"_NDArray_float_0_"*
  %".4" = getelementptr %"_NDArray_float_0_", %"_NDArray_float_0_"* null, i32 1
  %".5" = ptrtoint %"_NDArray_float_0_"* %".4" to i32
  %".6" = call i8* @"bohem_malloc"(i32 %".5")
  %".7" = ptrtoint i8* %".6" to i64
  %".8" = inttoptr i64 %".7" to %"_NDArray_float_0_"*
  call void @"%\22_NDArray_float_0_\22.__init___%\22_NDArray_float_0_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_0_"* %".8", %"_tuple_int_"* %".1")
  store %"_NDArray_float_0_"* %".8", %"_NDArray_float_0_"** %".3"
  %".11" = call float @"i32->float"(i32 1)
  %".12" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  call void @"%\22_NDArray_float_0_\22.set_all_%\22_NDArray_float_0_\22*_float"(%"_NDArray_float_0_"* %".12", float %".11")
  %".14" = load %"_NDArray_float_0_"*, %"_NDArray_float_0_"** %".3"
  ret %"_NDArray_float_0_"* %".14"
}

define %"_NDArray_int_1_"* @"nm._as_type_int_1_float_1__%\22_NDArray_float_1_\22*"(%"_NDArray_float_1_"* %".1")
{
entry:
  %".3" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  %".4" = call i1 @"__neq___i32_i32"(i32 1, i32 0)
  %".5" = call i1 @"__or___i1_i1"(i1 %".3", i1 %".4")
  br i1 %".5", label %".6", label %".7"
.6:
  %".10" = call i1 @"__neq___i32_i32"(i32 1, i32 1)
  br i1 %".10", label %".11", label %".12"
.7:
  br label %".8"
.8:
  %".24" = alloca %"_NDArray_int_1_"*
  %".25" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 3
  %".26" = getelementptr %"_NDArray_int_1_", %"_NDArray_int_1_"* null, i32 1
  %".27" = ptrtoint %"_NDArray_int_1_"* %".26" to i32
  %".28" = call i8* @"bohem_malloc"(i32 %".27")
  %".29" = ptrtoint i8* %".28" to i64
  %".30" = inttoptr i64 %".29" to %"_NDArray_int_1_"*
  %".31" = load %"_tuple_int_"*, %"_tuple_int_"** %".25"
  call void @"%\22_NDArray_int_1_\22.__init___%\22_NDArray_int_1_\22*_%\22_tuple_int_\22*"(%"_NDArray_int_1_"* %".30", %"_tuple_int_"* %".31")
  store %"_NDArray_int_1_"* %".30", %"_NDArray_int_1_"** %".24"
  %".37" = alloca i32
  %".38" = getelementptr %"_NDArray_float_1_", %"_NDArray_float_1_"* %".1", i32 0, i32 2
  %".39" = load i32, i32* %".38"
  %".40" = call %"__rangeiter"* @"range_i32"(i32 %".39")
  call void @"%\22__rangeiter\22.__iterget___%\22__rangeiter\22*"(%"__rangeiter"* %".40")
  br label %".34"
.11:
  %".15" = bitcast [19 x i8]* @"formatter31" to i8*
  call void @"__print___i8*"(i8* %".15")
  %".17" = bitcast [2 x i8]* @"formatter16" to i8*
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".17")
  call void @"exit"(i32 1)
  br label %".13"
.12:
  br label %".13"
.13:
  br label %".8"
.34:
  %".43" = call i1 @"%\22__rangeiter\22.__itercheck___%\22__rangeiter\22*"(%"__rangeiter"* %".40")
  br i1 %".43", label %".35", label %".36"
.35:
  %".45" = call i32 @"%\22__rangeiter\22.__iternext___%\22__rangeiter\22*"(%"__rangeiter"* %".40")
  store i32 %".45", i32* %".37"
  %".47" = load %"_NDArray_int_1_"*, %"_NDArray_int_1_"** %".24"
  %".48" = getelementptr i32, i32* null, i32 1
  %".49" = ptrtoint i32* %".48" to i32
  %".50" = mul i32 %".49", 1
  %".51" = call i8* @"bohem_malloc"(i32 %".50")
  %".52" = ptrtoint i8* %".51" to i64
  %".53" = inttoptr i64 %".52" to i32*
  %".54" = getelementptr i32, i32* %".53", i32 0
  %".55" = load i32, i32* %".37"
  store i32 %".55", i32* %".54"
  %".57" = call i32* @"%\22_NDArray_int_1_\22.__index___%\22_NDArray_int_1_\22*_i32*_i32"(%"_NDArray_int_1_"* %".47", i32* %".53", i32 1)
  %".58" = getelementptr i32, i32* null, i32 1
  %".59" = ptrtoint i32* %".58" to i32
  %".60" = mul i32 %".59", 1
  %".61" = call i8* @"bohem_malloc"(i32 %".60")
  %".62" = ptrtoint i8* %".61" to i64
  %".63" = inttoptr i64 %".62" to i32*
  %".64" = getelementptr i32, i32* %".63", i32 0
  %".65" = load i32, i32* %".37"
  store i32 %".65", i32* %".64"
  %".67" = call float* @"%\22_NDArray_float_1_\22.__index___%\22_NDArray_float_1_\22*_i32*_i32"(%"_NDArray_float_1_"* %".1", i32* %".63", i32 1)
  %".68" = load float, float* %".67"
  %".69" = load float, float* %".67"
  %".70" = call i32 @"float->i32"(float %".69")
  store i32 %".70", i32* %".57"
  br label %".34"
.36:
  %".73" = load %"_NDArray_int_1_"*, %"_NDArray_int_1_"** %".24"
  ret %"_NDArray_int_1_"* %".73"
}

@"formatter31" = internal constant [19 x i8] c"NDArray Cast Error\00"
define i32 @"main"()
{
entry:
  call void (...) @"bohem_start"()
  %".3" = alloca %"_NDArray_float_2_"*
  %".4" = getelementptr i32, i32* null, i32 1
  %".5" = ptrtoint i32* %".4" to i32
  %".6" = mul i32 %".5", 2
  %".7" = call i8* @"bohem_malloc"(i32 %".6")
  %".8" = ptrtoint i8* %".7" to i64
  %".9" = inttoptr i64 %".8" to i32*
  %".10" = getelementptr i32, i32* %".9", i32 0
  store i32 3, i32* %".10"
  %".12" = getelementptr i32, i32* %".9", i32 1
  store i32 4, i32* %".12"
  %".14" = getelementptr %"_tuple_int_", %"_tuple_int_"* null, i32 1
  %".15" = ptrtoint %"_tuple_int_"* %".14" to i32
  %".16" = call i8* @"bohem_malloc"(i32 %".15")
  %".17" = ptrtoint i8* %".16" to i64
  %".18" = inttoptr i64 %".17" to %"_tuple_int_"*
  call void @"%\22_tuple_int_\22.__init___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".18", i32* %".9", i32 2)
  %".20" = call %"_NDArray_float_0_"* @"nm._ones_float__%\22_tuple_int_\22*"(%"_tuple_int_"* %".18")
  %".21" = call %"_NDArray_float_2_"* @"%\22_NDArray_float_0_\22*->%\22_NDArray_float_2_\22*"(%"_NDArray_float_0_"* %".20")
  store %"_NDArray_float_2_"* %".21", %"_NDArray_float_2_"** %".3"
  %".23" = call i32 @"__neg___i32"(i32 3)
  %".24" = load %"_NDArray_float_2_"*, %"_NDArray_float_2_"** %".3"
  %".25" = getelementptr i32, i32* null, i32 1
  %".26" = ptrtoint i32* %".25" to i32
  %".27" = mul i32 %".26", 2
  %".28" = call i8* @"bohem_malloc"(i32 %".27")
  %".29" = ptrtoint i8* %".28" to i64
  %".30" = inttoptr i64 %".29" to i32*
  %".31" = getelementptr i32, i32* %".30", i32 0
  store i32 0, i32* %".31"
  %".33" = getelementptr i32, i32* %".30", i32 1
  store i32 %".23", i32* %".33"
  %".35" = call float* @"%\22_NDArray_float_2_\22.__index___%\22_NDArray_float_2_\22*_i32*_i32"(%"_NDArray_float_2_"* %".24", i32* %".30", i32 2)
  %".36" = call float @"i32->float"(i32 10000000)
  store float %".36", float* %".35"
  %".38" = load %"_NDArray_float_2_"*, %"_NDArray_float_2_"** %".3"
  call void @"%\22_NDArray_float_2_\22.set_all_%\22_NDArray_float_2_\22*_float"(%"_NDArray_float_2_"* %".38", float 0x3fb99999a0000000)
  %".40" = alloca %"_NDArray_float_1_"*
  %".41" = getelementptr i32, i32* null, i32 1
  %".42" = ptrtoint i32* %".41" to i32
  %".43" = mul i32 %".42", 1
  %".44" = call i8* @"bohem_malloc"(i32 %".43")
  %".45" = ptrtoint i8* %".44" to i64
  %".46" = inttoptr i64 %".45" to i32*
  %".47" = getelementptr i32, i32* %".46", i32 0
  store i32 12, i32* %".47"
  %".49" = getelementptr %"_tuple_int_", %"_tuple_int_"* null, i32 1
  %".50" = ptrtoint %"_tuple_int_"* %".49" to i32
  %".51" = call i8* @"bohem_malloc"(i32 %".50")
  %".52" = ptrtoint i8* %".51" to i64
  %".53" = inttoptr i64 %".52" to %"_tuple_int_"*
  call void @"%\22_tuple_int_\22.__init___%\22_tuple_int_\22*_i32*_i32"(%"_tuple_int_"* %".53", i32* %".46", i32 1)
  %".55" = load %"_NDArray_float_2_"*, %"_NDArray_float_2_"** %".3"
  %".56" = call %"_NDArray_float_0_"* @"%\22_NDArray_float_2_\22.reshape_%\22_NDArray_float_2_\22*_%\22_tuple_int_\22*"(%"_NDArray_float_2_"* %".55", %"_tuple_int_"* %".53")
  %".57" = call %"_NDArray_float_1_"* @"%\22_NDArray_float_0_\22*->%\22_NDArray_float_1_\22*"(%"_NDArray_float_0_"* %".56")
  store %"_NDArray_float_1_"* %".57", %"_NDArray_float_1_"** %".40"
  %".59" = alloca %"_NDArray_float_0_"*
  %".60" = load %"_NDArray_float_1_"*, %"_NDArray_float_1_"** %".40"
  %".61" = call %"_NDArray_float_0_"* @"%\22_NDArray_float_1_\22*->%\22_NDArray_float_0_\22*"(%"_NDArray_float_1_"* %".60")
  store %"_NDArray_float_0_"* %".61", %"_NDArray_float_0_"** %".59"
  %".63" = load %"_NDArray_float_1_"*, %"_NDArray_float_1_"** %".40"
  %".64" = call %"_NDArray_int_1_"* @"nm._as_type_int_1_float_1__%\22_NDArray_float_1_\22*"(%"_NDArray_float_1_"* %".63")
  call void @"%\22_NDArray_int_1_\22.__print___%\22_NDArray_int_1_\22*"(%"_NDArray_int_1_"* %".64")
  %".66" = bitcast [2 x i8]* @"formatter16" to i8*
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".66")
  ret i32 0
}
