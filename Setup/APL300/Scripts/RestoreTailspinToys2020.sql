USE [master]
RESTORE DATABASE [TailspinToys2020-US] 
FROM  DISK = N'D:\PL300\DatabaseBackup\TailspinToys2020-US-MSQL2017.bak' 
WITH  FILE = 1, NOUNLOAD,  STATS = 5
 ,  MOVE N'TailspinToys2020-US' TO N'D:\PL300\DBData\TailspinToys2020-US.mdf',  MOVE N'TailspinToys2020-US_Log' TO N'D:\PL300\DBData\TailspinToys2020-US_Log.ldf'
-- ,  MOVE N'AdventureWorksDW2020' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW2020.mdf',  MOVE N'AdventureWorksDW2020_Log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureWorksDW2020_Log.ldf'
GO
