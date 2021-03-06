/*
   wtorek, 6 czerwca 201717:35:24
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
ALTER TABLE dbo.CharacterStats
	DROP CONSTRAINT FK_CharacterStats_Attributes
GO
ALTER TABLE dbo.Attributes SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Attributes', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Attributes', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Attributes', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_CharacterStats
	(
	ID int NOT NULL IDENTITY (1, 1),
	AttributeID int NOT NULL,
	Value int NOT NULL,
	CharacterID int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CharacterStats SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_CharacterStats ON
GO
IF EXISTS(SELECT * FROM dbo.CharacterStats)
	 EXEC('INSERT INTO dbo.Tmp_CharacterStats (ID, AttributeID, Value, CharacterID)
		SELECT ID, AttributeID, Value, CharacterID FROM dbo.CharacterStats WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_CharacterStats OFF
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_CharacterStats
GO
DROP TABLE dbo.CharacterStats
GO
EXECUTE sp_rename N'dbo.Tmp_CharacterStats', N'CharacterStats', 'OBJECT' 
GO
ALTER TABLE dbo.CharacterStats ADD CONSTRAINT
	PK_CharacterStats PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.CharacterStats ADD CONSTRAINT
	FK_CharacterStats_Attributes FOREIGN KEY
	(
	AttributeID
	) REFERENCES dbo.Attributes
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Character SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per 