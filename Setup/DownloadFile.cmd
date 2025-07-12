@echo off
REM Usage: DownloadFile.cmd <URL> <OutputFileName>

if "%~1"=="" (
    echo Error: No URL specified.
    exit /b 1
)
if "%~2"=="" (
    echo Error: No output file name specified.
    exit /b 1
)

set "URL=%~1"
set "OUTFILE=%CD%\%~2"

powershell -NoProfile -Command "Start-BitsTransfer -Source '%URL%' -Destination '%OUTFILE%'"