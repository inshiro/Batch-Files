@echo off
cls
echo Starting browser...
start explorer http://www.google.com
PAUSE
:startup
cls
taskkill /f /im iexplore.exe
kill /f /im iexplore.exe
::taskkill /im iexplore.exe
::kill /im iexplore.exe
cls
PAUSE
goto startup