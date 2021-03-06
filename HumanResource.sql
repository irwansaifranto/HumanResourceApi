USE [master]
GO
/****** Object:  Database [HumanResources]    Script Date: 3/8/2018 11:51:42 PM ******/
CREATE DATABASE [HumanResources]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HumanResources', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HumanResources.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HumanResources_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HumanResources_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HumanResources] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HumanResources].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HumanResources] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HumanResources] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HumanResources] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HumanResources] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HumanResources] SET ARITHABORT OFF 
GO
ALTER DATABASE [HumanResources] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HumanResources] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HumanResources] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HumanResources] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HumanResources] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HumanResources] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HumanResources] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HumanResources] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HumanResources] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HumanResources] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HumanResources] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HumanResources] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HumanResources] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HumanResources] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HumanResources] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HumanResources] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HumanResources] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HumanResources] SET RECOVERY FULL 
GO
ALTER DATABASE [HumanResources] SET  MULTI_USER 
GO
ALTER DATABASE [HumanResources] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HumanResources] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HumanResources] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HumanResources] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HumanResources] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HumanResources', N'ON'
GO
ALTER DATABASE [HumanResources] SET QUERY_STORE = OFF
GO
USE [HumanResources]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HumanResources]
GO
/****** Object:  Table [dbo].[EmergencyContact]    Script Date: 3/8/2018 11:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyContact](
	[EmergencyContactId] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](128) NOT NULL,
	[Relationship] [varchar](32) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[City] [varchar](32) NOT NULL,
	[Province] [varchar](32) NOT NULL,
	[PostalCode] [varchar](16) NULL,
	[HomePhone] [varchar](16) NULL,
	[CellPhone] [varchar](16) NOT NULL,
	[EmailAddress] [varchar](64) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](64) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](64) NULL,
	[FkEmployeeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmergencyContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FkEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/8/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](32) NOT NULL,
	[MiddleName] [varchar](32) NULL,
	[LastName] [varchar](32) NULL,
	[BirthPlace] [varchar](64) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [varchar](1) NOT NULL,
	[Status] [varchar](32) NOT NULL,
	[Children] [smallint] NULL,
	[HomeAddress] [varchar](128) NOT NULL,
	[City] [varchar](32) NOT NULL,
	[Province] [varchar](32) NOT NULL,
	[PostalCode] [varchar](16) NULL,
	[HomePhone] [varchar](16) NULL,
	[CellPhone] [varchar](16) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[JoinDate] [date] NOT NULL,
	[BankName] [varchar](32) NOT NULL,
	[AccountNumberName] [varchar](64) NOT NULL,
	[AccountNumber] [varchar](32) NOT NULL,
	[IdentityCard] [varchar](64) NOT NULL,
	[NPWP] [varchar](32) NULL,
	[FamilyCard] [varchar](32) NULL,
	[Active] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](64) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/8/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](32) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[EmailAddress] [varchar](64) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](64) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](64) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmergencyContact]  WITH CHECK ADD FOREIGN KEY([FkEmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
USE [master]
GO
ALTER DATABASE [HumanResources] SET  READ_WRITE 
GO
