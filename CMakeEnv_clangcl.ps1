$env:Path = "$PSScriptRoot/clang/bin;${env:Path}"
$env:CMAKE_TOOLCHAIN_FILE = "$PSScriptRoot/CMake/VS2005_Win2003SDK_toolchain_clangcl.cmake"
cmd /K "SetupEnv.bat powershell"