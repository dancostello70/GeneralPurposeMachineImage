:: Debugging
SET DEBUG=0
IF NOT "%SETUP_DEBUG%"=="" IF NOT "%SETUP_DEBUG%"=="0" SET DEBUG=1

SET SETUPROOT=%~dp0

IF NOT "%1"=="" powershell -ExecutionPolicy Bypass -File %SETUPROOT%\InitSetup_Param.ps1 -ClassId %1

:: call %SETUPROOT%\StartSelectedClassSetup.cmd

IF %DEBUG%==1 pause
