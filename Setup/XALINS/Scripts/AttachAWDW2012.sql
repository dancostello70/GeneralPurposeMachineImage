USE [master]
GO
CREATE DATABASE [AdventureWorksDW2012] ON 
( FILENAME = N'C:\XAL2NSClassFiles\Chapter-11\AdventureWorksDW2012_Data.mdf' ),
( FILENAME = N'C:\XAL2NSClassFiles\Chapter-11\AdventureWorksDW2012_log.ldf' )
 FOR ATTACH
GO
