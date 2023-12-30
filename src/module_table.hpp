#include <iostream>
#include <memory>
#include <string>

typedef enum {
    MOTH_I1,
    MOTH_I8,
    MOTH_I16,
    MOTH_I32,
    MOTH_I64,
    MOTH_F16,
    MOTH_F32,
    MOTH_F64,
    MOTH_STRUCT,
    MOTH_OBJECT
} moth_base_type;

class moth_type{
    public:
        virtual ~moth_type() = default;
};

class moth_int_type : public moth_type{
    public:
        int width;
        moth_int_type(int width);
};

class moth_float_type : public moth_type{
    public:
        int width;
        moth_float_type(int width);
};

class moth_string_type : public moth_type{
    public:
        moth_string_type();
};

class moth_data_field{
    public:
        std::string name;
        moth_type type;
        moth_data_field(std::string name_, moth_type type_);
};

class moth_custom_type : public moth_type{
    public:
        std::vector<moth_data_field> attributes;
        moth_custom_type(std::vector<moth_data_field> attributes_);
};

class moth_object_type : public moth_custom_type{
    public:
        
};

class moth_struct_type : public moth_custom_type{
    public:
        
};

class moth_global{
    private:

};