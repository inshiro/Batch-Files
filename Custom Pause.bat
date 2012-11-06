@echo.
@if "%bs%"=="" @for /f %%A in ('"prompt $H & echo on & for %%B in (1) do rem"') do @set "bs=%%A"
@pause>nul|set /P =%bs% Press any key to continue . . . 
