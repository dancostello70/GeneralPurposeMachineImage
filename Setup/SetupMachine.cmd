:: Updated 2023-01-22
:: dan@costellotech.com

:: Debugging
SET DEBUG=0
IF NOT "%SETUP_DEBUG%"=="" (IF NOT "%SETUP_DEBUG%"=="0" (SET DEBUG=1))
IF "%SETUPROOT%"=="" (SET SETUPROOT=%~dp0)

powershell -ExecutionPolicy Bypass -File %SETUPROOT%\InitSetup.ps1

call %SETUPROOT%\StartSelectedClassSetup.cmd

IF %DEBUG%==1 pause
