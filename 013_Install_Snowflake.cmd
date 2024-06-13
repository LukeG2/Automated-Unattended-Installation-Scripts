ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=Snowflake ODBC Driver
set SCRIPT_LOCATION=%CD%
set BASE_LOCATION=D:\_SW
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=..\logfiles\013_Snowflake.txt

IF "%ENVIRONMENT%" == ""  GOTO :ENVIRONMENT
	echo Bitte wähle eine der folgenden Umgebungen
	echo 1 -- Etau Umgebung
	echo 2 -- Prod Umgebung
	CHOICE /c 12 /N
	IF %ERRORLEVEL% EQU 1 set ENVIRONMENT=etau
	IF %ERRORLEVEL% EQU 2 set ENVIRONMENT=prod

:ENVIRONMENT


set ENVIRONMENT-KONFIG=%ENVIRONMENT%_snowflake_konfig.reg

echo Installation von den Snowflake 64 Bit Treiber gestartet am %DATE% um %TIME% >> %LOGFILE%
msiexec /i snowflake64_odbc-3.1.4.msi /l %CD%\install_snowflake_64bit.txt LOGPATH="%INSTALL_LOCATION%\Snowflake ODBC Driver\logs" SNOWFLAKEINSTALLDIR="%INSTALL_LOCATION%\Snowflake ODBC Driver" /q

mkdir "%INSTALL_LOCATION%\Snowflake ODBC Driver\logs"

cd "D:\_SW\001_All_Server_Tools\ODBC und Oracle Konfiguration\"
REGEDIT /S %ENVIRONMENT-KONFIG%
cd %SCRIPT_LOCATION%

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )
