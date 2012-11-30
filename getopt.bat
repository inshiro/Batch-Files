@echo off
setlocal enableextensions
set e=echo
set ver=1.0
rem == Functions ==
if "%*"=="-v" goto version
if "%*"=="-version" goto version
if "%*"=="-h" goto help
if "%*"=="-help" goto help
rem ===============
set f=%0
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
for /f "delims=" %%G in ('time /t') do set time=%%G
ver | find "6.2" > nul
if %errorlevel% == 0 set os=Windows 8
ver | find "6.1" > nul
if %errorlevel% == 0 set os=Windows 7
ver | find "6.0" > nul
if %errorlevel% == 0 set os=Windows Vista
ver | find "5.1" > nul
if %errorlevel% == 0 set os=Windows XP
if "%*"=="" goto run
echo Error: Unknown option: %*
goto :EOF
:help
cls
echo.
echo Usage: %f% [OPTION]...
echo.
echo -h --help display this help and exit
echo -f --file specify the file you want to...
echo -v --version print product version and exit
echo -a --argument output argument value
echo.
echo Report getopt bugs to getopt@projects.mythli.net
goto :EOF
:version
%e%.
%e% %title% v%ver%
goto :EOF
:run
cls
echo.
echo  ============================================================
echo       %title% Made by Peteragent5 - %ver% [%os%] %time%
echo  ============================================================
echo.
echo.
echo  ^> MAIN MENU
echo.
echo  1 - Basic output
echo.
echo  x - Exit
echo.
set i=
set /p i=%bs% Enter Selection: 
if '%i%'=='' goto run
if %i%==1 (%e%. & pause>nul|set /p =%bs% Hello World! & goto run)
if /I %i%==x goto :EOF
%e%.
pause>nul|set /p =%bs% Invalid Selection! 
goto run
