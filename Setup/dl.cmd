@echo off

if "%1"=="" goto usage
SET TARGETPATH = %2
IF "%2"=="" SET TARGETPATH=%userprofile%\desktop

@echo Downloading %1
powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing -Uri %1 -OutFile %TARGETPATH%\$(Split-Path %1 -Leaf)"

goto end

:usage

@echo Usage: dl {URL_of_thing_to_download} [{target_path}]

:end
@echo Done.