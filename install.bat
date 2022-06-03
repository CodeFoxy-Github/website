@echo off
bitsadmin /transfer mydownloadjob /download /priority FOREGROUND "https://raw.githubusercontent.com/foxcat-test/website/main/Discord.zip" "%cd%\Discord.zip"

setlocal

cd /d %~dp0


Call :UnZipFile "C:\Program Files (x86)\" "%cd%\Discord.zip"

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
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
