/*
   czwartek, 1 czerwca 201713:44:09
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
ALTER TABLE dbo.Equipment
	DROP CONSTRAINT FK_Equipment_Item1
GO
ALTER TABLE dbo.Item
	DROP COLUMN Name
GO
ALTER TABLE dbo.Item SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Item', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Item', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Item', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.EqLoc SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Equipment
	(
	ID int NOT NULL,
	ItemID int NOT NULL,
	EqLoc int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Equipment SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Equipment)
	 EXEC('INSERT INTO dbo.Tmp_Equipment (ID, ItemID)
		SELECT ID, ItemID FROM dbo.Equipment WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Equipment
GO
EXECUTE sp_rename N'dbo.Tmp_Equipment', N'Equipment', 'OBJECT' 
GO
ALTER TABLE dbo.Equipment ADD CONSTRAINT
	PK_Equipment PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Equipment ADD CONSTRAINT
	FK_Equipment_Item1 FOREIGN KEY
	(
	ItemID
	) REFERENCES dbo.Item
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Equipment ADD CONSTRAINT
	FK_Equipment_EqLoc FOREIGN KEY
	(
	EqLoc
	) REFERENCES dbo.EqLoc
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Character SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per 