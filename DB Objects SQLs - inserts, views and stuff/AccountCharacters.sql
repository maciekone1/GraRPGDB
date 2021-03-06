/*
   wtorek, 6 czerwca 201717:41:29
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
ALTER TABLE dbo.AccountCharacters
	DROP CONSTRAINT FK_AccountCharacters_Character
GO
ALTER TABLE dbo.Character SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_AccountCharacters
	(
	ID int NOT NULL IDENTITY (1, 1),
	AccountID int NOT NULL,
	CharacterID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_AccountCharacters SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_AccountCharacters ON
GO
IF EXISTS(SELECT * FROM dbo.AccountCharacters)
	 EXEC('INSERT INTO dbo.Tmp_AccountCharacters (ID, AccountID, CharacterID)
		SELECT ID, AccountID, CharacterID FROM dbo.AccountCharacters WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_AccountCharacters OFF
GO
ALTER TABLE dbo.Accounts
	DROP CONSTRAINT FK_Accounts_AccountCharacters
GO
DROP TABLE dbo.AccountCharacters
GO
EXECUTE sp_rename N'dbo.Tmp_AccountCharacters', N'AccountCharacters', 'OBJECT' 
GO
ALTER TABLE dbo.AccountCharacters ADD CONSTRAINT
	PK_AccountCharacters PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.AccountCharacters ADD CONSTRAINT
	FK_AccountCharacters_Character FOREIGN KEY
	(
	CharacterID
	) REFERENCES dbo.Character
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.AccountCharacters', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.AccountCharacters', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.AccountCharacters', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Accounts ADD CONSTRAINT
	FK_Accounts_AccountCharacters FOREIGN KEY
	(
	CharacterAccountID
	) REFERENCES dbo.AccountCharacters
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Accounts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Accounts', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Accounts', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Accounts', 'Object', 'CONTROL') as Contr_Per 