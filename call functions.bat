@echo off
cls
set e=echo
REM ***********************************
REM *** Main
%e%.
call :Func "1st arg" "2nd arg"
%e%.
%e%  Back
pause
goto :EOF
REM ***********************************
REM *** Function Definitions

:Func
%e%  params: %~0 "%~1" "%~2"
%e%  file: %~nx0
%e%  full: %~dpnx0 %0
goto :EOF
REM *** End :Func