@echo off
TITLE Comment/Remark Test
setlocal enableextensions
set e=echo
set e-=echo.
set p=pause
for /f %%A in ('"prompt $H & %e% on & for %%B in (1) do rem"') do set "bs=%%A"
set input=
cls
%e%.
%e%.
%e%  Please press ENTER for below, and so on... 
%e%  ==========================================
%e%.
%e%.
set /P i=%bs% Inserting comment with double colon ... 
::%e%  This is a comment this will not be displayed.
%e%.
set /P i=%bs% Inserting comment with %REM ... 
REM %e%  This is a comment this will not be displayed.
%e%.
set /P i=%bs% Inserting comment and skipping it with GOTO ... 
GOTO next
set /P i=%bs% This is a comment this will not be displayed. 
:next
%e%.
set /P i=%bs% Finished! 
%e%.
set /P i=%bs% Please see the coding inside this BATCH file 
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!