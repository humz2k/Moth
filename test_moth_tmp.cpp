#include "/Users/humzaqureshi/GitHub/Moth/bin/moth_lib.hpp"


class __MothObjectfile{
public:
std::ofstream raw_write;std::ifstream raw_read;__Mothint mode;__Mothstr name;__Mothvoid Moth__init__(__Mothstr filename){
name = filename;
mode = -1;

}

__Mothvoid Mothopen(__Mothstr in_mode){
if (__MothBaseNOT_EQUAL(mode,-1)){
if (__MothBaseEQUAL(in_mode,convString("w"))){
mode = 0;
raw_write.open(name);
return ;

}

if (__MothBaseEQUAL(in_mode,convString("r"))){
mode = 1;
raw_read.open(name);
return ;

}

MoththrowErr(convString("Invalid file mode\n"));

}

else{
MoththrowErr(convString("File already open\n"));

}


}

__Mothvoid Mothclose(){
if (__MothBaseEQUAL(mode,0)){
mode = -1;
raw_write.close();
return ;

}

if (__MothBaseEQUAL(mode,1)){
mode = -1;
raw_read.close();
return ;

}

MoththrowErr(convString("No file open\n"));

}


};
__Mothint Mothmain(){
__MothObjectfile f;f.Moth__init__(convString("test.txt"));
f.Mothopen(convString("w"));
f.Mothclose();
return 0;

}

int main() {I.real = 0; I.imag = 1; return Mothmain();}
