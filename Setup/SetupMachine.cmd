

powershell -ExecutionPolicy Bypass -File %SETUPROOT%\InitSetup.ps1

call %SETUPROOT%\StartSelectedClassSetup.cmd

IF NOT "%SETUP_DEBUG%"=="" IF NOT "%SETUP_DEBUG%"=="0" pause
