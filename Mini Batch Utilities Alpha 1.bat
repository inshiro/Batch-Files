@ECHO off
SETLOCAL ENABLEEXTENSIONS
TITLE Mini Batch Utilities
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
CD %~dp0
REM Settings --------
:run
FOR /F "DELIMS=" %%F IN ('DATE /T') DO SET DATETIME=%%F
FOR /F "DELIMS=" %%G IN ('TIME /T') DO SET HRTIME=%%G
CLS
%e-%
%e%                                                          Date: %DATETIME%
%e-%
%e%  Current Directory: %CD%\
%e-%
%e%                                                              Time: %HRTIME%
%e%  1 - Rename
%e-%
%e%  2 - Copy
%e-%
%e%  3 - Delete file/folder
%e-%
%e%  4 - Check Disk for errors
%e-%
%e%  5 - List files
%e-%
%e%  6 - Zip
%e-%
%e%  7 - Create folder
%e-%
set input=
set /P input= Enter option: 
if '%input%'=='' (goto run)
if %input%==2 (goto copy)
if %input%==3 (goto del)
if %input%==4 (goto chkdsk)
if %input%==5 (goto list)
if %input%==7 (goto mkdir)
%e-%
set invalid=
set /P invalid= Invalid option!
goto run
:copy
CLS
%e-%
%e%  x - Back to menu
%e-%
set copyinput=
set /P copyinput= File: 
if '%copyinput%'=='' (goto copy)
if %copyinput%==X (goto run)
if %copyinput%==x (goto run)
if not exist "%copyinput%" (
%e-%
set invalidcopy=
set /P invalidcopy= ERROR: %copyinput% not found!
goto copy
) 
%e-%
set copyinputfolder=
set /P copyinputfolder= To: 
if '%copyinputfolder%'=='' (goto copy)
if %copyinputfolder%==X (goto run)
if %copyinputfolder%==x (goto run)
if not exist "%copyinputfolder%" (
%e-%
set invalidcopy=
set /P invalidcopy= ERROR: %copyinputfolder% not found!
goto copy
)
%e-%
%e%  Copying "%copyinput%" to "%copyinputfolder%"
copy /Y "%copyinput%" "%copyinputfolder%"
%e-%
set done=
set /P done=Finished!
goto copy
:del
%e-%
SET delinput=
SET /P delinput=File/Folder: 
if '%delinput%'=='' (goto del)
IF NOT EXIST %delinput% (
%e-%
%e%  ERROR: %delinput% not found!
)
IF EXIST "%delinput%" (
FOR %%F IN (%delinput%) DO RMDIR /Q "%%F"
FOR %%F IN (%delinput%) DO DEl /Q /F "%%F"
)
%e-%
%p%
goto run
:chkdsk
CLS
%e-%
SET chkdskinput=
SET /P chkdskinput=Specify a Disk: 
IF '%chkdskinput%'=='' (goto chkdsk)
IF "%chkdskinput%"=="C:" (set chkdskinput=C:\)
IF "%chkdskinput%"=="G:" (set chkdskinput=G:\)
IF "%chkdskinput%"=="F:" (set chkdskinput=F:\)
IF not exist "%chkdskinput%" (
%e-%
set invalid=
set /P invalid=ERROR: %chkdskinput% not found!
goto chkdsk
)
%e-%
SET chkdskinpu2=
SET /P chkdskinpu2=Locate ^& Fix bad sectors? This will take longer. [Y/n]: 
IF '%chkdskinpu2%'=='' (goto chkdsk)
IF %chkdskinpu2%==Y (goto chkdskyes)
IF %chkdskinpu2%==y (goto chkdskyes)
IF %chkdskinpu2%==N (goto chkdskno)
IF %chkdskinpu2%==n (goto chkdskno)
%e-%
set invalid=
set /P invalid=Invalid option!
goto chkdsk
:chkdskyes
%e-%
REM Locates bad sectors. Includes /F switch
IF "%chkdskinput%"=="C:\" (
chkdsk /I /C
) else (
chkdsk %chkdskinput% /R
)
%e-%
%p%
goto chkdsk
:chkdskno
%e-%
REM Fixes errors
IF "%chkdskinput%"=="C:\" (
chkdsk /I /C
) else (
chkdsk %chkdskinput% /F
)
%e-%
%p%
goto chkdsk
:list
CLS
%e-%
SET listinput=
SET /P listinput=List what file extensions?: 
IF '%listinput%'=='' (goto list)
%e-%
FOR %%L IN (%listinput%) DO %e% %%L
%e-%
%p%
goto list
:mkdir
%e-%
set mkdirinput=
set /P mkdirinput= Name: 
if not exist "%mkdirinput%" (
mkdir "%mkdirinput%"
set done=
set /P done= Finished!
goto run
)
if exist "%mkdirinput%" (
%e-%
set invalidmkdir=
set /P invalidmkdir= ERROR: %mkdirinput% exists!
goto run
)
goto
:exit
CLS
ECHO.