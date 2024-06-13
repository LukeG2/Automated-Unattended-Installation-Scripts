ECHO [96m
REM Setzen von Variablen
set SW_NAME=Microsoft Edge
set LOGFILE=..\logfiles\002_MicrosoftEdge.txt

echo Installation Startet at %DATE% %TIME% >> %LOGFILE%

msiexec /i MicrosoftEdgeEnterpriseX64.msi /qb /norestart /passive /log %LOGFILE%

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )
