/*
   środa, 31 maja 201708:39:45
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
CREATE TABLE dbo.Tmp_Spells
	(
	ID int NOT NULL,
	Name nvarchar(50) NOT NULL,
	Description nvarchar(250) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Spells SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Spells)
	 EXEC('INSERT INTO dbo.Tmp_Spells (ID, Name, Description)
		SELECT ID, Name, Description FROM dbo.Spells WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Spells
GO
EXECUTE sp_rename N'dbo.Tmp_Spells', N'Spells', 'OBJECT' 
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Spells', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Spells', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Spells', 'Object', 'CONTROL') as Contr_Per 