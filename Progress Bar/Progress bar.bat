@ECHO off
SETLOCAL ENABLEEXTENSIONS
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
SET s=sleep.exe
set sv=0.5
CD %~dp0
REM Settings --------
:run
IF NOT EXIST %s% goto errsleep
FOR /L %%G IN (1, 1, 100) DO (
CLS
%e-%
%e% Loading - Please wait [%%G%%]
%s% %sv%
CLS
)
%e-%
%e% Loading - Please wait [100%%]
%s% 1.5
CLS
%e-%
%e% Finished! [100%%]
%e-%
PAUSE
goto exit
:errsleep
CLS
%e-%
%e%  ERROR: %s% not found!
:exit
CLS
ECHO.