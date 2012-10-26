@ECHO off
CD %~dp0"
SETLOCAL enableextensions
TITLE Read Test - Display help file
SET h=help.txt
IF EXIST "%h%" del /F "%h%"
CLS
ECHO.
ECHO  Reading ...
ECHO.
echo  Welcome to the help text file!>>%h%
echo  1. Test1>>%h%
echo  2. Test2>>%h%
echo  3. Test3>>%h%
type "%h%"
echo.
IF EXIST "%h%" del /F "%h%"
PAUSE>NUL|SET /P =%BS% Press any key to continue . . . 
:exit
cls
%e%.
TITLE %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
