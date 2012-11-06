@echo off
title Display Computer Info
mode CON:COLS=70 LINES=35
setlocal enableextensions
set e=echo
set p=pause
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
rem Settings --------
:top
cls
%e%.
%e%  Username:
%e%  %USERNAME%
%e%.
%e%  User Profile:
%e%  %USERPROFILE%
%e%.
%e%  All User Profiles:
%e%  %ALLUSERSPROFILE%
%e%.
%e%  System Drive:
%e%  %SYSTEMDRIVE%\
%e%.
%e%  Program Files:
if EXIST %ProgramFiles(x86)% %e% %ProgramFiles% & %ProgramFiles(x86)%
%e%  %ProgramFiles%
%e%.
%e%  Common Program Files:
%e%  %CommonProgramFiles%
%e%.
%e%  Temporary Files:
%e%  %TEMP%
%e%.
%e%  Application Data:
%e%  %APPDATA%
%e%.
%e%  Processor:
if "%PROCESSOR_ARCHITECTURE%"=="x86"     %e%  32-bit (%PROCESSOR_ARCHITECTURE%)
if "%PROCESSOR_ARCHITECTURE%"=="AMD64"   %e%  64-bit (%PROCESSOR_ARCHITECTURE%)
if "%PROCESSOR_ARCHITECTURE%"=="IA64"    %e%  64-bit (%PROCESSOR_ARCHITECTURE%)
if %errorlevel% == 1 %e%.
if %errorlevel% == 1 %e%  ERROR! Unable to find your Processor.
:next
%e%.
%e%  Operating System: 
ver | find "6.1" > nul
if %errorlevel% == 0 %e%  Windows 7

ver | find "6.0" > nul
if %errorlevel% == 0 %e%  Windows Vista

ver | find "5.1" > nul
if %errorlevel% == 0 %e%  Windows XP
%e%.
pause>nul|set /P =%bs% Press any key to continue . . . 
REM ----------------------------------------------
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
