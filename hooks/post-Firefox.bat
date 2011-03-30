@ECHO OFF

:: make sure the file we want to create a shortcut to exists
IF EXIST "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\FirefoxPortable.exe" (
ECHO Firefox found, creating shortcut...
%BSD%\shortcut /A:C /T:"%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\FirefoxPortable.exe" /F:^"^%USERPROFILE%\Desktop\Firefox.lnk^" /R:3
ECHO shortcut.exe returned %ERRORLEVEL%
)

:: copy the 'vimperator' folder in 'pdev_root\files' to %USERPROFILE%\vimperator
IF EXIST "%PDEV_ROOT%\files\vimperator" (
ECHO found the vimperator folder on your device...
IF EXIST "%USERPROFILE%\vimperator" (
ECHO you already have a vimperator folder in your user profile folder...
)
ECHO copying the contents of the vimperator folder on the USB...
CALL XCOPY "%PDEV_ROOT%\files\vimperator" "%USERPROFILE%\vimperator" /I /-Y
)

:: copy the vimperatorrc file in 'pdev_root\files' to %USERPROFILE%
IF EXIST "%PDEV_ROOT%\files\vimperatorrc" (
ECHO found vimperatorrc on your device...
CALL XCOPY "%PDEV_ROOT%\files\vimperatorrc" "%USERPROFILE%\vimperatorrc" /I /-Y
)
