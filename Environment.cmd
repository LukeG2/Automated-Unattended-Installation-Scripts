
	echo Bitte wähle eine der folgenden Umgebungen
	echo 1 -- Etau Umgebung
	echo 2 -- Prod Umgebung
	CHOICE /c 12 /N
	IF %ERRORLEVEL% EQU 1 set ENVIRONMENT=etau
	IF %ERRORLEVEL% EQU 2 set ENVIRONMENT=prod