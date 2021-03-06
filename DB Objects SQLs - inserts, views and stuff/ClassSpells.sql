/*
   środa, 31 maja 201713:50:36
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
EXECUTE sp_rename N'dbo.ClassSpells.ClassSpells', N'Tmp_ID_1', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.ClassSpells.Tmp_ID_1', N'ID', 'COLUMN' 
GO
ALTER TABLE dbo.ClassSpells SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ClassSpells', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ClassSpells', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ClassSpells', 'Object', 'CONTROL') as Contr_Per 