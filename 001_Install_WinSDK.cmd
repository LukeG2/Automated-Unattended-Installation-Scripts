ECHO [96m
REM Setzen von Variablen
set SCRIPTNAME=WinSDK
set INSTALL_LOCATION=D:\Program Files
set LOGFILE=..\Logfiles\001_WinSDK.txt

echo Installation Startet at %DATE% %TIME% >> %LOGFILE%

winsdksetup.exe /q /ceip on /installpath "%INSTALL_LOCATION%\%SCRIPTNAME%" /features OptionId.NetFxSoftwareDevelopmentKit /log %LOGFILE%
IF %ERRORLEVEL% EQU 0 ( echo Installation Endet at %DATE% %TIME% >> %LOGFILE% ) ELSE ( echo Installation Failed %DATE% %TIME% >> %LOGFILE% )