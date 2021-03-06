/*
   środa, 31 maja 201712:53:39
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
CREATE TABLE dbo.Tmp_Character
	(
	ID int NOT NULL,
	Name nvarchar(50) NOT NULL,
	ClasssID int NOT NULL,
	FractionID int NOT NULL,
	Alive bit NOT NULL,
	[Level] int NOT NULL,
	XP int NOT NULL,
	Money int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Character SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Character)
	 EXEC('INSERT INTO dbo.Tmp_Character (ID, Name, ClasssID, FractionID, Alive, [Level], XP, Money)
		SELECT ID, Name, ClasssID, FractionID, Alive, [Level], XP, Money FROM dbo.Character WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Character
GO
EXECUTE sp_rename N'dbo.Tmp_Character', N'Character', 'OBJECT' 
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	PK_Character PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per 