USE [master]
GO
/****** Object:  Database [GraRPG]    Script Date: 30.05.2017 19:50:55 ******/
CREATE DATABASE [GraRPG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GraRPG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GraRPG.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GraRPG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GraRPG_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GraRPG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GraRPG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GraRPG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GraRPG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GraRPG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GraRPG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GraRPG] SET ARITHABORT OFF 
GO
ALTER DATABASE [GraRPG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GraRPG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GraRPG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GraRPG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GraRPG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GraRPG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GraRPG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GraRPG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GraRPG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GraRPG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GraRPG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GraRPG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GraRPG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GraRPG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GraRPG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GraRPG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GraRPG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GraRPG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GraRPG] SET  MULTI_USER 
GO
ALTER DATABASE [GraRPG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GraRPG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GraRPG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GraRPG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GraRPG] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GraRPG]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[CharacterID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ID] [int] NULL,
	[Attribute_Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Backpack]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Backpack](
	[ID] [int] NULL,
	[CharacterID] [int] NULL,
	[ItemID] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Character]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ClasssID] [int] NULL,
	[FractionID] [int] NULL,
	[Alive] [bit] NULL,
	[Level] [int] NULL,
	[XP] [int] NULL,
	[Money] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterStats]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterStats](
	[ID] [int] NULL,
	[CharacterID] [nchar](10) NULL,
	[AttributeID] [nchar](10) NULL,
	[Value] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharLoc]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharLoc](
	[ID] [int] NULL,
	[CharacterID] [int] NULL,
	[LocID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] NULL,
	[Class_name] [nvarchar](50) NULL,
	[SpecialisationID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSpells]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSpells](
	[ClassSpells] [int] NULL,
	[ClassID] [int] NULL,
	[SpellID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EqLoc]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EqLoc](
	[ID] [int] NULL,
	[Name] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] NULL,
	[EqLocID] [int] NULL,
	[CharacterID] [int] NULL,
	[ItemID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] NULL,
	[ItemType] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ID] [int] NULL,
	[Description] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localization]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localization](
	[ID] [int] NULL,
	[CharacterID] [int] NULL,
	[Nazwa] [int] NULL,
	[X] [int] NULL,
	[Y] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialisation]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialisation](
	[ID] [int] NULL,
	[Nazwa] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spells]    Script Date: 30.05.2017 19:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spells](
	[ID] [int] NULL,
	[Name] [nchar](10) NULL,
	[Description] [nchar](10) NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [GraRPG] SET  READ_WRITE 
GO
