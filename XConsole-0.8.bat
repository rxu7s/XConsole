@echo off
cd %appdata%
mkdir XConsoleTemp
cls
cd /d %~dp0
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
If %console%==nmap goto nmap
If %console%==msfconsole goto msfconsole
If %console%==msfvenom goto msfvenom
If %console%==autorat goto autorat
If %console%==mkdir goto mkdir
If %console%==del goto del
If %console%==copy goto copy
If %console%==ren goto ren
If %console%==ls goto ls
If %console%==cd goto cd
If %console%==ip goto ip
If %console%==clear goto clear
If %console%==driver goto driver
If %console%==color goto color
If %console%==startup goto startup
If %console%==temp goto temp
If %console%==webhook goto webhook
If %console%==time goto time
If %console%==date goto date
If %console%==start goto start
If %console%==google goto google

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
echo ^| nmap = (all-in-one ping tool)
echo ^| autorat = (fast rat building tutorial)
echo ^| mkdir/del/copy/ren/ls/cd = (file commands)
echo ^| ip = (ipconfig)
echo ^| clear = (clear command line)
echo ^| driver = (install drivers)
echo ^| color = (change command line color)
echo ^| startup = (set as startup application)
echo ^| temp = (delete temp)
echo ^| webhook = (webhook features)
echo ^| start = (start a program)
echo ^| google = (search on google)
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
	goto msfinstall
)
cd %userprofile%\metasploit-framework\bin
echo.
echo [0] fix
echo [1] msfconsole
echo [2] msfconsole-cmds
echo [3] msfvenom
echo.
set /p msfop=: 
If %msfop%==0 goto msfinstall
If %msfop%==1 goto msfconsole
If %msfop%==2 goto msfvenom
goto main
:msfinstall
cd /d %userprofile%
del metasploit-framework
powershell -command Invoke-WebRequest 'https://download1477.mediafire.com/sl8lg7ojh4ig/b5gouhf9a4m7l6f/metasploit-framework.zip' -OutFile metasploit-framework.zip
tar -x -f metasploit-framework.zip
goto main
:msfconsole
start msfconsole.bat
goto main
:msfvenom
cd %USERPROFILE%\metasploit-framework\bin
start msfvenom -h
goto main

:autorat
echo (soon)
goto main

:nmap
if not exist "%USERPROFILE%\Nmap\zenmap.exe" (
	goto nmapinstall
)
cd %userprofile%\Nmap
start zenmap.exe
goto main
:nmapinstall
cd /d %userprofile%
powershell -command Invoke-WebRequest 'https://download1582.mediafire.com/ykr1ukjbmcfg/ssc7yndh31vrk8f/Nmap.zip' -OutFile Nmap.zip
tar -x -f Nmap.zip
start zenmap.exe
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

:cd
set /p cdloc=Location: 
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

:date
echo %date%
goto main
:time
echo %time%
goto main

:start
set /p startfn=File name: 
start %startfn%
goto main

:google
set /p googlesc=Search: 
start https://www.google.com/search?q=%googlesc%
goto main

echo ^^c
pause