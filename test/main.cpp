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
         printf("meow\n");
    }
};

class Test {
    int* t;
public:
    Test(int a) 
    {
        t = new int(a);
        printf("Test()\n");
    }
    ~Test()
    {
        delete t;
        printf("~Test()\n");
    }
};
const Test t2 = Test(5);


int main()
{
    printf("Hello World!\n");

    MessageBoxA(0, "startup_main_cpp", "startup_main_cpp", MB_CANCELTRYCONTINUE);

    Animal* animal = new Cat();
    animal->Speak();
    delete animal;
}