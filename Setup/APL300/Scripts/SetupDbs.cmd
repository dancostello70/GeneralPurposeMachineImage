@Echo Off
ECHO Setting up SQL Server databases...

REM - Get current directory
SET SUBDIR=%~dp0

REM - Restart SQL Server Service to force closure of any open connections
NET STOP SQLSERVERAGENT /y
NET STOP MSSQLSERVER /y
NET START MSSQLSERVER /y
NET START SQLSERVERAGENT /y

REM - Run SQL Script to prepare the database environment
ECHO Preparing Databases...
SQLCMD -E -i %SUBDIR%\RestoreAWDW2020.sql
SQLCMD -E -i %SUBDIR%\RestoreTailspinToys2020.sql

::pause


