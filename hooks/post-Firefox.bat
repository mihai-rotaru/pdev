@ECHO OFF

IF EXIST "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\FirefoxPortable.exe" (
ECHO Firefox found, creating shortcut...
%BSD%\shortcut /A:C /T:"%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\FirefoxPortable.exe" /F:^"^%USERPROFILE%\Desktop\Firefox.lnk^" /R:3
)
ECHO shortcut.exe returned %ERRORLEVEL%
