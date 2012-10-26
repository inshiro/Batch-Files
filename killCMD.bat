@echo off
:: Based on kill process.bat
:inputmenu
set input=cmd
mode con:cols=60 lines=10
setlocal enableextensions
color 03
tasklist /FI "IMAGENAME eq %input%.exe" 2>NUL | find /I /N "%input%.exe">NUL"
if "%ERRORLEVEL%"=="1" (
cls
echo.
:next
echo.
set next=
set /P next=%input% is not running^!
goto inputmenu
)
if "%ERRORLEVEL%"=="0" (
set finish=
if exist kill (
    cls
	echo.
    echo Killing %input%...
    kill /f /im %input%.exe
	cls
	echo.
    echo Killing %input%...
	echo.
	set /P finish=Finished^!
	goto next2
 ) else ( 
    cls
	echo.
    echo Killing %input%...
    taskkill /f /im %input%.exe
	cls
	echo.
    echo Killing %input%...
	echo.
	set /P finish=Finished^!
	goto next2
 )
)
:next2
cls
echo.
set /P next2=Exit? [Y/n]: 
if '%next2%'==''  (goto next2)
if %next2%==Y     (goto YES)
if %next2%==y     (goto YES)
if %next2%==N     (goto NO)
if %next2%==n     (goto NO)
:YES
exit
:NO
goto inputmenu
:list
::mode con:cols=115 lines=45
cls
::tasklist
taskmgr.exe
echo.
::PAUSE
goto inputmenu
:END