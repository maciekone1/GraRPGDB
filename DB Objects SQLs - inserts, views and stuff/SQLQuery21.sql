alter procedure sp_insert_chk
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
				--postaæ respi sie w temple
							insert into dbo.Localization (ID,Nazwa, X,Y) values (@seq,'Temple2', 1.0, 1.0);
				--kreowanie postaci
							insert into dbo.Character 
							(ID, Name, ClasssID, Alive, Level, XP, Money, Logged, CharLocID, FractionID)
							values
							(Next Value for dbo.seq_chars, @RandomString, @randomClass, 1, 1, 1000, 500, 0, @seq, @factID)
			--Losowanie przypisanie postaci do konta
								insert into dbo.AccountCharacters (AccountID, CharacterID) values (@seq, @seq) 
			set @currentOne = (select ID from Character where Name = @RandomString)
			set @rowCount = @rowCount + 1
end
