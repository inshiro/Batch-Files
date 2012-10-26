@echo off
SETLOCAL ENABLEEXTENSIONS
SET e=echo
SET p=pause
CD /D "%~dp0"
for /f %%A in ('"prompt $H & %e% on & for %%B in (1) do rem"') do set "BS=%%A"
mode con:cols=60 lines=8
set c64=%ProgramFiles(x86)%\CCleaner
set c32=%programfiles%\CCleaner
if exist "%c64%" (
"%c64%\CCleaner64.exe" & goto input
) else (
"%c32%\CCleaner.exe" & goto input
)
set i=
set /P i=%BS% ERROR: CCleaner is not installed! 
:input
cls
%e%.
%e%.
set i=
set /P i=%BS% Do you want to shutdown your computer? [Y/n]: 
if '%i%'==''  (goto input)
if %i%==Y     (goto YES)
if %i%==y     (goto YES)
if %i%==N     (goto NO)
if %i%==n     (goto NO)
%e%.
set ierr=
set /P ierr=%BS% Invalid Selection! 
:YES
shutdown -s -t 03 -c "Shutting down Windows..."
:NO
exit