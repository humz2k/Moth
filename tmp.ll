; ModuleID = "test.moth"

%"__rangeiter" = type {i32, i32, i32, i32, i32}
%"_rawArray_int_" = type {i32*, i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare void @"bohem_start"(...)

declare i8* @"bohem_malloc"(i32 %".1")

define i1* @"i8*->i1*"(i8* %".1")
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to i1*
  ret i1* %".4"
}

define i32* @"i8*->i32*"(i8* %".1")
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to i32*
  ret i32* %".4"
}

define i64* @"i8*->i64*"(i8* %".1")
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to i64*
  ret i64* %".4"
}

define half* @"i8*->half*"(i8* %".1")
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to half*
  ret half* %".4"
}

define float* @"i8*->float*"(i8* %".1")
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to float*
  ret float* %".4"
}

define double* @"i8*->double*"(i8* %".1")
{
entry:
  %".3" = ptrtoint i8* %".1" to i64
  %".4" = inttoptr i64 %".3" to double*
  ret double* %".4"
}

define i1 @"i8->i1"(i8 %".1")
{
entry:
  %".3" = trunc i8 %".1" to i1
  ret i1 %".3"
}

define i1 @"i32->i1"(i32 %".1")
{
entry:
  %".3" = trunc i32 %".1" to i1
  ret i1 %".3"
}

define i1 @"i64->i1"(i64 %".1")
{
entry:
  %".3" = trunc i64 %".1" to i1
  ret i1 %".3"
}

define i8 @"i1->i8"(i1 %".1")
{
entry:
  %".3" = sext i1 %".1" to i8
  ret i8 %".3"
}

define i8 @"i32->i8"(i32 %".1")
{
entry:
  %".3" = trunc i32 %".1" to i8
  ret i8 %".3"
}

define i8 @"i64->i8"(i64 %".1")
{
entry:
  %".3" = trunc i64 %".1" to i8
  ret i8 %".3"
}

define i32 @"i1->i32"(i1 %".1")
{
entry:
  %".3" = sext i1 %".1" to i32
  ret i32 %".3"
}

define i32 @"i8->i32"(i8 %".1")
{
entry:
  %".3" = sext i8 %".1" to i32
  ret i32 %".3"
}

define i32 @"i64->i32"(i64 %".1")
{
entry:
  %".3" = trunc i64 %".1" to i32
  ret i32 %".3"
}

define i32 @"half->i32"(half %".1")
{
entry:
  %".3" = fptosi half %".1" to i32
  ret i32 %".3"
}

define i32 @"float->i32"(float %".1")
{
entry:
  %".3" = fptosi float %".1" to i32
  ret i32 %".3"
}

define i32 @"double->i32"(double %".1")
{
entry:
  %".3" = fptosi double %".1" to i32
  ret i32 %".3"
}

define i64 @"i1->i64"(i1 %".1")
{
entry:
  %".3" = sext i1 %".1" to i64
  ret i64 %".3"
}

define i64 @"i8->i64"(i8 %".1")
{
entry:
  %".3" = sext i8 %".1" to i64
  ret i64 %".3"
}

define i64 @"i32->i64"(i32 %".1")
{
entry:
  %".3" = sext i32 %".1" to i64
  ret i64 %".3"
}

define i64 @"half->i64"(half %".1")
{
entry:
  %".3" = fptosi half %".1" to i64
  ret i64 %".3"
}

define i64 @"float->i64"(float %".1")
{
entry:
  %".3" = fptosi float %".1" to i64
  ret i64 %".3"
}

define i64 @"double->i64"(double %".1")
{
entry:
  %".3" = fptosi double %".1" to i64
  ret i64 %".3"
}

define half @"i32->half"(i32 %".1")
{
entry:
  %".3" = sitofp i32 %".1" to half
  ret half %".3"
}

define half @"i64->half"(i64 %".1")
{
entry:
  %".3" = sitofp i64 %".1" to half
  ret half %".3"
}

define half @"float->half"(float %".1")
{
entry:
  %".3" = fptrunc float %".1" to half
  ret half %".3"
}

define half @"double->half"(double %".1")
{
entry:
  %".3" = fptrunc double %".1" to half
  ret half %".3"
}

define float @"i32->float"(i32 %".1")
{
entry:
  %".3" = sitofp i32 %".1" to float
  ret float %".3"
}

define float @"i64->float"(i64 %".1")
{
entry:
  %".3" = sitofp i64 %".1" to float
  ret float %".3"
}

define float @"half->float"(half %".1")
{
entry:
  %".3" = fpext half %".1" to float
  ret float %".3"
}

define float @"double->float"(double %".1")
{
entry:
  %".3" = fptrunc double %".1" to float
  ret float %".3"
}

define double @"i32->double"(i32 %".1")
{
entry:
  %".3" = sitofp i32 %".1" to double
  ret double %".3"
}

define double @"i64->double"(i64 %".1")
{
entry:
  %".3" = sitofp i64 %".1" to double
  ret double %".3"
}

define double @"half->double"(half %".1")
{
entry:
  %".3" = fpext half %".1" to double
  ret double %".3"
}

define double @"float->double"(float %".1")
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

@"global.a" = internal global i32 undef
define i32 @"main"()
{
entry:
  call void (...) @"bohem_start"()
  %".3" = alloca %"_rawArray_int_"*
  %".4" = getelementptr %"_rawArray_int_", %"_rawArray_int_"* null, i32 1
  %".5" = ptrtoint %"_rawArray_int_"* %".4" to i32
  %".6" = call i8* @"bohem_malloc"(i32 %".5")
  %".7" = ptrtoint i8* %".6" to i64
  %".8" = inttoptr i64 %".7" to %"_rawArray_int_"*
  call void @"%\22_rawArray_int_\22.__init___%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".8", i32 10)
  store %"_rawArray_int_"* %".8", %"_rawArray_int_"** %".3"
  %".11" = load %"_rawArray_int_"*, %"_rawArray_int_"** %".3"
  %".12" = call %"_rawArray_int_"* @"%\22_rawArray_int_\22.set_all_%\22_rawArray_int_\22*_i32"(%"_rawArray_int_"* %".11", i32 10)
  %".13" = call %"__rangeiter"* @"range_i32_i32_i32"(i32 0, i32 10, i32 2)
  %".14" = call %"_rawArray_int_"* @"%\22__rangeiter\22*->%\22_rawArray_int_\22*"(%"__rangeiter"* %".13")
  call void @"%\22_rawArray_int_\22.__print___%\22_rawArray_int_\22*"(%"_rawArray_int_"* %".14")
  %".16" = bitcast [2 x i8]* @"formatter11" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16")
  %".18" = call i32 @"__add___i32_i32"(i32 1, i32 1)
  call void @"__print___i32"(i32 %".18")
  %".20" = bitcast [2 x i8]* @"formatter11" to i8*
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20")
  store i32 5, i32* @"global.a"
  %".23" = load i32, i32* @"global.a"
  call void @"__print___i32"(i32 %".23")
  %".25" = bitcast [2 x i8]* @"formatter11" to i8*
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25")
  ret i32 0
}

@"formatter11" = internal constant [2 x i8] c"\0a\00"