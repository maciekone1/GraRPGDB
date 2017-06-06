create procedure dbo.Rekt
@characterID int
as

DECLARE @level int;
Declare @Money int;
Declare @Exp int;
declare @pent int;
declare @X int;
declare @Y int;
declare @Nazwa nvarchar(30);

set @X = 0.0;
set @Y = 0.0;
set @Nazwa = 'Hell';

set @level = (select dbo.Character.Level from dbo.Character where dbo.Character.ID = @characterID)
set @Money = (select dbo.Character.Money FROM DBO.Character where dbo.Character.ID = @characterID)
set @Exp = (select dbo.Character.XP FROM DBO.Character where dbo.Character.ID = @characterID)

set @pent = @Exp * 100;

BEGIN
update dbo.Character set Logged = 0, Alive = 0, Money = @Money - @pent, XP = @Exp - @pent where ID = @characterID
update dbo.Localization set X = @X, Y = @Y, Nazwa = @nazwa where ID = (select dbo.Character.CharLocID from dbo.Character where dbo.Character.ID = @characterID);
end
