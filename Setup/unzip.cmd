@echo off

if "%1"=="" goto usage
SET TARGETPATH=%2
IF "%2"=="" SET TARGETPATH=%userprofile%\desktop\%~n1\\

@echo Unzipping %1
:: powershell -ExecutionPolicy Bypass -Command "Expand-Archive -Force -Path %1 -DestinationPath %TARGETPATH%\$((Get-Item %1).Basename)"
powershell -ExecutionPolicy Bypass -Command "Expand-Archive -Force -Path %1 -DestinationPath %TARGETPATH%"

goto end

:usage

@echo Usage: unzip {path_of_thing_to_unzip} [{target_path}]

:end
@echo Done.
    