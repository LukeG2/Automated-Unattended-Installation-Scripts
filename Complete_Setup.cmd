rem
ECHO [96m
REM echo off
set SCRIPT_LOCATION_CS=%CD%
set LOGFILE_CS=%SCRIPT_LOCATION_CS%\Logfiles\000_Complete-Setup.txt
IF NOT EXIST %SCRIPT_LOCATION_CS%\Logfiles mkdir %SCRIPT_LOCATION_CS%\Logfiles

echo. >> %LOGFILE_CS%
echo Starting Complete Setup %DATE% %TIME% >> %LOGFILE_CS%

IF NOT "%INPUT_ACCEPTED%"=="1" (
	call D:\_SW\001_All_Server_Tools\INPUT.cmd ENVIRONMENT SID INPUT_ACCEPTED
)	

echo Please chose one of the fellowing servertypes
echo 1 -- Databank Server
echo 2 -- Report Server
echo 3 -- Remote Desktop Server
CHOICE /c 123 /N
IF %ERRORLEVEL% EQU 1 set SERVERTYPE_CS=1 && GOTO :All_Server_Setup
IF %ERRORLEVEL% EQU 2 set SERVERTYPE_CS=2 && GOTO :All_Server_Setup
IF %ERRORLEVEL% EQU 3 set SERVERTYPE_CS=3 && GOTO :All_Server_Setup


:All_Server_Setup
cd %SCRIPT_LOCATION_CS%
echo Starting All Server Tools Setup %DATE% %TIME% >> %LOGFILE_CS%
cd 001_All_Server_Tools
call 000_All_Server_tools_Setup.cmd %ENVIRONMENT% %SID% %INPUT_ACCEPTED%

:Serverselect
echo Chosing Servertype >> %LOGFILE_CS%
IF %SERVERTYPE_CS% EQU 1 GOTO :DB_Server_Setup
IF %SERVERTYPE_CS% EQU 2 GOTO :Report_Server_Setup
IF %SERVERTYPE_CS% EQU 3 GOTO :RDS_Server_Setup


:DB_Server_Setup
cd %SCRIPT_LOCATION_CS%
echo Databank server was chosen >> %LOGFILE_CS%

IF EXIST %SCRIPT_LOCATION_CS%\Logfiles\002_DBServer-Setup.txt GOTO :Exit
echo Starting Databank Server Setup %DATE% %TIME% >> %LOGFILE_CS%
cd 002_DB_Server
call 000_DB_Server_Setup.cmd %ENVIRONMENT%

GOTO :Ende

:Report_Server_Setup
cd %SCRIPT_LOCATION_CS%
echo Report Server was chosen >> %LOGFILE_CS%

IF EXIST %SCRIPT_LOCATION_CS%\Logfiles\003_ReportServer-Setup.txt GOTO :Exit
echo Starting Report Server Setup %DATE% %TIME% >> %LOGFILE_CS%
cd 003_ReportsServer
call 000_Report_Server_Setup.cmd %ENVIRONMENT%

GOTO :Ende

:RDS_Server_Setup
cd %SCRIPT_LOCATION_CS%
echo RDS Server was chosen >> %LOGFILE_CS%
IF EXIST %SCRIPT_LOCATION_CS%\Logfiles\004_RDSServer-Setup.txt GOTO :Exit
echo Starting RDS Server Setup %DATE% %TIME% >> %LOGFILE_CS%
cd 004_RDS_Server
call 000_RDS_Server_Setup.cmd %ENVIRONMENT%

GOTO :Ende

:Ende
cd %SCRIPT_LOCATION_CS%
echo Complete Setup finished %DATE% %TIME% >> %LOGFILE_CS%
echo. >> %LOGFILE_CS%
Echo alles Installiert 
Echo Reboot erfolgt jetzt

pause