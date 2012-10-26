@ECHO off
SETLOCAL ENABLEEXTENSIONS
PUSHD %CD%\
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
SET i=SET input=
SET i-=SET /P input=
CD %~dp0
REM Settings --------
:start
CLS
%e-%
SET t=t.txt
SET name=
SET /P name=What to call it?: 
%e%     if>>%t%
%e%      file_getprop("/tmp/aroma/customize.prop","item.2.5") == "0">>%t%
%e%    then>>%t%
%e%      ui_print("   %name%");>>%t%
%e%      delete("/system/app/%name%.apk");>>%t%
%e%    endif;>>%t%
%e-% >>%t%
REM PAUSE
GOTO start
:exit
CLS
ECHO.