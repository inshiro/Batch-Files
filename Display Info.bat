@ECHO off
TITLE Display Computer Info
MODE CON:COLS=70 LINES=35
SETLOCAL ENABLEEXTENSIONS
PUSHD %CD%\
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
SET i=SET input=
SET i-=SET /P input=
CD "%~dp0"
REM Settings --------
:top
CLS
%e-%
%e%  Username:
%e%  %USERNAME%
%e-%
%e%  User Profile:
%e%  %USERPROFILE%
%e-%
%e%  All User Profiles:
%e%  %ALLUSERSPROFILE%
%e-%
%e%  System Drive:
%e%  %SYSTEMDRIVE%\
%e-%
%e%  Program Files:
IF EXIST %ProgramFiles(x86)% %e% %ProgramFiles% & %ProgramFiles(x86)%
%e%  %ProgramFiles%
%e-%
%e%  Common Program Files:
%e%  %CommonProgramFiles%
%e-%
%e%  Temporary Files:
%e%  %TEMP%
%e-%
%e%  Application Data:
%e%  %APPDATA%
%e-%
%e%  Processor:
IF "%PROCESSOR_ARCHITECTURE%"=="x86"     %e%  32-bit (%PROCESSOR_ARCHITECTURE%)
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64"   %e%  64-bit (%PROCESSOR_ARCHITECTURE%)
IF "%PROCESSOR_ARCHITECTURE%"=="IA64"    %e%  64-bit (%PROCESSOR_ARCHITECTURE%)
if %ERRORLEVEL% == 1 %e-%
if %ERRORLEVEL% == 1 %e%  ERROR! Unable to find your Processor.
:next
%e-%
%e%  Operating System: 
VER | FIND "6.1" > NUL
if %ERRORLEVEL% == 0 %e%  Windows 7

VER | FIND "6.0" > NUL
if %ERRORLEVEL% == 0 %e%  Windows Vista

VER | FIND "5.1" > NUL
if %ERRORLEVEL% == 0 %e%  Windows XP
REM ----------------------------------------------
:exit
%e-%
PAUSE
cls
%e%.
TITLE %SystemRoot%\system32\cmd.exe
%e%  Goodbye!