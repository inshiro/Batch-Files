@echo off
setlocal enableextensions
set e=echo
set ver=1.0
if "%*"=="-h"				goto help
if "%*"=="--help"			goto help
if "%*"=="-v"				goto version
if "%*"=="--version"		goto version
if "%*"==""					goto run
%e% Error: Unknown option: %*
goto :EOF
:help
cls
%e%.
%e% Usage: %~n0 [OPTION] ...
%e%.
%e%   -h, --help		display this help and exit
%e%   -v, --version		print product version and exit
%e%.
%e% Report %~n0 bugs to peterhalim@live.com
goto :EOF
:version
%e%.
%e% v%ver%
goto :EOF
:run
%e%.
%e% Too few arguments.
goto :EOF