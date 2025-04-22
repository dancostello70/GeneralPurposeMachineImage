@Echo Off
:: Database setup for XSQL01
ECHO Setting up SQL Server databases...

:: Get current directory
SET SUBDIR=%~dp0
SET SQLCMD_WITH_PATH=C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\SQLCMD.EXE

:: Restart SQL Server Service to force closure of any open connections
NET STOP MSSQLLAUNCHPAD
NET STOP SQLSERVERAGENT
NET STOP MSSQLSERVER
NET START MSSQLSERVER
NET START SQLSERVERAGENT
NET START MSSQLLAUNCHPAD

:: Run SQL Script to prepare the database environment
ECHO Preparing Databases...
SQLCMD -E -i %SUBDIR%\DropDBs.sql
:: SQLCMD -S ADVENTUREWORKS\MSSQLSERVER01 -E -i %SUBDIR%\AttachPub1Db.sql
:: SQLCMD -S ADVENTUREWORKS\MSSQLSERVER01 -E -i %SUBDIR%\AttachPub2Db.sql
:: SQLCMD -E -i %SUBDIR%\AttachPub1Db.sql
:: SQLCMD -E -i %SUBDIR%\AttachPub2Db.sql
"%SQLCMD_WITH_PATH%" -E -i %SUBDIR%\2017_pub1_script.sql
"%SQLCMD_WITH_PATH%" -E -i %SUBDIR%\2017_pub2_script.sql



::pause


