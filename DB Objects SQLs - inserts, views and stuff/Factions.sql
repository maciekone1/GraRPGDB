/*
   czwartek, 1 czerwca 201712:05:37
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
CREATE TABLE dbo.Tmp_Factions
	(
	ID int NOT NULL IDENTITY (1, 1),
	FactionName nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Factions SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Factions ON
GO
IF EXISTS(SELECT * FROM dbo.Factions)
	 EXEC('INSERT INTO dbo.Tmp_Factions (ID, FactionName)
		SELECT ID, FactionName FROM dbo.Factions WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Factions OFF
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Factions
GO
DROP TABLE dbo.Factions
GO
EXECUTE sp_rename N'dbo.Tmp_Factions', N'Factions', 'OBJECT' 
GO
ALTER TABLE dbo.Factions ADD CONSTRAINT
	PK_Factions PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Factions', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Factions', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Factions', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Character SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per 