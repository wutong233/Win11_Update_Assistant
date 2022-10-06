::Written by unomind
::A poor work learned from baidu.
@echo off  
cls
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
 
if '%errorlevel%' NEQ '0' (  
    goto UACPrompt  
) else ( goto gotAdmin )  
   
:UACPrompt  
::Method From CSDN
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs" 
    "%temp%\getadmin.vbs" 
    exit /B  
   
:gotAdmin  
::Method From CSDN
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%" 
    CD /D "%~dp0" 
 
:begin
    ping -n 2 127.0.0.1
    echo Checking or waiting...
    if exist C:\$WINDOWS.~BT\Sources\appraiserres.dll (goto start) else (goto begin)

:start
    ping -n 2 127.0.0.1
    echo please let me be able to install update! > appraiserres.dll
    copy /y appraiserres.dll C:\$WINDOWS.~BT\Sources
    del appraiserres.dll
    attrib +r C:\$WINDOWS.~BT\Sources\appraiserres.dll
    echo You can update now!
    pause
