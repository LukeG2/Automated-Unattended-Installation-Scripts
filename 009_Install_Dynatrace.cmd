
echo off
chcp 65001 >nul

:START
ECHO [96m
REM Setzen von Variablen
set SCRIPT_LOCATION=%CD%
set BASE_LOCATION=D:\_SW
set "INSTALL_LOCATION=D:\Program Files"
set LOGFILE=..\logfiles\009_Dynatrace.txt
set "CD_INSTALL=CD /D "%INSTALL_LOCATION%\""

REM ABFRAGEN BENÖTIGTER DATEN
:INPUT
IF NOT "%INPUT_ACCEPTED%"=="1" (
	call D:\_SW\001_All_Server_Tools\INPUT.cmd ENVIRONMENT SID INPUT_ACCEPTED

)	
:ENVIRONMENT
IF "%ENVIRONMENT%" == "prod" (
	set ENVIRONMENT=PROD
	set AC=34
	ECHO [%AC%m
	set SHORT_ENVIRONMENT=P
) ELSE (
	set ENVIRONMENT=ETAU
	set AC=32
	ECHO [%AC%m
	set SHORT_ENVIRONMENT=A
)


echo Installation Startet at %DATE% %TIME% >> %LOGFILE%
%CD_INSTALL%
mkdir %SCRIPTNAME%
CD %SCRIPT_LOCATION%
dynatrace-OneAgent-Windows.exe INSTALL_PATH="D:\Programs\dynatrace\oneagent\" --quiet ADDITIONAL_CONFIGURATION="--set-host-group=Microsoft-BI@TDG_%ENVIRONMENT% --set-host-name=%COMPUTERNAME% --set-host-property=HUB=BI4BS --set-host-property=AppName_Darwin=Microsoft-BI_TDG_(%SHORT_ENVIRONMENT%) --set-host-property=AppNickName=MSBI_TDG --set-host-property=Operation_Mode=Approvaltest --set-host-property=NOR_Model=DE3 --set-host-property=ICTO-ID=ICTO-21603 --set-host-property=IncidentAssignmentGroup=TIT.TSI.INT.AO.TS1 --set-host-property=Systemname=%COMPUTERNAME% --set-host-property=SystemID=%SID%"

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )

