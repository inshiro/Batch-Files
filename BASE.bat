@echo off
SETLOCAL ENABLEEXTENSIONS
SET e=echo
SET p=pause
CD /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
REM Settings --------
:run
cls
%e%.
%e%  Running...& %e%. & %p%
:exit
cls
%e%.
TITLE %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
