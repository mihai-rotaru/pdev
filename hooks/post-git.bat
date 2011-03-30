@ECHO OFF

ECHO pdev root: %PDEV_ROOT%

:: make sure the file we want to create a shortcut to exists
IF EXIST "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\git-bash.bat" (
ECHO git-bash found, creating shortcut...
%BSD%\shortcut /A:C /T:"%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\FirefoxPortable.exe" /F:^"^%USERPROFILE%\Desktop\Firefox.lnk^" /R:3
ECHO shortcut.exe returned %ERRORLEVEL%
)

:: copy the .ssh folder in 'pdev_root\files' to %USERPROFILE%\.ssh
IF EXIST "%PDEV_ROOT%\files\.ssh" (
ECHO found the .ssh folder on your device...
IF EXIST "%USERPROFILE%\.ssh" (
ECHO you already have a .ssh folder in your user profile folder...
)
ECHO copying the contents of the .ssh folder on the USB...
CALL XCOPY "%PDEV_ROOT%\files\.ssh" "%USERPROFILE%\.ssh" /I /-Y
ECHO after calling xcopy .ssh, in the hook
)

:: copy the .gitconfig file in 'pdev_root\files' to %USERPROFILE%
IF EXIST "%PDEV_ROOT%\files\.gitconfig" (
ECHO found .gitconfig on your deveice...
CALL XCOPY "%PDEV_ROOT%\files\.gitconfig" "%USERPROFILE%\.gitconfig" /I /-Y
)
