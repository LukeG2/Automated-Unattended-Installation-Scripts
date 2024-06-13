ECHO [96m
REM Setzen von Variablen
set INSTALL_LOCATION=D:\Programs
set LOGFILE=..\logfiles\011_MSDefender.txt

rem call Defender_EDR_Offline_V1.5\Defender_EDR_Onboard_Run\Start_Defender_EDR_Onboard_Run.cmd >> %LOGFILE%

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )