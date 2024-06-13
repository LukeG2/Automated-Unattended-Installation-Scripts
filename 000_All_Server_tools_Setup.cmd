rem
echo on
ECHO [96m
set SCRIPT_LOCATION_AST=%CD%
mkdir D:\_SW\001_All_Server_Tools\Logfiles
SET LOGFILE_AST=..\Logfiles\001_AllServer-Setup.txt

IF NOT "%INPUT_ACCEPTED%"=="1" (
	call D:\_SW\001_All_Server_Tools\INPUT.cmd ENVIRONMENT SID INPUT_ACCEPTED
)	
echo Starting All Server Tools Setup %DATE% %TIME% >> %LOGFILE_AST%

:WinSDK
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\001_WinSDK.txt GOTO :Edge
echo Starting WinSDK Script %DATE% %TIME% >> %LOGFILE_AST%
cd 001_Windows_SDK
call 001_Install_WinSDK.cmd %ENVIRONMENT%

:Edge
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\002_MicrosoftEdge.txt GOTO :Chrome
echo Starting Microsoft Edge Script %DATE% %TIME% >> %LOGFILE_AST%
cd 002_Microsoft_Edge
call 002_Install_MS_Edge.cmd %ENVIRONMENT%

:Chrome
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\003_GoogleChrome.txt GOTO :Firefox
echo Starting Microsoft Chrome Script %DATE% %TIME% >> %LOGFILE_AST%
cd 003_GoogleChromeEnterpriseBundle64
call 003_Install_GoogleChrome.cmd %ENVIRONMENT%

:Firefox
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\004_Firefox.txt GOTO :7-Zip
echo Starting Mozilla Firefox Script %DATE% %TIME% >> %LOGFILE_AST%
cd 004_FireFox
call 004_Install_Firefox.cmd %ENVIRONMENT%

:7-Zip
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\005_7Zip.txt GOTO :Notepad++
echo Starting 7-Zip Script %DATE% %TIME% >> %LOGFILE_AST%
cd 005_7-Zip 
call 005_Install_7-Zip.cmd %ENVIRONMENT%

:NotePad++
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\006_Notepad++.txt GOTO :Zabbix
echo Starting Notepad++ Script %DATE% %TIME% >> %LOGFILE_AST%
cd 006_NotePad++
call 006_Install_NotePad++.cmd %ENVIRONMENT%

:Zabbix
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\007_Zabbix.txt GOTO :NXLog
echo Starting Zabbix Script %DATE% %TIME% >> %LOGFILE_AST%
cd 007_zabbix
call 007_Install_Zabbix.cmd %ENVIRONMENT%

:NXLog
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\008_NXLog.txt GOTO :Dynatrace
echo Starting NXLog Script %DATE% %TIME% >> %LOGFILE_AST%
cd 008_nxlog_for_SIEM
call 008_Install_nxlog.cmd %ENVIRONMENT%

:Dynatrace
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\009_Dynatrace.txt GOTO :Flexera
echo Starting Dynatrace Script %DATE% %TIME% >> %LOGFILE_AST%
cd 009_Dynatrace
call 009_Install_Dynatrace.cmd %ENVIRONMENT% %SID% %INPUT_ACCEPTED%
ECHO [96m

:Flexera
CD /D %SCRIPT_LOCATION_AST%
echo on
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\010_Flexera.txt GOTO :MS-Defender
echo Starting Flexera Script %DATE% %TIME% >> %LOGFILE_AST%
cd 010_Flexera 
call 010_Install_Flexera.cmd %ENVIRONMENT%

:MS-Defender
CD /D %SCRIPT_LOCATION_AST%
cd D:\_SW\001_All_Server_Tools
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\011_MSDefender.txt GOTO :Oracle
echo Starting Microsoft Defender Script %DATE% %TIME% >> %LOGFILE_AST%
cd 011_MS_Defender
call 011_Install_MS_defender.cmd %ENVIRONMENT%

:Oracle
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\012_Oracle.txt GOTO :Snowflake
echo Starting Oracle Script %DATE% %TIME% >> %LOGFILE_AST%
cd 012_Oracle_Client
call 012_Install_Oracle.cmd %ENVIRONMENT%

pause 

:Snowflake
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\013_Snowflake.txt GOTO :MySQL
echo Starting Snoflake Script %DATE% %TIME% >> %LOGFILE_AST%
cd 013_Snowflake_odbc
call 013_Install_Snowflake.cmd %ENVIRONMENT%
cd..

:MySQL
CD /D %SCRIPT_LOCATION_AST%
IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\014_MySQL-Connector.txt GOTO :Ende
echo Starting MySQL Connector Script %DATE% %TIME% >> %LOGFILE_AST%
cd 014_MySQL_Connector_NET
call 014_Install_MySQL.cmd %ENVIRONMENT%

:Ende
CD /D %SCRIPT_LOCATION_AST%
echo Finishing All Server Tools Setup %DATE% %TIME% >> %LOGFILE_AST%

REM Vorlage für weitere Installationsskripte
REM ----------------------------------------------------------------------------------------------
REM :PROGRAMMNAME
REM CD /D %SCRIPT_LOCATION_AST%
REM IF EXIST D:\_SW\001_All_Server_Tools\Logfiles\NUMMER_PROGRAMMNAME.txt GOTO :NÄCHSTES PROGRAMM
REM SET LOGFILE=%SAVED_LOGFILE%
REM echo Starting PROGRAMNAME Script %DATE% %TIME% >> %LOGFILE_AST%
REM cd PROGRAMM INSTALLATIONSORDNER
REM call PROGRAMM INSTALLATIONSSKRIPT.cmd
REM ----------------------------------------------------------------------------------------------
