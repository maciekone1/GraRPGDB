/*
   czwartek, 1 czerwca 201711:30:25
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
CREATE TABLE dbo.Tmp_Attributes
	(
	ID int NOT NULL IDENTITY (1, 1),
	Attribute_Name nvarchar(50) NOT NULL,
	Description nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Attributes SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Attributes ON
GO
IF EXISTS(SELECT * FROM dbo.Attributes)
	 EXEC('INSERT INTO dbo.Tmp_Attributes (ID, Attribute_Name, Description)
		SELECT ID, Attribute_Name, Description FROM dbo.Attributes WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Attributes OFF
GO
ALTER TABLE dbo.CharacterStats
	DROP CONSTRAINT FK_CharacterStats_Attributes
GO
DROP TABLE dbo.Attributes
GO
EXECUTE sp_rename N'dbo.Tmp_Attributes', N'Attributes', 'OBJECT' 
GO
ALTER TABLE dbo.Attributes ADD CONSTRAINT
	PK_Attributes PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Attributes', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Attributes', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Attributes', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.CharacterStats ADD CONSTRAINT
	FK_CharacterStats_Attributes FOREIGN KEY
	(
	AttributeID
	) REFERENCES dbo.Attributes
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CharacterStats SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.CharacterStats', 'Object', 'CONTROL') as Contr_Per 