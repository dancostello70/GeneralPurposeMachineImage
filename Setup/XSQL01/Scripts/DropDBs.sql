-- Drop DB Script for XSQL01
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'Pub1'
GO
USE [master]
GO
/****** Object:  Database [Pub1]    Script Date: 2/29/2020 10:01:21 AM ******/
DROP DATABASE [Pub1]
GO

