@echo off
TITLE Check Process v1.0
:menu
mode con:cols=60 lines=10
setlocal enableextensions
set e=echo
set p=pause
for /f %%A in ('"prompt $H & %e% on & for %%B in (1) do rem"') do set "bs=%%A"
color 06
cls
%e%.
%e%         ::## DO NOT INCLUDE THE .exe EXTENSION^! ##::
%e%.
%e%            ..:: CHECK IF A PROCESS IS RUNNING ::..
%e%.
%e%                       x - Quit
%e%.
%e%.
set a=
set /P a=%bs% What process to check?: 
if '%a%'==''  (goto menu)
if %a%==x     (goto exit)
if %a%==X     (goto exit)
cls
%e%.
%e%  Checking ...
%e%.
tasklist /FI "IMAGENAME eq %a%.exe" 2>NUL | find /I /N "%a%.exe">NUL
if "%ERRORLEVEL%"=="0" %e%  %a% is running.
if "%ERRORLEVEL%"=="1" %e%  %a% is not running^!
:PAUSE
%e%.
pause>nul|set /P =%bs% Press any key to continue . . . 
goto menu
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
