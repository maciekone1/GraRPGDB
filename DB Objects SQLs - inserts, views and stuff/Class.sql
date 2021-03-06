/*
   wtorek, 6 czerwca 201712:25:11
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
ALTER TABLE dbo.Class
	DROP CONSTRAINT FK_Class_Specialisation
GO
ALTER TABLE dbo.Specialisation SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Specialisation', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Specialisation', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Specialisation', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Class
	(
	ID int NOT NULL IDENTITY (1, 1),
	Class_name nvarchar(50) NOT NULL,
	SpecialisationID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Class SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Class ON
GO
IF EXISTS(SELECT * FROM dbo.Class)
	 EXEC('INSERT INTO dbo.Tmp_Class (ID, Class_name, SpecialisationID)
		SELECT ID, Class_name, SpecialisationID FROM dbo.Class WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Class OFF
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Class
GO
ALTER TABLE dbo.Spells
	DROP CONSTRAINT FK_Spells_Class
GO
DROP TABLE dbo.Class
GO
EXECUTE sp_rename N'dbo.Tmp_Class', N'Class', 'OBJECT' 
GO
ALTER TABLE dbo.Class ADD CONSTRAINT
	PK_Class PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Class ADD CONSTRAINT
	FK_Class_Specialisation FOREIGN KEY
	(
	SpecialisationID
	) REFERENCES dbo.Specialisation
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Class', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Class', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Class', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Spells ADD CONSTRAINT
	FK_Spells_Class FOREIGN KEY
	(
	ClassID
	) REFERENCES dbo.Class
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Spells SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Spells', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Spells', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Spells', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Character SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per 