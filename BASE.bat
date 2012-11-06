@echo off
setlocal enableextensions
set e=echo
set p=pause
pushd "%cd%\"
cd /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
rem pause>nul|set /P =%bs% Press any key to continue . . . 
rem Settings --------
:run
cls
%e%.
%e%  Running...& %e%. & pause>nul|set /P =%bs% Press any key to continue . . . 
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
popd
