USE [GraRPG]
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_chk]    Script Date: 08.06.2017 07:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_insert_chk]
@amount int
as

declare @rowCount int
declare @RandomString nvarchar(30)
declare @randomInt int
declare @randomClass int
declare @currentOne nvarchar(30)
declare @seq int
declare @factID int 

DECLARE @First VARCHAR(14)
DECLARE @Last VARCHAR(14)
Declare @Email VARCHAR(30)
DECLARE @RandomStringv2 NVARCHAR(MAX)

								insert into dbo.Attributes(Description,Attribute_Name) Values 
								('Siła określa ilość pkt. obrażeń', 'Siła') 
								,('Zręczność orkeśla szansę na trafienia krytyczne' , 'Zręczność')
								,('Witalność określa ilośc pkt. życia' , 'Witalność')
								,('Wiedza określa ilośc pkt. many' , 'Wiedza')
								,('Inteligencja określa ilośc pkt. obrażeń ', 'Inteligencja');
								insert into dbo.Factions(FactionName) Values 
								('Horda') 
								,('Przymierze')
								,('Nieumarli');
								insert into dbo.Specialisation(Name) Values 
								('Kowal') 
								,('Łowca')
								,('Zielarz')
								,('Handlarz'), ('Dekarz'), ('Marynaż'), ('Polityk'), ('Beggar'), ('Bandyta');
								insert into dbo.Class(Class_name, SpecialisationID) values ('Mag', 1), ('Druid', 2), ('Warlock', 3), ('Paladyn',4), ('Warrior',5), ('Thief', 6), ('Kleryk', 7), ('Bard',8);
								exec dbo.sp_czary;

								insert into dbo.ItemType (Description, Typ) Values ('Miecz ostry krótki', 'Miecz krótki'), ('Miecz ostry długi' , 'Miecz długi'),('Topór ostry' , 'Topór'),('Topór ostry dwóręczny' , 'Topór dwóręczny'),('Ciężka buława', 'Bulawa'),('Uk zwany łukiem', 'Łók'), ('Kusza co bełtami strzela', 'Kusza'), ('Hełm chroni głowe', 'Hełm'), ('Zbroja - chroni klate', 'Zbroja'), ('Cichobiegi', 'Buty'), ('Rękawice - do wyjmowania ciasta', 'Rękawice')
								exec dbo.sp_items;

set @rowCount =1
	while @rowCount < @amount
		begin

			set @randomInt = ABS(Checksum(NewID()) % 9) + 1 --wartosc bezwzgledna z newID (guid) podzielona przez 10 - zakres 1-9
			set @randomClass = ABS(Checksum(NewID()) % 8) + 1 
			set @factID = ABS(Checksum(NewID()) % 3) + 1
			EXEC stringGenerator 5, @RandomString OUTPUT;
			EXEC stringGenerator 10, @RandomStringv2 OUTPUT;
			set @First = @RandomStringv2
			set @Last = REVERSE(@RandomStringv2)
			set @Email = SUBSTRING(@First,1,4) +  SUBSTRING(@Last,1,4) + '@host' +  CAST(CAST (@factID as int) as nvarchar)  + '.pl'

				INSERT INTO [dbo].[Accounts] ([ID],[Login] ,[Password] ,[Email] ) VALUES (NEXT VALUE FOR dbo.seq_acc, @First, @Last, @Email)
				
				set @seq = NEXT VALUE FOR dbo.seq_loc		
				--postać respi sie w temple
							insert into dbo.Localization (ID,Nazwa, X,Y) values (@seq,'Temple2', 1.0, 1.0);
				--kreowanie postaci
							insert into dbo.Character 
							(ID, Name, ClasssID, Alive, Level, XP, Money, Logged, CharLocID, FractionID)
							values
							(Next Value for dbo.seq_chars, @RandomString, @randomClass, 1, 1, 1000, 500 + 12 * @factID  , 0, @seq, @factID)
			--Losowanie przypisanie postaci do konta
								insert into dbo.AccountCharacters (AccountID, CharacterID) values (@seq, @seq) 

			set @currentOne = (select ID from Character where Name = @RandomString)
			set @rowCount = @rowCount + 1
end
								exec dbo.sp_upd;

