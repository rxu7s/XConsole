@echo off
color 7
rem Coded by batu.sh#9675

cd /d %~dp0
:main
title %username%@%computername%: ~%cd%
set /p console=$ 

::IFcommandsCONSOLE
If %console%==help goto helpMain
If %console%==help_files goto helpFiles
If %console%==help_tools goto helpTools
If %console%==help_system goto helpSystem
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
If %console%==sysinfo goto systemInfo
If %console%==dir goto showDirectory
If %console%==cd goto goDirectory
If %console%==exit goto exit


:errorCMDnotFound
echo %console%: command not found
goto main


::commandsHELP
:helpMain
echo select the category you want help. type help_?
echo.
echo help_files
echo help_tools
echo help_system
echo.
goto main

:helpFiles
echo.
echo create= new
echo delete= del 
echo move= move
echo copy= copy
echo rename= ren
echo showDirectory= dir
echo goDirectory= cd
echo.
goto main

:helpTools
echo.
echo ddos= ddos
echo bitcoin= btc
echo webhook= webhook
echo.
goto main

:helpSystem
echo.
echo date= date
echo time= time
echo ip= ip
echo systemInfo= sysinfo
echo.
goto main

::commandsFiles
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

:showDirectory
set /p dirloc=Location: 
dir %dirloc%
goto main

:goDirectory
set /p cdloc=Location: 
cd %cdloc%
goto main

::commandsConsole
:clear
cls
goto main

:exit
exit
goto main

::commandsSys
:date
echo %date%
goto main

:time
echo %time%
goto main

:ipconfig
ipconfig
goto main

:systemInfo
systeminfo
goto main

::commandsTools
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
echo [1] Spammer
echo [2] Systeminfo
echo.
set /p categorywebh=: 
cls
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

echo ^^C
timeout -1 >nul
exit