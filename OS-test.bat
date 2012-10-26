@echo off
TITLE OS Check
SETLOCAL ENABLEEXTENSIONS
ECHO.
ver | find "6.1" > nul
if %ERRORLEVEL% == 0 ECHO Windows 7 && GOTO exit

ver | find "6.0" > nul
if %ERRORLEVEL% == 0 ECHO Windows Vista && GOTO exit

ver | find "5.1" > nul
if %ERRORLEVEL% == 0 ECHO Windows XP && GOTO exit

ECHO Could not find your Operating System^!

:exit
ECHO.
PAUSE
EXIT
REM ECHO.

:FOR-SYSTEMINFO
systeminfo | find "Windows 7"
if %ERRORLEVEL% == 0 ECHO Windows 7

systeminfo | find "Windows Vista"
if %ERRORLEVEL% == 0 ECHO Windows Vista

systeminfo | find "Windows XP"
if %ERRORLEVEL% == 0 ECHO Windows XP

goto exit