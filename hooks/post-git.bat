@ECHO OFF

:: this file attempts to use shortcut.exe to change the target and start
:: folder of an existing *.lnk file. The existing *.lnk will be copied
:: from the 'files' folder to the desktop ( it has the font, background
:: color, and size set ) and modified to point to the correct location.
::
:: This is neccesary because shortcut.exe doesn't provide for creating
:: shortcuts with custom visual attributes ( font, font color, etc )
::
ECHO pdev root: %PDEV_ROOT%
IF EXIST "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\git-bash.bat" (
ECHO git-bash found, creating shortcut...
:: check if a lnk file with the desired attributes exists in the 'files' folder
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
XCOPY "%PDEV_ROOT%\files\.ssh" "%USERPROFILE%\.ssh" /I /-Y
)

IF EXIST "%PDEV_ROOT%\files\.gitconfig" (
ECHO found .gitconfig on your deveice...
XCOPY "%PDEV_ROOT%\files\.gitconfig" "%USERPROFILE%\.gitconfig" /I /-Y
:: /E /F /L /-Y /H /I /P
