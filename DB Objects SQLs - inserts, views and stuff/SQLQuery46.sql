--create procedure sp_upd
--as

declare @zmienna int
declare @rozrzuta int
declare @ilosc int
set @ilosc = (select count(*) from dbo.Character)
declare @wartosc int
declare @cos int
set @cos = 1
begin
set @zmienna = 1
while @zmienna < @ilosc
	if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 4 = 0)
	begin
	update dbo.AccountCharacters set AccountID = @cos where CharacterID = @zmienna
	set @cos = @cos + 1
	set @zmienna = @zmienna + 1
	end
		else if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 8 = 0)
		begin
		set @cos = @cos + 1
		set @zmienna = @zmienna + 1
		end
				else if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 5 = 0)
				begin
				set @cos = @cos + 1
				set @zmienna = @zmienna + 1
				end
						else
						begin
						set @zmienna = @zmienna + 1
						end
							end;
