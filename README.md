# Moth

This repository contains the latest Moth compiler, tools and stdlib.

## Getting Started

More detailed documentation to come, but here is a brief overview of some of Moth's features.

### The Cannonical Hello World

    def int main():
        print("Hello World!")
        return 0

or

    def int main():
        str my_string = "Hello World!"
        print(my_string)
        return 0

or

    def int main():
        my_string = "Hello World!"
        print(my_string)
        return 0

### Base Types
    def int main():
        bool a
        char b
        int c
        long d
        half e
        float f
        double g
        str h
        return 0

### Vector Types
    def int main():
        int3 a = [1,2,3]
        double5 b = [1.0d,1.0d,1.0d,1.0d,1.0d]
        float3x3 c = [[1.0f,1.0f,1.0f],[1.0f,1.0f,1.0f],[1.0f,1.0f,1.0f]]
        print(a,b,"\n",c)
        return 0

SIMD

    def int main():
        a = [1,2,3]
        b = [1,2,3]
        c = a + b
        print(c)
        return 0

### Array Types
    def int main():
        float[:] a = new float[10]
        a[0] = 1.0f
        double[:,:] b = new double[2,3]
        b[1,1] = 1.0d
        float3[:] c = new float3[10]
        return 0

### Structs
Structs are passed by value

    struct TestStruct:
        int attr1
        float attr2

        def TestStruct __init__(int a):
            TestStruct out
            out.attr1 = a
            out.attr2 = 0
    
    def int main():
        TestStruct a = new TestStruct(1,1.0f)
        print(a)
        b = new TestStruct(1)
        print(b)
        return 0

### Objects
Objects are passed by reference

    object TestObject
        int attr1
        float attr2
        def void __init__(TestObject self):
            print("Creating",type(TestObject))
            self.attr1 = 10
            self.attr2 = 10

        def void __init__(TestObject self, int a, floatb):
            print("Creating",type(TestObject),"with alternate constructor")
            self.attr1 = a
            self.attr2 = b
    
    def int main():
        TestObject a = new TestObject()
        b = new TestObject(1,1.0f)
        return 0