@echo off
color 7
rem Coded by batu.sh#9675

:: 
:: ▐▓█▀▀▀▀▀▀▀▀▀█▓▌░▄▄▄▄▄░
:: ▐▓█░░▀░░▀▄░░█▓▌░█▄▄▄█░
:: ▐▓█░░▄░░▄▀░░█▓▌░█▄▄▄█░
:: ▐▓█▄▄▄▄▄▄▄▄▄█▓▌░█████░
::  ░░░▄▄███▄▄░░░░░█████░
:: 
:: 

cd /d %~dp0
:main
title %username%@%computername%: ~%cd%
set /p console=$ 

::other

::IFcommandsCONSOLE
If %console%==help goto help
If %console%==new goto mkdir
If %console%==del goto del
If %console%==move goto move
If %console%==copy goto copy
If %console%==ren goto ren
If %console%==clear goto clear
If %console%==date goto date
If %console%==time goto time
If %console%==ddos goto ddos
If %console%==btc goto btc
If %console%==webhook goto webhook
If %console%==ip goto ipconfig
If %console%==reset-ip goto resetip
If %console%==sys goto systeminfo
If %console%==dir goto dir
If %console%==cd goto cd
If %console%==cd.. goto cd..
If %console%==exit goto exit
If %console%==install goto install
If %console%==ls goto ls
If %console%==hack goto hack
If %console%==print goto print
If %console%==echo goto print
If %console%==msg goto msg
If %console%==money goto money
If %console%==cmd goto cmd
If %console%==web goto browser
If %console%==admin goto admin
If %console%==url goto url
If %console%==clock goto clockm
If %console%==google goto google
If %console%==firewall goto firewall
If %console%==startup goto startup
If %console%==state goto state
If %console%==notepad goto notepad
If %console%==spotify goto spotify
If %console%==txt goto txt
If %console%==pdf goto pdf


:errorCMDnotFound
echo %console%: command not found
goto main

:txt
set /p txtinp=File name: 
(
	echo txt
)>%txtinp%.txt
start %txtinp%.txt
goto main

:pdf
set /p pdfinp=File name: 
(
	echo pdf
)>%pdftinp%.pdf
start %pdfinp%.pdf
goto main

:spotify
start https://open.spotify.com/
goto main

:state
for /f "tokens=1,2 delims=]" %%p in ('WMIC OS get FreePhysicalMemory^|find /N /V ""') do (IF %%p equ [2 (set MEM=%%q))
set Times=0
for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do (
set Cpusage!Times!=%%p
set /A Times=!Times! + 1)
echo RAM: %totalm%
echo CPU: %Cpusage0%
echo Ram = %MEM%
goto main

:cd..
cd..
goto main

:notepad
start notepad
goto main

:google
set /p google=Search: 
start https://www.google.com/search?q=%google%&%google%
cls
goto main

:url
set /p urladdr=Go: 
start https://%urladdr%.com
goto main

:startup
cd /d %userprofile%
copy %0 "%userprofile%\Appdata\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto main


:firewall
echo.
echo [x] Exit
echo [1] On
echo [2] Off
echo.
set /p firewall=: 
If %firewall%==x goto main
If %firewall%==1 goto firewallON
If %firewall%==2 goto firewallOFF
netsh advfirewall set allprofiles state off
goto main
:firewallON
netsh advfirewall set allprofiles state on
goto main
:firewallOFF
netsh advfirewall set allprofiles state off
goto main

:clockm
cls
goto clock
:clock
echo.
echo    %time%
echo.
timeout 0 >nul
cls
goto clock

:admin
(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)
goto main

:browser
start https://google.com
goto main

:cmd
start cmd
goto main

:resetip
ipconfig /renew
goto main

:money
echo turkish money calculator
set /p moneytl200=200: 
set /p moneytl100=100: 
set /p moneytl50=50: 
set /p moneytl20=20: 
set /p moneytl10=10: 
set /p moneytl5=5: 
set /a totalm = %moneytl200% * 200 + %moneytl100% * 100 + %moneytl50% * 50 + %moneytl20% * + %moneytl10% * + %moneytl5%
echo %totalm%
goto main

:help
echo https://discord.gg/JxVT9zYWsJ
goto main

:install
set /p dinsln=Link: 
curl "%dinsln%" -O
goto main

:msg
set /p msg=Message: 
msg * %msg%
goto main

:print
set /p ecpr=echo: 
cls 
echo %ecpr%
timeout -1 >nul
goto main

:ls
dir
goto main

:mkdir
set /p mkdirfn=File name: 
mkdir %mkdirfn%
goto main

:del
set /p delfn=File name: 
del %delfn%
goto main

:move
set /p locmovefn1=File name: 
set /p locmovefn2=where to move: 
move %locmovefn1% %locmovefn2%
goto main

:ren
set /p renfn=File name: 
set /p renfnto=Rename file to: 
ren %renfn% %renfnto%
goto main

:dir
set /p dirloc=Location: 
dir %dirloc%
goto main

:cd
set /p cdloc=Location: %userprofile%\
cd %userprofile%\%cdloc%
goto main

:clear
cls
goto main

:exit
exit
goto main

:date
echo %date%
goto main

:time
echo %time%
goto main

:ipconfig
ipconfig
goto main

:systeminfo
systeminfo
goto main

:ddos
set /p ddip=IP: 
set /p ddpckt=Packet: 
ping %ddip%
if errorlevel 1 GOTO ddosError
goto ddosLoop
:ddosError
goto main
:ddosLoop
color 1
echo %ddpckt%m %date% %time% ^<--packet sent!--^>
goto ddosLoop

:btc
set /p btcwlt=Wallet: 
echo Starting bitcoin miner
timeout 2 >nul
setlocal enabledelayedexpansion
goto btcLoop
:btcLoop
timeout 3 >nul
set Times=0
for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do (
set Cpusage!Times!=%%p
set /A Times=!Times! + 1)
echo [+] %date% ^| %time% mined 0.0%random% BTC - cpu usage: %Cpusage0%
goto btcLoop
echo transferring to your wallet...
timeout 4 >nul
goto main

:webhook
echo.
echo [x] Exit
echo [1] Spammer
echo [2] Systeminfo
echo.
set /p categorywebh=: 
cls
If %categorywebh%==x goto main
If %categorywebh%==1 goto webhookmsgwebh
If %categorywebh%==2 goto webhooksyswebh
:webhookmsgwebh
set /p setwebh=URL: 
set /p meswebh=Message: 
goto webhookLoop
:webhookLoop
curl -X POST -H "Content-type: application/json" --data "{\"content\": \"%meswebh%\"}" %setwebh%
goto webhookLoop
:webhooksyswebh
set /p setwebh=URL: 
cls
goto sysinfowebh
:sysinfowebh
systeminfo >sysinfo-%username%.txt
curl -i -H 'Expect: application/json' -F file=@sysinfo-%username%.txt %setwebh%
cls
goto main

:hack
cd C:\
cls
color a
goto dirshmod
:dirshmod
dir /s
goto dirshmod

echo ^^C
exit