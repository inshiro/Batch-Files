@echo off
TITLE Check Process
:menu
mode con:cols=60 lines=10
setlocal enableextensions
color 06
cls
echo.
echo         ::## DO NOT INCLUDE THE .exe EXTENSION^! ##::
echo.
echo            ..:: CHECK IF A PROCESS IS RUNNING ::..
echo.
echo                       x - Exit
echo.
echo.
set a=
set /P a=What process to check?: 
if '%a%'==''  (goto menu)
if %a%==x     (goto exit)
if %a%==X     (goto exit)
cls
echo.
echo Checking...
echo.
tasklist /FI "IMAGENAME eq %a%.exe" 2>NUL | find /I /N "%a%.exe">NUL
if "%ERRORLEVEL%"=="0" echo %a% is running.
if "%ERRORLEVEL%"=="1" echo %a% is not running^!
:PAUSE
echo.
set pause=
set /P pause=Press any key to continue
goto menu
:exit
exit