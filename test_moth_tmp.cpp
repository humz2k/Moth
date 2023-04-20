#include "/Users/humzaqureshi/GitHub/Moth/bin/moth_lib.hpp"


class __MothObjectfile{
public:
std::ofstream raw;__Mothstr name;__Mothvoid Moth__init__(__Mothstr filename){
name = filename;

}

__Mothvoid Mothopen(){
raw.open(name);

}


};
__Mothint Mothmain(){
__MothObjectfile f;f.Moth__init__(convString("test.txt"));
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
