@echo off
bitsadmin /transfer mydownloadjob /download /priority FOREGROUND "https://raw.githubusercontent.com/foxcat-test/website/main/Discord.zip" "%cd%\Discord.zip"

setlocal

cd /d %~dp0


Call :UnZipFile "C:\Program Files (x86)\" "%cd%\Discord.zip"


exit /b

set Program=C:\Program Files (x86)\Discord\Discord.exe
 
:: set startup parameters (optional)
set  Arguments=
 
:: set shortcut name (required)
set LnkName=Discord
 
:: set the working path of the program, generally the program home directory. If this item is left blank, the script will analyze the path by itself
set WorkDir=
 
: set the description of shortcut display (optional)
set Desc=
 
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
echo oShellLink.Arguments="%Arguments%"
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.Save)>makelnk.vbs
echo Desktop shortcut created successfully!
makelnk.vbs
del /f /q makelnk.vbs
exit
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof




set Program=C:\Program Files (x86)\Discord\Discord.exe
 
:: set startup parameters (optional)
set  Arguments=
 
:: set shortcut name (required)
set LnkName=Discord
 
:: set the working path of the program, generally the program home directory. If this item is left blank, the script will analyze the path by itself
set WorkDir=
 
: set the description of shortcut display (optional)
set Desc=
 
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo Set oShellLink=WshShell.CreateShortcut(%AppData%\Microsoft\Windows\Start Menu\Programs\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
echo oShellLink.Arguments="%Arguments%"
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.Save)>makelnk.vbs
echo Desktop shortcut created successfully!
makelnk.vbs
del /f /q makelnk.vbs
exit
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof
