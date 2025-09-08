CALL "C:\Program Files\Microsoft Platform SDK\SetEnv.Cmd" /2000 /RETAIL 
CALL "C:\Program Files (x86)\Microsoft Visual Studio 8\VC\bin\vcvars32.bat" 
Set Include=include\clang_crt_patch;clang\lib\clang\21\include;include\win_sdk_patch;include\win_crt_patch;%Include%
Set Path=clang\bin;%Path%
if "%1" == "powershell" powershell.exe
