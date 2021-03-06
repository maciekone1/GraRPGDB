/*
   czwartek, 1 czerwca 201712:09:32
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
CREATE TABLE dbo.Tmp_Specialisation
	(
	ID int NOT NULL IDENTITY (1, 1),
	Name nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Specialisation SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Specialisation ON
GO
IF EXISTS(SELECT * FROM dbo.Specialisation)
	 EXEC('INSERT INTO dbo.Tmp_Specialisation (ID, Name)
		SELECT ID, Name FROM dbo.Specialisation WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Specialisation OFF
GO
ALTER TABLE dbo.Class
	DROP CONSTRAINT FK_Class_Specialisation
GO
DROP TABLE dbo.Specialisation
GO
EXECUTE sp_rename N'dbo.Tmp_Specialisation', N'Specialisation', 'OBJECT' 
GO
ALTER TABLE dbo.Specialisation ADD CONSTRAINT
	PK_Specialisation PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Specialisation', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Specialisation', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Specialisation', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
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
ALTER TABLE dbo.Class SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Class', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Class', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Class', 'Object', 'CONTROL') as Contr_Per 