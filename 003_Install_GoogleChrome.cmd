ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=GoogleChrome
set LOGFILE=..\logfiles\003_GoogleChrome.txt

echo Installation Startet at %DATE% %TIME% >> %LOGFILE%
msiexec /i Installers\GoogleChromeStandaloneEnterprise64.msi /qb /passive /norestart /log %LOGFILE%

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )
