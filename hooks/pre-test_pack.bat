@ECHO OFF

set PACK_NAME_TMP=%~n0
set PACK_NAME=%PACK_NAME_TMP:_pre=%

:: this package will install in the 'apps' folder
echo apps\test > %~p0\%PACK_NAME%_target.txt
