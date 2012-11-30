@echo off
:: Original author: Unknown
:: Editor: GrellesLicht28
REM To write a text before colored text, use a SET/P-command before the CALL-command.
REM To write a text between two colored texts, use a SET/P-command between two CALL-commands.
REM To write a text after all colored texts, use an ECHO-command. If you do not want to write anything after it, use "ECHO."
REM The last colored text should have "end" as third parameter.
title Colour Text
:run
cls
echo These are the colored texts:
echo.
call :ColorText 0a "GREEN"
echo.
echo.
pause
goto run
exit

:: Keep this label exactly as it is and do not change anything here!
:ColorText [%1 = Color] [%2 = Text]
set /p ".=." > "%~2" <nul 
findstr /v /a:%1 /R "^$" "%~2" nul 2>nul
set /p ".=" <nul
if "%3" == "end" set /p ".=  " <nul
del "%~2" >nul 2>nul
exit /b