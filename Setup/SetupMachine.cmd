:: Debugging
SET DEBUG=0
IF NOT "%SETUP_DEBUG%"=="" IF NOT "%SETUP_DEBUG%"=="0" SET DEBUG=1

powershell -ExecutionPolicy Bypass -File %SETUPROOT%\InitSetup.ps1

call %SETUPROOT%\StartSelectedClassSetup.cmd

IF %DEBUG%==1 pause
