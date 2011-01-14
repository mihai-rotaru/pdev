@ECHO OFF

::echo '"%TARGET_DIR%"'
::echo "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\gVimPortable.exe"
:: create a shortcut
IF EXIST "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\gVimPortable.exe" (
echo gVim found, creating shortcut...
%BSD%\shortcut -t "%TARGET_DIR%%PACKAGE_TARGET_DIR%\%PACK_NAME%\gVimPortable.exe" -n ""%USERPROFILE%"\Desktop\gVim.lnk"
)
