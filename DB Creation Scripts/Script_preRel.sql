USE [master]
GO
/****** Object:  Database [GraRPG]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Sequence [dbo].[seq_acc]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Sequence [dbo].[seq_chars]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Sequence [dbo].[seq_loc]    Script Date: 08.06.2017 17:27:26 ******/
CREATE SEQUENCE [dbo].[seq_loc] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  UserDefinedFunction [dbo].[emailSep]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  UserDefinedFunction [dbo].[Hosting]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[AccountCharacters]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Attributes]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Character]    Script Date: 08.06.2017 17:27:26 ******/
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
	[CharLocID] [int] NULL,
	[Logged] [bit] NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharactersDead]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharactersDead](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Level] [int] NULL,
	[XP] [int] NULL,
	[Money] [int] NULL,
	[Date] [date] NULL,
	[CharID] [int] NULL,
 CONSTRAINT [PK_CharactersDead] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterStats]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[EQ]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
 CONSTRAINT [PK_EQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EqLoc]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EqLoc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Loc] [nvarchar](50) NULL,
 CONSTRAINT [PK_EqLoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factions]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Loc] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Localization]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Specialisation]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  Table [dbo].[Spells]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  View [dbo].[mv_account_chars_dead]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  View [dbo].[v_account_chars]    Script Date: 08.06.2017 17:27:26 ******/
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
ALTER TABLE [dbo].[CharacterStats]  WITH CHECK ADD  CONSTRAINT [FK_CharacterStats_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([ID])
GO
ALTER TABLE [dbo].[CharacterStats] CHECK CONSTRAINT [FK_CharacterStats_Character]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Specialisation] FOREIGN KEY([SpecialisationID])
REFERENCES [dbo].[Specialisation] ([ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Specialisation]
GO
ALTER TABLE [dbo].[EQ]  WITH CHECK ADD  CONSTRAINT [FK_EQ_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Character] ([ID])
GO
ALTER TABLE [dbo].[EQ] CHECK CONSTRAINT [FK_EQ_Character]
GO
ALTER TABLE [dbo].[EQ]  WITH CHECK ADD  CONSTRAINT [FK_EQ_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[EQ] CHECK CONSTRAINT [FK_EQ_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_EqLoc] FOREIGN KEY([Loc])
REFERENCES [dbo].[EqLoc] ([ID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_EqLoc]
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


GO
/****** Object:  StoredProcedure [dbo].[stringGenerator]    Script Date: 08.06.2017 17:27:26 ******/
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

	
	
/****** Object:  StoredProcedure [dbo].[isertingItems]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[isertingItems] @value int
as

Declare @charID int
Declare @item int
set @charID = @value


declare @i1 int, @i2 int, @i3 int, @i4 int, @i5 int, @i6 int, @i7 int, @i8 int;

set @i1 = ABS(Checksum(NewID()) % 10) + 1
set @i2 = ABS(Checksum(NewID()) % 10) + 10
set @i3 = ABS(Checksum(NewID()) % 10) + 20
set @i4 = ABS(Checksum(NewID()) % 10) + 30
set @i5 = ABS(Checksum(NewID()) % 10) + 40
set @i6 = ABS(Checksum(NewID()) % 10) + 50
set @i7 = ABS(Checksum(NewID()) % 10) + 60
set @i8 = ABS(Checksum(NewID()) % 10) + 70

if (@value % 4 = 0)
	begin
	insert into dbo.EQ (ItemID, CharacterID) values (@i1, @value), (@i2, @value), (@i4, @value), (@i7, @value);
end --1,2,4,7
else if (@value % 3 = 0)
	begin
	insert into dbo.EQ (ItemID, CharacterID) values (@i8, @value), (@i3, @value), (@i5, @value)
	end -- 8,3,5
		else
			begin
			insert into dbo.EQ (ItemID, CharacterID) values (@i6, @value)
			end

--set @randomInt = ABS(Checksum(NewID()) % 9) + 1
--EXEC stringGenerator 5, @RandomString OUTPUT;
GO
/****** Object:  StoredProcedure [dbo].[logOut]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Rekt]    Script Date: 08.06.2017 17:27:26 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_czary]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_czary]
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
/****** Object:  StoredProcedure [dbo].[sp_isertingItems]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_isertingItems] @value int
as

Declare @charID int
Declare @item int
set @charID = @value


declare @i1 int, @i2 int, @i3 int, @i4 int, @i5 int, @i6 int, @i7 int, @i8 int;

set @i1 = ABS(Checksum(NewID()) % 10) + 1
set @i2 = ABS(Checksum(NewID()) % 10) + 10
set @i3 = ABS(Checksum(NewID()) % 10) + 20
set @i4 = ABS(Checksum(NewID()) % 10) + 30
set @i5 = ABS(Checksum(NewID()) % 10) + 40
set @i6 = ABS(Checksum(NewID()) % 10) + 50
set @i7 = ABS(Checksum(NewID()) % 10) + 60
set @i8 = ABS(Checksum(NewID()) % 10) + 70

if (@value % 4 = 0)
	begin
	insert into dbo.EQ (ItemID, CharacterID) values (@i1, @value), (@i2, @value), (@i4, @value), (@i7, @value);
end --1,2,4,7
else if (@value % 3 = 0)
	begin
	insert into dbo.EQ (ItemID, CharacterID) values (@i8, @value), (@i3, @value), (@i5, @value)
	end -- 8,3,5
		else
			begin
			insert into dbo.EQ (ItemID, CharacterID) values (@i6, @value)
			end

--set @randomInt = ABS(Checksum(NewID()) % 9) + 1
--EXEC stringGenerator 5, @RandomString OUTPUT;
GO
/****** Object:  StoredProcedure [dbo].[sp_items]    Script Date: 08.06.2017 17:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_items] 
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
insert into dbo.Item (ItemType, Name, Loc) VALUES (1, @Sword, 1)
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 20
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @LSword = 'Long Sword of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (2, @LSword, 1)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Axe = 'Axe of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (3, @Axe, 1)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @2Haxe = '2H Axe of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (4, @Axe, 1)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 40
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Mace = 'Mace of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (5, @Mace, 1)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 50
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Bow = 'Bow of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (6, @Bow,1 )
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 60
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Xbow= 'Crossbow of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (7, @Xbow, 1)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 70
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Helmet = 'Helmet of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (8, @Helmet, 2)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 80
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Armor = 'Armor of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (9, @Armor,3)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 90
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Boots= 'Boots of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (10, @Boots, 4)
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 100
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Gloves= 'Gloves of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name, Loc) VALUES (11, @Gloves,5)
set @RowCount2 = @RowCount2 + 1
end





GO
/****** Object:  StoredProcedure [dbo].[sp_upd]    Script Date: 08.06.2017 17:27:26 ******/
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





/****** Object:  StoredProcedure [dbo].[sp_insert_chk]    Script Date: 08.06.2017 17:27:26 ******/
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
declare @sq int
DECLARE @First VARCHAR(14)
DECLARE @Last VARCHAR(14)
Declare @Email VARCHAR(30)
Declare @s1 int
Declare @s2 int
Declare @s3 int
Declare @s4 int
Declare @s5 int
DECLARE @RandomStringv2 NVARCHAR(MAX)

								insert into dbo.Attributes(Description,Attribute_Name) Values 
								('Siła określa ilość pkt. obrażeń', 'Siła') 
								,('Zręczność orkeśla szansę na trafienia krytyczne' , 'Zręczność')
								,('Witalność określa ilośc pkt. życia' , 'Witalność')
								,('Wiedza określa ilośc pkt. many' , 'Wiedza')
								,('Inteligencja określa ilośc pkt. obrażeń ', 'Inteligencja');
								insert into dbo.Factions(FactionName) Values 
								('Horda') 
								,('Przymierze')
								,('Nieumarli');
								insert into dbo.Specialisation(Name) Values 
								('Kowal') 
								,('Łowca')
								,('Zielarz')
								,('Handlarz'), ('Dekarz'), ('Marynaż'), ('Polityk'), ('Beggar'), ('Bandyta');
								insert into dbo.Class(Class_name, SpecialisationID) values ('Mag', 1), ('Druid', 2), ('Warlock', 3), ('Paladyn',4), ('Warrior',5), ('Thief', 6), ('Kleryk', 7), ('Bard',8);
								exec dbo.sp_czary;

								insert into dbo.EqLoc (Loc) values ('Broń'), ('Głowa'), ('Klatka piersiowa'), ('Buty'), ('Ręce'); 
								insert into dbo.ItemType (Description, Typ) Values ('Miecz ostry krótki', 'Miecz krótki'), ('Miecz ostry długi' , 'Miecz długi'),('Topór ostry' , 'Topór'),('Topór ostry dwóręczny' , 'Topór dwóręczny'),('Ciężka buława', 'Bulawa'),('Uk zwany łukiem', 'Łók'), ('Kusza co bełtami strzela', 'Kusza'), ('Hełm chroni głowe', 'Hełm'), ('Zbroja - chroni klate', 'Zbroja'), ('Cichobiegi', 'Buty'), ('Rękawice - do wyjmowania ciasta', 'Rękawice')
								exec dbo.sp_items;

set @rowCount =1
	while @rowCount < @amount
		begin

			set @randomInt = ABS(Checksum(NewID()) % 9) + 1 --wartosc bezwzgledna z newID (guid) podzielona przez 10 - zakres 1-9
			set @randomClass = ABS(Checksum(NewID()) % 8) + 1 
			set @factID = ABS(Checksum(NewID()) % 3) + 1

						set @s1 = ABS(Checksum(NewID()) % 10) + 1
									set @s2 = ABS(Checksum(NewID()) % 10) + 1
												set @s3 = ABS(Checksum(NewID()) % 10) + 1
															set @s4 = ABS(Checksum(NewID()) % 10) + 1
																		set @s5 = ABS(Checksum(NewID()) % 10) + 1

			EXEC stringGenerator 5, @RandomString OUTPUT;
			EXEC stringGenerator 10, @RandomStringv2 OUTPUT;
			set @First = @RandomStringv2
			set @Last = REVERSE(@RandomStringv2)
			set @Email = SUBSTRING(@First,1,4) +  SUBSTRING(@Last,1,4) + '@host' +  CAST(CAST (@factID as int) as nvarchar)  + '.pl'

				INSERT INTO [dbo].[Accounts] ([ID],[Login] ,[Password] ,[Email] ) VALUES (NEXT VALUE FOR dbo.seq_acc, @First, @Last, @Email)
				
				set @seq = NEXT VALUE FOR dbo.seq_loc		
				--postać respi sie w temple
							insert into dbo.Localization (ID,Nazwa, X,Y) values (@seq,'Temple2', 1.0, 1.0);
				--kreowanie postaci
							insert into dbo.Character 
							(ID, Name, ClasssID, Alive, Level, XP, Money, Logged, CharLocID, FractionID)
							values
							(Next Value for dbo.seq_chars, @RandomString, @randomClass, 1, 1, 1000, 500 + 12 * @factID  , 0, @seq, @factID)
							set @sq = (SELECT CAST(current_value as int) FROM sys.sequences WHERE name = 'seq_chars')
							insert into dbo.CharacterStats (AttributeID, CharacterID, Value)
							values
							(1, @sq, @s1),
							(2, @sq, @s2),
							(3, @sq, @s3),
							(4, @sq, @s4),
							(5, @sq, @s5);
			--Losowanie przypisanie postaci do konta
								insert into dbo.AccountCharacters (AccountID, CharacterID) values (@seq, @seq) 
								exec sp_isertingItems @seq;

			set @currentOne = (select ID from Character where Name = @RandomString)
			set @rowCount = @rowCount + 1
end
								exec dbo.sp_upd;
								end
go
exec GraRPG.dbo.sp_insert_chk 10000;
end

USE [GraRPG]
GO
/****** Object:  View [dbo].[v_postacie]    Script Date: 08.06.2017 18:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  view [dbo].[v_postacie]
as
SELECT        TOP (100) PERCENT dbo.Character.Name AS [Nazwa Postaci], dbo.Character.[Level] AS Poziom, dbo.Character.XP AS [Ilość XP], dbo.Character.Money AS Pieniądze, dbo.Character.Logged AS [Czy zalogowana], 
                         dbo.Specialisation.Name AS Specjalizacja, dbo.Class.Class_name AS [Klasa Postaci]
FROM            dbo.Character INNER JOIN
                         dbo.Class ON dbo.Character.ClasssID = dbo.Class.ID INNER JOIN
                         dbo.Specialisation ON dbo.Class.SpecialisationID = dbo.Specialisation.ID INNER JOIN
                         dbo.Factions ON dbo.Character.FractionID = dbo.Factions.ID INNER JOIN
                         dbo.Localization ON dbo.Character.CharLocID = dbo.Localization.ID
WHERE        (dbo.Character.Money < 515)
ORDER BY [Czy zalogowana] DESC, [Klasa Postaci] DESC


GO
USE [master]
GO
ALTER DATABASE [GraRPG] SET  READ_WRITE 
GO
