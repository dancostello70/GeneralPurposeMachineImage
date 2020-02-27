USE [master]
GO
CREATE DATABASE [Pub1] ON 
( FILENAME = N'C:\094018Data\Pub1.mdf' ),
( FILENAME = N'C:\094018Data\Pub1_log.ldf' )
 FOR ATTACH
GO

USE [Pub1]
GO
EXEC sp_changedbowner 'sa' 
GO
