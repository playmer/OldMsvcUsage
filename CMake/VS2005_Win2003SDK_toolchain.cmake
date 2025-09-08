set(CMAKE_SYSTEM_NAME Windows3x)

set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_C_COMPILER clang)
set(CMAKE_AR llvm-ar)


set(CMAKE_PCH_PROLOGUE "#pragma clang system_header")

# The following stuff doesn't work.
## macOS paths usually start with /Users/*. Unfortunately, clang-cl interprets
## paths starting with /U as macro undefines, so we need to put a -- before the
## input file path to force it to be treated as a path.
#string(REPLACE "-c <SOURCE>" "-c -- <SOURCE>" CMAKE_${lang}_COMPILE_OBJECT "${CMAKE_${lang}_COMPILE_OBJECT}")
#string(REPLACE "-c <SOURCE>" "-c -- <SOURCE>" CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE "${CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE}")
#string(REPLACE "-c <SOURCE>" "-c -- <SOURCE>" CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE "${CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE}")

set(WIN32 1 CACHE INTERNAL "")
#set(CMAKE_EXE_LINKER_FLAGS "-Xlinker /LIBPATH:${CMAKE_CURRENT_LIST_DIR}/win_sdk_gen/defs/ KERNEL32.lib USER32.lib -Xlinker /subsystem:console,4 -Xlinker /NODEFAULTLIB -Xlinker /version:0 -Xlinker /osversion:4 -Xlinker /align:4096 -Xlinker /filealign:4096 -Xlinker /dynamicbase:no -Xlinker /tsaware:no -Xlinker /nxcompat:no -Xlinker /FIXED" CACHE INTERNAL "")
set(CMAKE_EXE_LINKER_FLAGS "-Xlinker /LIBPATH:${CMAKE_CURRENT_LIST_DIR}/win_sdk_gen/defs/ -Xlinker /subsystem:console,4 -Xlinker /version:0 -Xlinker /osversion:4 -Xlinker /align:4096 -Xlinker /filealign:4096 -Xlinker /dynamicbase:no -Xlinker /tsaware:no -Xlinker /nxcompat:no -Xlinker /FIXED" CACHE INTERNAL "")

# Pass -v for verbose output
#set(CMAKE_CXX_FLAGS_INIT "-target i386-pc-win32 -DWIN32 -I ${CMAKE_CURRENT_LIST_DIR}/llvm/lib/clang/20/include -I \"C:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/um\" -I \"C:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/shared\" -march=i386 -fuse-ld=lld-link -m32 -nostdinc")
#set(CMAKE_C_FLAGS_INIT "-target i386-pc-win32 -DWIN32 -I ${CMAKE_CURRENT_LIST_DIR}/llvm/lib/clang/20/include -I \"C:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/um\" -I \"C:/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/shared\" -march=i386 -fuse-ld=lld-link -m32 -nostdinc")


set(__WIN9X_DEFINES "-DWIN32 -D_STDCALL_SUPPORTED=1 -D__STDC__=1")
set(__WIN9X_ARCH_FLAGS "-target i386-pc-win32 -march=i386 -m32")
set(__WIN9X_INCLUDE_FLAGS "-nobuiltininc")
#set(__WIN9X_LINK_FLAGS "-fuse-ld=lld-link -L \"C:/Program Files (x86)/Microsoft Visual Studio 8/VC/LIB\" -L \"C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/lib\" -L \"C:/Program Files/Microsoft Platform SDK/Lib\"")
set(__WIN9X_LINK_FLAGS "-fuse-ld=lld-link -L \"C:/Program Files (x86)/Microsoft Visual Studio 8/VC/LIB\" -L \"C:/Program Files (x86)/Microsoft Visual Studio 8/SDK/v2.0/lib\" -L \"C:/Program Files/Microsoft Platform SDK/Lib\" -l User32.lib -l Kernel32.lib")

set(CMAKE_CXX_FLAGS_INIT "-v ${__WIN9X_DEFINES} -fms-compatibility-version=0 ${__WIN9X_ARCH_FLAGS} ${__WIN9X_INCLUDE_FLAGS} ${__WIN9X_LINK_FLAGS}")
set(CMAKE_C_FLAGS_INIT "-v ${__WIN9X_DEFINES} -fms-compatibility-version=0 ${__WIN9X_ARCH_FLAGS} ${__WIN9X_INCLUDE_FLAGS} ${__WIN9X_LINK_FLAGS}")

set(CMAKE_GENERATOR Ninja)
