/*
   środa, 31 maja 201712:54:02
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
CREATE TABLE dbo.Tmp_Accounts
	(
	ID int NOT NULL,
	Login nvarchar(50) NOT NULL,
	Password nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	CharacterAccountID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Accounts SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Accounts)
	 EXEC('INSERT INTO dbo.Tmp_Accounts (ID, Login, Password, Email, CharacterAccountID)
		SELECT ID, Login, Password, Email, CharacterAccountID FROM dbo.Accounts WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Accounts
GO
EXECUTE sp_rename N'dbo.Tmp_Accounts', N'Accounts', 'OBJECT' 
GO
ALTER TABLE dbo.Accounts ADD CONSTRAINT
	PK_Accounts PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Accounts', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Accounts', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Accounts', 'Object', 'CONTROL') as Contr_Per 