ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=7-Zip
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=..\logfiles\005_7Zip.txt

echo Installation Startet at %DATE% %TIME% >> %LOGFILE%

7z2301-x64.exe /S /D="%INSTALL_LOCATION%\7-Zip" >> %LOGFILE%

REM For exe installer: Use the "/S" parameter to do a silent installation and the /D="D:\Program Files\7-Zip" parameter to specify the "output directory". These options are case-sensitive.

REM For msi installer: Use the /q INSTALLDIR="C:\Program Files\7-Zip" parameters.


IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )
