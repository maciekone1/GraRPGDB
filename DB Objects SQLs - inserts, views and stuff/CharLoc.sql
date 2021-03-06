/*
   środa, 31 maja 201712:52:16
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
CREATE TABLE dbo.Tmp_CharLoc
	(
	ID int NOT NULL,
	CharacterID int NOT NULL,
	LocID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CharLoc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.CharLoc)
	 EXEC('INSERT INTO dbo.Tmp_CharLoc (ID, CharacterID, LocID)
		SELECT ID, CharacterID, LocID FROM dbo.CharLoc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.CharLoc
GO
EXECUTE sp_rename N'dbo.Tmp_CharLoc', N'CharLoc', 'OBJECT' 
GO
ALTER TABLE dbo.CharLoc ADD CONSTRAINT
	PK_CharLoc PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.CharLoc', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CharLoc', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CharLoc', 'Object', 'CONTROL') as Contr_Per 