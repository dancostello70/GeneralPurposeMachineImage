@echo off

echo Rearming Office
cd "C:\Program Files\Microsoft Office\Office16\"
"C:\Program Files\Microsoft Office\Office16\OSPPREARM.EXE"

echo Starting machine setup
call %SETUPROOT%\SetupMachine.cmd

echo Done!

