@echo off
cls
set root=%PROGRAMFILES%\Android\android-sdk\tools
echo Go to C: Drive
cd c:\
echo %CD%
echo.
PAUSE
echo.
echo.
echo Go back to set directory:
cd /d %root%
echo %CD%
echo.
PAUSE
::END