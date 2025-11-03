#include <stdio.h>

#include <inttypes.h>

#include "Windows.h"

struct Animal {
    virtual ~Animal(){};
    virtual void Speak() = 0;
};

struct Cat : public Animal {
    ~Cat(){};
    virtual void Speak() override {
         MessageBoxA(0, "meow", "meow\n", MB_CANCELTRYCONTINUE);
    }
};

class Test {
    int* t;
public:
    Test(int a) 
    {
        t = new int(a);
        MessageBoxA(0, "Test()", "Test()\n", MB_CANCELTRYCONTINUE);
    }
    ~Test()
    {
        delete t;
        MessageBoxA(0, "~Test()", "~Test()\n", MB_CANCELTRYCONTINUE);
    }
};
const Test t2 = Test(5);


int main()
{
    MessageBoxA(0, "startup_main_cpp", "startup_main_cpp", MB_CANCELTRYCONTINUE);

    MessageBoxA(0, "Hello World!", "Hello World!\n", MB_CANCELTRYCONTINUE);

    Animal* animal = new Cat();
    animal->Speak();
    delete animal;
}