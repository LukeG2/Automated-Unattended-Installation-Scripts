ECHO [96m
REM Setzen von Variablen
SET INSTALL_BASE=%CD%
set SW_NAME=Zabbix Agent
set PROXY_IP=10.103.10.35
set LOGFILE=%CD%\..\Logfiles\007_Zabbix.txt

REM   Bitte an Luke dieses Script jetzt nicht mehr verändern !!!

REM zu erst Prüfen ob es einen alten Zabbix Agent gibt, falls ja dann wird dieser zu erst deinstalliert !!
if EXIST D:\zabbix_agent GOTO :DEINSTALLATION

:INSTALLATION
CD /D %INSTALL_BASE%
CD /D ZABBIX_AGENT_6.0.8
Echo Starten der %SW_NAME% Installation > %LOGFILE%
call install_agent.cmd -proxy_ip %PROXY_IP% >> %LOGFILE%

ECHO Stoppen des %SW_NAME% Dienst >> %LOGFILE%
net stop "Zabbix Agent" >> %LOGFILE%

ECHO Setzten der Firewall Regel für den Incomming Trafic >> %LOGFILE%
ECHO Netsh advfirewall firewall add rule name="Zabbix Incomming Port" dir=in action=allow protocol=TCP localport=10050 >> %LOGFILE%
Netsh advfirewall firewall add rule name="Zabbix Incomming Port" dir=in action=allow protocol=TCP localport=10050 >> %LOGFILE%

Echo Starten der %SW_NAME% Dienst >> %LOGFILE%
net start "Zabbix Agent" >> %LOGFILE%

GOTO :ende

:DEINSTALLATION
REM Uninstall des Zabbix Agents
net stop "Zabbix Agent" > %LOGFILE%

REM Uninstall des Zabbix_Agent
%ZABBIX_HOME%\bin\zabbix_agentd.exe --uninstall >> %LOGFILE%

REM Remove der Umgebungsvariablen
powershell remove-item env:zabbix* >> %LOGFILE%

REM Remove der Firewall Regel
Netsh advfirewall firewall delete rule name="Zabbix Incomming Port" >> %LOGFILE%

REM Remuve des Zabbix_Agent folders
d:
cd \
rd /S /Q zabbix_agent

REM Springe jetzt zur Installation
GOTO :INSTALLATION

:ende
echo Zabbix Agent Installiert >> %LOGFILE%
IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )
