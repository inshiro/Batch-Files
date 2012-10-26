@echo off
TITLE Comment/Remark Test
SETLOCAL enableextensions
SET e=echo
SET e-=echo.
SET p=pause
CD /D "%~dp0"
for /f %%A in ('"prompt $H & %e% on & for %%B in (1) do rem"') do set "BS=%%A"
SET input=
cls
%e%.
%e%.
%e%  Please press ENTER for below, and so on.. 
%e%.
%e%.
SET /P input=%BS% Inserting comment with double colon ... 
::%e%  This is a comment this will not be displayed.
%e%.
SET /P input=%BS% Inserting comment with %REM ... 
REM %e%  This is a comment this will not be displayed.
%e%.
SET /P input=%BS% Inserting comment and skipping it with GOTO ... 
GOTO next
SET /P input=%BS% This is a comment this will not be displayed. 
:next
%e%.
set input=
SET /P input=%BS% Finished! 
%e%.
set input=
SET /P input=%BS% Please see the coding inside this BAT file 
set input=
%e%.