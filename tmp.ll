; ModuleID = "test.moth"

declare i32 @"printf"(i8* %".1", ...)

declare void @"bohem_start"(...)

declare i8* @"bohem_malloc"(i32 %".1")

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

define i32 @"test_i32_i32"(i32 %".1", i32 %".2")
{
entry:
  %".4" = call i32 @"__add___i32_i32"(i32 %".1", i32 %".2")
  ret i32 %".4"
}

define i32 @"main"()
{
entry:
  %".2" = alloca i32
  store i32 1, i32* %".2"
  br label %".4"
.4:
  %".8" = load i32, i32* %".2"
  %".9" = call i1 @"__ls___i32_i32"(i32 %".8", i32 5)
  br i1 %".9", label %".5", label %".6"
.5:
  %".11" = load i32, i32* %".2"
  call void @"__print___i32"(i32 %".11")
  %".13" = bitcast [2 x i8]* @"formatter6" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13")
  %".15" = alloca i32
  %".16" = load i32, i32* %".2"
  store i32 %".16", i32* %".15"
  br label %".18"
.6:
  ret i32 0
.18:
  %".22" = load i32, i32* %".15"
  %".23" = call i1 @"__geq___i32_i32"(i32 %".22", i32 0)
  br i1 %".23", label %".19", label %".20"
.19:
  %".25" = load i32, i32* %".15"
  call void @"__print___i32"(i32 %".25")
  %".27" = bitcast [2 x i8]* @"formatter6" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27")
  %".29" = load i32, i32* %".15"
  %".30" = call i32 @"__sub___i32_i32"(i32 %".29", i32 1)
  store i32 %".30", i32* %".15"
  br label %".18"
.20:
  %".33" = load i32, i32* %".2"
  %".34" = call i32 @"__add___i32_i32"(i32 %".33", i32 1)
  store i32 %".34", i32* %".2"
  br label %".4"
}

@"formatter6" = internal constant [2 x i8] c"\0a\00"