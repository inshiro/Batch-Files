@ECHO off
SETLOCAL ENABLEEXTENSIONS
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
CD /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
set err_var=%tmp%\err_log.txt
set err_var2=%tmp%\error.bat
REM Settings --------
:top
set var=POOP
set err=
if not exist "%var%" set err=%var%& goto err
CLS & %e-% & set input=& set /P input=%BS% This ran smoothly! & goto exit
:err
CLS
if exist "%err_var%" del /F "%err_var%"
if exist "%err_var2%" del /F "%err_var2%"
if not exist "%tmp%\error.bat" (
%e% %%e-%%>>%err_var%
%e% set err2=>>%err_var%
%e% set /P err2=%%BS%% ERROR: %%err%% not found! >>%err_var%
rename "%err_var%" "error.bat"
call "%err_var2%"
goto top
) else (
call "%tmp%\error.bat"
)
set err4=
set /P err4=%BS% There was an error! 
:exit
CLS
ECHO.