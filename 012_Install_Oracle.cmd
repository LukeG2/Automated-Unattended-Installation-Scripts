ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=Oracle Client
set SCRIPT_LOCATION=%CD%
set BASE_LOCATION=D:\_SW
set INSTALL_LOCATION=D:\app\Oracle
set LOGFILE=..\logfiles\012_Oracle.txt

IF not "%ENVIRONMENT%" == ""  GOTO :ENVIRONMENT
	echo Bitte wähle eine der folgenden Umgebungen
	echo 1 -- Etau Umgebung
	echo 2 -- Prod Umgebung
	CHOICE /c 12 /N
	IF %ERRORLEVEL% EQU 1 set ENVIRONMENT=etau
	IF %ERRORLEVEL% EQU 2 set ENVIRONMENT=prod

:ENVIRONMENT

set ENVIRONMENT-TNS=%ENVIRONMENT%_tnsnames.ora
pause
net stop OracleRemExecServiceV2
TIMEOUT /T 2
net start OracleRemExecServiceV2

ECHO Installation des Oracle Clients 32 Bit >> %LOGFILE%
Oracle_Client_19c_32\client32\setup.exe -silent -nowait -ignoreSysPrereqs -ignorePrereqFailure -waitForCompletion -force -responseFile %CD%\32client.rsp

ECHO Update der JAVA JDK Version für den Oracle Clients 32 Bit >> %LOGFILE%
copy /Y jdk_1.8.391_32bit.zip %INSTALL_LOCATION%\product\19.0.0\client_32\jdk_1.8.391_32bit.zip

cd %INSTALL_LOCATION%\product\19.0.0\client_32
tar xf jdk_1.8.391_32bit.zip

cd %SCRIPT_LOCATION%

net stop OracleRemExecServiceV2
TIMEOUT /T 2
net start OracleRemExecServiceV2

ECHO Installation des Oracle CLients 64 Bit >> %LOGFILE%
Oracle_Client_19c_64\client64\setup.exe -silent -nowait -ignoreSysPrereqs -ignorePrereqFailure -waitForCompletion -force -responseFile %CD%\64client.rsp

ECHO Update der JAVA JDK Version für den Oracle Clients 64 Bit >> %LOGFILE%
copy /Y jdk_1.8.391_64bit.zip %INSTALL_LOCATION%\product\19.0.0\client_64\jdk_1.8.391_64bit.zip

cd %INSTALL_LOCATION%\product\19.0.0\client_64
tar xf jdk_1.8.391_64bit.zip

cd %SCRIPT_LOCATION%

net stop OracleRemExecServiceV2
TIMEOUT /T 2

copy /Y "D:\_SW\001_All_Server_Tools\ODBC und Oracle Konfiguration\%ENVIRONMENT-TNS%" "D:\app\Oracle\product\19.0.0\client_32\network\admin\"
copy /Y "D:\_SW\001_All_Server_Tools\ODBC und Oracle Konfiguration\%ENVIRONMENT-TNS%" "D:\app\Oracle\product\19.0.0\client_64\network\admin\"

net start OracleRemExecServiceV2
pause
IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )