/*
   czwartek, 1 czerwca 201714:03:07
   User: 
   Server: EITX-N-00131\SQLEXPRESS
   Database: GraRPG
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Backpack
GO
ALTER TABLE dbo.Backpack SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Backpack', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Backpack', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Backpack', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_CharLoc
GO
ALTER TABLE dbo.CharLoc SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CharLoc', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CharLoc', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CharLoc', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_CharacterStats
GO
ALTER TABLE dbo.CharacterStats SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Class
GO
ALTER TABLE dbo.Class SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Class', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Class', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Class', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Equipment
GO
ALTER TABLE dbo.Equipment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Factions
GO
ALTER TABLE dbo.Factions SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Factions', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Factions', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Factions', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Character
	(
	ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL,
	ClasssID int NOT NULL,
	FractionID int NOT NULL,
	Alive bit NOT NULL,
	[Level] int NOT NULL,
	XP int NOT NULL,
	Money int NULL,
	CharacterStatsID int NULL,
	EquipmentID int NULL,
	CharLocID int NULL,
	BackpackID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Character SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Character ON
GO
IF EXISTS(SELECT * FROM dbo.Character)
	 EXEC('INSERT INTO dbo.Tmp_Character (ID, Name, ClasssID, FractionID, Alive, [Level], XP, Money, CharacterStatsID, EquipmentID, CharLocID, BackpackID)
		SELECT ID, Name, ClasssID, FractionID, Alive, [Level], XP, Money, CharacterStatsID, EquipmentID, CharLocID, BackpackID FROM dbo.Character WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Character OFF
GO
ALTER TABLE dbo.AccountCharacters
	DROP CONSTRAINT FK_AccountCharacters_Character
GO
DROP TABLE dbo.Character
GO
EXECUTE sp_rename N'dbo.Tmp_Character', N'Character', 'OBJECT' 
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	PK_Character PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_Factions FOREIGN KEY
	(
	FractionID
	) REFERENCES dbo.Factions
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_Equipment FOREIGN KEY
	(
	EquipmentID
	) REFERENCES dbo.Equipment
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_Class FOREIGN KEY
	(
	ClasssID
	) REFERENCES dbo.Class
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_CharacterStats FOREIGN KEY
	(
	CharacterStatsID
	) REFERENCES dbo.CharacterStats
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_CharLoc FOREIGN KEY
	(
	CharLocID
	) REFERENCES dbo.CharLoc
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_Backpack FOREIGN KEY
	(
	BackpackID
	) REFERENCES dbo.Backpack
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.AccountCharacters ADD CONSTRAINT
	FK_AccountCharacters_Character FOREIGN KEY
	(
	CharacterID
	) REFERENCES dbo.Character
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.AccountCharacters SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.AccountCharacters', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.AccountCharacters', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.AccountCharacters', 'Object', 'CONTROL') as Contr_Per 