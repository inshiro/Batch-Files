@echo off
mode con:cols=60 lines=10
setlocal enableextensions
:start
cls
echo.
echo.
set input=
set /P input=Are you sure you want to start this Bomb? [Y/n]: 
if '%input%'==''  (goto start)
if %input%==Y     (goto BOMB)
if %input%==y     (goto BOMB)
if %input%==N     (goto NO)
if %input%==n     (goto NO)
echo.
echo Invalid selection.
call paus
:BOMB
cls
:BOMBB
start
goto BOMBB
:NO
exit