/*
   czwartek, 1 czerwca 201710:20:52
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
ALTER TABLE dbo.Item
	DROP CONSTRAINT FK_Item_ItemType
GO
ALTER TABLE dbo.ItemType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ItemType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ItemType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ItemType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Item
	(
	ID int NOT NULL IDENTITY (1, 1),
	ItemType int NOT NULL,
	Name nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Item SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Item ON
GO
IF EXISTS(SELECT * FROM dbo.Item)
	 EXEC('INSERT INTO dbo.Tmp_Item (ID, ItemType, Name)
		SELECT ID, ItemType, Name FROM dbo.Item WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Item OFF
GO
ALTER TABLE dbo.Equipment
	DROP CONSTRAINT FK_Equipment_Item
GO
ALTER TABLE dbo.Backpack
	DROP CONSTRAINT FK_Backpack_Item
GO
DROP TABLE dbo.Item
GO
EXECUTE sp_rename N'dbo.Tmp_Item', N'Item', 'OBJECT' 
GO
ALTER TABLE dbo.Item ADD CONSTRAINT
	PK_Item PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Item ADD CONSTRAINT
	FK_Item_ItemType FOREIGN KEY
	(
	ItemType
	) REFERENCES dbo.ItemType
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Item', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Item', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Item', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Backpack ADD CONSTRAINT
	FK_Backpack_Item FOREIGN KEY
	(
	ItemID
	) REFERENCES dbo.Item
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Backpack SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Backpack', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Backpack', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Backpack', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Equipment ADD CONSTRAINT
	FK_Equipment_Item FOREIGN KEY
	(
	ItemID
	) REFERENCES dbo.Item
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Equipment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Equipment', 'Object', 'CONTROL') as Contr_Per 