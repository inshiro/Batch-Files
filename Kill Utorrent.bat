@echo off
:: Based on kill process.bat
:inputmenu
set input=utorrent
mode con:cols=60 lines=10
setlocal enableextensions
set e=echo
set p=pause
color 03
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
tasklist /FI "IMAGENAME eq %input%.exe" 2>NUL | find /I /N "%input%.exe">NUL"
if "%ERRORLEVEL%"=="1" (
cls
echo.
:next
echo.
set next=
set /P next=%bs% %input% is not running! 
goto exit
)
if "%ERRORLEVEL%"=="0" (
set finish=
if exist "%SystemRoot%\system32\kill.exe" (
    cls
	echo.
    echo Killing %input%...
    kill /f /im %input%.exe
	cls
	echo.
    echo Killing %input%...
	echo.
	echo Finished!
	goto next2
 ) else ( 
    cls
	echo.
    echo Killing %input%...
    taskkill /f /im %input%.exe
	cls
	echo.
    echo Killing %input%...
	echo.
	echo Finished!
	goto next2
 )
)
:next2
goto inputmenu
:list
::mode con:cols=115 lines=45
cls
::tasklist
taskmgr.exe
echo.
::PAUSE
goto inputmenu
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
