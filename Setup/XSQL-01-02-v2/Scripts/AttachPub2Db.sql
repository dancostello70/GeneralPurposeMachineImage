USE [master]
GO
CREATE DATABASE [Pub2] ON 
( FILENAME = N'C:\094030Data\Pub2.mdf' ),
( FILENAME = N'C:\094030Data\Pub2_log.ldf' )
 FOR ATTACH
GO

USE [Pub2]
GO
EXEC sp_changedbowner 'sa' 
GO
