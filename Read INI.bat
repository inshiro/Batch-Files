@echo off
SETLOCAL ENABLEEXTENSIONS
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
set c=config.ini
CD "%~dp0"
%e-%
%e% username=user>>%c%
%e% password=pass>>%c%
for /f "tokens=1,2 delims==" %%a in (config.ini) do (
if %%a==username set username=%%b
if %%a==password set password=%%b
)
echo  Username: %username%
echo  Password: %password%
if exist "%c%" del /F "%c%"
%e-%
PAUSE>NUL|SET /P =%BS% Press any key to continue . . . 
:exit
cls
%e%.
TITLE %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
