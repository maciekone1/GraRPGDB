use GraRPG


create procedure logOut
@characterID int,
@X int,
@Y int,
@nazwa nvarchar(30)
AS
BEGIN
update dbo.Character set Logged = 0 where ID = @characterID
update dbo.Localization set X = @X, Y = @Y, Nazwa = @nazwa where ID = (select LocID from dbo.CharLoc where ID = (select ID from dbo.Character where ID = @characterID))
end
