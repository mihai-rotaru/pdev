@ECHO OFF

IF EXIST "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\gVimPortable.exe" (
ECHO gVim found, creating shortcut...
%BSD%\shortcut /A:C /T:"%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\gVimPortable.exe" /F:^"^%USERPROFILE%\Desktop\gVim.lnk^" /R:3
ECHO shortcut.exe returned %ERRORLEVEL%
)
