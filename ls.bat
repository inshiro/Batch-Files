@echo off
for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do set "BS=%%A"
echo.
for %%f in (*) do echo %%f