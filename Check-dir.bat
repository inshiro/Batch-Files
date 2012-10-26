@ECHO off
TITLE Display Current Directory
SETLOCAL ENABLEEXTENSIONS
SET e=echo
SET p=pause
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
CLS
IF "%CD%\"=="%~dp0" goto yes
IF "%CD%"=="%SYSTEMDRIVE%\" goto yes
:no
%e%.
set i=
set /P i=%BS% You are running this from: %CD%  :(
GOTO exit
:yes
%e%.
set i=
set /P i=%BS% You are running this in the batch directory! YAY! 
:exit
CLS
ECHO.