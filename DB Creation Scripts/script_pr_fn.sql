USE [master]
GO
/****** Object:  Database [GraRPG]    Script Date: 06.06.2017 21:27:11 ******/
CREATE DATABASE [GraRPG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GraRPG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GraRPG.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  UserDefinedFunction [dbo].[emailSep]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[emailSep] (@email nvarchar(255))
Returns varchar(255)
as Begin

declare @EmailB nvarchar(255)
set @EmailB = @email;
set @EmailB = REPLACE(@EmailB, '@', ' ')
set @EmailB = REPLACE(@EmailB, '.host.com', ' ')

return @EmailB
end
GO
/****** Object:  UserDefinedFunction [dbo].[Hosting]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Hosting] (@email nvarchar(255)) Returns varchar(255)
as Begin
declare @EmailB nvarchar(255)
set @EmailB = @email

set @EmailB = REPLACE(SUBSTRING(@EmailB, CHARINDEX('.', @EmailB), LEN(@EmailB)), '.', '.')

return @EmailB
end
GO
/****** Object:  Table [dbo].[AccountCharacters]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountCharacters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
 CONSTRAINT [PK_AccountCharacters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CharacterAccountID] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Attribute_Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Backpack]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Backpack](
	[ID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
 CONSTRAINT [PK_Backpack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Character]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClasssID] [int] NOT NULL,
	[FractionID] [int] NOT NULL,
	[Alive] [bit] NOT NULL,
	[Level] [int] NOT NULL,
	[XP] [int] NOT NULL,
	[Money] [int] NULL,
	[CharacterStatsID] [int] NULL,
	[EquipmentID] [int] NULL,
	[CharLocID] [int] NULL,
	[BackpackID] [int] NULL,
	[Logged] [bit] NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterStats]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterStats](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[CharacterID] [int] NULL,
 CONSTRAINT [PK_CharacterStats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharLoc]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharLoc](
	[ID] [int] NOT NULL,
	[LocID] [int] NOT NULL,
 CONSTRAINT [PK_CharLoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_name] [nvarchar](50) NOT NULL,
	[SpecialisationID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSpells]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSpells](
	[ID] [int] NOT NULL,
	[SpellID] [int] NOT NULL,
 CONSTRAINT [PK_ClassSpells] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EqLoc]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EqLoc](
	[ID] [int] NOT NULL,
	[Loc] [nvarchar](50) NULL,
 CONSTRAINT [PK_EqLoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[EqLoc] [int] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factions]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FactionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Factions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Typ] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localization]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[X] [numeric](5, 2) NOT NULL,
	[Y] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_Localization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RandomData]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RandomData](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[SomeInt] [int] NULL,
	[SomeBit] [bit] NULL,
	[SomeVarchar] [varchar](10) NULL,
	[SomeDateTime] [datetime] NULL,
	[SomeNumeric] [numeric](16, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specialisation]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialisation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specialisation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spells]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spells](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Spells] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[testTAB]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[testTAB](
	[Test] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AccountCharacters]  WITH CHECK ADD  CONSTRAINT [FK_AccountCharacters_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([ID])
GO
ALTER TABLE [dbo].[AccountCharacters] CHECK CONSTRAINT [FK_AccountCharacters_Character]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_AccountCharacters] FOREIGN KEY([CharacterAccountID])
REFERENCES [dbo].[AccountCharacters] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_AccountCharacters]
GO
ALTER TABLE [dbo].[Backpack]  WITH CHECK ADD  CONSTRAINT [FK_Backpack_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[Backpack] CHECK CONSTRAINT [FK_Backpack_Item]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_CharacterStats] FOREIGN KEY([CharacterStatsID])
REFERENCES [dbo].[CharacterStats] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_CharacterStats]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Class] FOREIGN KEY([ClasssID])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Class]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Factions] FOREIGN KEY([FractionID])
REFERENCES [dbo].[Factions] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Factions]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Localization] FOREIGN KEY([CharLocID])
REFERENCES [dbo].[Localization] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Localization]
GO
ALTER TABLE [dbo].[CharacterStats]  WITH CHECK ADD  CONSTRAINT [FK_CharacterStats_Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attributes] ([ID])
GO
ALTER TABLE [dbo].[CharacterStats] CHECK CONSTRAINT [FK_CharacterStats_Attributes]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Specialisation] FOREIGN KEY([SpecialisationID])
REFERENCES [dbo].[Specialisation] ([ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Specialisation]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EqLoc] FOREIGN KEY([EqLoc])
REFERENCES [dbo].[EqLoc] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EqLoc]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Item1] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Item1]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([ItemType])
REFERENCES [dbo].[ItemType] ([ID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
GO
ALTER TABLE [dbo].[Spells]  WITH CHECK ADD  CONSTRAINT [FK_Spells_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Spells] CHECK CONSTRAINT [FK_Spells_Class]
GO
/****** Object:  StoredProcedure [dbo].[logOut]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[logOut]
@characterID int,
@X int,
@Y int,
@nazwa nvarchar(30)
AS
BEGIN
update dbo.Character set Logged = 0 where ID = @characterID
update dbo.Localization set X = @X, Y = @Y, Nazwa = @nazwa where ID = (select dbo.Character.CharLocID from dbo.Character where dbo.Character.ID = @characterID);
end

GO
/****** Object:  StoredProcedure [dbo].[Rekt]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rekt]
@characterID int
as

DECLARE @level int;
Declare @Money int;
Declare @Exp int;
declare @pent int;
declare @X int;
declare @Y int;
declare @Nazwa nvarchar(30);

set @X = 0.0;
set @Y = 0.0;
set @Nazwa = 'Hell';

set @level = (select dbo.Character.Level from dbo.Character where dbo.Character.ID = @characterID)
set @Money = (select dbo.Character.Money FROM DBO.Character where dbo.Character.ID = @characterID)
set @Exp = (select dbo.Character.XP FROM DBO.Character where dbo.Character.ID = @characterID)

set @pent = @level * 100;

BEGIN
update dbo.Character set Logged = 0, Alive = 0, Money = @Money - @pent, XP = @Exp - @pent where ID = @characterID
update dbo.Localization set X = @X, Y = @Y, Nazwa = @nazwa where ID = (select dbo.Character.CharLocID from dbo.Character where dbo.Character.ID = @characterID);
end

GO
/****** Object:  StoredProcedure [dbo].[stringGenerator]    Script Date: 06.06.2017 21:27:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stringGenerator]
@sLength tinyint , 
@RandomString nvarchar(MAX) OUTPUT 
 
AS
 
SET NOCOUNT ON
 
DECLARE @Count tinyint, @NextC char(1)
SET @Count = 1
SET @RandomString = ''
WHILE @Count <= @sLength
BEGIN
SELECT @NextC = CHAR(ROUND(RAND() * 81 + 33, 0))
	IF (ASCII(@NextC) > 96  AND ASCII(@NextC) < 122) or (ASCII(@NextC) > 65  AND ASCII(@NextC) < 90)
		BEGIN
			SELECT @RandomString = @RandomString + @NextC
			SET @Count = @Count + 1
		END
	END
 

GO
USE [master]
GO
ALTER DATABASE [GraRPG] SET  READ_WRITE 
GO
