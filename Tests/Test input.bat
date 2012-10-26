@echo off
SETLOCAL ENABLEEXTENSIONS
SET e=echo
SET p=pause
CD /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
REM Settings --------
:top
cls
echo.
set input=
set /P input=%BS% Test your input: 
if '%input%'=='' (goto top)
REM if "%errorlevel%"=="1" goto error
:next
echo.
set INPUT2=
set /P INPUT2=%BS% You typed: %input% 
goto top