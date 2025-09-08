#include <stdio.h>

#include <inttypes.h>

#include "Windows.h"

int main()
{
    printf("Hello World!\n");

    MessageBoxA(0, "startup_main_c", "startup_main_c", MB_CANCELTRYCONTINUE);
}