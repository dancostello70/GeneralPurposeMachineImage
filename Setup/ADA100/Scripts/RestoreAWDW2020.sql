USE [master]
RESTORE DATABASE [AdventureWorksDW2020] 
FROM  DISK = N'D:\DA100\DatabaseBackup\AdventureWorksDW2020.bak' 
WITH  FILE = 1, NOUNLOAD,  STATS = 5
-- ,  MOVE N'AdventureWorksDW2020' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW2020.mdf',  MOVE N'AdventureWorksDW2020_Log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW2020_Log.ldf'
GO


