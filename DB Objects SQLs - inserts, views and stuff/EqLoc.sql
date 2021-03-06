/*
   środa, 31 maja 201712:50:58
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
CREATE TABLE dbo.Tmp_EqLoc
	(
	ID int NOT NULL,
	Name nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_EqLoc SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.EqLoc)
	 EXEC('INSERT INTO dbo.Tmp_EqLoc (ID, Name)
		SELECT ID, CONVERT(nvarchar(50), Name) FROM dbo.EqLoc WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.EqLoc
GO
EXECUTE sp_rename N'dbo.Tmp_EqLoc', N'EqLoc', 'OBJECT' 
GO
ALTER TABLE dbo.EqLoc ADD CONSTRAINT
	PK_EqLoc PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.EqLoc', 'Object', 'CONTROL') as Contr_Per 