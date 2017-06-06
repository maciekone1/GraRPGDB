/*
   środa, 31 maja 201712:52:49
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
CREATE TABLE dbo.Tmp_CharacterStats
	(
	ID int NOT NULL,
	CharacterID int NOT NULL,
	AttributeID int NOT NULL,
	Value int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CharacterStats SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.CharacterStats)
	 EXEC('INSERT INTO dbo.Tmp_CharacterStats (ID, CharacterID, AttributeID, Value)
		SELECT ID, CONVERT(int, CharacterID), CONVERT(int, AttributeID), CONVERT(int, Value) FROM dbo.CharacterStats WITH (HOLDLOCK TABLOCKX)')
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
COMMIT
select Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'CONTROL') as Contr_Per 