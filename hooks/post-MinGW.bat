%BSD%\setx PATH "C:\pdev\MinGW\bin;C:\pdev\MinGW\msys\1.0\bin;C:\pdev\apps\gVim\Tools;C:\pdev\MinGW\tools;C:\Python26;C:\ruby-1.9.1\bin;c:\pdev\apps\7-Zip\App\7-Zip;C:\Python26\Scripts;c:\pdev\git\bin;C:\pdev\apps\gVim\App\vim\vim73"

IF EXIST "%PDEV_ROOT%\files\.bashrc" (
ECHO found .bashrc on your deveice...
XCOPY "%PDEV_ROOT%\files\.bashrc" "%USERPROFILE%\.bashrc" /I /-Y
)
