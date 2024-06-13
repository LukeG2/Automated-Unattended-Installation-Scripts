ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=nxlog
set SCRIPT_LOCATION=%CD%
set BASE_LOCATION=D:\_SW
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=D:\_SW\001_All_Server_Tools\logfiles\008_NXLog.txt
set "CD_INSTALL=CD /D "%INSTALL_LOCATION%\""

echo Installation Startet at %DATE% %TIME% >> %LOGFILE%
cd nxlog_install

rem call install_nxlog_v1.bat >> %LOGFILE%

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )
