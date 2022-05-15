@echo off
cd /d %userprofile%
color 7

rem Coded by batu.sh#9675
:: 
:: ▐▓█▀▀▀▀▀▀▀▀▀█▓▌░▄▄▄▄▄░
:: ▐▓█░░▀░░▀▄░░█▓▌░█▄▄▄█░
:: ▐▓█░░▄░░▄▀░░█▓▌░█▄▄▄█░
:: ▐▓█▄▄▄▄▄▄▄▄▄█▓▌░█████░
::  ░░░▄▄███▄▄░░░░░█████░
:: 

:main
title %username%@%computername%: ~%cd%
set /p console=$ 

If %console%==help goto help
If %console%==admin goto admin
If %console%==firewall-on goto firewall-on
If %console%==firewall-off goto firewall-off
If %console%==metasploit goto metasploit
If %console%==mkdir goto mkdir
If %console%==del goto del
If %console%==copy goto copy
If %console%==ren goto ren
If %console%==ls goto ls
If %console%==ip goto ip
If %console%==clear goto clear
If %console%==driver goto driver
If %console%==color goto color
If %console%==startup goto startup
If %console%==temp goto temp
If %console%==webhook goto webhook

If %console%==exit goto exit
:errorCMDnotFound
echo %console%: command not found
goto main

:help
echo.
echo ^| help = (show commands)
echo ^| admin = (get administrative privileges)
echo ^| firewall-on/off = (set firewall status)
echo ^| metasploit = (all-in-one hacking tool)
echo ^| mkdir/del/copy/ren/ls = (file commands)
echo ^| ip = (ipconfig)
echo ^| clear = (clear command line)
echo ^| driver = (install drivers)
echo ^| color = (change command line color)
echo ^| startup = (set as startup application)
echo ^| temp = (delete temp)
echo ^| webhook = (webhook features)
echo ^| exit = (exit from command line)
echo.
goto main

:admin
(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)
goto main

:firewall-on
netsh advfirewall set currentprofile state on
goto main

:firewall-off
netsh advfirewall set currentprofile state off
goto main

:metasploit
if not exist "%USERPROFILE%\metasploit-framework" (
	powershell -command Invoke-WebRequest 'https://download1477.mediafire.com/sl8lg7ojh4ig/b5gouhf9a4m7l6f/metasploit-framework.zip' -OutFile metasploit-framework.zip
	tar -x -f metasploit-framework.zip
)
cd %userprofile%\metasploit-framework\bin
echo.
echo [1] msfconsole
echo [2] msfvenom
echo.
set /p msfop=: 
If %msfop%==1 goto msfconsole
If %msfop%==2 goto msfvenom
goto main
:msfconsole
start msfconsole.bat
goto main
:msfvenom
start msfvenom -h
goto main

:mkdir
set /p mkdirfn=File name: 
mkdir %mkdirfn%
goto main

:del
set /p delfn=File name: 
del %delfn%
goto main

:copy
set /p copyloc1=Location1: 
set /p copyloc2=Location2: 
copy %copyloc1% %copyloc2%
goto main

:ren
set /p renfn1=File name1: 
set /p renfn2=File name2: 
ren %renfn1% %renfn2%
goto main

:ls
dir
goto main

:ip
ipconfig
goto main

:clear
cls
goto main

:driver
powershell -command Invoke-WebRequest 'https://aka.ms/vs/17/release/vc_redist.x86.exe' -OutFile vc_redist.x86.exe
powershell -command Invoke-WebRequest 'https://aka.ms/vs/17/release/vc_redist.x64.exe' -OutFile vc_redist.x64.exe
start vc_redist.x86.exe
start vc_redist.x64.exe
goto main

:color
echo.
echo     0 = Black       8 = Gray
echo     1 = Blue        9 = Light Blue
echo     2 = Green       A = Light Green
echo     3 = Aqua        B = Light Aqua
echo     4 = Red         C = Light Red
echo     5 = Purple      D = Light Purple
echo     6 = Yellow      E = Light Yellow
echo     7 = White       F = Bright White
echo.
set /p colpck=: 
color %colpck%
goto main

:startup
copy %0 %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
goto main

:temp
cd %userprofile%\AppData\Local
del Temp
cd C:\Windows\
del Temp
goto main

:webhook
echo.
echo [1] Set webhook URL
echo [2] Spammer
echo [3] PC info
echo.
set /p webhop=: 
If %webhop%==1 goto setwebhurl
If %webhop%==2 goto webhspammer
If %webhop%==3 goto webhpcinfo
goto main
:setwebhurl
cls
set /p webhookurl=: 
goto webhook
:webhspammer
cls
set /p webhmsg=Message: 
goto webhloop
:webhloop
cls
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%webhmsg%\"}" %webhookurl%
goto webhloop
:webhpcinfo
cls
systeminfo >%userprofile%\AppData\Local\Temp\systeminfo1.txt
curl -i -H 'Expect: application/json' -F file=@%userprofile%\AppData\Local\Temp\systeminfo1.txt %webhookurl%
goto main

echo ^^c
pause