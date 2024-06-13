ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=Flexera
set LOGFILE=..\logfiles\010_Flexera.txt
set LOCATION_FLEXERA=%CD%

echo Installation Startet at %DATE% %TIME% >> %LOGFILE%
copy /Y windows_2022_R2\*.* C:\Scripts

C:
cd \
cd Scripts
cscript "C:\scripts\unzip.vbs" "C:\scripts\lib.zip" "C:\scripts"
cscript "C:\scripts\unzip.vbs" "C:\scripts\packages.zip" "C:\scripts"

PowerShell -ep bypass -command "C:\Scripts\Packages\flexera_client_install\install.cmd" 10.169.203.234 beacon-cndtag.telekom.de
set SCRIPTNAME=Flexera
set LOGFILE=..\logfiles\010_Flexera.txt
cd /D %LOCATION_FLEXERA%
IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )

TIMEOUT /T 10

"C:\Program Files (x86)\ManageSoft\Schedule Agent\ndschedag.exe" -t Machine

rd /Q /S packages\Flexera_Client_Install

del lib.zip
del Packages.zip
del unzip.vbs

