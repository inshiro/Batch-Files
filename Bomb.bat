@echo off
mode con:cols=60 lines=10
setlocal enableextensions
set e=echo
set p=pause
for /f %%A in ('"prompt $H & %e% on & for %%B in (1) do rem"') do set "bs=%%A"
:start
cls & %e%. & %e%. & set input=
set /P input=%bs% Are you sure you want to start this Bomb? [Y/n]: 
if '%input%'==''  goto start
if /I %input%==y     goto BOMB
if /I %input%==n     goto NO
if /I %input%==x     goto NO
if /I %input%==q     goto NO
goto NO
if exist "invalid.bat" (
call invalid
) else (
%e%.
pause>nul|set /P =%bs% Invalid selection! 
goto start
)
:BOMB
cls
:BOMBB
start
goto BOMBB
:NO
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
