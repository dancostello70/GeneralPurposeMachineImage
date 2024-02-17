USE [master]
RESTORE DATABASE [AdventureWorksDW2020] 
FROM DISK = N'D:\Allfiles\DatabaseBackup\AdventureWorksDW2020.bak' WITH FILE = 1,  NOUNLOAD,  STATS = 5
 ,  MOVE N'AdventureWorksDW2020' TO N'D:\Allfiles\DBData\AdventureWorksDW2020.mdf',  MOVE N'AdventureWorksDW2020_Log' TO N'D:\Allfiles\DBData\AdventureWorksDW2020_Log.ldf'
GO


