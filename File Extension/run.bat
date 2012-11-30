@echo off
setlocal enableextensions
set e=echo
set p=pause
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
:run
cls
%e%.
%e%  List of file extensions that will work:
%e%.
%e%  ^> .bat
%e%  ^> .exe
%e%  ^> .txt
%e%  ^> .hx
%e%.
set p=
set /P p=%bs% Type a filename: 
if '%p%'=='' goto run
if /I %p%==x goto exit
for %%f in (%p%) do set ext=%%~xf
if "%ext%"=="" goto noext
%e%.
if /I %ext%==.bat %e%  You entered a BAT file! & goto next
if /I %ext%==.exe %e%  You entered a EXE file! & goto next
if /I %ext%==.txt %e%  You entered a TEXT file! & goto next
if /I %ext%==.hx %e%  You entered a TEXT file! & goto next
%e%  Unknown file extension!
:next
%e%.
pause>nul|set /P =%bs% Press any key to continue . . . 
goto run
:noext
%e%.
%e%  There is no file extension!
%e%.
pause>nul|set /P =%bs% Press any key to continue . . . 
goto run
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
