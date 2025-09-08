#include <stdio.h>

#include <inttypes.h>

#include "Windows.h"


#define _COMPLEX_DEFINED

#define _complex _Complex
#define _Complex __Complex

#include <math.h>

#undef _Complex
#undef _complex

int main()
{
    printf("Hello World!\n");

    MessageBoxA(0, "startup_main_c", "startup_main_c", MB_CANCELTRYCONTINUE);
}