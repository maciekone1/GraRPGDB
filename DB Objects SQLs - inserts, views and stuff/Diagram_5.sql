/*
   czwartek, 1 czerwca 201713:00:54
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
	DROP CONSTRAINT FK_Equipment_Item
GO
ALTER TABLE dbo.Item SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Item', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Item', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Item', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Equipment
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
ALTER TABLE dbo.Equipment
	DROP COLUMN EqLocID
GO
ALTER TABLE dbo.Equipment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.EqLoc SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ItemType ADD
	EqLocID int NOT NULL
GO
COMMIT
