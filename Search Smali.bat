@echo off
SETLOCAL ENABLEEXTENSIONS
title Search File in Subfolder
SET e=echo
SET p=pause
CD /D "%~dp0"
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
REM Settings --------
:run
cls
%e%.
%e%  == Search File in Subfolder ==
%e%.
%e%  This is dangerous. Make sure you put this in a directory where there is smalis
%e%.
%e%  Or else it will search in every folder ^& subfolder
%e%.
set ii=
set /P ii=%BS% File to search: 
%e%.
if '%ii%'=='' (goto run)
set i=
set /P i=%BS% Continue? [Y/n]: 
if '%i%'=='' (goto run)
if %i%==y (goto yes)
if %i%==y (goto yes)
if %i%==n (goto exit)
if %i%==N (goto exit)
if %i%==x (goto exit)
if %i%==X (goto exit)
%e%.
set err=
set /P err=%BS% Invalid selection! 
:yes
cls
%e%.
%e%  Searching ...
%e%.
for /R %%i in (*AndroidBidi.smali) do echo %%i>>log.txt
for /R %%i in (*Assetmanager.smali) do echo %%i>>log.txt
for /R %%i in (*BluetoothA2dpService.smali) do echo %%i>>log.txt
for /R %%i in (*BrowserFrame.smali) do echo %%i>>log.txt
for /R %%i in (*Canvas.smali) do echo %%i>>log.txt
for /R %%i in (*DnsResolver.smali) do echo %%i>>log.txt
for /R %%i in (*LoadListener.smali) do echo %%i>>log.txt
for /R %%i in (*MediaRecorder.smali) do echo %%i>>log.txt
for /R %%i in (*Network.smali) do echo %%i>>log.txt
for /R %%i in (*Process.smali) do echo %%i>>log.txt
for /R %%i in (*Settings$Secure.smali) do echo %%i>>log.txt
for /R %%i in (*Surface.smali) do echo %%i>>log.txt
for /R %%i in (*TextUtils.smali) do echo %%i>>log.txt
for /R %%i in (*ToneGenerator.smali) do echo %%i>>log.txt
for /R %%i in (*WebSettings.smali) do echo %%i>>log.txt
for /R %%i in (*WebViewCore.smali) do echo %%i>>log.txt
set d=
set /P d=%BS% Finished! 
:exit
cls
%e%.
TITLE %SystemRoot%\system32\cmd.exe
%e%  Goodbye!
