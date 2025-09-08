
# Complications
 - Clang has some Windows APIs as intrinsics, and they're _slighltly_ different now, one of the args being volatile. Should we patch the Windows SDK header? I don't _think_ it would cause problems. Alternatively could provide a forwarding header to def/undef the symbol to something else.

# Compiling with clang:

## C
`clang test\main.c -D__STDC__=1 -fms-compatibility-version=0 -nobuiltininc -v  -march=i386 -m32 -fuse-ld=lld-link -L "%Lib%" -l User32.lib`

## C++

`clang++ -D_STDCALL_SUPPORTED=1 -D__STDC__=1 test\main.cpp -fms-compatibility-version=0 -nobuiltininc -v  -march=i386 -m32 -fuse-ld=lld-link -L "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/LIB" -L "C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/lib" -L "C:/Program Files/Microsoft Platform SDK/Lib" -l User32.lib`