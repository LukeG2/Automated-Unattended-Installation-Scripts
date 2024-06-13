
ECHO OFF
set AC=0
:START
ECHO [%AC%m

call D:\_SW\001_All_Server_Tools\Environment.cmd ENVIRONMENT

IF "%SID_ACCEPTED%" == "1" GOTO :INSTALL
:SID
IF "%RETRY%" == "1" GOTO :RETRY
IF NOT "%SID%" == "" GOTO :SID_P
:RETRY
call D:\_SW\001_All_Server_Tools\009_Dynatrace\SID_Check.cmd %AC%
set SID=S%ERRORLEVEL%
:SID_P

set RETRY=0
set RETRY=0
ECHO [93m --- [%AC%m Bitte überprüfen Sie ob ihre Angaben richtig sind:
ECHO [93m --- [%AC%m Umgebungstyp: [95m %ENVIRONMENT% Umgebung [%AC%m
ECHO [93m --- [%AC%m SID von %COMPUTERNAME%: [95m %SID% [%AC%m
ECHO.
ECHO [%AC%m
CHOICE /C YyNn /CS /N /M "Sind diese Angaben richtig [Y/N] "
IF %ERRORLEVEL% EQU 3 set "RETRY=1" && GOTO :START
IF %ERRORLEVEL% EQU 4 set "RETRY=1" && GOTO :START
set SID_ACCEPTED=1
:INSTALL 
set INPUT_ACCEPTED=1