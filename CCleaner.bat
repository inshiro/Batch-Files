@echo off
setlocal enableextensions
set e=echo
set p=pause
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
mode con:cols=60 lines=8
%e%. & %e%. & %e%  Detecting CCleaner (%PROCESSOR_ARCHITECTURE%) ...
set c64=%ProgramFiles(x86)%\CCleaner
set c32=%programfiles%\CCleaner
if exist "%c64%" (
"%c64%\CCleaner64.exe" & goto run
) else (
"%c32%\CCleaner.exe" & goto run
)
cls
%e%.
%e%.
pause>nul|set /P =%bs% Error: CCleaner not found! 
:run
cls
%e%.
%e%.
set i=
set /P i=%bs% Shutdown Computer? [Y/n]: 
if '%i%'==''  goto run
if /I %i%==y     goto YES
if /I %i%==n     goto exit
if /I %i%==q     goto exit
if /I %i%==x     goto exit
if exist "invalid.bat" (
call invalid
) else (
%e%.
pause>nul|set /P =%bs% Invalid selection! 
goto run
)
:YES
shutdown -s -t 03 -c "Shutting down Windows..."
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
