:: file: setup.bat
::
:: For each 7z archive in the root folder ( the folder which contains this
:: file ) will extract it to the path specified as the first parameter.
::
:: Archives listed in the IGNORE file will be ignored ( not extracted )
::
@ECHO OFF

ECHO +-------------------------------------------------------------+
ECHO ^|  pdev 0.1                                                   ^|
ECHO ^|  by Mihai Rotaru ( mihai.rotaru@gmx.com )                   ^|
ECHO +-------------------------------------------------------------+

:: the drive from which this batch file is run
SET USB_DRIVE=%~d0
ECHO drive of batch file: %USB_DRIVE%

ECHO path of batch file: %CD%

:: the folder which contains the needed tools for the setup
set BSD=%CD%\bootstrap

:: where to unpack ?
set TARGET_DIR=C:\pdev\

:: check for parameters
:Loop
IF "%1"=="" GOTO Continue
set TARGET_DIR="%1"
SHIFT
GOTO Loop

:Continue
ECHO Targed folder: %TARGET_DIR%

echo -----------------------------------------------------------
:: for each 7z archive in the current directory
:: - check if it's not in the IGNORE file
:: - check it there are hooks for it
FOR %%a IN (.\*.7z) DO call :install_package %%a

:install_package
IF "%~n1"=="" GOTO :done_installing_packages
set PACK_NAME=%~n1
echo installing %PACK_NAME% ...

:: call the 'pre' hook - a bat file executed before the
:: unzipping process begins. Most common use is for setting
:: a specific folder for unzipping this particular package
IF EXIST %~p0hooks\pre-%PACK_NAME%.bat (
ECHO executing the 'pre' hook for %PACK_NAME%
CALL %~p0hooks\pre-%PACK_NAME%.bat
ECHO exiting 'pre' hook for %PACK_NAME%)

:: check if a target folder was specified
IF EXIST %~p0hooks\%PACK_NAME%_target.txt (
set /p PACKAGE_TARGET_DIR=<%~p0hooks\%PACK_NAME%_target.txt
)

echo package target folder: %TARGET_DIR%%PACKAGE_TARGET_DIR%

echo BSD: %BSD%
:: unzip the package ( archive )
ECHO unzipping %PACK_NAME%...
%BSD%\7za x %~1 -o%TARGET_DIR%%PACKAGE_TARGET_DIR% -aoa 1>NULL

:: check 7z return codes
IF %ERRORLEVEL%==0 ECHO 7-Zip returned 0 - successfull execution.
IF %ERRORLEVEL%==1 ECHO 7-Zip returned 1 - there were warnings. You can look at log.txt for details.
IF %ERRORLEVEL%==2 ECHO 7-Zip returned 2 - FATAL ERROR
IF %ERRORLEVEL%==7 ECHO 7-Zip returned 7 - command-line error
IF %ERRORLEVEL%==8 ECHO 7-Zip returned 8 - not enough memory
IF %ERRORLEVEL%==255 ECHO 7-Zip returned 255 - user stopped the process

:: delete file created for storing the package's target folder
DEL %~p0hooks\%PACK_NAME%_target.txt

:: execute the 'post' hook - a bat file executed after the
:: unzipping process completed
IF EXIST %~p0hooks\post-%PACK_NAME%.bat (
ECHO executing the 'post' hook for %PACK_NAME%
CALL %~p0hooks\post-%PACK_NAME%.bat
ECHO exiting the 'post' hook for %PACK_NAME%)

set PACKAGE_TARGET_DIR=

echo -----------------------------------------------------------

:done_installing_packages

:: cleanup
::set TARGET_DIR=
::set BSD=

CALL post-setup.bat
