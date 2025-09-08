# Setup

Make sure to install VS2005 express, the Windows Server 2003 SDK, and clang. Install scripts have been provided in `InstallerScripts`, the SDK one isn't tested as a cohesive script yet, need to spin up a VM, as I ran those commands manually.

The clang one is just downloading the latest clang and putting it locally here, ideally we actually install this "toolchain" somewhere.


# Complications
 - Clang has some Windows APIs as intrinsics, and they're _slighltly_ different now, one of the args being volatile. Should we patch the Windows SDK header? I don't _think_ it would cause problems. Alternatively could provide a forwarding header to def/undef the symbol to something else.
   - Currently I'm just shimming them.

# Compiling with clang:

Run SetupEnv.bat or SetupEnv.ps1 depending on if you're using powershell or cmd. That'll get you a command line environment that works. You should be able to call `cl` and `clang`.

## C
`clang -D_STDCALL_SUPPORTED=1 -D__STDC__=1 test\main.c -fms-compatibility-version=0 -nobuiltininc -v  -march=i386 -m32 -fuse-ld=lld-link -L "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/LIB" -L "C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/lib" -L "C:/Program Files/Microsoft Platform SDK/Lib" -l User32.lib`

## C++

`clang++ -D_STDCALL_SUPPORTED=1 -D__STDC__=1 test\main.cpp -fms-compatibility-version=0 -nobuiltininc -v  -march=i386 -m32 -fuse-ld=lld-link -L "C:/Program Files (x86)/Microsoft Visual Studio 8/VC/LIB" -L "C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/lib" -L "C:/Program Files/Microsoft Platform SDK/Lib" -l User32.lib`