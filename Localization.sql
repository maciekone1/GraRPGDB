/*
   środa, 7 czerwca 201709:54:33
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
ALTER view mv_account_chars_dead   as  
	select a.Login, a.Email as [E-mail], ch.Name as [Nazwa Postaci], ch.Level, ch.Logged as [Zalogowana], cs.Class_name as [Klasa] , sp.Name  as Specjalizacja, lo.Nazwa as Lokalizacja
	 from dbo.Accounts as a 
	inner join dbo.AccountCharacters ac on a.ID = ac.AccountID 
	join dbo.Character ch on ac.CharacterID = ch.ID 
	join dbo.Class cs on ch.ClasssID = cs.ID
	join dbo.Specialisation sp on cs.SpecialisationID = sp.ID
	join dbo.Localization lo on lo.ID = ch.CharLocID
	where ch.Alive = 0
GO
CREATE TABLE dbo.Tmp_Localization
	(
	ID int NOT NULL,
	Nazwa nvarchar(50) NOT NULL,
	X numeric(5, 2) NOT NULL,
	Y numeric(5, 2) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Localization SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Localization)
	 EXEC('INSERT INTO dbo.Tmp_Localization (ID, Nazwa, X, Y)
		SELECT ID, Nazwa, X, Y FROM dbo.Localization WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT FK_Character_Localization
GO
DROP TABLE dbo.Localization
GO
EXECUTE sp_rename N'dbo.Tmp_Localization', N'Localization', 'OBJECT' 
GO
ALTER TABLE dbo.Localization ADD CONSTRAINT
	PK_Localization PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Localization', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Localization', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Localization', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	FK_Character_Localization FOREIGN KEY
	(
	CharLocID
	) REFERENCES dbo.Localization
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Character SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Character', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Character', 'Object', 'CONTROL') as Contr_Per 