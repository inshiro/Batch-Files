@echo off
title Kill Process v1.0
setLOCAL ENABLEEXTENSIONS
set e=echo
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "bs=%%A"
:inputmenu
color 03
mode CON:COLS=60 LINES=10
rem mode CON:RATE=31 DELAY=1
cls
%e%.
%e%       ::## DO NOT INCLUDE THE .exe EXTENSION^! ##::
%e%.
%e%             Type: list to view all processes
%e%.
%e%                       x - Quit
%e%.
%e%.
set input=
set /P input=%bs% What process to kill?: 
if '%input%'==''  goto inputmenu
if %input%==list  goto list
if /I %input%==x     goto exit
tasklist /FI "IMAGENAME eq %input%.exe" 2>NUL | find /I /N "%input%.exe">NUL
if "%ERRORLEVEL%"=="1" (
cls
%e%.
:next
%e%.
set next=
set /P next=%bs% ERROR: %input% is not running! 
goto inputmenu
)
if "%ERRORLEVEL%"=="0" (
set finish=
if exist kill (
    cls
	%e%.
    %e%  Killing %input% ...
    kill /f /im "%input%.exe"
	cls
	%e%.
    %e%  Killing %input% ...
	%e%.
	set /P finish=%bs% Finished! 
	goto inputmenu
 ) else ( 
    cls
	%e%.
    %e%  Killing %input% ...
    taskkill /f /im "%input%.exe"
	cls
	%e%.
    %e%  Killing %input% ...
	%e%.
	set /P finish=%bs% Finished! 
	goto inputmenu
 )
)
:next2
cls
%e%.
set /P next2=%bs% Exit? [Y/n]: 
if '%next2%'==''  (goto next2)
if %next2%==Y     (goto YES)
if %next2%==y     (goto YES)
if %next2%==N     (goto NO)
if %next2%==n     (goto NO)
if exist "invalid.bat" (
call invalid
) else (
%e%.
pause>nul|set /P =%bs% Invalid selection! 
goto run
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
%e%.
set err=
set /P err=%bs% Task Manager was not found! 
)
goto inputmenu
::PAUSE
:exit
cls
%e%.
title %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
:END
