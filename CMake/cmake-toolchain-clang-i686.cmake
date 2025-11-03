set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86)

find_program(CMAKE_C_COMPILER NAMES clang)
find_program(CMAKE_CXX_COMPILER NAMES clang++)
find_program(CMAKE_RC_COMPILER NAMES llvm-rc)

if(NOT CMAKE_C_COMPILER)
	message(FATAL_ERROR "Failed to find CMAKE_C_COMPILER.")
endif()

if(NOT CMAKE_CXX_COMPILER)
	message(FATAL_ERROR "Failed to find CMAKE_CXX_COMPILER.")
endif()

if(NOT CMAKE_RC_COMPILER)
        message(FATAL_ERROR "Failed to find CMAKE_RC_COMPILER.")
endif()

set(CMAKE_CXX_FLAGS_INIT "-D_WIN32_WINNT=0x0501 -m32") #-target i386-pc-win32 -march=i386")
set(CMAKE_C_FLAGS_INIT "-D_WIN32_WINNT=0x0501 -m32") #-target i386-pc-win32 -march=i386")
