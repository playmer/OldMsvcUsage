CALL "C:\Program Files\Microsoft Platform SDK\SetEnv.Cmd" /2000 /RETAIL 
CALL "C:\Program Files (x86)\Microsoft Visual Studio 8\VC\bin\vcvars32.bat" 
Set Include=%~dp0include\clang_crt_patch;%~dp0clang\lib\clang\21\include;%~dp0include\win_sdk_patch;%~dp0include\win_crt_patch;%Include%
Set Path=clang\bin;%Path%
if "%1" == "powershell" powershell.exe
