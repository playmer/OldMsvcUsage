
#define _MSV_VER_TEMP _MSC_VER 
#undef _MSC_VER
#define _MSC_VER 1800
#include_next <inttypes.h>
#undef _MSC_VER
#define _MSC_VER _MSV_VER_TEMP
#undef  _MSV_VER_TEMP