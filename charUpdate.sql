USE [GraRPG]
GO
/****** Object:  StoredProcedure [dbo].[sp_upd]    Script Date: 08.06.2017 07:27:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_upd]
as

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
		else if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 9 = 0)
		begin
			update dbo.AccountCharacters set AccountID = @cos where CharacterID = @zmienna
		set @cos = @cos + 1
		set @zmienna = @zmienna + 1
		end
				else if ((select CharacterID from AccountCharacters where CharacterID = @zmienna) % 5 = 0)
				begin
					update dbo.AccountCharacters set AccountID = @cos where CharacterID = @zmienna
					update dbo.Character set Alive = 0 where ID = @zmienna
				set @cos = @cos + 1
				set @zmienna = @zmienna + 1
				end
						else
						begin
						set @zmienna = @zmienna + 1
						end
							end;

