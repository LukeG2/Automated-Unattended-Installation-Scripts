ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=MySQL Connector NET
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=..\logfiles\014_MySQL-Connector.txt


msiexec /i mysql-connector-net-8.4.0.msi /q INSTALLDIR="%INSTALL_LOCATION%\MySQL\MySQL Connector Net 8.4.0" /l %LOGFILE%

IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )

