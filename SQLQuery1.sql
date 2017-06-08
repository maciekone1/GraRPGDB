USE [master]
GO
/****** Object:  Database [GraRPG]    Script Date: 08.06.2017 08:18:21 ******/
CREATE DATABASE [GraRPG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GraRPG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GraRPG.mdf' , SIZE = 12288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GraRPG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GraRPG_log.ldf' , SIZE = 13632KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [GraRPG]
GO
/****** Object:  Sequence [dbo].[seq_acc]    Script Date: 08.06.2017 08:18:21 ******/
CREATE SEQUENCE [dbo].[seq_acc] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
USE [GraRPG]
GO
/****** Object:  Sequence [dbo].[seq_chars]    Script Date: 08.06.2017 08:18:21 ******/
CREATE SEQUENCE [dbo].[seq_chars] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
USE [GraRPG]
GO
/****** Object:  Sequence [dbo].[seq_loc]    Script Date: 08.06.2017 08:18:21 ******/
CREATE SEQUENCE [dbo].[seq_loc] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  UserDefinedFunction [dbo].[emailSep]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  UserDefinedFunction [dbo].[Hosting]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[AccountCharacters]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Attributes]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Backpack]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Character]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[ID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[CharacterStats]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[ClassSpells]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[EqLoc]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Equipment]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Factions]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Localization]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localization](
	[ID] [int] NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[X] [numeric](5, 2) NOT NULL,
	[Y] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_Localization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialisation]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  Table [dbo].[Spells]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  View [dbo].[mv_account_chars_dead]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[mv_account_chars_dead]   as  
	select a.Login, a.Email as [E-mail], ch.Name as [Nazwa Postaci], ch.Level, ch.Logged as [Zalogowana], cs.Class_name as [Klasa] , sp.Name  as Specjalizacja, lo.Nazwa as Lokalizacja
	 from dbo.Accounts as a 
	inner join dbo.AccountCharacters ac on a.ID = ac.AccountID 
	join dbo.Character ch on ac.CharacterID = ch.ID 
	join dbo.Class cs on ch.ClasssID = cs.ID
	join dbo.Specialisation sp on cs.SpecialisationID = sp.ID
	join dbo.Localization lo on lo.ID = ch.CharLocID
	where ch.Alive = 0


GO
/****** Object:  View [dbo].[v_account_chars]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_account_chars] as  
	select a.Login, a.Email as [E-mail], ch.Name as [Nazwa Postaci], ch.Level, ch.Logged as [Zalogowana], cs.Class_name as [Klasa] , sp.Name  as Specjalizacja, lo.Nazwa as Lokalizacja
	 from dbo.Accounts as a 
	inner join dbo.AccountCharacters ac on a.ID = ac.AccountID 
	join dbo.Character ch on ac.CharacterID = ch.ID 
	join dbo.Class cs on ch.ClasssID = cs.ID
	join dbo.Specialisation sp on cs.SpecialisationID = sp.ID
	join dbo.Localization lo on lo.ID = ch.CharLocID
	where ch.Alive = 1


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
/****** Object:  StoredProcedure [dbo].[logOut]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  StoredProcedure [dbo].[Rekt]    Script Date: 08.06.2017 08:18:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_czary]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

/****** Object:  StoredProcedure [dbo].[stringGenerator]    Script Date: 08.06.2017 08:18:21 ******/
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
GO
create procedure [dbo].[sp_czary]
as

DECLARE @Mag VARCHAR(30)
DECLARE @Druid Varchar(30)
DECLARE @Czarnoksieznik Varchar(30)
DECLARE @Paladyn Varchar(30)
DECLARE @Warrior Varchar(30)
DECLARE @Thief Varchar(30)
DECLARE @Kleryk Varchar(30)
DECLARE @Bard Varchar(30)
Declare @Description varchar(30)
DECLARE @RowCount2 INT
DECLARE @MOD INT
DECLARE @Buff varchar(20)

Declare @BUFFMOD int
Set @RowCount2 = 1

Set @MOD = 0


while @RowCount2 < 10
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Mag = 'Mage spell of ' + @Buff;
SET @Description = @MAG +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Mag, @Description, 1);
set @RowCount2 = @RowCount2 + 1
end
while @RowCount2 < 20
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Druid = 'Druid spell of ' + @Buff;
SET @Description = @Druid +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Druid, @Description, 2);
set @RowCount2 = @RowCount2 + 1
end
while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Czarnoksieznik = 'Warlock spell of ' + @Buff;
SET @Description = @Czarnoksieznik +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Czarnoksieznik, @Description, 3);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 40
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Paladyn = 'Paladin spell of ' + @Buff;
SET @Description = @Paladyn +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Paladyn, @Description, 4);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 50
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Warrior = 'Warropr spell of ' + @Buff;
SET @Description = @Warrior +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Warrior, @Description, 5);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 60
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Thief = 'Thief spell of ' + @Buff;
SET @Description = @Thief +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Thief, @Description, 6);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 70
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Kleryk = 'Cleric spell of ' + @Buff;
SET @Description = @Kleryk +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Kleryk, @Description, 7);
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 80
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Bard = 'Bard spell of ' + @Buff;
SET @Description = @Bard +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Bard, @Description, 8);
set @RowCount2 = @RowCount2 + 1
end







GO



GO
/****** Object:  StoredProcedure [dbo].[sp_items]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_items] 
as

DECLARE @Sword VARCHAR(30)
DECLARE @LSword Varchar(30)
DECLARE @Axe Varchar(30)
DECLARE @2Haxe Varchar(30)
DECLARE @Mace Varchar(30)
DECLARE @Bow Varchar(30)
DECLARE @Xbow Varchar(30)
DECLARE @Helmet Varchar(30)
DECLARE @Armor Varchar(30)
DECLARE @Boots Varchar(30)
DECLARE @Gloves Varchar(30)

DECLARE @RowCount2 INT
DECLARE @MOD INT
DECLARE @Buff varchar(20)

Declare @BUFFMOD int
Set @RowCount2 = 1
Set @MOD = 0


while @RowCount2 < 10
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Sword = 'Sword of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (1, @Sword)
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 20
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @LSword = 'Long Sword of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (2, @LSword)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Axe = 'Axe of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (3, @Axe)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @2Haxe = '2H Axe of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (4, @Axe)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 40
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Mace = 'Mace of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (5, @Mace)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 50
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Bow = 'Bow of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (6, @Bow)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 60
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Xbow= 'Crossbow of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (7, @Xbow)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 70
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Helmet = 'Helmet of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (8, @Helmet)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 80
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Armor = 'Armo of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (9, @Armor)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 90
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Boots= 'Boots of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (10, @Boots)
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 100
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Gloves= 'Gloves of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (11, @Gloves)
set @RowCount2 = @RowCount2 + 1
end

GO
/****** Object:  StoredProcedure [dbo].[sp_upd]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_upd]
as

declare @zmienna int
declare @rozrzuta int
declare @ilosc int
set @ilosc = (select count(*) from dbo.Character)
declare @wartosc int
declare @cos int
set @cos = 1
begin
set @zmienna = 1
while @zmienna < @ilosc
	if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 4 = 0)
	begin
	update dbo.AccountCharacters set AccountID = @cos where CharacterID = @zmienna
	set @cos = @cos + 1
	set @zmienna = @zmienna + 1
	end
		else if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 9 = 0)
		begin
			update dbo.AccountCharacters set AccountID = @cos where CharacterID = @zmienna
		set @cos = @cos + 1
		set @zmienna = @zmienna + 1
		end
				else if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 5 = 0)
				begin
					update dbo.AccountCharacters set AccountID = @cos where CharacterID = @zmienna
					update dbo.Character set Alive = 0 where ID = @zmienna
				set @cos = @cos + 1
				set @zmienna = @zmienna + 1
				end
						else
						begin
						set @zmienna = @zmienna + 1
						end
							end;


GO


/****** Object:  StoredProcedure [dbo].[sp_insert_chk]    Script Date: 08.06.2017 08:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert_chk]
@amount int
as

declare @rowCount int
declare @RandomString nvarchar(30)
declare @randomInt int
declare @randomClass int
declare @currentOne nvarchar(30)
declare @seq int
declare @factID int 

DECLARE @First VARCHAR(14)
DECLARE @Last VARCHAR(14)
Declare @Email VARCHAR(30)
DECLARE @RandomStringv2 NVARCHAR(MAX)

								insert into dbo.Attributes(Description,Attribute_Name) Values 
								('Si³a okreœla iloœæ pkt. obra¿eñ', 'Si³a') 
								,('Zrêcznoœæ orkeœla szansê na trafienia krytyczne' , 'Zrêcznoœæ')
								,('Witalnoœæ okreœla iloœc pkt. ¿ycia' , 'Witalnoœæ')
								,('Wiedza okreœla iloœc pkt. many' , 'Wiedza')
								,('Inteligencja okreœla iloœc pkt. obra¿eñ ', 'Inteligencja');
								insert into dbo.Factions(FactionName) Values 
								('Horda') 
								,('Przymierze')
								,('Nieumarli');
								insert into dbo.Specialisation(Name) Values 
								('Kowal') 
								,('£owca')
								,('Zielarz')
								,('Handlarz'), ('Dekarz'), ('Maryna¿'), ('Polityk'), ('Beggar'), ('Bandyta');
								insert into dbo.Class(Class_name, SpecialisationID) values ('Mag', 1), ('Druid', 2), ('Warlock', 3), ('Paladyn',4), ('Warrior',5), ('Thief', 6), ('Kleryk', 7), ('Bard',8);
								exec dbo.sp_czary;

								insert into dbo.ItemType (Description, Typ) Values ('Miecz ostry krótki', 'Miecz krótki'), ('Miecz ostry d³ugi' , 'Miecz d³ugi'),('Topór ostry' , 'Topór'),('Topór ostry dwórêczny' , 'Topór dwórêczny'),('Ciê¿ka bu³awa', 'Bulawa'),('Uk zwany ³ukiem', '£ók'), ('Kusza co be³tami strzela', 'Kusza'), ('He³m chroni g³owe', 'He³m'), ('Zbroja - chroni klate', 'Zbroja'), ('Cichobiegi', 'Buty'), ('Rêkawice - do wyjmowania ciasta', 'Rêkawice')
								exec dbo.sp_items;

set @rowCount =1
	while @rowCount < @amount
		begin

			set @randomInt = ABS(Checksum(NewID()) % 9) + 1 --wartosc bezwzgledna z newID (guid) podzielona przez 10 - zakres 1-9
			set @randomClass = ABS(Checksum(NewID()) % 8) + 1 
			set @factID = ABS(Checksum(NewID()) % 3) + 1
			EXEC stringGenerator 5, @RandomString OUTPUT;
			EXEC stringGenerator 10, @RandomStringv2 OUTPUT;
			set @First = @RandomStringv2
			set @Last = REVERSE(@RandomStringv2)
			set @Email = SUBSTRING(@First,1,4) +  SUBSTRING(@Last,1,4) + '@host' +  CAST(CAST (@factID as int) as nvarchar)  + '.pl'

				INSERT INTO [dbo].[Accounts] ([ID],[Login] ,[Password] ,[Email] ) VALUES (NEXT VALUE FOR dbo.seq_acc, @First, @Last, @Email)
				
				set @seq = NEXT VALUE FOR dbo.seq_loc		
				--postaæ respi sie w temple
							insert into dbo.Localization (ID,Nazwa, X,Y) values (@seq,'Temple2', 1.0, 1.0);
				--kreowanie postaci
							insert into dbo.Character 
							(ID, Name, ClasssID, Alive, Level, XP, Money, Logged, CharLocID, FractionID)
							values
							(Next Value for dbo.seq_chars, @RandomString, @randomClass, 1, 1, 1000, 500 + 12 * @factID  , 0, @seq, @factID)
			--Losowanie przypisanie postaci do konta
								insert into dbo.AccountCharacters (AccountID, CharacterID) values (@seq, @seq) 

			set @currentOne = (select ID from Character where Name = @RandomString)
			set @rowCount = @rowCount + 1
end
								exec dbo.sp_upd;

								Go
EXEC GraRPG.dbo.sp_insert_chk 10000;

GO
USE [master]
GO
ALTER DATABASE [GraRPG] SET  READ_WRITE 
GO
