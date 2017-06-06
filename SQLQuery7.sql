/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ID]
      ,[AccountID]
      ,[CharacterID]
  FROM [GraRPG].[dbo].[AccountCharacters]



  use GraRPG

  --insert into dbo.Localization (Nazwa, X,Y) values ('Depo', 1.111 , 2.222)


  insert into dbo.Character (Name, ClasssID, FractionID, Alive, Level, XP, Money, CharacterStatsID, Logged, CharLocID) values ('Test'
  insert into dbo.Character (Name, ClasssID, FractionID, Alive, Level, XP, Money, CharacterStatsID, EquipmentID, CharLocID, BackpackID, Logged) values ('Test', 1,1,1,1,111,2,1,1,1,1,1);
  insert into dbo.AccountCharacters (AccountID, CharacterID) values (1,1);