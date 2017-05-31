USE [master]
GO
/****** Object:  Database [GraRPG]    Script Date: 31.05.2017 14:04:23 ******/
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
/****** Object:  Table [dbo].[AccountCharacters]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountCharacters](
	[ID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
 CONSTRAINT [PK_AccountCharacters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CharacterAccountID] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ID] [int] NOT NULL,
	[Attribute_Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Backpack]    Script Date: 31.05.2017 14:04:23 ******/
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
/****** Object:  Table [dbo].[Character]    Script Date: 31.05.2017 14:04:23 ******/
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
	[Money] [int] NOT NULL,
	[CharacterStatsID] [int] NOT NULL,
	[EquipmentID] [int] NULL,
	[CharLocID] [int] NULL,
	[BackpackID] [int] NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterStats]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterStats](
	[ID] [int] NOT NULL,
	[AttributeID] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_CharacterStats] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharLoc]    Script Date: 31.05.2017 14:04:23 ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] NOT NULL,
	[Class_name] [nvarchar](50) NOT NULL,
	[SpecialisationID] [int] NOT NULL,
	[ClassSpellID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassSpells]    Script Date: 31.05.2017 14:04:23 ******/
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
/****** Object:  Table [dbo].[EqLoc]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EqLoc](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_EqLoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[ID] [int] NOT NULL,
	[EqLocID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factions]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factions](
	[ID] [int] NOT NULL,
	[FactionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Factions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] NOT NULL,
	[ItemType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localization]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localization](
	[ID] [int] NOT NULL,
	[CharacterID] [int] NOT NULL,
	[Nazwa] [nvarchar](50) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
 CONSTRAINT [PK_Localization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialisation]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialisation](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specialisation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spells]    Script Date: 31.05.2017 14:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spells](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Spells] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Backpack] FOREIGN KEY([BackpackID])
REFERENCES [dbo].[Backpack] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Backpack]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_CharacterStats] FOREIGN KEY([CharacterStatsID])
REFERENCES [dbo].[CharacterStats] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_CharacterStats]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_CharLoc] FOREIGN KEY([CharLocID])
REFERENCES [dbo].[CharLoc] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_CharLoc]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Class] FOREIGN KEY([ClasssID])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Class]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Equipment]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Factions] FOREIGN KEY([FractionID])
REFERENCES [dbo].[Factions] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Factions]
GO
ALTER TABLE [dbo].[CharacterStats]  WITH CHECK ADD  CONSTRAINT [FK_CharacterStats_Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attributes] ([ID])
GO
ALTER TABLE [dbo].[CharacterStats] CHECK CONSTRAINT [FK_CharacterStats_Attributes]
GO
ALTER TABLE [dbo].[CharLoc]  WITH CHECK ADD  CONSTRAINT [FK_CharLoc_Localization] FOREIGN KEY([LocID])
REFERENCES [dbo].[Localization] ([ID])
GO
ALTER TABLE [dbo].[CharLoc] CHECK CONSTRAINT [FK_CharLoc_Localization]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_ClassSpells] FOREIGN KEY([ClassSpellID])
REFERENCES [dbo].[ClassSpells] ([ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_ClassSpells]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Specialisation] FOREIGN KEY([SpecialisationID])
REFERENCES [dbo].[Specialisation] ([ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Specialisation]
GO
ALTER TABLE [dbo].[ClassSpells]  WITH CHECK ADD  CONSTRAINT [FK_ClassSpells_Spells] FOREIGN KEY([SpellID])
REFERENCES [dbo].[Spells] ([ID])
GO
ALTER TABLE [dbo].[ClassSpells] CHECK CONSTRAINT [FK_ClassSpells_Spells]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_EqLoc] FOREIGN KEY([EqLocID])
REFERENCES [dbo].[EqLoc] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_EqLoc]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_ItemType] FOREIGN KEY([ItemType])
REFERENCES [dbo].[ItemType] ([ID])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_ItemType]
GO
USE [master]
GO
ALTER DATABASE [GraRPG] SET  READ_WRITE 
GO
