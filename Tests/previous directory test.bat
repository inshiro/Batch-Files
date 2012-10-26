@echo off
cls
pushd "%CD%"
echo %CD%
echo.
PAUSE
echo Go to %PROGRAMFILES% Drive
cd %PROGRAMFILES%
echo %CD%
echo.
PAUSE
echo.
echo.
echo Go back to previous directory:
popd
echo %CD%
echo.
PAUSE
::END