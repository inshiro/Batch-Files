@ECHO off
SETLOCAL ENABLEEXTENSIONS
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
CD /D "%~dp0"
REM Settings --------
:run
CLS
%e-%
%e% Zipaligning...
IF not exist "zipalign.exe" (
CLS
%e-%
set err=
set /P err=  ERROR: zipalign.exe not found!
goto exit
)
FOR %%K IN (*.apk *.jar) DO (
if not exist OUT mkdir OUT
zipalign -f -v 4 "%%~nxK" "OUT\%%~nxK"
)
%e-%
set done=
set /P done=  Done!
:exit
CLS
ECHO.