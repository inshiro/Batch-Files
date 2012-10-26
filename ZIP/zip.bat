@ECHO off
SETLOCAL ENABLEEXTENSIONS
SET e=ECHO
SET e-=ECHO.
SET p=PAUSE
SET zip=Tools\7za.exe
CD %~dp0
REM Settings --------
:run
if '%clvl%'=='' (set clvl=9)
if exist %zip% goto 7zexist
if exist 7za.exe goto 7zexist
if not exist "7za.exe" (
CLS
%e-%
set /P n=7za.exe was not found!
goto exit
)
:7zexist
CLS
%e-%
%e%  =====================================
%e%  *            Zip   Menu             *
%e%  =====================================
%e-%
%e%  Compression Level: %clvl%
%e-%
%e%  c - Set Compression Level
%e-%
%e%  x - Exit
%e-%
set input=
set /P input=File or Folder: 
if '%input%'==''      (goto 7zexist)
if %input%==C     (goto setclvl)
if %input%==c     (goto setclvl)
if %input%==X     (goto exit)
if %input%==x     (goto exit)
if not exist "%input%" (
%e-%
set inputinvalid=
set /P inputinvalid=%input% was not found!
goto 7zexist
)
%e-%
set /P inputz=Name of zip: 
if '%inputz%'==''      (goto 7zexist)
if %inputz%==C     (goto setclvl)
if %inputz%==c     (goto setclvl)
if %inputz%==X     (goto exit)
if %inputz%==x     (goto exit)
%e-%
CLS
if exist 7za.exe (
7za a -tzip "%inputz%" "%input%" -mx%clvl%
)
if exist %zip% (
if not exist output_zip mkdir output_zip
%zip% a -tzip "..\%inputz%" "..\output_zip\%input%" -mx%clvl%
)
%e-%
set fi=
set /P fi=Finished!
:setclvl
set clvl=
CLS
%e-%
%e-%
%e%    0      1       3    4     5      6     7      8     9
%e%  Copy  Fastest  Fast       Normal       Maximum      Ultra
%e-%
%e-%
%e%  x - Back to menu
%e-%
%e-%
set ic=
set /P ic= Enter option: 
if '%ic%'=='' (set clvl=9 & goto 7zexist)
if %ic%==X (set clvl=9 & goto 7zexist)
if %ic%==x (set clvl=9 & goto 7zexist)
if %ic%==0 (set clvl=0 & goto 7zexist)
if %ic%==1 (set clvl=1 & goto 7zexist)
if %ic%==2 (set clvl=2 & goto 7zexist)
if %ic%==3 (set clvl=3 & goto 7zexist)
if %ic%==4 (set clvl=4 & goto 7zexist)
if %ic%==5 (set clvl=5 & goto 7zexist)
if %ic%==6 (set clvl=6 & goto 7zexist)
if %ic%==7 (set clvl=7 & goto 7zexist)
if %ic%==8 (set clvl=8 & goto 7zexist)
if %ic%==9 (set clvl=9 & goto 7zexist)
%e-%
set invalid=
set /P invalid=Invalid value!
goto setclvl
:exit
CLS
ECHO.
