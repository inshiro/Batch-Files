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
for %%F in ("%cd%\internet fix.txt") do %e%   Dirname: %%~dpF
for /f "delims=" %%i in ("%cd%\basename-dirname.bat") do %e%  Basename: %%~nxi
%e%.
pause>nul|set /P =%bs% Press any key to continue . . . 