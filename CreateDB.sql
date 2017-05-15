--------------------------------------------------------------------------------------------------------------------
-- TrustID.ExampleCo DB and users
--------------------------------------------------------------------------------------------------------------------

-- DB
CREATE DATABASE [DBUpdater]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBUpdater', FILENAME = N'C:\temp\DBUpdater.mdf' , SIZE = 5120KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBUpdater_log', FILENAME = N'C:\temp\DBUpdater_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBUpdater] SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE [DBUpdater] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBUpdater] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBUpdater] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBUpdater] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBUpdater] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBUpdater] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBUpdater] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBUpdater] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBUpdater] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBUpdater] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBUpdater] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBUpdater] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBUpdater] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBUpdater] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBUpdater] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBUpdater] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBUpdater] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBUpdater] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBUpdater] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBUpdater] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBUpdater] SET  READ_WRITE 
GO
ALTER DATABASE [DBUpdater] SET RECOVERY FULL 
GO
ALTER DATABASE [DBUpdater] SET  MULTI_USER 
GO
ALTER DATABASE [DBUpdater] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBUpdater] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBUpdater]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [DBUpdater] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO

-- Users
USE [master]
IF NOT EXISTS (SELECT name FROM sys.server_principals WHERE name = 'dbupdater-dbo')
BEGIN
	CREATE LOGIN [dbupdater-dbo] WITH PASSWORD=N'afri1123$$', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
END
GO
USE [DBUpdater]
GO
CREATE USER [dbupdater-dbo] FOR LOGIN [dbupdater-dbo] WITH DEFAULT_SCHEMA=[dbo]
GO
EXEC sp_addrolemember N'db_owner', N'dbupdater-dbo'
GO
--ALTER SERVER ROLE [dbcreator] ADD MEMBER [dbupdater-dbo]
GO
/*
DROP TABLE Testing
CREATE TABLE Testing
(      PortfolioID          VARCHAR(40)
,      TransactionID VARCHAR(40)
,      JoinKey                    VARCHAR(40)
,      InstrumentType       VARCHAR(40)
,      TranType             VARCHAR(5)
,      FldDesc                    VARCHAR(40)
,      CcyLocal             VARCHAR(5)    
,      Consideration FLOAT
)
CREATE CLUSTERED INDEX CIX_Trans_tranID_JoinKey ON Testing (TransactionID,JoinKey)