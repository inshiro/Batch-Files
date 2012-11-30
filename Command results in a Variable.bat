@echo off
set e=echo
cls
for /f "delims=" %%a in ('ver') do set foobar=%%a
%e%.
%e%  ==Command results in a Variable==
%e%.
%e%  %foobar%
%e%.
pause