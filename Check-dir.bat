@ECHO off
TITLE Display Current Directory
setLOCAL ENABLEEXTENSIONS
set e=echo
set p=pause
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
cls
IF "%CD%\"=="%~dp0" goto yes
IF "%CD%"=="%SYSTEMDRIVE%\" goto yes
:no
%e%.
set i=
set /P i=%bs% You are running this from: %CD%  :(
GOTO exit
:yes
%e%.
set i=
set /P i=%bs% You are running this in the batch directory! YAY! 
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
