@echo off
TITLE Kill Process
SETLOCAL ENABLEEXTENSIONS
SET e=echo
SET e-=echo.
SET p=pause
CD /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
:inputmenu
color 03
MODE CON:COLS=60 LINES=10
REM MODE CON:RATE=31 DELAY=1
cls
%e-%
%e%       ::## DO NOT INCLUDE THE .exe EXTENSION^! ##::
%e-%
%e%             Type: list to view all processes
%e-%
%e%                       x - Exit
%e-%
%e-%
set input=
set /P input=%BS% What process to kill?: 
if '%input%'==''  (goto inputmenu)
if %input%==list  (goto list)
if %input%==x     (goto exit)
if %input%==X     (goto exit)
tasklist /FI "IMAGENAME eq %input%.exe" 2>NUL | find /I /N "%input%.exe">NUL
if "%ERRORLEVEL%"=="1" (
cls
%e-%
:next
%e-%
set next=
set /P next=%BS% ERROR: %input% is not running! 
goto inputmenu
)
if "%ERRORLEVEL%"=="0" (
set finish=
if exist kill (
    cls
	%e-%
    %e%  Killing %input% ...
    kill /f /im "%input%.exe"
	cls
	%e-%
    %e%  Killing %input% ...
	%e-%
	set /P finish=%BS% Finished! 
	goto inputmenu
 ) else ( 
    cls
	%e-%
    %e%  Killing %input% ...
    taskkill /f /im "%input%.exe"
	cls
	%e-%
    %e%  Killing %input% ...
	%e-%
	set /P finish=%BS% Finished! 
	goto inputmenu
 )
)
:next2
cls
%e-%
set /P next2=%BS% Exit? [Y/n]: 
if '%next2%'==''  (goto next2)
if %next2%==Y     (goto YES)
if %next2%==y     (goto YES)
if %next2%==N     (goto NO)
if %next2%==n     (goto NO)
if exist pause.bat (
call paus
) else (
%e-%
%e%  Invalid Selection.
%e-%
PAUSE
goto next2
)
:YES
exit
:NO
goto inputmenu
:list
::mode con:cols=115 lines=45
cls
::tasklist
if exist %SystemRoot%\system32\taskmgr.exe (
"%SystemRoot%\system32\taskmgr.exe"
) else (
%e-%
set err=
set /P err=%BS% Task Manager was not found! 
)
goto inputmenu
::PAUSE
:exit
exit
:END