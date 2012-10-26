@echo off
cd /D "%~dp0"
setlocal enableextensions
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
:top
set t=test.txt
if exist %t% del /F %t%
cls
echo.
echo  Running ...
if not exist "%t%" echo Hello there!>%t%
if exist "%programfiles%\Notepad++" (
"%programfiles%\Notepad++\notepad++.exe" "%~dp0%t%"
goto next
) else (
if exist "%programfiles(x86)%\Notepad++" (
"%programfiles(x86)%\Notepad++\notepad++.exe" "%~dp0%t%"
goto next
 )
)
"%SystemRoot%\system32\notepad.exe" %t%
:next
echo.
set i=
set /P i=%BS% Finished! 
if exist %t% del /F %t%
:END