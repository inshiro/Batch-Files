@echo off
set e=echo
cls
set myvar="some string"
rem compute the length of a string
set #=%myvar%
set length=0
:loop
if defined # (
    rem shorten string by one character
    set #=%#:~1%
    rem increment the string count variable %length%
    set /A length += 1
    rem repeat until string is null
    goto loop
)
echo %myvar%
echo myvar is %length% characters long!
pause