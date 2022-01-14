::Written by unomind
@echo off  
cls
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
 
if '%errorlevel%' NEQ '0' (  
    goto UACPrompt  
) else ( goto gotAdmin )  
   
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs" 
    "%temp%\getadmin.vbs" 
    exit /B  
   
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%" 
    CD /D "%~dp0" 
 
:begin
    echo Checking or waiting...
    if exist C:\$WINDOWS.~BT\Sources\appraiserres.dll (goto start) else (goto begin)

:start
    echo please let me be able to install update! > appraiserres.dll
    copy /y appraiserres.dll C:\$WINDOWS.~BT\Sources
    del appraiserres.dll
    attrib +r C:\$WINDOWS.~BT\Sources\appraiserres.dll
    echo You can update now!
