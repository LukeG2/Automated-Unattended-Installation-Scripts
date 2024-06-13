 ECHO [96m
REM Setzen von Variablen
set SAVED_LOCATION=%CD%
set SCRIPT_LOCATION=%SAVED_LOCATION%
set SCRIPTNAME=NotePad++
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=..\Logfiles\006_Notepad++.txt
set "CD_INSTALL=CD /D "%INSTALL_LOCATION%\""
SET BASE_DIR=%SYSTEMDRIVE%\Scripts

echo Installation Startet at %DATE% %TIME% >> "%LOGFILE%"
%CD_INSTALL%
mkdir "%SCRIPTNAME%"
CD /D "%INSTALL_LOCATION%\%SCRIPTNAME%\"

TAR -xf %SCRIPT_LOCATION%\npp.8.6.2.portable.x64.zip
set SAVED_LOCATION=%CD%
cd %SCRIPT_LOCATION%
IF %ERRORLEVEL% EQU 0 ( 
	echo Installation Endet at %DATE% %TIME% >> %LOGFILE% 
	) ELSE (
		echo Installation Failed %DATE% %TIME% >> %LOGFILE% 
)
cd %SAVED_LOCATION%

%BASE_DIR%\bin\nircmd shortcut "%INSTALL_LOCATION%\Notepad++\Notepad++.exe" "%userprofile%\Desktop" "Notepad++" "" "%BASE_DIR%\icon\notepad++appicon.ico"

CD %SCRIPT_LOCATION%
IF %ERRORLEVEL% EQU 0 ( 
	echo Shortcut created %DATE% %TIME% >> %LOGFILE% 
	) ELSE (
		echo Failed to create Shortcut %DATE% %TIME% >> %LOGFILE% 
)
