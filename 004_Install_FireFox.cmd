ECHO [96m
REM Setzen von Variablen
set "SETUP_NAME=Firefox Setup 123.0esr.msi"
set SW_NAME=Mozilla Firefox
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=..\logfiles\004_Firefox.txt

echo Installation Startet at %DATE% %TIME% > %LOGFILE%

msiexec.exe /i "%SETUP_NAME%" /qb /norestart /passive /log %LOGFILE% INSTALL_DIRECTORY_PATH="%INSTALL_LOCATION%\%SW_NAME%" TASKBAR_SHORTCUT=false START_MENU_SHORTCUT=false DESKTOP_SHORTCUT=true REMOVE_DISTRIBUTION_DIR=false INSTALL_MAINTENANCE_SERVICE=false 

TIMEOUT /T 2

mkdir "%INSTALL_LOCATION%\%SW_NAME%\distribution"
copy /Y policies.json "%INSTALL_LOCATION%\%SW_NAME%\distribution\"


IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )