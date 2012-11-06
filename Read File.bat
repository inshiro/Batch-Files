@echo off
title Read Test - Display help file
setlocal enableextensions
set e=echo
set p=pause
pushd "%cd%\"
cd /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
set h=help.txt
if EXIST "%h%" del /F "%h%"
cls
%e%.
%e%  Reading %h% ...
%e%.
%e%  ===================================
%e%  Welcome to the help text file!>>%h%
%e%  1. Test1>>%h%
%e%  2. Test2>>%h%
%e%  3. Test3>>%h%
type "%h%"
%e%  ===================================
%e%.
IF EXIST "%h%" del /F "%h%"
PAUSE>NUL|SET /P =%BS% Press any key to continue . . . 
:exit
cls
%e%.
TITLE %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
popd
